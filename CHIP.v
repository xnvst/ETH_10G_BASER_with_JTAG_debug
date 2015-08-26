// Top level module for board testing

module CHIP (
	input  wire 		REFCLK,
	input  wire 		CLK_100MHZ,
	
	input  wire 		RXP_10G_BASE_R,
	output wire 		TXP_10G_BASE_R,

	input  wire 		RXP_10G_BASE_R_2,
	output wire 		TXP_10G_BASE_R_2,	
	
	output wire [7:0] 	LEDHOST,

	output wire			MDC,
	inout wire			MDIO,

	output wire			MDC_2,
	inout wire			MDIO_2,		
	
	//SFP Cage Interface
	input wire			SFPP_TX_FAULT,
	input wire			SFPP_RX_LOS,
	input wire			SFPP_MOD_ABS,
	output wire			SFPP_TX_DIS,
	output wire	[1:0]	SFPP_RATE_SEL,

	input wire			SFPP_TX_FAULT_2,
	input wire			SFPP_RX_LOS_2,
	input wire			SFPP_MOD_ABS_2,
	output wire			SFPP_TX_DIS_2,
	output wire	[1:0]	SFPP_RATE_SEL_2	
);

// +___________________________________________________________
// +
wire			clk_50;
wire          	rx_phy_clk;
wire          	rx_phy_clk_2;
wire			pll_locked; 

wire   [63:0] 	avalon_st_rx_data;
wire   [2:0]  	avalon_st_rx_empty;
wire          	avalon_st_rx_eop;
wire   [5:0]  	avalon_st_rx_error;
wire          	avalon_st_rx_ready;
wire          	avalon_st_rx_sop;
wire          	avalon_st_rx_valid;

wire   [63:0] 	avalon_st_rx_data_2;
wire   [2:0]  	avalon_st_rx_empty_2;
wire          	avalon_st_rx_eop_2;
wire   [5:0]  	avalon_st_rx_error_2;
wire          	avalon_st_rx_ready_2;
wire          	avalon_st_rx_sop_2;
wire          	avalon_st_rx_valid_2;   

wire   [63:0] 	avalon_st_tx_data;
wire   [2:0]  	avalon_st_tx_empty;
wire          	avalon_st_tx_eop;
wire          	avalon_st_tx_error;
wire          	avalon_st_tx_ready;
wire          	avalon_st_tx_sop;
wire          	avalon_st_tx_valid;

wire   [63:0] 	avalon_st_tx_data_2;
wire   [2:0]  	avalon_st_tx_empty_2;
wire          	avalon_st_tx_eop_2;
wire          	avalon_st_tx_error_2;
wire          	avalon_st_tx_ready_2;
wire          	avalon_st_tx_sop_2;
wire          	avalon_st_tx_valid_2;

wire			rx_status_valid;
wire   [6:0]	rx_status_error;
wire   [39:0]	rx_status_data;
wire			rx_status_valid_2;
wire   [6:0]	rx_status_error_2;
wire   [39:0]	rx_status_data_2;

wire 			STOPMON;
wire 			mon_error;
wire 			mon_active;
wire 			STOPMON_2;
wire 			mon_error_2;
wire 			mon_active_2;

wire	[7:0]	LEDHOST_0007;
wire	[7:0]	LEDHOST_0815;

wire	[1:0]	link_fault_status;
wire	[1:0]	link_fault_status_2;

wire [1:0] 	DPSW;
assign DPSW = 2'b11;

//wire   RESET_N  	= 1; 	// active low
reg   RESET_N;

// +-------------------------------------------------------------------
parameter	NUMSLAVES = 7;
// +-------------------------------------------------------------------

assign SFPP_TX_DIS 		= 0;
assign SFPP_TX_DIS_2 	= 0;

assign STOPMON  	= 0;
  
//assign	SFPP_RATE_SEL	= 2'b01;	//SFPP_RATE_SEL[0] = 1 for 10G, 0 for 1G (Finisar SFP+)
assign	SFPP_RATE_SEL	= 2'b01;	//Feng
assign	SFPP_RATE_SEL_2	= 2'b01;

