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


//
// Common control & status register map for transceiver PHY IP
// Applies to Stratix V-generation basic PHY components
//
// $Header$
//

`timescale 1 ns / 1 ns

module csr_pcs10gbaser #(
	parameter lanes = 1
)
(
	// user data (avalon-MM formatted) 
	input	wire		clk,
	input	tri0		reset,
	input	wire [7:0]	address,
	input	tri0		read,
	output	reg  [31:0]	readdata = 0,
	input	tri0		write,
	input	wire [31:0]	writedata,

	input 	wire		rx_clk,	// to synchronize rx control outputs
	input 	wire		tx_clk,	// to synchronize tx control outputs
	input 	wire[lanes - 1 : 0]		rx_pma_clk,	// to synchronize tx control outputs


	//transceiver status inputs to this CSR
	input	wire [lanes - 1 : 0]	pcs_status,
	input	wire [lanes - 1 : 0]	hi_ber,
	input	wire [lanes - 1 : 0]	block_lock,
	input	wire [lanes - 1 : 0]	rx_data_ready,
	input	wire [lanes - 1 : 0]	tx_fifo_full,
	input	wire [lanes - 1 : 0]	rx_fifo_full,
	input	wire [lanes - 1 : 0]	rx_sync_head_error,
	input	wire [lanes - 1 : 0]	rx_scrambler_error,
	input	wire [lanes*6 - 1 : 0]	ber_cnt,
	input	wire [lanes*8 - 1 : 0]	errored_block_cnt,

	
	// read/write control outputs
	// PCS controls
	output	wire [lanes - 1 : 0]	csr_rclr_errblk_cnt,
	output	wire [lanes - 1 : 0]	csr_rclr_ber_cnt
);
	import alt_xcvr_csr_common_h::*;
	import csr_pcs10gbaser_h::*;
	
	localparam sync_stages = 3;	// number of sync stages for transceiver status signals
	localparam sync_stages_str = sync_stages[7:0] + 8'd48; // number of sync stages specified as string (for timing constraints)
	localparam LANE_REGW = 5;

	// Parameter strings for embedded timing constraints
	localparam  SYNC_RCLR_CNT_CONSTRAINT = {"-name SDC_STATEMENT \"set regs [get_registers -nowarn *csr_pcs10gbaser*sync_rclr_*_cnt[",sync_stages_str,"]*]; if {[llength [query_collection -report -all $regs]] > 0} {set_false_path -to $regs}\""};
	localparam  ALTSHIFT_TAPS_CONSTRAINT = {"-name SDC_STATEMENT \"set regs [get_registers -nowarn *csr_pcs10gbaser*altshift_taps*porta_datain_reg*]; if {[llength [query_collection -report -all $regs]] > 0} {set_false_path -to $regs}\""};

	// internal registers
	reg  [LANE_REGW-1:0] reg_lane_number = 0; // lane or group number for indirection
	reg  [lanes - 1 : 0] clear_latch_status;
	reg  [lanes - 1 : 0] block_lock_latch_low, block_lock_sync;
	reg  [lanes - 1 : 0] hi_ber_latch_high, hi_ber_sync;

	////////////////////////////////////////////////////////
	// Read/Write CSR registers with lane indirection 
	////////////////////////////////////////////////////////
	reg  [lanes - 1 : 0] reg_rclr_errblk_cnt = 0;
	(* altera_attribute = SYNC_RCLR_CNT_CONSTRAINT *) reg  [lanes - 1 : 0] sync_rclr_errblk_cnt [sync_stages:1]; // synchronize to tx_clk
	wire [lanes - 1 : 0] write_rclr_errblk_cnt;	// indexed write group muxed in
	wire [0 : 0] lane_rclr_errblk_cnt;	// selected group indexed for output
	csr_indexed_write_mux #(.groups(lanes), .grp_size(1), .sel_size(LANE_REGW), .init_value(0))
		wmux_rclr_errblk_cnt(.in_narrow(writedata[2]), 
			.in_wide(reg_rclr_errblk_cnt), .sel(reg_lane_number),
			.out_narrow(lane_rclr_errblk_cnt), .out_wide(write_rclr_errblk_cnt));

	reg  [lanes - 1 : 0] reg_rclr_ber_cnt = 0;
	(* altera_attribute = SYNC_RCLR_CNT_CONSTRAINT *) reg  [lanes - 1 : 0] sync_rclr_ber_cnt [sync_stages:1]; // synchronize to rx_clk
	wire [lanes - 1 : 0] write_rclr_ber_cnt;	// indexed write group muxed in
	wire [0 : 0] lane_rclr_ber_cnt;	// selected group indexed for output
	csr_indexed_write_mux #(.groups(lanes), .grp_size(1), .sel_size(LANE_REGW), .init_value(0))
		wmux_rclr_ber_cnt(.in_narrow(writedata[3]), 
			.in_wide(reg_rclr_ber_cnt), .sel(reg_lane_number),
			.out_narrow(lane_rclr_ber_cnt), .out_wide(write_rclr_ber_cnt));

	////////////////////////////////////////////////////////
	// Read-only CSR registers with lane indirection
	////////////////////////////////////////////////////////
	// read-only status registers are synchronized forms of transceiver status signals
	// async inputs go to reg [sync_stages], and come out synchronized at reg [1]
	////////////////////////////////////////////////////////
	// read selectors (muxes) that index using the indirect lane (group) number
	wire [0 : 0]	lane_pcs_status;
	(* altera_attribute = ALTSHIFT_TAPS_CONSTRAINT *)
	csr_indexed_read_only_reg #(.groups(lanes), .grp_size(1), .sel_size(LANE_REGW), .sync_stages(sync_stages))
		mux_pcs_status(.clk(clk), .async_in_wide(pcs_status),
			.sel(reg_lane_number), .out_narrow(lane_pcs_status));

	wire [0 : 0]	lane_hi_ber;
	csr_indexed_read_only_reg #(.groups(lanes), .grp_size(1), .sel_size(LANE_REGW), .sync_stages(sync_stages))
		mux_hi_ber(.clk(clk), .async_in_wide(hi_ber),
			.sel(reg_lane_number), .out_narrow(lane_hi_ber));

	wire [0 : 0]	lane_block_lock;
	csr_indexed_read_only_reg #(.groups(lanes), .grp_size(1), .sel_size(LANE_REGW), .sync_stages(sync_stages))
		mux_block_lock(.clk(clk), .async_in_wide(block_lock),
			.sel(reg_lane_number), .out_narrow(lane_block_lock));

	wire [0 : 0]	lane_rx_data_ready;
	csr_indexed_read_only_reg #(.groups(lanes), .grp_size(1), .sel_size(LANE_REGW), .sync_stages(sync_stages))
		mux_rx_data_ready(.clk(clk), .async_in_wide(rx_data_ready),
			.sel(reg_lane_number), .out_narrow(lane_rx_data_ready));


	wire [0 : 0]	lane_tx_fifo_full;
	csr_indexed_read_only_reg #(.groups(lanes), .grp_size(1), .sel_size(LANE_REGW), .sync_stages(sync_stages))
		mux_tx_fifo_full(.clk(clk), .async_in_wide(tx_fifo_full),
			.sel(reg_lane_number), .out_narrow(lane_tx_fifo_full));

	wire [0 : 0]	lane_rx_fifo_full;
	csr_indexed_read_only_reg #(.groups(lanes), .grp_size(1), .sel_size(LANE_REGW), .sync_stages(sync_stages))
		mux_rx_fifo_full(.clk(clk), .async_in_wide(rx_fifo_full),
			.sel(reg_lane_number), .out_narrow(lane_rx_fifo_full));

	wire [0 : 0]	lane_rx_sync_head_error;
	csr_indexed_read_only_reg #(.groups(lanes), .grp_size(1), .sel_size(LANE_REGW), .sync_stages(sync_stages))
		mux_rx_sync_head_error(.clk(clk), .async_in_wide(rx_sync_head_error),
			.sel(reg_lane_number), .out_narrow(lane_rx_sync_head_error));

	wire [0 : 0]	lane_rx_scrambler_error;
	csr_indexed_read_only_reg #(.groups(lanes), .grp_size(1), .sel_size(LANE_REGW), .sync_stages(sync_stages))
		mux_scrambler_error(.clk(clk), .async_in_wide(rx_scrambler_error),
			.sel(reg_lane_number), .out_narrow(lane_rx_scrambler_error));

	wire [5 : 0]	lane_ber_cnt;
	csr_indexed_read_only_reg #(.groups(lanes), .grp_size(6), .sel_size(LANE_REGW), .sync_stages(sync_stages))
		mux_ber_cnt(.clk(clk), .async_in_wide(ber_cnt),
			.sel(reg_lane_number), .out_narrow(lane_ber_cnt));
			
	wire [7 : 0]	lane_errored_block_cnt;
	csr_indexed_read_only_reg #(.groups(lanes), .grp_size(8), .sel_size(LANE_REGW), .sync_stages(sync_stages))
		mux_errored_block_cnt(.clk(clk), .async_in_wide(errored_block_cnt),
			.sel(reg_lane_number), .out_narrow(lane_errored_block_cnt));
			
	wire [0 : 0] lane_block_lock_latch;
	csr_indexed_read_only_reg #(.groups(lanes), .grp_size(1), .sel_size(LANE_REGW), .sync_stages(1))
		mux_block_lock_latch(.clk(clk), .async_in_wide(block_lock_latch_low),
			.sel(reg_lane_number), .out_narrow(lane_block_lock_latch));
			
	wire [0 : 0] lane_hi_ber_latch;
	csr_indexed_read_only_reg #(.groups(lanes), .grp_size(1), .sel_size(LANE_REGW), .sync_stages(1))
		mux_hi_ber_latch(.clk(clk), .async_in_wide(hi_ber_latch_high),
			.sel(reg_lane_number), .out_narrow(lane_hi_ber_latch));

	alt_xcvr_resync #(
		.WIDTH       (lanes)  // Number of bits to resync
	) block_lock_resync (
		.clk    (clk),
		.reset  (reset),
		.d      (block_lock),
		.q      (block_lock_sync)
	);

	alt_xcvr_resync #(
		.WIDTH       (lanes)  // Number of bits to resync
	) hi_ber_resync (
		.clk    (clk),
		.reset  (reset),
		.d      (hi_ber),
		.q      (hi_ber_sync)
	);



	always @(posedge clk or posedge reset) begin
		if (reset == 1) begin
			readdata <= 0;
			reg_lane_number <= 0;
			reg_rclr_errblk_cnt <= 0;
			reg_rclr_ber_cnt <= 0;
			clear_latch_status <= {lanes{1'b0}};
			block_lock_latch_low <= {lanes{1'b0}};
			hi_ber_latch_high <= {lanes{1'b0}};
			// no need to clear synchronization registers, since they do not store state
		end
		else begin
			clear_latch_status <= {lanes{1'b0}};
			// latch logic for block_lock and hi_ber
			block_lock_latch_low  <=  block_lock_sync                                    & // set
										(block_lock_latch_low | clear_latch_status);  // hold
			hi_ber_latch_high  <=  hi_ber_sync                                           | // set
									(hi_ber_latch_high & ~clear_latch_status);        // hold
			
			// decode read & write for each supported address
			case (address)
			// lane or group number for indirection
			ADDR_PCS_LANE_GROUP: begin
				readdata <= (32'd0 | reg_lane_number);
				if (write) reg_lane_number <= writedata[LANE_REGW-1:0];
			end
			// offset + 0, read/write TX control bits
			// bit 0, rclr_errblk_cnt
			// bit 1, rclr_ber_cnt
			ADDR_PCS10G_CNT_CONTROL: begin
				readdata <= (32'd0 | {28'd0,lane_rclr_ber_cnt,lane_rclr_errblk_cnt,2'd0});
				if (write) begin
					reg_rclr_errblk_cnt <= write_rclr_errblk_cnt;
					reg_rclr_ber_cnt <= write_rclr_ber_cnt;
				end
			end
			
			// offset + 1, read-only status bits
			// bit 0, pcs_status
			// bit 1, hi_ber
			// bit 2, block_lock
			// bit 3, tx_fifo_full
			// bit 4, rx_fifo_full
			// bit 5, rx_sync_head_error
			// bit 6, rx_scrambler_error
			// bit 7, rx_data_ready
			ADDR_PCS10G_STATUS: begin
				readdata <= (32'd0 |
					{24'd0, 
					 lane_rx_data_ready,
					 lane_rx_scrambler_error, 
					 lane_rx_sync_head_error,
					 lane_rx_fifo_full, lane_tx_fifo_full,
					 lane_block_lock,
					 lane_hi_ber,lane_pcs_status}); 
			end

			// offset + 2, read-only cnt status bits
			// bit 5:0, ber_cnt
			// bit 13:6, errored_block_cnt
			// bit 14, hi_ber_latch
			// bit 15, block_lock_latch
			ADDR_PCS10G_CNT_STATUS: begin
				readdata <= (32'd0 | 
					{16'd0, 
					 lane_block_lock_latch,
					 lane_hi_ber_latch,
					 lane_errored_block_cnt,
					 lane_ber_cnt}); 
				if (read) clear_latch_status[reg_lane_number] <= 1'b1;
			end


			endcase
		end
	end

	// synchronize RX controls to rx_clk before generating output
	// sysclk-sync'ed input enters at [sync_stages], and rx_clk-sync'ed output exist at [1]
	/*integer stage;
	always @(posedge rx_clk) begin
		sync_rclr_errblk_cnt[sync_stages] <= reg_rclr_errblk_cnt;
		sync_rclr_ber_cnt[sync_stages] <= reg_rclr_ber_cnt;
		for (stage=2; stage < sync_stages + 1; stage=stage +1 ) begin			// additional sync stages
			sync_rclr_errblk_cnt[stage-1] <= sync_rclr_errblk_cnt[stage];
			sync_rclr_ber_cnt[stage-1] <= sync_rclr_ber_cnt[stage];
		end
	end
	assign csr_rclr_errblk_cnt = sync_rclr_errblk_cnt[1];
	assign csr_rclr_ber_cnt = sync_rclr_ber_cnt[1];*/
	
	
  integer stage;
  genvar i;
  generate 
	for(i = 0; i < lanes; i = i + 1) 
	begin : sync_ctrl
		always @(posedge rx_pma_clk[i]) begin
		sync_rclr_errblk_cnt[sync_stages][i] <= reg_rclr_errblk_cnt[i];
		sync_rclr_ber_cnt[sync_stages][i] <= reg_rclr_ber_cnt[i];
		for (stage=2; stage <= sync_stages; stage = stage + 1 ) begin			// additional sync stages
			sync_rclr_errblk_cnt[stage-1][i] <= sync_rclr_errblk_cnt[stage][i];
			sync_rclr_ber_cnt[stage-1][i] <= sync_rclr_ber_cnt[stage][i];
		end
		end
	 end
    endgenerate
       
	assign csr_rclr_errblk_cnt = sync_rclr_errblk_cnt[1];
	assign csr_rclr_ber_cnt = sync_rclr_ber_cnt[1];

endmodule
