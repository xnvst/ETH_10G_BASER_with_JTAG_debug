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
//   output_name:        qsys_10g_eth_10g_design_example_0_eth_loopback_composed_lc_splitter_timing_adapter
//   in_use_ready:       false
//   out_use_ready:      true
//   in_use_valid:       false
//   out_use_valid:      true
//   use_packets:        false
//   use_empty:          0
//   empty_width:        0
//   data_width:         72
//   channel_width:      0
//   error_width:        0
//   in_ready_latency:   0
//   out_ready_latency:  0
//   in_payload_width:   72
//   out_payload_width:  72
//   in_payload_map:     in_data
//   out_payload_map:    out_data
// ------------------------------------------



module qsys_10g_eth_10g_design_example_0_eth_loopback_composed_lc_splitter_timing_adapter
(  
 input     [72-1: 0]  in_data,
 // Interface: out
 input               out_ready,
 output reg          out_valid,
 output reg [72-1: 0] out_data,
  // Interface: clk
 input              clk,
 // Interface: reset
 input              reset_n

 /*AUTOARG*/);

   // ---------------------------------------------------------------------
   //| Signal Declarations
   // ---------------------------------------------------------------------
   
   reg [72-1:0]   in_payload;
   reg [72-1:0]   out_payload;
   reg [1-1:0]   ready;   
   reg           in_ready;
   // synthesis translate_off
   always @(negedge in_ready) begin
      $display("%m: The downstream component is backpressuring by deasserting ready, but the upstream component can't be backpressured.");
   end
   // synthesis translate_on   
   reg            in_valid;
   reg [1-1:0]    valid_vector;

   // ---------------------------------------------------------------------
   //| Payload Mapping
   // ---------------------------------------------------------------------
   always @* begin
     in_payload = {in_data};
     {out_data} = out_payload;
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



   // ---------------------------------------------------------------------
   //| Input Valid Generation
   // ---------------------------------------------------------------------
   always @* begin
      valid_vector[0] = in_ready;
      in_valid        = valid_vector[0];
   end


endmodule