// +-------------------------------------------------------------------
// +
// +
wire  					master_if_clk;				// master clock				//jier no use
wire [NUMSLAVES-1:0] 	slave_if_clk;				// slave clock 	      (s) 	//jier no use
wire [NUMSLAVES-1:0] 	slave_if_write;				// slave write 	      (s)
wire [NUMSLAVES-1:0] 	slave_if_read;				// slave read 	      (s)
wire [24*NUMSLAVES-1:0] slave_if_address;			// slave address      (s)
wire [32*NUMSLAVES-1:0] slave_if_writedata;			// slave writedata    (s)
wire [32*NUMSLAVES-1:0] slave_if_readdata;		// slave read 	      (s)			
wire [NUMSLAVES-1:0] 	slave_if_readdata_valid;	// slave readvalid    (s)
wire [NUMSLAVES-1:0] 	slave_if_waitrequest;		// slave readvalid    (s)

wire [4*NUMSLAVES-1:0] 	slave_if_burstcount;
wire [4*NUMSLAVES-1:0] 	slave_if_byteenable;
wire [NUMSLAVES-1:0] 	slave_if_readdatavalid;
wire [NUMSLAVES-1:0]	slave_if_chipselect;
wire [NUMSLAVES-1:0]	slave_if_debugaccess;


wire mon_done, tx_pma_ready, tx_pma_ready_data, rx_pma_ready, rx_pma_ready_data;
wire mon_done_2, tx_pma_ready_2, tx_pma_ready_data_2, rx_pma_ready_2, rx_pma_ready_data_2;

wire sel_display = DPSW[0];
assign rx_pma_ready_data = 1'b0;
assign tx_pma_ready_data = 1'b0;
assign rx_pma_ready_data_2 = 1'b0;
assign tx_pma_ready_data_2 = 1'b0;

wire          mdc_from_the_mdio;
wire          mdio_in_to_the_mdio;
wire          mdio_oen_from_the_mdio;
wire          mdio_out_from_the_mdio;

wire          mdc_from_the_mdio_2;
wire          mdio_in_to_the_mdio_2;
wire          mdio_oen_from_the_mdio_2;
wire          mdio_out_from_the_mdio_2;

// MDIO ports connection
assign		MDC					= mdc_from_the_mdio; 
assign 		MDIO 				= !mdio_oen_from_the_mdio? mdio_out_from_the_mdio : 1'bz;
assign 		mdio_in_to_the_mdio = MDIO;

assign		MDC_2					= mdc_from_the_mdio_2; 
assign 		MDIO_2 					= !mdio_oen_from_the_mdio_2? mdio_out_from_the_mdio_2 : 1'bz;
assign 		mdio_in_to_the_mdio_2 	= MDIO_2;


reg  [63:0] tx_dc_fifo_in_data;   
reg         tx_dc_fifo_in_valid;  
wire        tx_dc_fifo_in_ready;  
wire [63:0] tx_dc_fifo_out_data;  
wire        tx_dc_fifo_out_valid; 
reg         tx_dc_fifo_out_ready;

reg  [63:0] tx_dc_fifo_in_data_2;   
reg         tx_dc_fifo_in_valid_2;  
wire        tx_dc_fifo_in_ready_2;  
wire [63:0] tx_dc_fifo_out_data_2;  
wire        tx_dc_fifo_out_valid_2; 
reg         tx_dc_fifo_out_ready_2;

reg  [63:0] rx_dc_fifo_in_data;   
wire        rx_dc_fifo_in_valid;  
wire        rx_dc_fifo_in_ready;  
wire [63:0] rx_dc_fifo_out_data;  
wire        rx_dc_fifo_out_valid; 
wire        rx_dc_fifo_out_ready;

reg  [63:0] rx_dc_fifo_in_data_2;   
wire        rx_dc_fifo_in_valid_2;  
wire        rx_dc_fifo_in_ready_2;  
wire [63:0] rx_dc_fifo_out_data_2;  
wire        rx_dc_fifo_out_valid_2; 
wire        rx_dc_fifo_out_ready_2;

reg			sys_reset_req;  

// +-------------------------------------------------------------------
// +

/*
sys_pll	system_pll_u0	(
	.areset			(!RESET_N),
	.inclk0			(CLK_100MHZ),
	.c0				(clk_50),
	.locked			(pll_locked)
	);
*/

assign clk_50 = CLK_100MHZ;

//Feng - 50MHz for XAUI, 100MHz for 10G Base R


// +-------------------------------------------------------------------
// +
     
