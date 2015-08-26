// --------------------------------------------------------------------------------
//| Multiplexer
// --------------------------------------------------------------------------------
// altera message_level level1

`timescale 1ns / 100ps
module qsys_10g_eth_10g_design_example_0_eth_10g_mac_tx_st_mux_flow_control_user_frame (	
    
      // Interface: clk
      input              clk,
      // Interface: reset
      input              reset_n,
      // Interface: in0
      input              in0_valid,
      output reg         in0_ready,
      input      [63: 0] in0_data,
      input      [ 1: 0] in0_error,
      input              in0_startofpacket,
      input              in0_endofpacket,
      input      [ 2: 0] in0_empty,
      // Interface: in1
      input              in1_valid,
      output reg         in1_ready,
      input      [63: 0] in1_data,
      input      [ 1: 0] in1_error,
      input              in1_startofpacket,
      input              in1_endofpacket,
      input      [ 2: 0] in1_empty,
      // Interface: out
      output reg         out_channel,
      output reg         out_valid,
      input              out_ready,
      output reg [63: 0] out_data,
      output reg [ 1: 0] out_error,
      output reg         out_startofpacket,
      output reg         out_endofpacket,
      output reg [ 2: 0] out_empty
);

   // ---------------------------------------------------------------------
   //| Signal Declarations
   // ---------------------------------------------------------------------
   reg  [70: 0] in0_payload;
   reg  [70: 0] in1_payload;

   reg          decision = 0;      
   reg          select = 0;
   reg          selected_endofpacket = 0;
   reg          selected_valid;
   wire         out_valid_wire;
   wire         selected_ready;
   reg  [70: 0] selected_payload;
   reg          packet_in_progress;
   
   wire         out_select;
   wire [70: 0] out_payload;

   // ---------------------------------------------------------------------
   //| Input Mapping
   // ---------------------------------------------------------------------
   always @* begin
     in0_payload = {in0_data,in0_empty,in0_endofpacket,in0_error,in0_startofpacket};
     in1_payload = {in1_data,in1_empty,in1_endofpacket,in1_error,in1_startofpacket};
   end
   
   // ---------------------------------------------------------------------
   //| Scheduling Algorithm
   // ---------------------------------------------------------------------
   always @* begin
         
      decision = 0;
      case(select) 
         0 : begin
            if (in0_valid) decision = 0;
            if (in1_valid) decision = 1;
         end  
         1 : begin
            if (in1_valid) decision = 1;
            if (in0_valid) decision = 0;
         end  
         default : begin // Same as '0', should never get used.
            if (in0_valid) decision = 0;
            if (in1_valid) decision = 1;
         end  
      endcase   
   end

   // ---------------------------------------------------------------------
   //| Capture Decision
   // ---------------------------------------------------------------------
   always @ (negedge reset_n, posedge clk) begin
      if (!reset_n) begin
         select <= 0;
         packet_in_progress <= 0;
      end else begin
         if (!selected_valid && !packet_in_progress) begin
            select <= decision;
         end else begin
            packet_in_progress <= 1;
         end
         if (selected_endofpacket && selected_valid && selected_ready) begin
            select <= decision;
            packet_in_progress <= 0;
         end
      end
   end

   // ---------------------------------------------------------------------
   //| Mux
   // ---------------------------------------------------------------------
   always @* begin
      case(select) 
         0 : begin
            selected_payload = in0_payload;         
            selected_valid   = in0_valid;
            selected_endofpacket = in0_endofpacket;
         end  
         1 : begin
            selected_payload = in1_payload;         
            selected_valid   = in1_valid;
            selected_endofpacket = in1_endofpacket;
         end  
         default : begin
            selected_payload = in0_payload;         
            selected_valid = in0_valid;
            selected_endofpacket = in0_endofpacket;
         end
      endcase

   end

   // ---------------------------------------------------------------------
   //| Back Pressure
   // ---------------------------------------------------------------------
   always @* begin
      in0_ready <= ~in0_valid	;
      in1_ready <= ~in1_valid	;
      case(select) 
         0 : in0_ready <= selected_ready;
         1 : in1_ready <= selected_ready;
         default : in0_ready <= selected_ready;
      endcase
   end

   // ---------------------------------------------------------------------
   //| output Pipeline
   // ---------------------------------------------------------------------
   qsys_10g_eth_10g_design_example_0_eth_10g_mac_tx_st_mux_flow_control_user_frame_1stage_pipeline #( .PAYLOAD_WIDTH( 71 + 1 ) ) outpipe
      ( .clk      (clk ),
        .reset_n  (reset_n  ),
        .in_ready ( selected_ready ),
        .in_valid ( selected_valid ), 
        .in_payload ({select,selected_payload}),
        .out_ready(out_ready ), 
        .out_valid(out_valid_wire), 
        .out_payload({out_select,out_payload}) );
   
   // ---------------------------------------------------------------------
   //| Output Mapping
   // ---------------------------------------------------------------------
   always @* begin
     out_valid   = out_valid_wire;
     out_channel = out_select;
     {out_data,out_empty,out_endofpacket,out_error,out_startofpacket} = out_payload;
   end


endmodule

//  --------------------------------------------------------------------------------
// | single buffered pipeline stage
//  --------------------------------------------------------------------------------
module qsys_10g_eth_10g_design_example_0_eth_10g_mac_tx_st_mux_flow_control_user_frame_1stage_pipeline  
#( parameter PAYLOAD_WIDTH = 8 )
 ( input                          clk,
   input                          reset_n, 
   output reg                     in_ready,
   input                          in_valid,   
   input      [PAYLOAD_WIDTH-1:0] in_payload,
   input                          out_ready,   
   output reg                     out_valid,
   output reg [PAYLOAD_WIDTH-1:0] out_payload      
 );
   
   reg in_ready1;
   
   always @* begin
   
     in_ready = out_ready || ~out_valid;
   
//     in_ready = in_ready1;
//     if (!out_ready)
//       in_ready = 0;
   end
   
   always @ (negedge reset_n, posedge clk) begin
      if (!reset_n) begin
         in_ready1 <= 0;
         out_valid <= 0;
         out_payload <= 0;
      end else begin
         in_ready1 <= out_ready || !out_valid;
         
         if (in_valid) begin
           out_valid <= 1;
         end else if (out_ready) begin
           out_valid <= 0;
         end
         
         if(in_valid && in_ready) begin
            out_payload <= in_payload;
         end
      end
   end

endmodule

