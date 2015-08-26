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


`timescale 1 ns / 1 ps

module altera_xcvr_10gbaser #(
    parameter device_family ="Stratix V",
    parameter num_channels = 4,   // define the channel numbers
    parameter operation_mode = "duplex", //SV parameter only
    parameter external_pma_ctrl_config = 0, // when PHY need to merge with other phy, skip the common code
    parameter control_pin_out = 0, // when PHY need to merge with other phy, skip the common code
    parameter recovered_clk_out = 0, // select if let rx_recovered_clk appear as output
    parameter pll_locked_out = 0,
    parameter ref_clk_freq = "322.265625 MHz", // support both 322.265625 MHz, 644.53125 MHz
    parameter pma_mode = 40,
    parameter pll_type = "AUTO",     // PLL type for each PLL
    parameter starting_channel_number = 0, //physical start channel number, useful in SIV
    parameter reconfig_interfaces = 1, //reconfig interfaces, need at port definition
    parameter rx_use_coreclk = 0,
    parameter embedded_reset = 1,  // (0,1) 1-Enable embedded reset controller
    parameter latadj = 0,
    parameter high_precision_latadj = 1, // Determine latency_adj port width
    //analog parameter siv only
    parameter tx_termination = "OCT_85_OHMS", //Select the Transmitter termination resistance
    parameter tx_vod_selection = 1,//0-7 Select the Transitter VOD control setting
    parameter tx_preemp_pretap = 0,//Select the Pre-emphasis pre-tap setting 0-7
    parameter tx_preemp_pretap_inv = 0,//0/1. Determine whether the pre-emphasis control signal for the pretap needed to be inverted or not.?true? ? Invert the pre-emphasis control signal for the pre tap.?false? ? Do not invert the pre-emphasis control signal for the pretap.
    parameter tx_preemp_tap_1 = 5,//0-15 Select the Pre-emphasis first post-tap setting
    parameter tx_preemp_tap_2 = 0,//0-7 Select the Pre-emphasis second post-tap setting
    parameter tx_preemp_tap_2_inv = 0,//0/1.Select the Pre-emphasis second post-tap polarity setting
    parameter rx_common_mode = "0.82v",
    parameter rx_termination = "OCT_100_OHMS", //OCT_85_OHMS,OCT_100_OHMS,OCT_120_OHMS,OCT_150_OHMS  Select the Receiver termination resistance
    parameter rx_eq_dc_gain = 0, //0-4 Select the Receiver DC gain                                       
    parameter rx_eq_ctrl = 14, //0-16   Select the Receiver static equalizer setting 
    parameter mgmt_clk_in_mhz = 50, //system clock for the avalone interface. It is limited by reconfig speed. This parameter will affact the reset hold time.
    parameter tx_common_mode = "0.65V",//
    parameter starting_ch = 0, //reconfig interfaces, need at port definition
    parameter sync_depth = 2
)(
        phy_mgmt_clk,            //         mgmt_clk.clk
        phy_mgmt_clk_reset,    //     mgmt_clk_rst.reset_n
        phy_mgmt_read,           //         phy_mgmt.read
        phy_mgmt_write,          //                 .write
        phy_mgmt_address,        //                 .address
        phy_mgmt_writedata,      //                 .writedata
        phy_mgmt_readdata,       //                 .readdata
        phy_mgmt_waitrequest,    //                 .waitrequest
        xgmii_tx_clk,        //     xgmii_tx_clk.clk
        pll_ref_clk,
        rx_coreclkin,        //     xgmii_rx_clk.clk
        xgmii_rx_clk,        //     xgmii_rx_clk.clk
        rx_recovered_clk,
        tx_ready,           //         tx_ready.data
        rx_ready,          //        rx_ready0.data
        rx_data_ready,          
        rx_block_lock,          
        rx_hi_ber,              
        xgmii_tx_dc,      //    xgmii_tx_dc_0.data
        xgmii_rx_dc,      //    xgmii_rx_dc_0.data
        tx_serial_data, // tx_serial_data_0.export
        rx_serial_data,  // rx_serial_data_0.export

        //common control ports when external control needed
        gxb_pdn,
        pll_locked,
        pll_pdn,
        cal_blk_pdn,
        cal_blk_clk, //calibration block clock

        // Reset inputs
        pll_powerdown, 
        tx_analogreset,
        tx_digitalreset,
        rx_analogreset,
        rx_digitalreset,
  
        // Calibration busy signals
        tx_cal_busy,
        rx_cal_busy,
        rx_is_lockedtodata,

        //reconfig
        reconfig_from_xcvr,
        reconfig_to_xcvr,
    
        tx_latency_adj,
        rx_latency_adj
);

        import altera_xcvr_functions::*;

   localparam rx_latadj = ((latadj == 1) && (operation_mode!="tx_only")) ? 1:0;
   localparam tx_latadj = ((latadj == 1) && (operation_mode!="rx_only")) ? 1:0;
   localparam latadj_width = (high_precision_latadj) ? 16 : 12; // latency_adj port width

   input  wire        phy_mgmt_clk;            //         mgmt_clk.clk
   input  wire        phy_mgmt_clk_reset;    //     mgmt_clk_rst.reset_n
   input  wire        phy_mgmt_read;           //         phy_mgmt.read
   input  wire        phy_mgmt_write;          //                 .write
   input  wire [8:0]  phy_mgmt_address;        //                 .address
   input  wire [31:0] phy_mgmt_writedata;      //                 .writedata
   output wire [31:0] phy_mgmt_readdata;       //                 .readdata
   output wire        phy_mgmt_waitrequest;    //                 .waitrequest
   input  wire        xgmii_tx_clk;        //     xgmii_tx_clk.clk
   input  wire        pll_ref_clk;
   input  wire        rx_coreclkin;        //     xgmii_rx_clk.clk
   output wire        xgmii_rx_clk;        //     xgmii_rx_clk.clk
   output wire [num_channels -1 : 0] rx_recovered_clk;
   output wire        tx_ready;           //         tx_ready.data
   output wire        rx_ready;          //        rx_ready0.data
   output wire        [num_channels -1 : 0]rx_data_ready;          
   output wire        [num_channels -1 : 0]rx_block_lock;          
   output wire        [num_channels -1 : 0]rx_hi_ber;              
   input  wire [72*num_channels -1 : 0] xgmii_tx_dc;      //    xgmii_tx_dc_0.data
   output wire [72*num_channels -1 : 0] xgmii_rx_dc;      //    xgmii_rx_dc_0.data
   output wire [num_channels -1 : 0] tx_serial_data; // tx_serial_data_0.export
   input  wire [num_channels -1 : 0] rx_serial_data;  // rx_serial_data_0.export

   //common control ports when external control needed
   input tri0 gxb_pdn;
   output wire pll_locked;
   input tri0 pll_pdn;
   input tri0 cal_blk_pdn;
   input tri0 cal_blk_clk; //calibration block clock

   // Reset inputs
   input  wire [num_channels-1:0] pll_powerdown; 
   input  wire [num_channels-1:0] tx_analogreset;
   input  wire [num_channels-1:0] tx_digitalreset;
   input  wire [num_channels-1:0] rx_analogreset;
   input  wire [num_channels-1:0] rx_digitalreset;
   // Calibration busy signals
   output wire [num_channels-1:0] tx_cal_busy;
   output wire [num_channels-1:0] rx_cal_busy;
   output wire [num_channels-1:0] rx_is_lockedtodata;
 
   //reconfig
   output wire [altera_xcvr_functions::get_reconfig_from_width(device_family,reconfig_interfaces)-1:0] reconfig_from_xcvr;
   input  tri0 [altera_xcvr_functions::get_reconfig_to_width(device_family,reconfig_interfaces)  -1:0] reconfig_to_xcvr;
   
   output wire [latadj_width*num_channels-1:0] tx_latency_adj;
   output wire [latadj_width*num_channels-1:0] rx_latency_adj;
  
   // 'top' channel CSR ports, mgmt facing
   wire [31:0] sc_topcsr_readdata;
   wire        sc_topcsr_waitrequest;
   wire [ 7:0] sc_topcsr_address;
   wire        sc_topcsr_read;
   wire        sc_topcsr_write;

   // dynamic reconfig ports, mgmt facing
   wire [31:0] sc_reconf_readdata;
   wire        sc_reconf_waitrequest;
   wire [ 7:0] sc_reconf_address;
   wire        sc_reconf_read;
   wire        sc_reconf_write;
   
   wire tx_pll_locked;

   //SIV reconfig ports
   wire  [3:0] wire_reconfig_to_gxb;

   // Latency Adjustment Ports
   wire [latadj_width*num_channels-1:0] tx_latency_adj_int;
   wire [latadj_width*num_channels-1:0] rx_latency_adj_int;

   assign tx_latency_adj = (tx_latadj == 0) ? {(latadj_width*num_channels){1'b0}} : tx_latency_adj_int;
   assign rx_latency_adj = (rx_latadj == 0) ? {(latadj_width*num_channels){1'b0}} : rx_latency_adj_int;

generate 
  if ( device_family != "Stratix V" && device_family != "Arria V" && device_family != "Arria V GZ")
        begin
        ///////////////////////////////////////////////////////////////////////
        // Decoder for multiple slaves of reconfig_mgmt interface
        ///////////////////////////////////////////////////////////////////////
        alt_xcvr_mgmt2dec mgmtdec (
                .mgmt_clk_reset(phy_mgmt_clk_reset),
                .mgmt_clk(phy_mgmt_clk),

                .mgmt_address(phy_mgmt_address),
                .mgmt_read(phy_mgmt_read),
                .mgmt_write(phy_mgmt_write),
                .mgmt_readdata(phy_mgmt_readdata),
                .mgmt_waitrequest(),

                // internal interface to 'top' csr block
                .topcsr_readdata(sc_topcsr_readdata),
                .topcsr_waitrequest(1'b0),
                .topcsr_address(sc_topcsr_address),
                .topcsr_read(sc_topcsr_read),
                .topcsr_write(sc_topcsr_write),

                // internal interface to 'top' csr block
                .reconf_readdata(sc_reconf_readdata),
                .reconf_waitrequest(1'b0),
                .reconf_address(sc_reconf_address),
                .reconf_read(sc_reconf_read),
                .reconf_write(sc_reconf_write)
        );
  end
endgenerate

        // 'top' PIPE channel includes basic reconfiguration interface for dyn reconfiguration controller
        wire basic_waitrequest;
        wire basic_irq;
        wire basic_readdata;
        wire basic_address;
        wire basic_read;
        wire basic_write;
        wire basic_writedata;
        wire reconfig_done;     // for reset controller in 'top'
        
        //instantiate different PHY according to parameters
        
        generate 
           if ( device_family == "Stratix IV" & external_pma_ctrl_config == 0)
                begin
                     siv_10gbaser_xcvr  #(
                     .num_channels      (num_channels),
                     .sys_clk_in_mhz    (mgmt_clk_in_mhz),
                     .tx_termination            (tx_termination),
                     .tx_common_mode    (tx_common_mode),
                     .tx_preemp_pretap  (tx_preemp_pretap ),
                     .tx_preemp_pretap_inv      (tx_preemp_pretap_inv ),//?TRUE? or ?FALSE?. Determine whether the pre-emphasis control signal for the pretap needed to be inverted or not.?true? ? Invert the pre-emphasis control signal for the pre tap.?false? ? Do not invert the pre-emphasis control signal for the pretap.
                     .tx_preemp_tap_1   (tx_preemp_tap_1 ),//0-15
                     .tx_preemp_tap_2   (tx_preemp_tap_2 ),//0-7
                     .tx_preemp_tap_2_inv       (tx_preemp_tap_2_inv ),//?TRUE? or ?FALSE?.
                     .tx_vod_selection  (tx_vod_selection ),//0-7
                     .rx_termination    (rx_termination ), //OCT_85_OHMS,OCT_100_OHMS,OCT_120_OHMS,OCT_150_OHMS                      
                     .rx_common_mode    (rx_common_mode),
                     .rx_eq_dc_gain             (rx_eq_dc_gain ), //0-4                                        
                     .rx_eq_ctrl                (rx_eq_ctrl),//0-16    
                     .reconfig_interfaces (reconfig_interfaces),
                     .ref_clk_freq      (ref_clk_freq),
                     .high_precision_latadj      (high_precision_latadj),
                     .latadj_width      (latadj_width),
                     .pll_type          (pll_type)
                     )siv_xcvr_with_pma_ctrl(
                     .mgmt_clk          (phy_mgmt_clk),                  //         mgmt_clk.clk
                     .mgmt_clk_rstn     (!phy_mgmt_clk_reset),                  //     mgmt_clk_rst.reset_n
                     .mgmt_read         (sc_topcsr_read),                //         phy_mgmt.read
                     .mgmt_write        (sc_topcsr_write),               //                 .write
                     .mgmt_address      (sc_topcsr_address),             //                 .address
                     .mgmt_writedata    (phy_mgmt_writedata),            //                 .writedata
                     .mgmt_readdata     (sc_topcsr_readdata),            //                 .readdata
                     .mgmt_waitrequest  (sc_topcsr_waitrequest),         //                 .waitrequest
                     .xgmii_tx_clk      (xgmii_tx_clk),          //     xgmii_tx_clk.clk
                     .pll_ref_clk       (pll_ref_clk),           //      pll_ref_clk.clk
                     .xgmii_rx_clk      (xgmii_rx_clk),          //     xgmii_rx_clk.clk
                     .rx_recovered_clk (rx_recovered_clk),
                     .rx_data_ready         (rx_data_ready),
                     .tx_ready          (tx_ready),              //         tx_ready.data
                     .rx_ready          (rx_ready),                     //        rx_ready0.data
                     .block_lock        ( rx_block_lock),               
                     .hi_ber            ( rx_hi_ber),           
                     .cal_blk_clk       (phy_mgmt_clk), //calibration block clock
                     .xgmii_tx_dc       (xgmii_tx_dc),          //    xgmii_tx_dc_0.data
                     .xgmii_rx_dc       (xgmii_rx_dc),          //    xgmii_rx_dc_0.data
                     .tx_serial_data    ( tx_serial_data),      // tx_serial_data_0.export
                     .rx_serial_data    (rx_serial_data),       // rx_serial_data_0.export
                     .reconfig_to_gxb   (wire_reconfig_to_gxb),
                     .reconfig_from_gxb (reconfig_from_xcvr),
                     .tx_latency_adj    (tx_latency_adj_int),                    
                     .rx_latency_adj    (rx_latency_adj_int)
                     );
                       assign pll_locked = 'b0;
                end 
           else if ( device_family == "Stratix IV")
                begin
                     siv_10gbaser_pcs_pma_map  #(
                     .num_channels      (num_channels),
                     .starting_channel_number (starting_channel_number),
                     .sys_clk_in_mhz    (mgmt_clk_in_mhz),
                     .tx_termination            (tx_termination),
                     .tx_common_mode    (tx_common_mode),
                     .tx_preemp_pretap  (tx_preemp_pretap ),
                     .tx_preemp_pretap_inv      (tx_preemp_pretap_inv ),//?TRUE? or ?FALSE?. Determine whether the pre-emphasis control signal for the pretap needed to be inverted or not.?true? ? Invert the pre-emphasis control signal for the pre tap.?false? ? Do not invert the pre-emphasis control signal for the pretap.
                     .tx_preemp_tap_1   (tx_preemp_tap_1 ),//0-15
                     .tx_preemp_tap_2   (tx_preemp_tap_2 ),//0-7
                     .tx_preemp_tap_2_inv       (tx_preemp_tap_2_inv ),//?TRUE? or ?FALSE?.
                     .tx_vod_selection  (tx_vod_selection ),//0-7
                     .rx_termination    (rx_termination ), //OCT_85_OHMS,OCT_100_OHMS,OCT_120_OHMS,OCT_150_OHMS                      
                     .rx_common_mode    (rx_common_mode),
                     .rx_eq_dc_gain             (rx_eq_dc_gain ), //0-4                                        
                     .rx_eq_ctrl                (rx_eq_ctrl),//0-16    
                    .reconfig_interfaces (reconfig_interfaces),
                     .ref_clk_freq      (ref_clk_freq),
                     .high_precision_latadj      (high_precision_latadj),
                     .latadj_width      (latadj_width),
                     .pll_type          (pll_type)
                     )siv_xcvr_without_pma_ctrl(
                     .mgmt_clk  (phy_mgmt_clk),                  //         mgmt_clk.clk
                     .mgmt_clk_rstn     (!phy_mgmt_clk_reset),                  //     mgmt_clk_rst.reset_n
                     .mgmt_read         (sc_topcsr_read),                //         phy_mgmt.read
                     .mgmt_write        (sc_topcsr_write),               //                 .write
                     .mgmt_address      (sc_topcsr_address),             //                 .address
                     .mgmt_writedata    (phy_mgmt_writedata),            //                 .writedata
                     .mgmt_readdata     (sc_topcsr_readdata),            //                 .readdata
                     .xgmii_tx_clk      (xgmii_tx_clk),          //     xgmii_tx_clk.clk
                     .rx_recovered_clk  (rx_recovered_clk),
                     .rx_data_ready     (rx_data_ready),
                     .pll_ref_clk       (pll_ref_clk),           //      pll_ref_clk.clk
                     .xgmii_rx_clk      (xgmii_rx_clk),          //     xgmii_rx_clk.clk
//                     .rx_oc_busy      (rx_oc_busy),                   // RX channel offset cancellation status
                     .tx_ready  (tx_ready),              //         tx_ready.data
                     .rx_ready  (rx_ready),                     //        rx_ready0.data
                     .block_lock        ( rx_block_lock),               
                     .hi_ber            ( rx_hi_ber),           
                     .xgmii_tx_dc       (xgmii_tx_dc),          //    xgmii_tx_dc_0.data
                     .xgmii_rx_dc       (xgmii_rx_dc),          //    xgmii_rx_dc_0.data
                     .tx_serial_data    ( tx_serial_data),      // tx_serial_data_0.export
                     .rx_serial_data    (rx_serial_data),       // rx_serial_data_0.export
                     .reconfig_to_gxb(reconfig_to_xcvr),
                     .reconfig_from_gxb( reconfig_from_xcvr),
                     .pma_controller_gxb_pdn(gxb_pdn),
                     .tx_pll_locked     (tx_pll_locked),
                     .tx_pll_pdn        (pll_pdn),
                     .cal_blk_clk       (cal_blk_clk), //calibration block clock
                     .pma_controller_cal_blk_pdn        (cal_blk_pdn),
                     .tx_latency_adj    (tx_latency_adj_int),                    
                     .rx_latency_adj    (rx_latency_adj_int)
                     );
                  end
        
           else if ( ((device_family == "Stratix V") | (device_family == "Arria V GZ")) & external_pma_ctrl_config == 0)
                begin

        // instantiate 10gbaser phy
        // The latadj parameters must be propagated to provide soft FIFO variant
        sv_xcvr_10gbaser_nr  #(
          .num_channels          (num_channels         ),
          .operation_mode        (operation_mode       ),
          .sys_clk_in_mhz        (mgmt_clk_in_mhz      ),
          .ref_clk_freq          (ref_clk_freq         ),
          .rx_use_coreclk        (rx_use_coreclk       ),
          .pll_type              (pll_type             ),
          .pma_mode              (pma_mode             ),
          .embedded_reset        (embedded_reset       ),
          .high_precision_latadj (high_precision_latadj),
          .latadj_width          (latadj_width),
          .RX_LATADJ             (rx_latadj),
          .TX_LATADJ             (tx_latadj)
        )xv_xcvr_10gbaser_nr_inst(
          .mgmt_clk              (phy_mgmt_clk),              //         mgmt_clk.clk
          .mgmt_clk_rstn         (!phy_mgmt_clk_reset),       //     mgmt_clk_rst.reset_n
          .mgmt_read             (phy_mgmt_read),             //         phy_mgmt.read
          .mgmt_write            (phy_mgmt_write),            //                 .write
          .mgmt_address          (phy_mgmt_address[7:0]),     //                 .address
          .mgmt_writedata        (phy_mgmt_writedata),        //                 .writedata
          .mgmt_readdata         (phy_mgmt_readdata),         //                 .readdata
          .mgmt_waitrequest      (phy_mgmt_waitrequest),
          .xgmii_tx_clk          (xgmii_tx_clk),              //     xgmii_tx_clk.clk
          .pll_ref_clk           (pll_ref_clk),               //      pll_ref_clk.clk
          .rx_coreclkin          (rx_coreclkin),
          .xgmii_rx_clk          (xgmii_rx_clk),              //     xgmii_rx_clk.clk
          .rx_recovered_clk      (rx_recovered_clk),
          .tx_ready              (tx_ready),                  //         tx_ready.data
          .rx_ready              (rx_ready),                  //        rx_ready0.data
          .rx_data_ready         (rx_data_ready),
          .pll_locked            (pll_locked),
          .block_lock            (rx_block_lock),               
          .hi_ber                (rx_hi_ber),           
          .xgmii_tx_dc           (xgmii_tx_dc),               //    xgmii_tx_dc_0.data
          .xgmii_rx_dc           (xgmii_rx_dc),               //    xgmii_rx_dc_0.data
          .tx_serial_data        (tx_serial_data),            // tx_serial_data_0.export
          .rx_serial_data        (rx_serial_data),            //sync with reconfig_clk.
          .pll_powerdown         (pll_powerdown),
          .tx_analogreset        (tx_analogreset),
          .tx_digitalreset       (tx_digitalreset),
          .rx_analogreset        (rx_analogreset),
          .rx_digitalreset       (rx_digitalreset),
          .tx_cal_busy           (tx_cal_busy),
          .rx_cal_busy           (rx_cal_busy),
          .rx_is_lockedtodata    (rx_is_lockedtodata),
          .rx_latency_adj        (rx_latency_adj_int),
          .tx_latency_adj        (tx_latency_adj_int),
          .reconfig_to_xcvr      (reconfig_to_xcvr),
          .reconfig_from_xcvr    (reconfig_from_xcvr)
        );
              end
              
           else if ( device_family == "Arria V" & external_pma_ctrl_config == 0)
                begin

        // instantiate 10gbaser phy
        // The latadj parameters must be propagated to provide soft FIFO variant
        av_xcvr_10gbaser_nr  #(
          .num_channels          (num_channels          ),
          .operation_mode        (operation_mode        ),
          .sys_clk_in_mhz        (mgmt_clk_in_mhz       ),
          .ref_clk_freq          (ref_clk_freq          ),
          .rx_use_coreclk        (rx_use_coreclk        ),
          .embedded_reset        (embedded_reset        ),
          .high_precision_latadj (high_precision_latadj ),
          .latadj_width          (latadj_width          ),
          .pll_type              (pll_type              )
        )av_xcvr_10gbaser_nr_inst(
          .mgmt_clk          (phy_mgmt_clk),                  // mgmt_clk.clk
          .mgmt_clk_rstn     (!phy_mgmt_clk_reset),           // mgmt_clk_rst.reset_n
          .mgmt_read         (phy_mgmt_read),                 // phy_mgmt.read
          .mgmt_write        (phy_mgmt_write),                // .write
          .mgmt_address      (phy_mgmt_address[7:0]),         // .address
          .mgmt_writedata    (phy_mgmt_writedata),            // .writedata
          .mgmt_readdata     (phy_mgmt_readdata),             // .readdata
          .mgmt_waitrequest  (phy_mgmt_waitrequest),
          .xgmii_tx_clk      (xgmii_tx_clk),                  // xgmii_tx_clk.clk
          .rx_coreclkin      (rx_coreclkin),
          .pll_ref_clk       (pll_ref_clk),                   // pll_ref_clk.clk
          .xgmii_rx_clk      (xgmii_rx_clk),                  // xgmii_rx_clk.clk
          .rx_recovered_clk  (rx_recovered_clk),
          .tx_ready          (tx_ready),                      // tx_ready.data
          .rx_ready          (rx_ready),                      // rx_ready0.data
          .rx_data_ready     (rx_data_ready),
          .pll_locked        (pll_locked),
          .block_lock        (rx_block_lock),               
          .hi_ber            (rx_hi_ber),           
          .xgmii_tx_dc       (xgmii_tx_dc),                   // xgmii_tx_dc_0.data
          .xgmii_rx_dc       (xgmii_rx_dc),                   // xgmii_rx_dc_0.data
          .tx_serial_data    (tx_serial_data),                // tx_serial_data_0.export
          .rx_serial_data    (rx_serial_data),                // sync with reconfig_clk.
          .pll_powerdown     (pll_powerdown),
          .tx_analogreset    (tx_analogreset),
          .tx_digitalreset   (tx_digitalreset),
          .rx_analogreset    (rx_analogreset),
          .rx_digitalreset   (rx_digitalreset),
          .tx_cal_busy       (tx_cal_busy),
          .rx_cal_busy       (rx_cal_busy),
          .rx_is_lockedtodata(rx_is_lockedtodata),
          .rx_latency_adj    (rx_latency_adj_int),
          .tx_latency_adj    (tx_latency_adj_int),
          .reconfig_to_xcvr  (reconfig_to_xcvr),
          .reconfig_from_xcvr(reconfig_from_xcvr)
        );

              end

        endgenerate      
generate        
  if ( device_family != "Stratix V" && device_family != "Arria V" && device_family != "Arria V GZ")
        begin
        // generate waitrequest for 'top' channel
          altera_wait_generate top_wait (
                  .rst(phy_mgmt_clk_reset),
                  .clk(phy_mgmt_clk),
                  .launch_signal(phy_mgmt_read),
                  .wait_req(phy_mgmt_waitrequest)
          );
  end
endgenerate

        // Dynamic reconfiguration controller
        generate 
    if ( device_family == "Stratix IV" & external_pma_ctrl_config == 0)
                begin
                alt_xcvr_reconfig_siv#(
                     .number_of_reconfig_interfaces (reconfig_interfaces)
                     )  
                reconfig (
                        .mgmt_clk_clk(phy_mgmt_clk),
                        .mgmt_rst_reset(phy_mgmt_clk_reset),
                        .reconfig_mgmt_address(sc_reconf_address),
                        .reconfig_mgmt_read(sc_reconf_read),
                        .reconfig_mgmt_write(sc_reconf_write),
                        .reconfig_mgmt_writedata(phy_mgmt_writedata),
                        .reconfig_mgmt_waitrequest(sc_reconf_waitrequest),
                        .reconfig_mgmt_readdata(sc_reconf_readdata),
                        .reconfig_done(reconfig_done),
                        .reconfig_togxb(wire_reconfig_to_gxb),
                        .reconfig_fromgxb(reconfig_from_xcvr)   // native testbus input, from 'top' channel
                );
              end
        endgenerate      

        generate 
           if ( device_family == "Stratix IV" & external_pma_ctrl_config == 1)
                begin

                //sync pll_locked if it is exported
                altera_std_synchronizer # (
                 .depth ( sync_depth)
                )   stdsync_hi_ber ( 
                        .clk(phy_mgmt_clk),
                        .din(tx_pll_locked),
                        .dout(pll_locked),
                        .reset_n(!phy_mgmt_clk_reset)
                );
             end
        endgenerate      

endmodule
