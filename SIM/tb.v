`timescale 1ps/1ps

 module tb();

 // ______________________________________________
 //
 `include "./tb_inc.v"

   parameter HALF_PERIOD_156P25 = 3200;     //ref clock set to 156.25Mhz for XAUI Reference design
   parameter HALF_PERIOD_644P53125 = 776;	//ref clock set clostest to 644.3125Mhz (644.33Mhz) for 10G Base R Reference design
   parameter HALF_PERIOD_50 = 10000;        //system clock is 50Mhz for XAUI Reference design 
   parameter HALF_PERIOD_100 = 5000;		//system clock is 100Mhz for 10G Base R Reference design
   
   parameter ACTIVE_RESET = 40*HALF_PERIOD_100;

   reg  REFCLK, CLK_100M;
   reg  async_reset;
 
  initial
     begin
   	REFCLK = 0;
	CLK_100M = 0;
   	async_reset = 0;
        # ACTIVE_RESET async_reset = 1;
        # ACTIVE_RESET async_reset = 0;
     end

  always
     begin
       #(HALF_PERIOD_100) CLK_100M = ~CLK_100M;
     end

  always
     begin
       #(HALF_PERIOD_644P53125) REFCLK = ~REFCLK;
     end


 // ________________________________________________
 //  
   wire	RXP_10G_BASE_R, TXP_10G_BASE_R;
   assign RXP_10G_BASE_R = TXP_10G_BASE_R; 	 
   
   reg  [1:0]  	PBTN;
   reg	[1:0]	DPSW;
   wire [7:0] 	LED0;
   wire			sys_rdy;
   assign sys_rdy = (LED0[3:0] == 4'h3)? 1'b1 : 1'b0;		//LEDHOST output is active low

CHIP CHIP_DUT (
	.REFCLK 			(REFCLK),
	.CLK_100MHZ			(CLK_100M),	
	
	.RXP_10G_BASE_R		(RXP_10G_BASE_R),
	.TXP_10G_BASE_R		(TXP_10G_BASE_R),
	
	.PBTN				({PBTN[1:0], ~async_reset}),
	.DPSW				(DPSW),
	.LEDHOST			(LED0),

	.MDC				(mdc),
	.MDIO				(mdio),

	//SFP Cage Interface
	.SFPP_TX_FAULT		(1'b0),
	.SFPP_RX_LOS		(1'b0),
	.SFPP_MOD_ABS		(1'b0),
	.SFPP_TX_DIS		(),
	.SFPP_RATE_SEL		()
);	
	
	
 // ________________________________________________
 //
  `ifndef DMPVARMODULE
	`define DUMPVARMODULE test
  `else
  `endif

 `ifdef DUMP_VCD
     	initial
       	  begin
             $dumpfile("test_core.vcd");
             $dumpvars(0, `DUMPVARMODULE);
       	  end
  `else
  `endif
      
 // ____________________________________

  task wait_for_reset_done;
     begin
        @(negedge async_reset);
        repeat (10) @(posedge REFCLK);
        $display ("DUT Reset de-asserted \n");
     end
   endtask


 // ____________________________________

initial                  
   begin                 
      #10
      wait_for_reset_done;
      #50
		PBTN = 2'b11;
		DPSW = 2'b11;		//to select the LEDHOST to display the TX and RX PMA READY status and Link Fault status (all is active low due to led display)
      fork
	 begin
 	// _____________________________________________________
	//	ENV Configurations
	// _____________________________________________________
        	repeat (10) @(posedge CHIP_DUT.TRAFFIC_CTRL.clk);
	      	CONFIG_BURST_PKT_SIZE_FIXED(32'd100, 32'd80); 
	      	SETMON_RXPKTCNT_EXPT(32'd100);	

	// _____________________________________________________
	//	MAC Configurations
	// _____________________________________________________
		SETMAC_PRIMARY_ADDR(48'hC5C4C3C2C1C0);
		CHKMAC_PRIMARY_ADDR(48'hC5C4C3C2C1C0);
 		SETMAC_STRIP_RX_PADCRC;
 		//SETMAC_LOCAL_LPBK_ENA;
	      
		SETPHY_GXB_PWRDWN;	
 	// _____________________________________________________
	//	external PHY access via MDIO
 	// _____________________________________________________
		//MDIO_WRITE(5'h01, 5'h04, 16'habcd, 16'hfeed);

	// _____________________________________________________
	//	Wait Link Up
 	// _____________________________________________________	
		wait (sys_rdy == 1'b1);
		$display ("Ethernet Link is up and ready \n");
 	// _____________________________________________________
	//	KICK_START
	// _____________________________________________________
		//repeat (1000) @(posedge CHIP_DUT.TRAFFIC_CTRL.clk);
		SETGEN_START;

 	// _____________________________________________________
	//	C H E C K _ R E S U L T S
	// _____________________________________________________
	        CHKMON_STATUS_DONE;
	        $stop;
	 end
	 begin
             repeat (4000) @(posedge CHIP_DUT.TRAFFIC_CTRL.clk);
	     PBTN = 2'b01;	//stop simulation
	 end
       join
	 
   end

 
 endmodule
