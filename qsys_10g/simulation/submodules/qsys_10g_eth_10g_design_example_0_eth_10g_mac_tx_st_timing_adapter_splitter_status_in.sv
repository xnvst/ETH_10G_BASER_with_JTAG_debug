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


// (C) 2001-2013 Altera Corporation. All rights reserved.
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

 
// $Id: //acds/rel/13.1/ip/.../avalon-st_timing_adapter.sv.terp#1 $
// $Revision: #1 $
// $Date: 2013/09/27 $
// $Author: dmunday, korthner $

// --------------------------------------------------------------------------------
//| Avalon Streaming Timing Adapter
// --------------------------------------------------------------------------------

`timescale 1ns / 100ps
// ------------------------------------------
// Generation parameters:
//   output_name:        qsys_10g_eth_10g_design_example_0_eth_10g_mac_tx_st_timing_adapter_splitter_status_in
//   in_use_ready:       false
//   out_use_ready:      true
//   in_use_valid:       true
//   out_use_valid:      true
//   use_packets:        false
//   use_empty:          0
//   empty_width:        0
//   data_width:         40
//   channel_width:      0
//   error_width:        7
//   in_ready_latency:   0
//   out_ready_latency:  0
//   in_payload_width:   47
//   out_payload_width:  47
//   in_payload_map:     in_data,in_error
//   out_payload_map:    out_data,out_error
// ------------------------------------------



module qsys_10g_eth_10g_design_example_0_eth_10g_mac_tx_st_timing_adapter_splitter_status_in
(  
 input               in_valid,
 input     [40-1: 0]  in_data,
 input     [7-1: 0] in_error,
 // Interface: out
 input               out_ready,
 output reg          out_valid,
 output reg [40-1: 0] out_data,
 output reg [7-1: 0] out_error,
  // Interface: clk
 input              clk,
 // Interface: reset
 input              reset_n

 /*AUTOARG*/);

   // ---------------------------------------------------------------------
   //| Signal Declarations
   // ---------------------------------------------------------------------
   
   reg [47-1:0]   in_payload;
   reg [47-1:0]   out_payload;
   reg [1-1:0]   ready;   
   reg           in_ready;
   // synthesis translate_off
   always @(negedge in_ready) begin
      $display("%m: The downstream component is backpressuring by deasserting ready, but the upstream component can't be backpressured.");
   end
   // synthesis translate_on   

   // ---------------------------------------------------------------------
   //| Payload Mapping
   // ---------------------------------------------------------------------
   always @* begin
     in_payload = {in_data,in_error};
     {out_data,out_error} = out_payload;
   end

   // ---------------------------------------------------------------------
   //| Ready & valid signals.
   // ---------------------------------------------------------------------
   always @* begin
     ready[0]    = out_ready;
     out_valid = in_valid;
     out_payload = in_payload;
     in_ready    = ready[0];
   end




endmodule


