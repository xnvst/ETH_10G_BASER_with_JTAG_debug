//Legal Notice: (C)2014 Altera Corporation. All rights reserved.  Your
//use of Altera Corporation's design tools, logic functions and other
//software and tools, and its AMPP partner logic functions, and any
//output files any of the foregoing (including device programming or
//simulation files), and any associated documentation or information are
//expressly subject to the terms and conditions of the Altera Program
//License Subscription Agreement or other applicable license agreement,
//including, without limitation, that your use is for the sole purpose
//of programming logic devices manufactured by Altera and sold by Altera
//or its authorized distributors.  Please refer to the applicable
//agreement for further details.

// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module avalon_mon_onchip_memory2_0 (
                                     // inputs:
                                      address,
                                      byteenable,
                                      chipselect,
                                      clk,
                                      clken,
                                      reset,
                                      reset_req,
                                      write,
                                      writedata,

										//
										mac_rx_status_valid,    
										mac_rx_status_error,        
										mac_rx_status_data,   

										avalon_st_rx_data,           
										avalon_st_rx_valid,          
										avalon_st_rx_sop,            
										avalon_st_rx_eop,            
										avalon_st_rx_empty,          
										avalon_st_rx_error,          
										avalon_st_rx_ready,         
										stop_mon,
										mon_active,
										mon_done,
										mon_error,
										gen_lpbk,		
									  
                                     // outputs:
                                      readdata
                                   )
;

  parameter INIT_FILE = "avalon_mon_onchip_memory2_0.hex";


  output  [ 31: 0] readdata;
  input   [  9: 0] address;
  input   [  3: 0] byteenable;
  input            chipselect;
  input            clk;
  input            clken;
  input            reset;
  input            reset_req;
  input            write;
  input   [ 31: 0] writedata;

input  mac_rx_status_valid;    
input  mac_rx_status_error;        
input [39:0] mac_rx_status_data;    

input [63:0] avalon_st_rx_data;           
input avalon_st_rx_valid;          
input avalon_st_rx_sop;            
input avalon_st_rx_eop;            
input [2:0]  avalon_st_rx_empty;          
input [5:0]  avalon_st_rx_error;          
output wire   avalon_st_rx_ready;          
input wire   stop_mon;
output wire  mon_active;
output wire  mon_done;
output wire   mon_error;
output wire   gen_lpbk;

  
  wire             clocken0;
  wire    [ 31: 0] readdata;
  wire             wren;
  assign wren = chipselect & write;
  assign clocken0 = clken & ~reset_req;
  altsyncram the_altsyncram
    (
      .address_a (address),
      .byteena_a (byteenable),
      .clock0 (clk),
      .clocken0 (clocken0),
      .data_a (writedata),
      //.q_a (readdata),
      .wren_a (wren)
    );

  defparam the_altsyncram.byte_size = 8,
           the_altsyncram.init_file = "UNUSED",
           the_altsyncram.lpm_type = "altsyncram",
           the_altsyncram.maximum_depth = 1024,
           the_altsyncram.numwords_a = 1024,
           the_altsyncram.operation_mode = "SINGLE_PORT",
           the_altsyncram.outdata_reg_a = "UNREGISTERED",
           the_altsyncram.ram_block_type = "AUTO",
           the_altsyncram.read_during_write_mode_mixed_ports = "OLD_DATA",
           the_altsyncram.width_a = 32,
           the_altsyncram.width_byteena_a = 4,
           the_altsyncram.widthad_a = 10;

  //s1, which is an e_avalon_slave
  //s2, which is an e_avalon_slave

  
 	avalon_st_mon  	MON (
  // ___________________________________________________________________
	.clk       		(clk ),     			// RX clock
	.reset     		(reset ),     		// Reset Signal
	.avalon_mm_address   	(address),     	// Avalon-MM Address
	.avalon_mm_write     	(wren),  	// Avalon-MM Write Strobe
	.avalon_mm_writedata 	(writedata),     	// Avalon-MM write Data
	//.avalon_mm_read    	(avl_mm_read & blk_sel_mon),   	// Avalon-MM Read Strobe
	//.avalon_mm_waitrequest 	(waitrequest_mon),   		
	.avalon_mm_readdata  	(readdata),     	// Avalon-MM Read Data
	
	.mac_rx_status_valid	(mac_rx_status_valid),     		
	.mac_rx_status_error	(mac_rx_status_error),     		
	.mac_rx_status_data 	(mac_rx_status_data),     		
	.stop_mon 		(stop_mon),     		
	.mon_active 		(mon_active),     		
	.mon_done 		(mon_done),     		
	.mon_error 		(mon_error),     		
	.gen_lpbk 		(gen_lpbk),     		
	 
	.avalon_st_rx_data   	(avalon_st_rx_data),    	// Avalon-ST RX Data
	.avalon_st_rx_valid  	(avalon_st_rx_val),     	// Avalon-ST RX Valid
	.avalon_st_rx_sop    	(avalon_st_rx_sop),     	// Avalon-ST RX StartOfPacket
	.avalon_st_rx_eop    	(avalon_st_rx_eop),     	// Avalon-ST RX EndOfPacket
	.avalon_st_rx_empty  	(avalon_st_rx_empty),   	// Avalon-ST RX Data Empty
	.avalon_st_rx_error  	(avalon_st_rx_error),   	// Avalon-ST RX Error
	.avalon_st_rx_ready  	(avalon_st_rx_ready)    	// Avalon-ST RX Ready Output
	);
  
  
endmodule

