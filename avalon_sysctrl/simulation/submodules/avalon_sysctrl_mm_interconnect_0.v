// avalon_sysctrl_mm_interconnect_0.v

// This file was auto-generated from altera_mm_interconnect_hw.tcl.  If you edit it your changes
// will probably be lost.
// 
// Generated using ACDS version 14.0 205 at 2014.11.09.00:47:09

`timescale 1 ps / 1 ps
module avalon_sysctrl_mm_interconnect_0 (
		input  wire        clk_0_clk_clk,                               //                             clk_0_clk.clk
		input  wire        mm_bridge_reset_reset_bridge_in_reset_reset, // mm_bridge_reset_reset_bridge_in_reset.reset
		input  wire [23:0] mm_bridge_m0_address,                        //                          mm_bridge_m0.address
		output wire        mm_bridge_m0_waitrequest,                    //                                      .waitrequest
		input  wire [0:0]  mm_bridge_m0_burstcount,                     //                                      .burstcount
		input  wire [3:0]  mm_bridge_m0_byteenable,                     //                                      .byteenable
		input  wire        mm_bridge_m0_read,                           //                                      .read
		output wire [31:0] mm_bridge_m0_readdata,                       //                                      .readdata
		output wire        mm_bridge_m0_readdatavalid,                  //                                      .readdatavalid
		input  wire        mm_bridge_m0_write,                          //                                      .write
		input  wire [31:0] mm_bridge_m0_writedata,                      //                                      .writedata
		input  wire        mm_bridge_m0_debugaccess,                    //                                      .debugaccess
		output wire [7:0]  onchip_memory2_0_s1_address,                 //                   onchip_memory2_0_s1.address
		output wire        onchip_memory2_0_s1_write,                   //                                      .write
		input  wire [31:0] onchip_memory2_0_s1_readdata,                //                                      .readdata
		output wire [31:0] onchip_memory2_0_s1_writedata,               //                                      .writedata
		output wire [3:0]  onchip_memory2_0_s1_byteenable,              //                                      .byteenable
		output wire        onchip_memory2_0_s1_chipselect,              //                                      .chipselect
		output wire        onchip_memory2_0_s1_clken                    //                                      .clken
	);

	wire         mm_bridge_m0_translator_avalon_universal_master_0_waitrequest;   // onchip_memory2_0_s1_translator:uav_waitrequest -> mm_bridge_m0_translator:uav_waitrequest
	wire   [2:0] mm_bridge_m0_translator_avalon_universal_master_0_burstcount;    // mm_bridge_m0_translator:uav_burstcount -> onchip_memory2_0_s1_translator:uav_burstcount
	wire  [31:0] mm_bridge_m0_translator_avalon_universal_master_0_writedata;     // mm_bridge_m0_translator:uav_writedata -> onchip_memory2_0_s1_translator:uav_writedata
	wire  [23:0] mm_bridge_m0_translator_avalon_universal_master_0_address;       // mm_bridge_m0_translator:uav_address -> onchip_memory2_0_s1_translator:uav_address
	wire         mm_bridge_m0_translator_avalon_universal_master_0_lock;          // mm_bridge_m0_translator:uav_lock -> onchip_memory2_0_s1_translator:uav_lock
	wire         mm_bridge_m0_translator_avalon_universal_master_0_write;         // mm_bridge_m0_translator:uav_write -> onchip_memory2_0_s1_translator:uav_write
	wire         mm_bridge_m0_translator_avalon_universal_master_0_read;          // mm_bridge_m0_translator:uav_read -> onchip_memory2_0_s1_translator:uav_read
	wire  [31:0] mm_bridge_m0_translator_avalon_universal_master_0_readdata;      // onchip_memory2_0_s1_translator:uav_readdata -> mm_bridge_m0_translator:uav_readdata
	wire         mm_bridge_m0_translator_avalon_universal_master_0_debugaccess;   // mm_bridge_m0_translator:uav_debugaccess -> onchip_memory2_0_s1_translator:uav_debugaccess
	wire   [3:0] mm_bridge_m0_translator_avalon_universal_master_0_byteenable;    // mm_bridge_m0_translator:uav_byteenable -> onchip_memory2_0_s1_translator:uav_byteenable
	wire         mm_bridge_m0_translator_avalon_universal_master_0_readdatavalid; // onchip_memory2_0_s1_translator:uav_readdatavalid -> mm_bridge_m0_translator:uav_readdatavalid

	altera_merlin_master_translator #(
		.AV_ADDRESS_W                (24),
		.AV_DATA_W                   (32),
		.AV_BURSTCOUNT_W             (1),
		.AV_BYTEENABLE_W             (4),
		.UAV_ADDRESS_W               (24),
		.UAV_BURSTCOUNT_W            (3),
		.USE_READ                    (1),
		.USE_WRITE                   (1),
		.USE_BEGINBURSTTRANSFER      (0),
		.USE_BEGINTRANSFER           (0),
		.USE_CHIPSELECT              (0),
		.USE_BURSTCOUNT              (1),
		.USE_READDATAVALID           (1),
		.USE_WAITREQUEST             (1),
		.USE_READRESPONSE            (0),
		.USE_WRITERESPONSE           (0),
		.AV_SYMBOLS_PER_WORD         (4),
		.AV_ADDRESS_SYMBOLS          (1),
		.AV_BURSTCOUNT_SYMBOLS       (0),
		.AV_CONSTANT_BURST_BEHAVIOR  (0),
		.UAV_CONSTANT_BURST_BEHAVIOR (0),
		.AV_LINEWRAPBURSTS           (0),
		.AV_REGISTERINCOMINGSIGNALS  (0)
	) mm_bridge_m0_translator (
		.clk                      (clk_0_clk_clk),                                                   //                       clk.clk
		.reset                    (mm_bridge_reset_reset_bridge_in_reset_reset),                     //                     reset.reset
		.uav_address              (mm_bridge_m0_translator_avalon_universal_master_0_address),       // avalon_universal_master_0.address
		.uav_burstcount           (mm_bridge_m0_translator_avalon_universal_master_0_burstcount),    //                          .burstcount
		.uav_read                 (mm_bridge_m0_translator_avalon_universal_master_0_read),          //                          .read
		.uav_write                (mm_bridge_m0_translator_avalon_universal_master_0_write),         //                          .write
		.uav_waitrequest          (mm_bridge_m0_translator_avalon_universal_master_0_waitrequest),   //                          .waitrequest
		.uav_readdatavalid        (mm_bridge_m0_translator_avalon_universal_master_0_readdatavalid), //                          .readdatavalid
		.uav_byteenable           (mm_bridge_m0_translator_avalon_universal_master_0_byteenable),    //                          .byteenable
		.uav_readdata             (mm_bridge_m0_translator_avalon_universal_master_0_readdata),      //                          .readdata
		.uav_writedata            (mm_bridge_m0_translator_avalon_universal_master_0_writedata),     //                          .writedata
		.uav_lock                 (mm_bridge_m0_translator_avalon_universal_master_0_lock),          //                          .lock
		.uav_debugaccess          (mm_bridge_m0_translator_avalon_universal_master_0_debugaccess),   //                          .debugaccess
		.av_address               (mm_bridge_m0_address),                                            //      avalon_anti_master_0.address
		.av_waitrequest           (mm_bridge_m0_waitrequest),                                        //                          .waitrequest
		.av_burstcount            (mm_bridge_m0_burstcount),                                         //                          .burstcount
		.av_byteenable            (mm_bridge_m0_byteenable),                                         //                          .byteenable
		.av_read                  (mm_bridge_m0_read),                                               //                          .read
		.av_readdata              (mm_bridge_m0_readdata),                                           //                          .readdata
		.av_readdatavalid         (mm_bridge_m0_readdatavalid),                                      //                          .readdatavalid
		.av_write                 (mm_bridge_m0_write),                                              //                          .write
		.av_writedata             (mm_bridge_m0_writedata),                                          //                          .writedata
		.av_debugaccess           (mm_bridge_m0_debugaccess),                                        //                          .debugaccess
		.av_beginbursttransfer    (1'b0),                                                            //               (terminated)
		.av_begintransfer         (1'b0),                                                            //               (terminated)
		.av_chipselect            (1'b0),                                                            //               (terminated)
		.av_lock                  (1'b0),                                                            //               (terminated)
		.uav_clken                (),                                                                //               (terminated)
		.av_clken                 (1'b1),                                                            //               (terminated)
		.uav_response             (2'b00),                                                           //               (terminated)
		.av_response              (),                                                                //               (terminated)
		.uav_writeresponserequest (),                                                                //               (terminated)
		.uav_writeresponsevalid   (1'b0),                                                            //               (terminated)
		.av_writeresponserequest  (1'b0),                                                            //               (terminated)
		.av_writeresponsevalid    ()                                                                 //               (terminated)
	);

	altera_merlin_slave_translator #(
		.AV_ADDRESS_W                   (8),
		.AV_DATA_W                      (32),
		.UAV_DATA_W                     (32),
		.AV_BURSTCOUNT_W                (1),
		.AV_BYTEENABLE_W                (4),
		.UAV_BYTEENABLE_W               (4),
		.UAV_ADDRESS_W                  (24),
		.UAV_BURSTCOUNT_W               (3),
		.AV_READLATENCY                 (1),
		.USE_READDATAVALID              (0),
		.USE_WAITREQUEST                (0),
		.USE_UAV_CLKEN                  (0),
		.USE_READRESPONSE               (0),
		.USE_WRITERESPONSE              (0),
		.AV_SYMBOLS_PER_WORD            (4),
		.AV_ADDRESS_SYMBOLS             (0),
		.AV_BURSTCOUNT_SYMBOLS          (0),
		.AV_CONSTANT_BURST_BEHAVIOR     (0),
		.UAV_CONSTANT_BURST_BEHAVIOR    (0),
		.AV_REQUIRE_UNALIGNED_ADDRESSES (0),
		.CHIPSELECT_THROUGH_READLATENCY (0),
		.AV_READ_WAIT_CYCLES            (0),
		.AV_WRITE_WAIT_CYCLES           (0),
		.AV_SETUP_WAIT_CYCLES           (0),
		.AV_DATA_HOLD_CYCLES            (0)
	) onchip_memory2_0_s1_translator (
		.clk                      (clk_0_clk_clk),                                                   //                      clk.clk
		.reset                    (mm_bridge_reset_reset_bridge_in_reset_reset),                     //                    reset.reset
		.uav_address              (mm_bridge_m0_translator_avalon_universal_master_0_address),       // avalon_universal_slave_0.address
		.uav_burstcount           (mm_bridge_m0_translator_avalon_universal_master_0_burstcount),    //                         .burstcount
		.uav_read                 (mm_bridge_m0_translator_avalon_universal_master_0_read),          //                         .read
		.uav_write                (mm_bridge_m0_translator_avalon_universal_master_0_write),         //                         .write
		.uav_waitrequest          (mm_bridge_m0_translator_avalon_universal_master_0_waitrequest),   //                         .waitrequest
		.uav_readdatavalid        (mm_bridge_m0_translator_avalon_universal_master_0_readdatavalid), //                         .readdatavalid
		.uav_byteenable           (mm_bridge_m0_translator_avalon_universal_master_0_byteenable),    //                         .byteenable
		.uav_readdata             (mm_bridge_m0_translator_avalon_universal_master_0_readdata),      //                         .readdata
		.uav_writedata            (mm_bridge_m0_translator_avalon_universal_master_0_writedata),     //                         .writedata
		.uav_lock                 (mm_bridge_m0_translator_avalon_universal_master_0_lock),          //                         .lock
		.uav_debugaccess          (mm_bridge_m0_translator_avalon_universal_master_0_debugaccess),   //                         .debugaccess
		.av_address               (onchip_memory2_0_s1_address),                                     //      avalon_anti_slave_0.address
		.av_write                 (onchip_memory2_0_s1_write),                                       //                         .write
		.av_readdata              (onchip_memory2_0_s1_readdata),                                    //                         .readdata
		.av_writedata             (onchip_memory2_0_s1_writedata),                                   //                         .writedata
		.av_byteenable            (onchip_memory2_0_s1_byteenable),                                  //                         .byteenable
		.av_chipselect            (onchip_memory2_0_s1_chipselect),                                  //                         .chipselect
		.av_clken                 (onchip_memory2_0_s1_clken),                                       //                         .clken
		.av_read                  (),                                                                //              (terminated)
		.av_begintransfer         (),                                                                //              (terminated)
		.av_beginbursttransfer    (),                                                                //              (terminated)
		.av_burstcount            (),                                                                //              (terminated)
		.av_readdatavalid         (1'b0),                                                            //              (terminated)
		.av_waitrequest           (1'b0),                                                            //              (terminated)
		.av_writebyteenable       (),                                                                //              (terminated)
		.av_lock                  (),                                                                //              (terminated)
		.uav_clken                (1'b0),                                                            //              (terminated)
		.av_debugaccess           (),                                                                //              (terminated)
		.av_outputenable          (),                                                                //              (terminated)
		.uav_response             (),                                                                //              (terminated)
		.av_response              (2'b00),                                                           //              (terminated)
		.uav_writeresponserequest (1'b0),                                                            //              (terminated)
		.uav_writeresponsevalid   (),                                                                //              (terminated)
		.av_writeresponserequest  (),                                                                //              (terminated)
		.av_writeresponsevalid    (1'b0)                                                             //              (terminated)
	);

endmodule
