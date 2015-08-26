// --------------------------------------------------------------------------------
//| Avalon Streaming Error Adapter
// --------------------------------------------------------------------------------

`timescale 1ns / 100ps
module qsys_10g_eth_10g_design_example_0_eth_10g_mac_rx_st_error_adapter_stat (
    
      // Interface: clk
      input              clk,
      // Interface: reset
      input              reset_n,
      // Interface: in
      input              in_valid,
      input      [39: 0] in_data,
      input      [ 4: 0] in_error,
      // Interface: out
      output reg         out_valid,
      output reg [39: 0] out_data,
      output reg [ 6: 0] out_error
);



   // ---------------------------------------------------------------------
   //| Pass-through Mapping
   // ---------------------------------------------------------------------
   always @* begin
      out_valid = in_valid;
      out_data = in_data;

   end

   // ---------------------------------------------------------------------
   //| Error Mapping
   // ---------------------------------------------------------------------
   always @* begin
      out_error = 0;
      
      out_error[0] = in_error[2];   // undersize
      out_error[1] = in_error[3];   // oversize
      out_error[2] = in_error[4];   // payload_length
      out_error[3] = in_error[1];   // crc
      out_error[6] = in_error[0];   // phy
   

   end
endmodule