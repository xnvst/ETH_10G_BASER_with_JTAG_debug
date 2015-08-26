// (C) 2001-2014 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License Subscription 
// Agreement, Altera MegaCore Function License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


/*
currently it only work for as 2 to 1 mux, although can be extended in the future
*/
`timescale 1ns / 1ns

module altera_eth_loopback (
    clk,
    reset_n,

    // sink
    in_data_0,
    in_valid_0,
    in_ready_0,
    in_startofpacket_0,
    in_endofpacket_0,
    in_empty_0,
    in_error_0,

    // sink
    in_data_1,
    in_valid_1,
    in_ready_1,
    in_startofpacket_1,
    in_endofpacket_1,
    in_empty_1,
    in_error_1,

    // source
    out_data,
    out_valid,
    out_ready,
    out_startofpacket,
    out_endofpacket,
    out_empty,
    out_error,

    // in control
    control_address,
    control_write,
    control_read,
    control_readdata,
    control_writedata

);


    // ---------------------------------------------------------------------
    // Parameters
    // ---------------------------------------------------------------------
    parameter SYMBOLS_PER_BEAT     = 4;
    parameter BITS_PER_SYMBOL      = 8;
    parameter ERROR_WIDTH          = 1;
    parameter USE_PACKETS          = 1;
    parameter EMPTY_WIDTH          = 0;
    parameter MAX_CHANNELS         = 2;

    localparam DATA_WIDTH = SYMBOLS_PER_BEAT * BITS_PER_SYMBOL;

    // ---------------------------------------------------------------------
    // Input/Output Signals
    // ---------------------------------------------------------------------
    input clk;
    input reset_n;

    input [DATA_WIDTH - 1 : 0] in_data_0;
    input in_valid_0;
    input in_startofpacket_0;
    input in_endofpacket_0;
    input [EMPTY_WIDTH - 1 : 0] in_empty_0;
    input [ERROR_WIDTH - 1 : 0] in_error_0;
    output in_ready_0;

    input [DATA_WIDTH - 1 : 0] in_data_1;
    input in_valid_1;
    input in_startofpacket_1;
    input in_endofpacket_1;
    input [EMPTY_WIDTH - 1 : 0] in_empty_1;
    input [ERROR_WIDTH - 1 : 0] in_error_1;
    output in_ready_1;

    output [DATA_WIDTH - 1 : 0] out_data;
    output out_valid;
    output out_startofpacket;
    output out_endofpacket;
    output [EMPTY_WIDTH - 1 : 0] out_empty;
    output [ERROR_WIDTH - 1 : 0] out_error;
    input out_ready;

    input control_address;
    input control_read;
    input control_write;
    input [31 : 0] control_writedata;
    output reg [31 : 0] control_readdata;
    
    reg selector;

    always @(posedge clk or negedge reset_n) begin
         if (!reset_n) begin
             control_readdata <= 0;
             selector  <= 0;
         end
         else begin
             if (control_write) begin
                 selector <= 0;
                 selector <= control_writedata;
             end
             else if (control_read) begin
                 control_readdata <= 0;
                 control_readdata <= selector;
             end
         end
    end

    assign out_data             =  selector == 1'b0 ? in_data_0           : in_data_1 ; 
    assign out_valid            =  selector == 1'b0 ? in_valid_0          : in_valid_1 ; 
    assign out_startofpacket    =  selector == 1'b0 ? in_startofpacket_0  : in_startofpacket_1 ; 
    assign out_endofpacket      =  selector == 1'b0 ? in_endofpacket_0    : in_endofpacket_1 ; 
    assign out_empty            =  selector == 1'b0 ? in_empty_0          : in_empty_1 ; 
    assign out_error            =  selector == 1'b0 ? in_error_0          : in_error_1 ; 
    assign in_ready_0            =  selector == 1'b0 ? out_ready          : 1'b0 ; 
    assign in_ready_1            =  selector == 1'b1 ? out_ready          : 1'b0 ;     

endmodule

