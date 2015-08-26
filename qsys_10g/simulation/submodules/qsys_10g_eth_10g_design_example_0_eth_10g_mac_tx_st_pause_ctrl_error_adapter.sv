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

 
// $Id: //acds/rel/13.1/ip/.../avalon-st_error_adapter.sv.terp#1 $
// $Revision: #1 $
// $Date: 2013/09/09 $
// $Author: dmunday $


// --------------------------------------------------------------------------------
//| Avalon Streaming Error Adapter
// --------------------------------------------------------------------------------

`timescale 1ns / 100ps

// ------------------------------------------
// Generation parameters:
//   output_name:        qsys_10g_eth_10g_design_example_0_eth_10g_mac_tx_st_pause_ctrl_error_adapter
//   use_ready:          true
//   use_packets:        true
//   use_empty:          1
//   empty_width:        3
//   data_width:         64
//   channel_width:      0
//   in_error_width:     1
//   out_error_width:    2
//   in_errors_list      
//   in_errors_indices   0
//   out_errors_list     
//   has_in_error_desc:  FALSE
//   has_out_error_desc: FALSE
//   has_other:          FALSE
//   out_other_index:    -1
//   dumpVar:            
//   inString:            in_error[
//   closeString:        ] |

// ------------------------------------------




module qsys_10g_eth_10g_design_example_0_eth_10g_mac_tx_st_pause_ctrl_error_adapter
(
 // Interface: in
 output reg         in_ready,
 input              in_valid,
 input [64-1: 0]     in_data,
 input              in_error,
 input              in_startofpacket,
 input              in_endofpacket,
 input [3-1: 0]     in_empty,
 // Interface: out
 input               out_ready,
 output reg          out_valid,
 output reg [64-1: 0] out_data,
 output reg [2-1: 0] out_error,
 output reg          out_startofpacket,
 output reg          out_endofpacket,
 output reg [3-1: 0] out_empty,
  // Interface: clk
 input              clk,
 // Interface: reset
 input              reset_n

 /*AUTOARG*/);
   

   // ---------------------------------------------------------------------
   //| Pass-through Mapping
   // ---------------------------------------------------------------------
   always @* begin
      in_ready = out_ready;
      out_valid = in_valid;
      out_data = in_data;
      out_startofpacket = in_startofpacket;
      out_endofpacket = in_endofpacket;
      out_empty = in_empty;

   end

   // ---------------------------------------------------------------------
   //| Error Mapping
   // ---------------------------------------------------------------------
   always @* begin
      out_error = 0;
      
      out_error = in_error;
   end //always @*
endmodule

