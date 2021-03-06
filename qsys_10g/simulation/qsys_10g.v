// qsys_10g.v

// Generated using ACDS version 14.0 205 at 2014.10.27.20:37:56

`timescale 1 ps / 1 ps
module qsys_10g (
		input  wire        clk_clk,                         //                        clk.clk
		input  wire        reset_reset_n,                   //                      reset.reset_n
		input  wire        tx_clk_clk,                      //                     tx_clk.clk
		input  wire        tx_reset_reset_n,                //                   tx_reset.reset_n
		input  wire        ref_clk_clk,                     //                    ref_clk.clk
		input  wire        ref_reset_reset_n,               //                  ref_reset.reset_n
		output wire        avalon_st_rxstatus_valid,        //         avalon_st_rxstatus.valid
		output wire [39:0] avalon_st_rxstatus_data,         //                           .data
		output wire [6:0]  avalon_st_rxstatus_error,        //                           .error
		output wire [1:0]  link_fault_status_xgmii_rx_data, // link_fault_status_xgmii_rx.data
		input  wire        rx_serial_data_export,           //             rx_serial_data.export
		output wire [0:0]  tx_serial_data_export,           //             tx_serial_data.export
		output wire        rx_ready_export,                 //                   rx_ready.export
		output wire        tx_ready_export,                 //                   tx_ready.export
		input  wire [63:0] tx_sc_fifo_in_data,              //              tx_sc_fifo_in.data
		input  wire        tx_sc_fifo_in_valid,             //                           .valid
		output wire        tx_sc_fifo_in_ready,             //                           .ready
		input  wire        tx_sc_fifo_in_startofpacket,     //                           .startofpacket
		input  wire        tx_sc_fifo_in_endofpacket,       //                           .endofpacket
		input  wire [2:0]  tx_sc_fifo_in_empty,             //                           .empty
		input  wire        tx_sc_fifo_in_error,             //                           .error
		output wire [63:0] rx_sc_fifo_out_data,             //             rx_sc_fifo_out.data
		output wire        rx_sc_fifo_out_valid,            //                           .valid
		input  wire        rx_sc_fifo_out_ready,            //                           .ready
		output wire        rx_sc_fifo_out_startofpacket,    //                           .startofpacket
		output wire        rx_sc_fifo_out_endofpacket,      //                           .endofpacket
		output wire [2:0]  rx_sc_fifo_out_empty,            //                           .empty
		output wire [5:0]  rx_sc_fifo_out_error,            //                           .error
		output wire        mdio_mdc,                        //                       mdio.mdc
		input  wire        mdio_mdio_in,                    //                           .mdio_in
		output wire        mdio_mdio_out,                   //                           .mdio_out
		output wire        mdio_mdio_oen,                   //                           .mdio_oen
		output wire [39:0] avalon_st_txstatus_data,         //         avalon_st_txstatus.data
		output wire        avalon_st_txstatus_valid,        //                           .valid
		output wire [6:0]  avalon_st_txstatus_error,        //                           .error
		output wire        xgmii_rx_clk_clk,                //               xgmii_rx_clk.clk
		output wire        mm_bridge_s0_waitrequest,        //               mm_bridge_s0.waitrequest
		output wire [31:0] mm_bridge_s0_readdata,           //                           .readdata
		output wire        mm_bridge_s0_readdatavalid,      //                           .readdatavalid
		input  wire [3:0]  mm_bridge_s0_burstcount,         //                           .burstcount
		input  wire [31:0] mm_bridge_s0_writedata,          //                           .writedata
		input  wire [23:0] mm_bridge_s0_address,            //                           .address
		input  wire        mm_bridge_s0_write,              //                           .write
		input  wire        mm_bridge_s0_read,               //                           .read
		input  wire [3:0]  mm_bridge_s0_byteenable,         //                           .byteenable
		input  wire        mm_bridge_s0_debugaccess         //                           .debugaccess
	);

	wire   [3:0] mm_bridge_m0_burstcount;                                                   // mm_bridge:m0_burstcount -> mm_interconnect_0:mm_bridge_m0_burstcount
	wire         mm_bridge_m0_waitrequest;                                                  // mm_interconnect_0:mm_bridge_m0_waitrequest -> mm_bridge:m0_waitrequest
	wire  [23:0] mm_bridge_m0_address;                                                      // mm_bridge:m0_address -> mm_interconnect_0:mm_bridge_m0_address
	wire  [31:0] mm_bridge_m0_writedata;                                                    // mm_bridge:m0_writedata -> mm_interconnect_0:mm_bridge_m0_writedata
	wire         mm_bridge_m0_write;                                                        // mm_bridge:m0_write -> mm_interconnect_0:mm_bridge_m0_write
	wire         mm_bridge_m0_read;                                                         // mm_bridge:m0_read -> mm_interconnect_0:mm_bridge_m0_read
	wire  [31:0] mm_bridge_m0_readdata;                                                     // mm_interconnect_0:mm_bridge_m0_readdata -> mm_bridge:m0_readdata
	wire         mm_bridge_m0_debugaccess;                                                  // mm_bridge:m0_debugaccess -> mm_interconnect_0:mm_bridge_m0_debugaccess
	wire   [3:0] mm_bridge_m0_byteenable;                                                   // mm_bridge:m0_byteenable -> mm_interconnect_0:mm_bridge_m0_byteenable
	wire         mm_bridge_m0_readdatavalid;                                                // mm_interconnect_0:mm_bridge_m0_readdatavalid -> mm_bridge:m0_readdatavalid
	wire         mm_interconnect_0_eth_10g_design_example_0_mm_pipeline_bridge_waitrequest; // eth_10g_design_example_0:mm_pipeline_bridge_waitrequest -> mm_interconnect_0:eth_10g_design_example_0_mm_pipeline_bridge_waitrequest
	wire  [31:0] mm_interconnect_0_eth_10g_design_example_0_mm_pipeline_bridge_writedata;   // mm_interconnect_0:eth_10g_design_example_0_mm_pipeline_bridge_writedata -> eth_10g_design_example_0:mm_pipeline_bridge_writedata
	wire  [18:0] mm_interconnect_0_eth_10g_design_example_0_mm_pipeline_bridge_address;     // mm_interconnect_0:eth_10g_design_example_0_mm_pipeline_bridge_address -> eth_10g_design_example_0:mm_pipeline_bridge_address
	wire         mm_interconnect_0_eth_10g_design_example_0_mm_pipeline_bridge_write;       // mm_interconnect_0:eth_10g_design_example_0_mm_pipeline_bridge_write -> eth_10g_design_example_0:mm_pipeline_bridge_write
	wire         mm_interconnect_0_eth_10g_design_example_0_mm_pipeline_bridge_read;        // mm_interconnect_0:eth_10g_design_example_0_mm_pipeline_bridge_read -> eth_10g_design_example_0:mm_pipeline_bridge_read
	wire  [31:0] mm_interconnect_0_eth_10g_design_example_0_mm_pipeline_bridge_readdata;    // eth_10g_design_example_0:mm_pipeline_bridge_readdata -> mm_interconnect_0:eth_10g_design_example_0_mm_pipeline_bridge_readdata
	wire         rst_controller_reset_out_reset;                                            // rst_controller:reset_out -> [mm_bridge:reset, mm_interconnect_0:eth_10g_design_example_0_mm_reset_reset_bridge_in_reset_reset, mm_interconnect_0:mm_bridge_reset_reset_bridge_in_reset_reset]

	qsys_10g_eth_10g_design_example_0 #(
		.starting_channel_number      (0),
		.interface_type               ("Soft XAUI"),
		.data_rate                    ("3125 Mbps"),
		.xaui_pll_type                ("AUTO"),
		.BASE_DATA_RATE               (""),
		.en_synce_support             (0),
		.use_control_and_status_ports (0),
		.external_pma_ctrl_reconf     (0),
		.recovered_clk_out            (0),
		.number_of_interfaces         (1),
		.reconfig_interfaces          (1),
		.use_rx_rate_match            (0),
		.tx_termination               ("OCT_100_OHMS"),
		.tx_vod_selection             (4),
		.tx_preemp_pretap             (0),
		.tx_preemp_pretap_inv         ("false"),
		.tx_preemp_tap_1              (0),
		.tx_preemp_tap_2              (0),
		.tx_preemp_tap_2_inv          ("false"),
		.rx_common_mode               ("0.82v"),
		.rx_termination               ("OCT_100_OHMS"),
		.rx_eq_dc_gain                (0),
		.rx_eq_ctrl                   (0),
		.pll_external_enable          (0)
	) eth_10g_design_example_0 (
		.mm_clk_clk                            (clk_clk),                                                                   //                     mm_clk.clk
		.mm_reset_reset_n                      (reset_reset_n),                                                             //                   mm_reset.reset_n
		.tx_clk_clk                            (tx_clk_clk),                                                                //                     tx_clk.clk
		.tx_reset_reset_n                      (tx_reset_reset_n),                                                          //                   tx_reset.reset_n
		.mm_pipeline_bridge_address            (mm_interconnect_0_eth_10g_design_example_0_mm_pipeline_bridge_address),     //         mm_pipeline_bridge.address
		.mm_pipeline_bridge_waitrequest        (mm_interconnect_0_eth_10g_design_example_0_mm_pipeline_bridge_waitrequest), //                           .waitrequest
		.mm_pipeline_bridge_read               (mm_interconnect_0_eth_10g_design_example_0_mm_pipeline_bridge_read),        //                           .read
		.mm_pipeline_bridge_readdata           (mm_interconnect_0_eth_10g_design_example_0_mm_pipeline_bridge_readdata),    //                           .readdata
		.mm_pipeline_bridge_write              (mm_interconnect_0_eth_10g_design_example_0_mm_pipeline_bridge_write),       //                           .write
		.mm_pipeline_bridge_writedata          (mm_interconnect_0_eth_10g_design_example_0_mm_pipeline_bridge_writedata),   //                           .writedata
		.ref_clk_clk                           (ref_clk_clk),                                                               //                    ref_clk.clk
		.ref_reset_reset_n                     (ref_reset_reset_n),                                                         //                  ref_reset.reset_n
		.xgmii_rx_clk_clk                      (xgmii_rx_clk_clk),                                                          //               xgmii_rx_clk.clk
		.reconfig_to_xcvr_reconfig_to_xcvr     (),                                                                          //           reconfig_to_xcvr.reconfig_to_xcvr
		.reconfig_from_xcvr_reconfig_from_xcvr (),                                                                          //         reconfig_from_xcvr.reconfig_from_xcvr
		.avalon_st_rxstatus_valid              (avalon_st_rxstatus_valid),                                                  //         avalon_st_rxstatus.valid
		.avalon_st_rxstatus_data               (avalon_st_rxstatus_data),                                                   //                           .data
		.avalon_st_rxstatus_error              (avalon_st_rxstatus_error),                                                  //                           .error
		.link_fault_status_xgmii_rx_data       (link_fault_status_xgmii_rx_data),                                           // link_fault_status_xgmii_rx.data
		.rx_serial_data_export                 (rx_serial_data_export),                                                     //             rx_serial_data.export
		.tx_serial_data_export                 (tx_serial_data_export),                                                     //             tx_serial_data.export
		.rx_ready_export                       (rx_ready_export),                                                           //                   rx_ready.export
		.rx_data_ready_export                  (),                                                                          //              rx_data_ready.export
		.tx_ready_export                       (tx_ready_export),                                                           //                   tx_ready.export
		.tx_sc_fifo_in_data                    (tx_sc_fifo_in_data),                                                        //              tx_sc_fifo_in.data
		.tx_sc_fifo_in_valid                   (tx_sc_fifo_in_valid),                                                       //                           .valid
		.tx_sc_fifo_in_ready                   (tx_sc_fifo_in_ready),                                                       //                           .ready
		.tx_sc_fifo_in_startofpacket           (tx_sc_fifo_in_startofpacket),                                               //                           .startofpacket
		.tx_sc_fifo_in_endofpacket             (tx_sc_fifo_in_endofpacket),                                                 //                           .endofpacket
		.tx_sc_fifo_in_empty                   (tx_sc_fifo_in_empty),                                                       //                           .empty
		.tx_sc_fifo_in_error                   (tx_sc_fifo_in_error),                                                       //                           .error
		.rx_sc_fifo_out_data                   (rx_sc_fifo_out_data),                                                       //             rx_sc_fifo_out.data
		.rx_sc_fifo_out_valid                  (rx_sc_fifo_out_valid),                                                      //                           .valid
		.rx_sc_fifo_out_ready                  (rx_sc_fifo_out_ready),                                                      //                           .ready
		.rx_sc_fifo_out_startofpacket          (rx_sc_fifo_out_startofpacket),                                              //                           .startofpacket
		.rx_sc_fifo_out_endofpacket            (rx_sc_fifo_out_endofpacket),                                                //                           .endofpacket
		.rx_sc_fifo_out_empty                  (rx_sc_fifo_out_empty),                                                      //                           .empty
		.rx_sc_fifo_out_error                  (rx_sc_fifo_out_error),                                                      //                           .error
		.mdio_mdc                              (mdio_mdc),                                                                  //                       mdio.mdc
		.mdio_mdio_in                          (mdio_mdio_in),                                                              //                           .mdio_in
		.mdio_mdio_out                         (mdio_mdio_out),                                                             //                           .mdio_out
		.mdio_mdio_oen                         (mdio_mdio_oen),                                                             //                           .mdio_oen
		.avalon_st_txstatus_data               (avalon_st_txstatus_data),                                                   //         avalon_st_txstatus.data
		.avalon_st_txstatus_valid              (avalon_st_txstatus_valid),                                                  //                           .valid
		.avalon_st_txstatus_error              (avalon_st_txstatus_error)                                                   //                           .error
	);

	altera_avalon_mm_bridge #(
		.DATA_WIDTH        (32),
		.SYMBOL_WIDTH      (8),
		.HDL_ADDR_WIDTH    (24),
		.BURSTCOUNT_WIDTH  (4),
		.PIPELINE_COMMAND  (0),
		.PIPELINE_RESPONSE (0)
	) mm_bridge (
		.clk              (clk_clk),                        //   clk.clk
		.reset            (rst_controller_reset_out_reset), // reset.reset
		.s0_waitrequest   (mm_bridge_s0_waitrequest),       //    s0.waitrequest
		.s0_readdata      (mm_bridge_s0_readdata),          //      .readdata
		.s0_readdatavalid (mm_bridge_s0_readdatavalid),     //      .readdatavalid
		.s0_burstcount    (mm_bridge_s0_burstcount),        //      .burstcount
		.s0_writedata     (mm_bridge_s0_writedata),         //      .writedata
		.s0_address       (mm_bridge_s0_address),           //      .address
		.s0_write         (mm_bridge_s0_write),             //      .write
		.s0_read          (mm_bridge_s0_read),              //      .read
		.s0_byteenable    (mm_bridge_s0_byteenable),        //      .byteenable
		.s0_debugaccess   (mm_bridge_s0_debugaccess),       //      .debugaccess
		.m0_waitrequest   (mm_bridge_m0_waitrequest),       //    m0.waitrequest
		.m0_readdata      (mm_bridge_m0_readdata),          //      .readdata
		.m0_readdatavalid (mm_bridge_m0_readdatavalid),     //      .readdatavalid
		.m0_burstcount    (mm_bridge_m0_burstcount),        //      .burstcount
		.m0_writedata     (mm_bridge_m0_writedata),         //      .writedata
		.m0_address       (mm_bridge_m0_address),           //      .address
		.m0_write         (mm_bridge_m0_write),             //      .write
		.m0_read          (mm_bridge_m0_read),              //      .read
		.m0_byteenable    (mm_bridge_m0_byteenable),        //      .byteenable
		.m0_debugaccess   (mm_bridge_m0_debugaccess)        //      .debugaccess
	);

	qsys_10g_mm_interconnect_0 mm_interconnect_0 (
		.clk_clk_clk                                                   (clk_clk),                                                                   //                                                 clk_clk.clk
		.eth_10g_design_example_0_mm_reset_reset_bridge_in_reset_reset (rst_controller_reset_out_reset),                                            // eth_10g_design_example_0_mm_reset_reset_bridge_in_reset.reset
		.mm_bridge_reset_reset_bridge_in_reset_reset                   (rst_controller_reset_out_reset),                                            //                   mm_bridge_reset_reset_bridge_in_reset.reset
		.mm_bridge_m0_address                                          (mm_bridge_m0_address),                                                      //                                            mm_bridge_m0.address
		.mm_bridge_m0_waitrequest                                      (mm_bridge_m0_waitrequest),                                                  //                                                        .waitrequest
		.mm_bridge_m0_burstcount                                       (mm_bridge_m0_burstcount),                                                   //                                                        .burstcount
		.mm_bridge_m0_byteenable                                       (mm_bridge_m0_byteenable),                                                   //                                                        .byteenable
		.mm_bridge_m0_read                                             (mm_bridge_m0_read),                                                         //                                                        .read
		.mm_bridge_m0_readdata                                         (mm_bridge_m0_readdata),                                                     //                                                        .readdata
		.mm_bridge_m0_readdatavalid                                    (mm_bridge_m0_readdatavalid),                                                //                                                        .readdatavalid
		.mm_bridge_m0_write                                            (mm_bridge_m0_write),                                                        //                                                        .write
		.mm_bridge_m0_writedata                                        (mm_bridge_m0_writedata),                                                    //                                                        .writedata
		.mm_bridge_m0_debugaccess                                      (mm_bridge_m0_debugaccess),                                                  //                                                        .debugaccess
		.eth_10g_design_example_0_mm_pipeline_bridge_address           (mm_interconnect_0_eth_10g_design_example_0_mm_pipeline_bridge_address),     //             eth_10g_design_example_0_mm_pipeline_bridge.address
		.eth_10g_design_example_0_mm_pipeline_bridge_write             (mm_interconnect_0_eth_10g_design_example_0_mm_pipeline_bridge_write),       //                                                        .write
		.eth_10g_design_example_0_mm_pipeline_bridge_read              (mm_interconnect_0_eth_10g_design_example_0_mm_pipeline_bridge_read),        //                                                        .read
		.eth_10g_design_example_0_mm_pipeline_bridge_readdata          (mm_interconnect_0_eth_10g_design_example_0_mm_pipeline_bridge_readdata),    //                                                        .readdata
		.eth_10g_design_example_0_mm_pipeline_bridge_writedata         (mm_interconnect_0_eth_10g_design_example_0_mm_pipeline_bridge_writedata),   //                                                        .writedata
		.eth_10g_design_example_0_mm_pipeline_bridge_waitrequest       (mm_interconnect_0_eth_10g_design_example_0_mm_pipeline_bridge_waitrequest)  //                                                        .waitrequest
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (1),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (0),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller (
		.reset_in0      (~reset_reset_n),                 // reset_in0.reset
		.clk            (clk_clk),                        //       clk.clk
		.reset_out      (rst_controller_reset_out_reset), // reset_out.reset
		.reset_req      (),                               // (terminated)
		.reset_req_in0  (1'b0),                           // (terminated)
		.reset_in1      (1'b0),                           // (terminated)
		.reset_req_in1  (1'b0),                           // (terminated)
		.reset_in2      (1'b0),                           // (terminated)
		.reset_req_in2  (1'b0),                           // (terminated)
		.reset_in3      (1'b0),                           // (terminated)
		.reset_req_in3  (1'b0),                           // (terminated)
		.reset_in4      (1'b0),                           // (terminated)
		.reset_req_in4  (1'b0),                           // (terminated)
		.reset_in5      (1'b0),                           // (terminated)
		.reset_req_in5  (1'b0),                           // (terminated)
		.reset_in6      (1'b0),                           // (terminated)
		.reset_req_in6  (1'b0),                           // (terminated)
		.reset_in7      (1'b0),                           // (terminated)
		.reset_req_in7  (1'b0),                           // (terminated)
		.reset_in8      (1'b0),                           // (terminated)
		.reset_req_in8  (1'b0),                           // (terminated)
		.reset_in9      (1'b0),                           // (terminated)
		.reset_req_in9  (1'b0),                           // (terminated)
		.reset_in10     (1'b0),                           // (terminated)
		.reset_req_in10 (1'b0),                           // (terminated)
		.reset_in11     (1'b0),                           // (terminated)
		.reset_req_in11 (1'b0),                           // (terminated)
		.reset_in12     (1'b0),                           // (terminated)
		.reset_req_in12 (1'b0),                           // (terminated)
		.reset_in13     (1'b0),                           // (terminated)
		.reset_req_in13 (1'b0),                           // (terminated)
		.reset_in14     (1'b0),                           // (terminated)
		.reset_req_in14 (1'b0),                           // (terminated)
		.reset_in15     (1'b0),                           // (terminated)
		.reset_req_in15 (1'b0)                            // (terminated)
	);

endmodule
