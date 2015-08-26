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


// $File: //acds/main/ip/sopc/components/verification/altera_avalon_mm_master_bfm/altera_avalon_mm_master_bfm_hw.tcl $
// $Revision: #47 $
// $Date: 2011/09/14 $
// $Author: klong $
//------------------------------------------------------------------------------

`timescale 1ns / 1ns

module altera_avalon_st_delay #(
   parameter 
      NUMBER_OF_DELAY_CLOCKS = 1,

      DATA_WIDTH  = 8,
      BITS_PER_SYMBOL = 8,

      USE_PACKETS = 0,

      USE_CHANNEL   = 0,
      CHANNEL_WIDTH = 1,

      USE_ERROR   = 0,
      ERROR_WIDTH = 1,

      // Derived parameters
      SYMBOLS_PER_BEAT = DATA_WIDTH / BITS_PER_SYMBOL,
      EMPTY_WV   = USE_PACKETS ? (
                   (SYMBOLS_PER_BEAT > 128) ? 8 :
                   (SYMBOLS_PER_BEAT >  64) ? 7 :
                   (SYMBOLS_PER_BEAT >  32) ? 6 :
                   (SYMBOLS_PER_BEAT >  16) ? 5 :
                   (SYMBOLS_PER_BEAT >   8) ? 4 :
                   (SYMBOLS_PER_BEAT >   4) ? 3 :
                   (SYMBOLS_PER_BEAT >   2) ? 2 :
                   (SYMBOLS_PER_BEAT >   1) ? 1 :
                                             1) : 1,

      CHANNEL_WV = USE_CHANNEL ? CHANNEL_WIDTH : 1,

      ERROR_WV   = USE_ERROR   ? ERROR_WIDTH   : 1
  )
(
   input  wire                    in0_valid,
   input  wire  [DATA_WIDTH-1 :0] in0_data,
   input  wire  [CHANNEL_WV-1 :0] in0_channel,
   input  wire  [ERROR_WV-1   :0] in0_error,
   input  wire                    in0_startofpacket,
   input  wire                    in0_endofpacket,
   input  wire  [EMPTY_WV-1   :0] in0_empty,

   output wire                    out0_valid,
   output wire  [DATA_WIDTH-1 :0] out0_data,
   output wire  [CHANNEL_WV-1 :0] out0_channel,
   output wire  [ERROR_WV-1   :0] out0_error,
   output wire                    out0_startofpacket,
   output wire                    out0_endofpacket,
   output wire  [EMPTY_WV-1   :0] out0_empty,

   input  wire                    reset_n,
   input  wire                    clk
);


// ********************************************************************
// Module Wiring

wire   [16:0]            OutValid;
wire   [DATA_WIDTH-1 :0] OutData    [16:0];
wire   [CHANNEL_WV-1 :0] OutChannel [16:0];
wire   [ERROR_WV-1   :0] OutError   [16:0];
wire   [16:0]            OutSOP;
wire   [16:0]            OutEOP;
wire   [EMPTY_WV-1   :0] OutEmpty   [16:0];

genvar                   i;


// ********************************************************************
// Module Logic

assign OutValid[0]   = in0_valid;
assign OutData[0]    = in0_data;
assign OutChannel[0] = in0_channel;
assign OutError[0]   = in0_error;
assign OutSOP[0]     = in0_startofpacket;
assign OutEOP[0]     = in0_endofpacket;
assign OutEmpty[0]   = in0_empty;


generate
   for (i=0; i < NUMBER_OF_DELAY_CLOCKS; i=i+1) begin : DELAY_PORT
      altera_st_delay_reg #(DATA_WIDTH, CHANNEL_WV, ERROR_WV, EMPTY_WV) U 
         (OutValid[i],
          OutData[i],
          OutChannel[i],
          OutError[i],
          OutSOP[i],
          OutEOP[i],
          OutEmpty[i],
          OutValid[i+1],
          OutData[i+1],
          OutChannel[i+1],
          OutError[i+1],
          OutSOP[i+1],
          OutEOP[i+1],
          OutEmpty[i+1],
          reset_n,
          clk);
   end
endgenerate


assign out0_valid         = OutValid[NUMBER_OF_DELAY_CLOCKS];
assign out0_data          = OutData[NUMBER_OF_DELAY_CLOCKS];
assign out0_channel       = OutChannel[NUMBER_OF_DELAY_CLOCKS];
assign out0_error         = OutError[NUMBER_OF_DELAY_CLOCKS];
assign out0_startofpacket = OutSOP[NUMBER_OF_DELAY_CLOCKS];
assign out0_endofpacket   = OutEOP[NUMBER_OF_DELAY_CLOCKS];
assign out0_empty         = OutEmpty[NUMBER_OF_DELAY_CLOCKS];


endmodule


module altera_st_delay_reg #(
   parameter DATA_WIDTH = 8, CHANNEL_WV = 1, ERROR_WV = 1, EMPTY_WV = 1)
(
   input  wire                    in_valid,
   input  wire  [DATA_WIDTH-1 :0] in_data,
   input  wire  [CHANNEL_WV-1 :0] in_channel,
   input  wire  [ERROR_WV-1   :0] in_error,
   input  wire                    in_startofpacket,
   input  wire                    in_endofpacket,
   input  wire  [EMPTY_WV-1   :0] in_empty,

   output reg                     out_valid,
   output reg   [DATA_WIDTH-1 :0] out_data,
   output reg   [CHANNEL_WV-1 :0] out_channel,
   output reg   [ERROR_WV-1   :0] out_error,
   output reg                     out_startofpacket,
   output reg                     out_endofpacket,
   output reg   [EMPTY_WV-1   :0] out_empty,

   input  wire                    reset_n,
   input  wire                    clk
);


always @(posedge clk or negedge reset_n) begin
   if (!reset_n)
      out_valid <= 1'b0;
   else
      out_valid <= in_valid;
end


always @(posedge clk) begin
   out_data          <= in_data;
   out_channel       <= in_channel;
   out_error         <= in_error;
   out_startofpacket <= in_startofpacket;
   out_endofpacket   <= in_endofpacket;
   out_empty         <= in_empty;
end


endmodule

