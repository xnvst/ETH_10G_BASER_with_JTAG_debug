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


//-----------------------------------------------------------------------------
// DESCRIPTION
// st_2to1_adapter handle the two different st interface and combine it to become one ST interface 
//-----------------------------------------------------------------------------

// altera message_off 10230 

module altera_eth_fifo_pause_ctrl_adapter
(						
						//global
						clk,
						reset,
						
					
						//Almost full Data Sink
						data_sink_almost_full,
						
						//Almost empty Data Sink
						data_sink_almost_empty,
						
                        //Av-ST Data Source
                        pause_ctrl_src_data
                        
						);
						
	// =head2 Clock and reset interface
	input									clk;
	input									reset;
   
	// =head2 Avalon ST DataIn (Sink) Interface
	input									data_sink_almost_full;
	
	// =head2 Avalon ST DataIn (Sink) Interface
	input									data_sink_almost_empty;	

	// =head2 Avalon ST DataOut (Source) Interface
	output		[1:0]                       pause_ctrl_src_data;
    
    reg                                     hold_almost_full;
    reg                                     hold_almost_full_1;
    reg                                     reg_data_sink_almost_full;
    reg                                     reg_data_sink_almost_empty;
    
    always @ (posedge clk or posedge reset)
        begin
        if(reset == 1'b1)
            begin
            hold_almost_full <= 1'b0;
            reg_data_sink_almost_full <= 1'b0;
            reg_data_sink_almost_empty <= 1'b0;
            hold_almost_full_1 <= 1'b0;
            end
        else
            begin
            if(data_sink_almost_empty == 1'b1)
                begin
                hold_almost_full <= 1'b0;
                end
            else if(data_sink_almost_full == 1'b1)
                begin
                hold_almost_full <=1'b1;
                end 
            reg_data_sink_almost_full <= data_sink_almost_full;
            reg_data_sink_almost_empty <= data_sink_almost_empty;
            hold_almost_full_1 <= hold_almost_full;
            end
        end

	assign pause_ctrl_src_data[1] = reg_data_sink_almost_full;
	assign pause_ctrl_src_data[0] = hold_almost_full_1 & reg_data_sink_almost_empty;


endmodule