LED_CONTROL #(.INWIDTH(8)) LED_CONTROL (
	.reset_n 		(RESET_N),
	.clk	 		(clk_50),
	.LEDHOST_0007	(LEDHOST_0007),
	.LEDHOST_0815	(LEDHOST_0815),
	.LEDHSMC_GRN	(),
	.LEDHSMC_RED	(),
	.sel_display	(sel_display),
	.in				({	sel_display,					//Jier change the bit order for 10G Base R Ref Design	
	  					tx_pma_ready_data, 
	  					rx_pma_ready_data,
	  					mon_active,
	  					mon_error,
	  					mon_done, 
	  					tx_pma_ready,
	  					rx_pma_ready 
	  				})
);

// +-------------------------------------------------------------------
// +

LED_CTRL_MUX	LED_CTRL_MUX (
	.LED_DISP_CTRL	(DPSW),
	.INPUT_0		(LEDHOST_0007),
	.INPUT_1		(LEDHOST_0815),
	.INPUT_2		({!tx_pma_ready, !rx_pma_ready, !SFPP_TX_DIS, ~SFPP_RATE_SEL, !SFPP_RX_LOS, !SFPP_TX_FAULT, SFPP_MOD_ABS}),
	.INPUT_3		({4'hF, !tx_pma_ready, !rx_pma_ready, ~link_fault_status}),
	.OUTPUT			(LEDHOST)
);

//Feng

 
jtag_system  JTAG_SYSTEM_TOP (
	.clk_clk						(clk_50),
	.reset_reset_n					(1'b1),

	.mm_bridge_s0_m0_waitrequest		(slave_if_waitrequest[0]),
	.mm_bridge_s0_m0_readdata      		(slave_if_readdata[31:0]),
	.mm_bridge_s0_m0_readdatavalid 		(slave_if_readdatavalid[0]),
	.mm_bridge_s0_m0_burstcount    		(slave_if_burstcount[0]),
	.mm_bridge_s0_m0_writedata     		(slave_if_writedata[31:0]),	
	.mm_bridge_s0_m0_address       		(slave_if_address[23:0]),
	.mm_bridge_s0_m0_write         		(slave_if_write[0]),
	.mm_bridge_s0_m0_read          		(slave_if_read[0]),
	.mm_bridge_s0_m0_byteenable    		(slave_if_byteenable[3:0]),
	.mm_bridge_s0_m0_debugaccess		(slave_if_debugaccess[0]),	
	
	.mm_bridge_s1_m0_waitrequest		(slave_if_waitrequest[1]),
	.mm_bridge_s1_m0_readdata      		(slave_if_readdata[63:32]),
	.mm_bridge_s1_m0_readdatavalid 		(slave_if_readdatavalid[1]),
	.mm_bridge_s1_m0_burstcount    		(slave_if_burstcount[1]),
	.mm_bridge_s1_m0_writedata     		(slave_if_writedata[63:32]),	
	.mm_bridge_s1_m0_address       		(slave_if_address[47:24]),
	.mm_bridge_s1_m0_write         		(slave_if_write[1]),
	.mm_bridge_s1_m0_read          		(slave_if_read[1]),
	.mm_bridge_s1_m0_byteenable    		(slave_if_byteenable[7:4]),
	.mm_bridge_s1_m0_debugaccess		(slave_if_debugaccess[1]),

	.mm_bridge_s2_m0_waitrequest		(slave_if_waitrequest[2]),
	.mm_bridge_s2_m0_readdata      		(slave_if_readdata[95:64]),
	.mm_bridge_s2_m0_readdatavalid 		(slave_if_readdatavalid[2]),
	.mm_bridge_s2_m0_burstcount    		(slave_if_burstcount[2]),
	.mm_bridge_s2_m0_writedata     		(slave_if_writedata[95:64]),	
	.mm_bridge_s2_m0_address       		(slave_if_address[71:48]),
	.mm_bridge_s2_m0_write         		(slave_if_write[2]),
	.mm_bridge_s2_m0_read          		(slave_if_read[2]),
	.mm_bridge_s2_m0_byteenable    		(slave_if_byteenable[11:8]),
	.mm_bridge_s2_m0_debugaccess		(slave_if_debugaccess[2]),

	.mm_bridge_s3_m0_waitrequest		(slave_if_waitrequest[3]),
	.mm_bridge_s3_m0_readdata      		(slave_if_readdata[127:96]),
	.mm_bridge_s3_m0_readdatavalid 		(slave_if_readdatavalid[3]),
	.mm_bridge_s3_m0_burstcount    		(slave_if_burstcount[3]),
	.mm_bridge_s3_m0_writedata     		(slave_if_writedata[127:96]),	
	.mm_bridge_s3_m0_address       		(slave_if_address[95:72]),
	.mm_bridge_s3_m0_write         		(slave_if_write[3]),
	.mm_bridge_s3_m0_read          		(slave_if_read[3]),
	.mm_bridge_s3_m0_byteenable    		(slave_if_byteenable[15:12]),
	.mm_bridge_s3_m0_debugaccess		(slave_if_debugaccess[3]),

	.mm_bridge_s4_m0_waitrequest		(slave_if_waitrequest[4]),
	.mm_bridge_s4_m0_readdata      		(slave_if_readdata[159:128]),
	.mm_bridge_s4_m0_readdatavalid 		(slave_if_readdatavalid[4]),
	.mm_bridge_s4_m0_burstcount    		(slave_if_burstcount[4]),
	.mm_bridge_s4_m0_writedata     		(slave_if_writedata[159:128]),	
	.mm_bridge_s4_m0_address       		(slave_if_address[119:96]),
	.mm_bridge_s4_m0_write         		(slave_if_write[4]),
	.mm_bridge_s4_m0_read          		(slave_if_read[4]),
	.mm_bridge_s4_m0_byteenable    		(slave_if_byteenable[19:16]),
	.mm_bridge_s4_m0_debugaccess		(slave_if_debugaccess[4]),

	.mm_bridge_s5_m0_waitrequest		(slave_if_waitrequest[5]),
	.mm_bridge_s5_m0_readdata      		(slave_if_readdata[191:160]),
	.mm_bridge_s5_m0_readdatavalid 		(slave_if_readdatavalid[5]),
	.mm_bridge_s5_m0_burstcount    		(slave_if_burstcount[5]),
	.mm_bridge_s5_m0_writedata     		(slave_if_writedata[191:160]),	
	.mm_bridge_s5_m0_address       		(slave_if_address[143:120]),
	.mm_bridge_s5_m0_write         		(slave_if_write[5]),
	.mm_bridge_s5_m0_read          		(slave_if_read[5]),
	.mm_bridge_s5_m0_byteenable    		(slave_if_byteenable[23:20]),
	.mm_bridge_s5_m0_debugaccess		(slave_if_debugaccess[5]),

	.mm_bridge_s6_m0_waitrequest		(slave_if_waitrequest[6]),
	.mm_bridge_s6_m0_readdata      		(slave_if_readdata[223:192]),
	.mm_bridge_s6_m0_readdatavalid 		(slave_if_readdatavalid[6]),
	.mm_bridge_s6_m0_burstcount    		(slave_if_burstcount[6]),
	.mm_bridge_s6_m0_writedata     		(slave_if_writedata[223:192]),	
	.mm_bridge_s6_m0_address       		(slave_if_address[167:144]),
	.mm_bridge_s6_m0_write         		(slave_if_write[6]),
	.mm_bridge_s6_m0_read          		(slave_if_read[6]),
	.mm_bridge_s6_m0_byteenable    		(slave_if_byteenable[27:24]),
	.mm_bridge_s6_m0_debugaccess		(slave_if_debugaccess[6]),	
);	

qsys_10g  ETH10G_TOP (
	.clk_clk							(clk_50),
	.reset_reset_n						(RESET_N),
	
	.mm_bridge_s0_waitrequest			(slave_if_waitrequest[0]),
	.mm_bridge_s0_readdata      		(slave_if_readdata[31:0]),
	.mm_bridge_s0_readdatavalid 		(slave_if_readdatavalid[0]),
	.mm_bridge_s0_burstcount    		(slave_if_burstcount[0]),
	.mm_bridge_s0_writedata     		(slave_if_writedata[31:0]),	
	.mm_bridge_s0_address       		(slave_if_address[23:0]),
	.mm_bridge_s0_write         		(slave_if_write[0]),
	.mm_bridge_s0_read          		(slave_if_read[0]),
	.mm_bridge_s0_byteenable    		(slave_if_byteenable[3:0]),
	.mm_bridge_s0_debugaccess			(slave_if_debugaccess[0]),
	
	.xgmii_rx_clk_clk					(rx_phy_clk),
	.link_fault_status_xgmii_rx_data	(link_fault_status),
	
	.tx_serial_data_export				(TXP_10G_BASE_R),
	.rx_serial_data_export				(RXP_10G_BASE_R),
	
	.ref_clk_clk						(REFCLK),
	.ref_reset_reset_n					(RESET_N),
	
	.avalon_st_rxstatus_valid			(rx_status_valid),
	.avalon_st_rxstatus_data			(rx_status_data),
	.avalon_st_rxstatus_error			(rx_status_error),
	.avalon_st_txstatus_valid			(),
	.avalon_st_txstatus_data			(),
	.avalon_st_txstatus_error			(),
	
	.tx_ready_export					(tx_pma_ready),
	.rx_ready_export					(rx_pma_ready),
	
	.rx_sc_fifo_out_data				(avalon_st_rx_data),
	.rx_sc_fifo_out_valid				(avalon_st_rx_valid),
	.rx_sc_fifo_out_ready				(avalon_st_rx_ready),
	.rx_sc_fifo_out_startofpacket		(avalon_st_rx_sop),
	.rx_sc_fifo_out_endofpacket			(avalon_st_rx_eop),
	.rx_sc_fifo_out_empty				(avalon_st_rx_empty),
	.rx_sc_fifo_out_error				(avalon_st_rx_error),
	
	.tx_sc_fifo_in_data					(avalon_st_tx_data),
	.tx_sc_fifo_in_valid				(avalon_st_tx_valid),
	.tx_sc_fifo_in_ready				(avalon_st_tx_ready),
	.tx_sc_fifo_in_startofpacket		(avalon_st_tx_sop),
	.tx_sc_fifo_in_endofpacket			(avalon_st_tx_eop),
	.tx_sc_fifo_in_empty				(avalon_st_tx_empty),
	.tx_sc_fifo_in_error				(avalon_st_tx_error),
	
	.mdio_mdc   						(mdc_from_the_mdio),
	.mdio_mdio_in						(mdio_in_to_the_mdio),
	.mdio_mdio_out						(mdio_out_from_the_mdio),
	.mdio_mdio_oen       				(mdio_oen_from_the_mdio),	
	
	.tx_clk_clk							(rx_phy_clk),
	.tx_reset_reset_n					(RESET_N) 
);

avalon_gen AVALON_GEN_TOP (
	.clk_clk							(rx_phy_clk),
	.reset_reset_n						(RESET_N),	

	.mm_bridge_s0_waitrequest			(slave_if_waitrequest[1]),
	.mm_bridge_s0_readdata      		(slave_if_readdata[63:32]),
	.mm_bridge_s0_readdatavalid 		(slave_if_readdatavalid[1]),
	.mm_bridge_s0_burstcount    		(slave_if_burstcount[1]),
	.mm_bridge_s0_writedata     		(slave_if_writedata[63:32]),	
	.mm_bridge_s0_address       		(slave_if_address[47:24]),
	.mm_bridge_s0_write         		(slave_if_write[1]),
	.mm_bridge_s0_read          		(slave_if_read[1]),
	.mm_bridge_s0_byteenable    		(slave_if_byteenable[7:4]),
	.mm_bridge_s0_debugaccess			(slave_if_debugaccess[1]),
		
	.mm_tx_data							(avalon_st_tx_data),
	.mm_tx_empty						(avalon_st_tx_empty),
	.mm_tx_eop							(avalon_st_tx_eop),
	.mm_tx_error						(avalon_st_tx_error),
	.mm_tx_ready						(avalon_st_tx_ready),
	.mm_tx_sop							(avalon_st_tx_sop),
	.mm_tx_valid						(avalon_st_tx_valid),
	
	.input_10g_data						(tx_dc_fifo_out_data)
);

avalon_mon AVALON_MON_TOP (
	//.clk_clk							(rx_phy_clk),
	.clk_clk							(clk_50),
	.reset_reset_n						(RESET_N),	

	.mm_bridge_s0_waitrequest			(slave_if_waitrequest[2]),
	.mm_bridge_s0_readdata      		(slave_if_readdata[95:64]),
	.mm_bridge_s0_readdatavalid 		(slave_if_readdatavalid[2]),
	.mm_bridge_s0_burstcount    		(slave_if_burstcount[2]),
	.mm_bridge_s0_writedata     		(slave_if_writedata[95:64]),	
	.mm_bridge_s0_address       		(slave_if_address[71:48]),
	.mm_bridge_s0_write         		(slave_if_write[2]),
	.mm_bridge_s0_read          		(slave_if_read[2]),
	.mm_bridge_s0_byteenable    		(slave_if_byteenable[11:8]),
	.mm_bridge_s0_debugaccess			(slave_if_debugaccess[2]),
	
	.avl_st_rx_data					(avalon_st_rx_data),
	.avl_st_rx_empty				(avalon_st_rx_empty),
	.avl_st_rx_eop					(avalon_st_rx_eop),
	.avl_st_rx_error				(avalon_st_rx_error),
	.avl_st_rx_ready				(avalon_st_rx_ready),
	.avl_st_rx_sop					(avalon_st_rx_sop),
	.avl_st_rx_valid				(avalon_st_rx_valid),

	.mac_rx_status_valid			(rx_status_valid),
	.mac_rx_status_error			(rx_status_error[0]),
	.mac_rx_status_data				(rx_status_data),

	.stop_mon						(STOPMON),
	.mon_active						(mon_active),
	.mon_done						(mon_done),
	.mon_error						(mon_error),	
);

qsys_10g  ETH10G_TOP_2 (
	.clk_clk							(clk_50),
	.reset_reset_n						(RESET_N),
	
	.mm_bridge_s0_waitrequest			(slave_if_waitrequest[3]),
	.mm_bridge_s0_readdata      		(slave_if_readdata[127:96]),
	.mm_bridge_s0_readdatavalid 		(slave_if_readdatavalid[3]),
	.mm_bridge_s0_burstcount    		(slave_if_burstcount[3]),
	.mm_bridge_s0_writedata     		(slave_if_writedata[127:96]),	
	.mm_bridge_s0_address       		(slave_if_address[95:72]),
	.mm_bridge_s0_write         		(slave_if_write[3]),
	.mm_bridge_s0_read          		(slave_if_read[3]),
	.mm_bridge_s0_byteenable    		(slave_if_byteenable[15:12]),
	.mm_bridge_s0_debugaccess			(slave_if_debugaccess[3]),	
	
	.xgmii_rx_clk_clk					(rx_phy_clk_2),
	.link_fault_status_xgmii_rx_data	(link_fault_status_2),
	
	.tx_serial_data_export				(TXP_10G_BASE_R_2),
	.rx_serial_data_export				(RXP_10G_BASE_R_2),
	
	.ref_clk_clk						(REFCLK),
	.ref_reset_reset_n					(RESET_N),
	
	.avalon_st_rxstatus_valid			(rx_status_valid_2),
	.avalon_st_rxstatus_data			(rx_status_data_2),
	.avalon_st_rxstatus_error			(rx_status_error_2),
	.avalon_st_txstatus_valid			(),
	.avalon_st_txstatus_data			(),
	.avalon_st_txstatus_error			(),
	
	.tx_ready_export					(tx_pma_ready_2),
	.rx_ready_export					(rx_pma_ready_2),
	
	.rx_sc_fifo_out_data				(avalon_st_rx_data_2),
	.rx_sc_fifo_out_valid				(avalon_st_rx_valid_2),
	.rx_sc_fifo_out_ready				(avalon_st_rx_ready_2),
	.rx_sc_fifo_out_startofpacket		(avalon_st_rx_sop_2),
	.rx_sc_fifo_out_endofpacket			(avalon_st_rx_eop_2),
	.rx_sc_fifo_out_empty				(avalon_st_rx_empty_2),
	.rx_sc_fifo_out_error				(avalon_st_rx_error_2),
	
	.tx_sc_fifo_in_data					(avalon_st_tx_data_2),
	.tx_sc_fifo_in_valid				(avalon_st_tx_valid_2),
	.tx_sc_fifo_in_ready				(avalon_st_tx_ready_2),
	.tx_sc_fifo_in_startofpacket		(avalon_st_tx_sop_2),
	.tx_sc_fifo_in_endofpacket			(avalon_st_tx_eop_2),
	.tx_sc_fifo_in_empty				(avalon_st_tx_empty_2),
	.tx_sc_fifo_in_error				(avalon_st_tx_error_2),
	
	.mdio_mdc   						(mdc_from_the_mdio_2),
	.mdio_mdio_in						(mdio_in_to_the_mdio_2),
	.mdio_mdio_out						(mdio_out_from_the_mdio_2),
	.mdio_mdio_oen       				(mdio_oen_from_the_mdio_2),	
	
	.tx_clk_clk							(rx_phy_clk_2),
	.tx_reset_reset_n					(RESET_N) 
);

avalon_gen AVALON_GEN_TOP_2 (
	.clk_clk							(rx_phy_clk_2),
	.reset_reset_n						(RESET_N),	
	
	.mm_bridge_s0_waitrequest			(slave_if_waitrequest[4]),
	.mm_bridge_s0_readdata      		(slave_if_readdata[159:128]),
	.mm_bridge_s0_readdatavalid 		(slave_if_readdatavalid[4]),
	.mm_bridge_s0_burstcount    		(slave_if_burstcount[4]),
	.mm_bridge_s0_writedata     		(slave_if_writedata[159:128]),	
	.mm_bridge_s0_address       		(slave_if_address[119:96]),
	.mm_bridge_s0_write         		(slave_if_write[4]),
	.mm_bridge_s0_read          		(slave_if_read[4]),
	.mm_bridge_s0_byteenable    		(slave_if_byteenable[19:16]),
	.mm_bridge_s0_debugaccess			(slave_if_debugaccess[4]),	
		
	.mm_tx_data							(avalon_st_tx_data_2),
	.mm_tx_empty						(avalon_st_tx_empty_2),
	.mm_tx_eop							(avalon_st_tx_eop_2),
	.mm_tx_error						(avalon_st_tx_error_2),
	.mm_tx_ready						(avalon_st_tx_ready_2),
	.mm_tx_sop							(avalon_st_tx_sop_2),
	.mm_tx_valid						(avalon_st_tx_valid_2),
	
	.input_10g_data						(tx_dc_fifo_out_data_2)	
);

avalon_mon AVALON_MON_TOP_2 (
	//.clk_clk							(rx_phy_clk_2),
	.clk_clk							(clk_50),
	.reset_reset_n						(RESET_N),	

	.mm_bridge_s0_waitrequest			(slave_if_waitrequest[5]),
	.mm_bridge_s0_readdata      		(slave_if_readdata[191:160]),
	.mm_bridge_s0_readdatavalid 		(slave_if_readdatavalid[5]),
	.mm_bridge_s0_burstcount    		(slave_if_burstcount[5]),
	.mm_bridge_s0_writedata     		(slave_if_writedata[191:160]),	
	.mm_bridge_s0_address       		(slave_if_address[143:120]),
	.mm_bridge_s0_write         		(slave_if_write[5]),
	.mm_bridge_s0_read          		(slave_if_read[5]),
	.mm_bridge_s0_byteenable    		(slave_if_byteenable[23:20]),
	.mm_bridge_s0_debugaccess			(slave_if_debugaccess[5]),
	
	.avl_st_rx_data					(avalon_st_rx_data_2),
	.avl_st_rx_empty				(avalon_st_rx_empty_2),
	.avl_st_rx_eop					(avalon_st_rx_eop_2),
	.avl_st_rx_error				(avalon_st_rx_error_2),
	.avl_st_rx_ready				(avalon_st_rx_ready_2),
	.avl_st_rx_sop					(avalon_st_rx_sop_2),
	.avl_st_rx_valid				(avalon_st_rx_valid_2),

	.mac_rx_status_valid			(rx_status_valid_2),
	.mac_rx_status_error			(rx_status_error_2[0]),
	.mac_rx_status_data				(rx_status_data_2),

	.stop_mon						(STOPMON_2),
	.mon_active						(mon_active_2),
	.mon_done						(mon_done_2),
	.mon_error						(mon_error_2),	
);

avalon_sysctrl AVALON_SYSCTRL_TOP_(
	.clk_clk							(clk_50),
	.reset_reset_n						(1'b1),	

	.mm_bridge_s0_waitrequest			(slave_if_waitrequest[6]),
	.mm_bridge_s0_readdata      		(slave_if_readdata[223:192]),
	.mm_bridge_s0_readdatavalid 		(slave_if_readdatavalid[6]),
	.mm_bridge_s0_burstcount    		(slave_if_burstcount[6]),
	.mm_bridge_s0_writedata     		(slave_if_writedata[223:192]),	
	.mm_bridge_s0_address       		(slave_if_address[167:144]),
	.mm_bridge_s0_write         		(slave_if_write[6]),
	.mm_bridge_s0_read          		(slave_if_read[6]),
	.mm_bridge_s0_byteenable    		(slave_if_byteenable[27:24]),
	.mm_bridge_s0_debugaccess			(slave_if_debugaccess[6]),
	.sys_reset_req						(sys_reset_req)	
);

avalon_dc_fifo AVALON_DC_FIFO_TX_TOP(
		.reset_ext_reset_n		(RESET_N),
		.clk_int_clk			(clk_50),
		.reset_int_reset_n		(RESET_N),
		.clk_ext_clk			(rx_phy_clk),
		.dc_fifo_in_data		(tx_dc_fifo_in_data),   
		.dc_fifo_in_valid		(tx_dc_fifo_in_valid),
		.dc_fifo_in_ready		(tx_dc_fifo_in_ready), 
		.dc_fifo_out_data		(tx_dc_fifo_out_data), 
		.dc_fifo_out_valid		(tx_dc_fifo_out_valid),
		.dc_fifo_out_ready		(tx_dc_fifo_out_ready),
	);

avalon_dc_fifo AVALON_DC_FIFO_TX_TOP_2(
		.reset_ext_reset_n		(RESET_N),
		.clk_int_clk			(clk_50),
		.reset_int_reset_n		(RESET_N),
		.clk_ext_clk			(rx_phy_clk_2),
		.dc_fifo_in_data		(tx_dc_fifo_in_data_2),   
		.dc_fifo_in_valid		(tx_dc_fifo_in_valid_2),
		.dc_fifo_in_ready		(tx_dc_fifo_in_ready_2), 
		.dc_fifo_out_data		(tx_dc_fifo_out_data_2), 
		.dc_fifo_out_valid		(tx_dc_fifo_out_valid_2),
		.dc_fifo_out_ready		(tx_dc_fifo_out_ready_2),
	);	

avalon_dc_fifo AVALON_DC_FIFO_RX_TOP(
		.reset_ext_reset_n		(RESET_N),
		.clk_int_clk			(rx_phy_clk),
		.reset_int_reset_n		(RESET_N),
		.clk_ext_clk			(clk_50),
		.dc_fifo_in_data		(avalon_st_rx_data),   
		.dc_fifo_in_valid		(rx_dc_fifo_in_valid),
		.dc_fifo_in_ready		(rx_dc_fifo_in_ready), 
		.dc_fifo_out_data		(rx_dc_fifo_out_data), 
		.dc_fifo_out_valid		(rx_dc_fifo_out_valid),
		.dc_fifo_out_ready		(rx_dc_fifo_out_ready),
	);
	
avalon_dc_fifo AVALON_DC_FIFO_RX_TOP_2(
		.reset_ext_reset_n		(RESET_N),
		.clk_int_clk			(rx_phy_clk_2),
		.reset_int_reset_n		(RESET_N),
		.clk_ext_clk			(clk_50),
		.dc_fifo_in_data		(avalon_st_rx_data_2),   
		.dc_fifo_in_valid		(rx_dc_fifo_in_valid_2),
		.dc_fifo_in_ready		(rx_dc_fifo_in_ready_2), 
		.dc_fifo_out_data		(rx_dc_fifo_out_data_2), 
		.dc_fifo_out_valid		(rx_dc_fifo_out_valid_2),
		.dc_fifo_out_ready		(rx_dc_fifo_out_ready_2),
	);	

//=============================================================================================================

assign rx_dc_fifo_in_valid = 1;
assign rx_dc_fifo_out_ready = 1;
assign rx_dc_fifo_in_valid_2 = 1;
assign rx_dc_fifo_out_ready_2 = 1;

always @ (posedge clk_50)
	begin
		if (!RESET_N)
			begin
				tx_dc_fifo_in_data <= 64'h0;
				tx_dc_fifo_in_valid <= 0;
				tx_dc_fifo_out_ready <= 0;
				tx_dc_fifo_in_data_2 <= 64'h0;
				tx_dc_fifo_in_valid_2 <= 0;
				tx_dc_fifo_out_ready_2 <= 0;				
			end
		else if (avalon_st_tx_sop)
			begin
				tx_dc_fifo_in_data <= tx_dc_fifo_in_data + 64'h1;
			end
		else if (avalon_st_tx_sop_2)
			begin
				tx_dc_fifo_in_data_2 <= tx_dc_fifo_in_data_2 + 64'h1;
			end			
		else
			begin
				tx_dc_fifo_in_data <= 64'hA0A1A2A3A4A5A6A7;
				tx_dc_fifo_in_valid <= 1;
				tx_dc_fifo_out_ready <= 1;
				tx_dc_fifo_in_data_2 <= 64'hB0B1B2B3B4B5B6B7;
				tx_dc_fifo_in_valid_2 <= 1;
				tx_dc_fifo_out_ready_2 <= 1;				
			end			
	end


always @ (posedge clk_50)
	begin 
		if (sys_reset_req)
			begin
				RESET_N <= 0;
			end
		else
			RESET_N <= 1;
	end	
//=============================================================================================================

		
endmodule
