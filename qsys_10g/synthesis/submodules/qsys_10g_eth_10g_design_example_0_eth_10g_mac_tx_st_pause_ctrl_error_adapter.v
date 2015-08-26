// --------------------------------------------------------------------------------
//| Avalon Streaming Error Adapter
// --------------------------------------------------------------------------------

`timescale 1ns / 100ps
module qsys_10g_eth_10g_design_example_0_eth_10g_mac_tx_st_pause_ctrl_error_adapter (
    
      // Interface: clk
      input              clk,
      // Interface: reset
      input              reset_n,
      // Interface: in
      output reg         in_ready,
      input              in_valid,
      input      [63: 0] in_data,
      input      [ 0: 0] in_error,
      input              in_startofpacket,
      input              in_endofpacket,
      input      [ 2: 0] in_empty,
      // Interface: out
      input              out_ready,
      output reg         out_valid,
      output reg [63: 0] out_data,
      output reg [ 1: 0] out_error,
      output reg         out_startofpacket,
      output reg         out_endofpacket,
      output reg [ 2: 0] out_empty
);



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
   end
endmodule