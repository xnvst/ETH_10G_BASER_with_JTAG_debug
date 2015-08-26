// --------------------------------------------------------------------------------
//| Avalon Streaming Timing Adapter
// --------------------------------------------------------------------------------
// altera message_level level1

`timescale 1ns / 100ps
module qsys_10g_eth_10g_design_example_0_eth_10g_mac_rx_timing_adapter_frame_status_out_frame_decoder (
    
      // Interface: clk
      input              clk,
      // Interface: reset
      input              reset_n,
      // Interface: in
      output reg         in_ready,
      input              in_valid,
      input      [63: 0] in_data,
      input              in_error,
      input              in_startofpacket,
      input              in_endofpacket,
      input      [ 2: 0] in_empty,
      // Interface: out
      output reg         out_valid,
      output reg [63: 0] out_data,
      output reg         out_error,
      output reg         out_startofpacket,
      output reg         out_endofpacket,
      output reg [ 2: 0] out_empty
);




   // ---------------------------------------------------------------------
   //| Signal Declarations
   // ---------------------------------------------------------------------

   reg  [69: 0] in_payload;
   reg  [69: 0] out_payload;
   reg  [ 0: 0] ready;


   // ---------------------------------------------------------------------
   //| Payload Mapping
   // ---------------------------------------------------------------------
   always @* begin
     in_payload = {in_data,in_error,in_startofpacket,in_endofpacket,in_empty};
     {out_data,out_error,out_startofpacket,out_endofpacket,out_empty} = out_payload;
   end

   // ---------------------------------------------------------------------
   //| Ready & valid signals.
   // ---------------------------------------------------------------------
   always @* begin
     ready[0] = 1;
     out_valid = in_valid;
     out_payload = in_payload;
     in_ready = ready[0];
   end




endmodule

