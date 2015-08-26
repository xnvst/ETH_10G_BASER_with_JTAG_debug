
module qsys_10g (
	clk_clk,
	reset_reset_n,
	tx_clk_clk,
	tx_reset_reset_n,
	ref_clk_clk,
	ref_reset_reset_n,
	avalon_st_rxstatus_valid,
	avalon_st_rxstatus_data,
	avalon_st_rxstatus_error,
	link_fault_status_xgmii_rx_data,
	rx_serial_data_export,
	tx_serial_data_export,
	rx_ready_export,
	tx_ready_export,
	tx_sc_fifo_in_data,
	tx_sc_fifo_in_valid,
	tx_sc_fifo_in_ready,
	tx_sc_fifo_in_startofpacket,
	tx_sc_fifo_in_endofpacket,
	tx_sc_fifo_in_empty,
	tx_sc_fifo_in_error,
	rx_sc_fifo_out_data,
	rx_sc_fifo_out_valid,
	rx_sc_fifo_out_ready,
	rx_sc_fifo_out_startofpacket,
	rx_sc_fifo_out_endofpacket,
	rx_sc_fifo_out_empty,
	rx_sc_fifo_out_error,
	mdio_mdc,
	mdio_mdio_in,
	mdio_mdio_out,
	mdio_mdio_oen,
	avalon_st_txstatus_data,
	avalon_st_txstatus_valid,
	avalon_st_txstatus_error,
	xgmii_rx_clk_clk,
	mm_bridge_s0_waitrequest,
	mm_bridge_s0_readdata,
	mm_bridge_s0_readdatavalid,
	mm_bridge_s0_burstcount,
	mm_bridge_s0_writedata,
	mm_bridge_s0_address,
	mm_bridge_s0_write,
	mm_bridge_s0_read,
	mm_bridge_s0_byteenable,
	mm_bridge_s0_debugaccess);	

	input		clk_clk;
	input		reset_reset_n;
	input		tx_clk_clk;
	input		tx_reset_reset_n;
	input		ref_clk_clk;
	input		ref_reset_reset_n;
	output		avalon_st_rxstatus_valid;
	output	[39:0]	avalon_st_rxstatus_data;
	output	[6:0]	avalon_st_rxstatus_error;
	output	[1:0]	link_fault_status_xgmii_rx_data;
	input		rx_serial_data_export;
	output	[0:0]	tx_serial_data_export;
	output		rx_ready_export;
	output		tx_ready_export;
	input	[63:0]	tx_sc_fifo_in_data;
	input		tx_sc_fifo_in_valid;
	output		tx_sc_fifo_in_ready;
	input		tx_sc_fifo_in_startofpacket;
	input		tx_sc_fifo_in_endofpacket;
	input	[2:0]	tx_sc_fifo_in_empty;
	input		tx_sc_fifo_in_error;
	output	[63:0]	rx_sc_fifo_out_data;
	output		rx_sc_fifo_out_valid;
	input		rx_sc_fifo_out_ready;
	output		rx_sc_fifo_out_startofpacket;
	output		rx_sc_fifo_out_endofpacket;
	output	[2:0]	rx_sc_fifo_out_empty;
	output	[5:0]	rx_sc_fifo_out_error;
	output		mdio_mdc;
	input		mdio_mdio_in;
	output		mdio_mdio_out;
	output		mdio_mdio_oen;
	output	[39:0]	avalon_st_txstatus_data;
	output		avalon_st_txstatus_valid;
	output	[6:0]	avalon_st_txstatus_error;
	output		xgmii_rx_clk_clk;
	output		mm_bridge_s0_waitrequest;
	output	[31:0]	mm_bridge_s0_readdata;
	output		mm_bridge_s0_readdatavalid;
	input	[3:0]	mm_bridge_s0_burstcount;
	input	[31:0]	mm_bridge_s0_writedata;
	input	[23:0]	mm_bridge_s0_address;
	input		mm_bridge_s0_write;
	input		mm_bridge_s0_read;
	input	[3:0]	mm_bridge_s0_byteenable;
	input		mm_bridge_s0_debugaccess;
endmodule
