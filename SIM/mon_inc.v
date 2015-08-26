 // ___________________________________________________________________________
 //		Generator registers
 // ___________________________________________________________________________


  parameter	MON_RXPKTCNT_EXPT	= BASE_ADDR_MON + 32'h0000; 	// 0
  parameter	MON_RXPKTCNT_GOOD	= BASE_ADDR_MON + 32'h0004;    	// 1
  parameter	MON_RXPKTCNT_ERROR 	= BASE_ADDR_MON + 32'h0008;    	// 2
  parameter	MON_RXBYTECNT_LO32 	= BASE_ADDR_MON + 32'h000C;	// 3
  parameter	MON_RXBYTECNT_HI32 	= BASE_ADDR_MON + 32'h0010;	// 4
  parameter	MON_RXCYCLCNT_LO32 	= BASE_ADDR_MON + 32'h0014;	// 5
  parameter	MON_RXCYCLCNT_HI32 	= BASE_ADDR_MON + 32'h0018;	// 6
  parameter	MON_RXCTRL_STATUS 	= BASE_ADDR_MON + 32'h001C;	// 7

 // ___________________________________________________________________________

 task SETMON_STOP; 
     begin
       $display (" STOPING [user requested] Packet Checker at Time %t\n",$time);
       $display ("=================================================\n");
      `AVMM.write(MON_RXCTRL_STATUS, {30'd0,2'b10}); 
     end
  endtask

 task SETMON_RXCNT_RESET; 
     begin
       $display (" RESETTING Monitor Packet Counters at Time %t\n",$time);
       $display ("=================================================\n");
      `AVMM.write(MON_RXCTRL_STATUS, {30'd0,2'b01}); 
     end
  endtask

 task SETMON_RXPKTCNT_EXPT; 
     input[31:0] value;
     begin
       $display (" Number of Packets Expected to be Received = %d \n",value);
       $display ("=================================================\n");
      `AVMM.write(MON_RXPKTCNT_EXPT, value[31:0]); 
     end
  endtask

 reg[31:0] rx_status; initial begin rx_status = 32'd0; end
 reg[31:0] num_pkts_good; initial begin num_pkts_good = 32'd0; end
 reg[31:0] num_pkts_bad; initial begin num_pkts_bad = 32'd0; end

 task CHKMON_STATUS_DONE;
     begin
   	$display("Monitor Waiting to Receive number of packets Expected");
       `AVMM.print_register_match_message("F");
        while (rx_status[2] !== 1'b1)
           begin	   
      	       `AVMM.readout(MON_RXCTRL_STATUS, rx_status); 
           end	   
      `AVMM.print_register_match_message("F");
      `AVMM.print_register_mismatch_message("F");
      `AVMM.readout(MON_RXPKTCNT_GOOD, num_pkts_good); 
      `AVMM.readout(MON_RXPKTCNT_ERROR, num_pkts_bad); 
       $display ("______________________________________________________________________\n");
       $display ("	Monitor Received %d pkt(s) \n", num_pkts_good);
       $display ("	Monitor Received %d pkt(s) with CRC Errors \n", num_pkts_bad);
       $display ("______________________________________________________________________\n\n");
     end
  endtask

 // __________________________________________________________________________________________
 // 





