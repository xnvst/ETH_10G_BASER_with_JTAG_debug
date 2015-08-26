`timescale 1ps/1ps
 // _________________________________________________________________________________________________________
 //	file: alt_jtagavalon.v
 //	purpose: functional verification
 //	author: Ajay dubey
 // _________________________________________________________________________________________________________
 //synopsys translate_off
  module altera_jtag_avalon_master #(parameter USE_PLI = 0, PLI_PORT = 50000)(
	  input  wire clk  											
	, input  wire reset_n     										
	, input  wire [31:0] readdata_to_the_altera_jtag_avalon_master_packets_to_transactions_converter		
	, input  wire readdatavalid_to_the_altera_jtag_avalon_master_packets_to_transactions_converter	
	, input  wire waitrequest_to_the_altera_jtag_avalon_master_packets_to_transactions_converter 	
	, output wire resetrequest_from_the_altera_jtag_avalon_master_jtag_interface  			
	, output wire [31:0] address_from_the_altera_jtag_avalon_master_packets_to_transactions_converter  		
	, output wire [3:0] byteenable_from_the_altera_jtag_avalon_master_packets_to_transactions_converter	
	, output wire read_from_the_altera_jtag_avalon_master_packets_to_transactions_converter 		
	, output wire write_from_the_altera_jtag_avalon_master_packets_to_transactions_converter 		
	, output wire [31:0] writedata_from_the_altera_jtag_avalon_master_packets_to_transactions_converter 	
	);

 // _________________________________________________________________________________________________________

	wire avalon_write; 
	wire avalon_read; 
	reg[31:0] avalon_address; initial begin avalon_address = 32'd0; end
	reg[31:0] avalon_writedata; initial begin avalon_writedata = 32'd0; end
	reg[3:0] avalon_byteenable; initial begin avalon_byteenable = 4'hf; end
	reg avalon_resetrequest; initial begin avalon_resetrequest = 1'd0; end

 // _________________________________________________________________________________________________________
	assign read_from_the_altera_jtag_avalon_master_packets_to_transactions_converter = avalon_read;
	assign write_from_the_altera_jtag_avalon_master_packets_to_transactions_converter= avalon_write;
	assign writedata_from_the_altera_jtag_avalon_master_packets_to_transactions_converter= avalon_writedata;
	assign address_from_the_altera_jtag_avalon_master_packets_to_transactions_converter = avalon_address;
	assign byteenable_from_the_altera_jtag_avalon_master_packets_to_transactions_converter = avalon_byteenable;
	assign resetrequest_from_the_altera_jtag_avalon_master_jtag_interface = avalon_resetrequest;
	wire avalon_waitrequest = waitrequest_to_the_altera_jtag_avalon_master_packets_to_transactions_converter; 
	wire avalon_readdatavalid = readdatavalid_to_the_altera_jtag_avalon_master_packets_to_transactions_converter; 
	wire [31:0] avalon_readdata = readdata_to_the_altera_jtag_avalon_master_packets_to_transactions_converter;

	parameter IDLE = 2'd0, WRITE = 2'd1, READ = 2'd2;
	reg[1:0] state, next_state; 
 	initial begin state = 2'd0; next_state = 2'd0; end
 // _________________________________________________________________________________________________________
  	reg print_match_message= 1'b1;
  	task print_register_match_message;
     	input[7:0] true_false;
     	    begin
         	if(true_false === "T") print_match_message= 1'b1;
         	else if(true_false === "F") print_match_message= 1'b0;
         	else print_match_message= 1'b1;
     	    end
 	endtask
         
  	reg print_mismatch_message= 1'b1;
  	task print_register_mismatch_message;
     	input[7:0] true_false;
     	    begin
         	if(true_false === "T") print_mismatch_message= 1'b1;
         	else if(true_false === "F") print_mismatch_message= 1'b0;
         	else print_mismatch_message= 1'b1;
     	    end
 	endtask
 // _________________________________________________________________________________________________________
  	reg wren; initial begin wren = 1'b0; end
  	task write;
     	input[31:0] addr;
     	input[31:0] data;
     	    begin
	    	repeat(10) @(posedge clk);  // hack assumes any previous transaction is done within 10 cycles
	  	avalon_address = addr;
	  	avalon_writedata=data;
    		//$display("__INFO__: Writing Register @ %h => Write Data %h", avalon_address, avalon_writedata);
		@(posedge clk) wren=#1 1'b1;
		@(posedge clk) wren=#1 1'b0;
		@(negedge avalon_write); // must not exit until write is done
     	    end
  	endtask
 // _________________________________________________________________________________________________________
  	reg rden; initial begin rden = 1'b0; end
	reg[31:0] exp_readdata; initial begin exp_readdata = 32'd0; end
  	task read;
     	input[31:0] addr;
     	input[31:0] data;
     	    begin
	   	print_register_match_message("T");
	   	print_register_mismatch_message("T");
	    	repeat(10) @(posedge clk);  // hack assumes any previous transaction is done within 10 cycles
	  	avalon_address = addr;
		@(posedge clk) rden=#1 1'b1; exp_readdata = data;
		@(posedge clk) rden=#1 1'b0;
		//@(negedge avalon_waitrequest); // must not exit until read is done
		@(posedge avalon_readdatavalid); // must not exit until read is done
     	    end
  	endtask

     reg[31:0] debug; initial begin debug = 0; end
  	task readout;
     	input[31:0] addr;
     	output[31:0] dout;
     	    begin
	   	print_register_match_message("F");
	   	print_register_mismatch_message("F");
		repeat (2) @(posedge clk);
	  	avalon_address = addr;
	    	@(posedge clk) rden=1'b1;
		@(posedge clk) rden=1'b0;
		@(posedge avalon_readdatavalid) dout = avalon_readdata;
     	    end
   	 endtask
 // _________________________________________________________________________________________________________

 	always@ (negedge clk)
 	    begin
      		if (avalon_readdatavalid)
	 	    begin
      			if((exp_readdata === avalon_readdata)& print_match_message)
       	    		$display("__INFO__: At Time:%t Register @ %h Returned Expected Value %h", $time, avalon_address, exp_readdata);
      			else if(!(exp_readdata === avalon_readdata)&&print_mismatch_message)
           		$display("__ERROR_: AT TIME: %t Register @ %h Returned %h while Expected Value was %h", $time, avalon_address, avalon_readdata, exp_readdata);
   		    end
    	    end
 // _________________________________________________________________________________________________________

	always@(*)
	    begin
		case(state)
		   IDLE: if(wren) next_state = WRITE; else if (rden) next_state = READ; else next_state = IDLE;
		   READ: if (avalon_waitrequest) next_state = state; else if (rden) next_state = READ; else if (wren) next_state = WRITE; else next_state = IDLE;
		   WRITE:if (avalon_waitrequest) next_state = state; else if (rden) next_state = READ; else if (wren) next_state = WRITE; else next_state = IDLE;
		   //READ: if (avalon_waitrequest) next_state = state; else next_state = IDLE;
		   //WRITE:if (avalon_waitrequest) next_state = state; else next_state = IDLE;
		   default: next_state = state;
		endcase
	    end

	always@(posedge clk) state <= #1 next_state;

	assign avalon_write = (state == WRITE);
	assign avalon_read = (state == READ);

 // _________________________________________________________________________________________________________


 endmodule
//synopsys translate_on
//VALID FILE
