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

module avalon_gen_onchip_memory2_0 (
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
									tx_ready,
									tx_data,
									tx_valid,
									tx_sop,
									tx_eop,
									tx_empty,
									tx_error,
									input_10g_data,
									
                                     // outputs:
                                      readdata
                                   )
;

  parameter INIT_FILE = "avalon_gen_onchip_memory2_0.hex";


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

input                  tx_ready;        // Avalon-ST Ready Input
output wire     [63:0] tx_data;         // Avalon-ST TX Data
output wire            tx_valid;        // Avalon-ST TX Valid
output wire            tx_sop;          // Avalon-ST TX StartOfPacket
output wire            tx_eop;          // Avalon-ST TX EndOfPacket
output wire     [2:0]  tx_empty;        // Avalon-ST TX Empty
output wire            tx_error;        // Avalon-ST TX Error
input wire     [63:0]  input_10g_data;

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

  
 //========================================================================================================
	
  
   	avalon_st_gen  GEN (
// _______________________________________________________________
	.clk         (clk), 	 			// Tx clock
	.reset       (reset), 			// Reset signal
	.address     (address), 		// Avalon-MM Address
	.write       (wren), 			// Avalon-MM Write Strobe
	.writedata   (writedata), 		// Avalon-MM Write Data
	//.read        (avl_mm_read & blk_sel_gen), 	// Avalon-MM Read Strobe
	.readdata    (readdata), 		// Avalon-MM Read Data
	//.waitrequest (waitrequest_gen),   		
	 
	.tx_data     (tx_data), 			// Avalon-ST Data
	.tx_valid    (tx_valid), 			// Avalon-ST Valid
	.tx_sop      (tx_sop), 			// Avalon-ST StartOfPacket
	.tx_eop      (tx_eop), 			// Avalon-ST EndOfPacket
	.tx_empty    (tx_empty), 		// Avalon-ST Empty
	.tx_error    (tx_error), 		// Avalon-ST Error
	.tx_ready    (tx_ready),
	.input_10g_data		(input_10g_data)
	);
  // ___________________________________________________________________
  
endmodule

  
  
  
  
