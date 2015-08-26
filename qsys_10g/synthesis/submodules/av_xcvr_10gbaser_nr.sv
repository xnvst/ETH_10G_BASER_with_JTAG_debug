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

import altera_xcvr_functions::*;

(* altera_attribute = "-name GLOBAL_SIGNAL \"PERIPHERY CLOCK\" -to \"*av_xcvr_10gbaser_native*av_rx_pma|clkdivrx*\";-name GLOBAL_SIGNAL \"PERIPHERY CLOCK\" -to \"*av_xcvr_10gbaser_native*av_tx_pma|clkdivtx*\"" *)
module av_xcvr_10gbaser_nr #(
  parameter num_channels          = 4,
  parameter operation_mode        = "duplex",
  parameter sys_clk_in_mhz        = 50,
  parameter sync_depth            = 2,
  parameter ref_clk_freq          = "322.265625 Mhz",
  parameter rx_use_coreclk        = 0,
  parameter embedded_reset        = 1,  // (0,1) 1-Enable embedded reset controller
  parameter high_precision_latadj = 1,
  parameter latadj_width          = 16,
  parameter pll_type              = "AUTO"     // PLL type for each PLL
)(
  input wire                                                                                                           mgmt_clk,
  input wire                                                                                                           mgmt_clk_rstn,
  input wire                                                                                                           mgmt_read,
  input wire                                                                                                           mgmt_write,
  input wire [ 7:0]                                                                                                    mgmt_address,
  input wire [31:0]                                                                                                    mgmt_writedata,
  output wire [31:0]                                                                                                   mgmt_readdata,
  output wire                                                                                                          mgmt_waitrequest,
  input  wire                                                                                                          rx_coreclkin,
  input wire                                                                                                           pll_ref_clk,
  input wire                                                                                                           xgmii_tx_clk,
  output wire                                                                                                          xgmii_rx_clk,
  output wire [ num_channels -1 : 0]                                                                                   rx_recovered_clk,
  output wire                                                                                                          tx_ready,
  output wire                                                                                                          rx_ready,
  output wire [ num_channels -1 : 0]                                                                                   rx_data_ready,
  output wire                                                                                                          pll_locked,
  output wire [ num_channels -1 : 0]                                                                                   block_lock,
  output wire [ num_channels -1 : 0]                                                                                   hi_ber,
  input wire [72*num_channels -1 : 0]                                                                                  xgmii_tx_dc,
  output wire [72*num_channels -1 : 0]                                                                                 xgmii_rx_dc,
  output wire [ num_channels -1 : 0]                                                                                   tx_serial_data,
  input wire [ num_channels -1 : 0]                                                                                    rx_serial_data,

  // Reset inputs
  input   wire    [ num_channels-1:0]                                                                                  pll_powerdown, 
  input   wire    [ num_channels-1:0]                                                                                  tx_analogreset,
  input   wire    [ num_channels-1:0]                                                                                  tx_digitalreset,
  input   wire    [ num_channels-1:0]                                                                                  rx_analogreset,
  input   wire    [ num_channels-1:0]                                                                                  rx_digitalreset,
  // Calibration busy signals
  output   wire   [ num_channels-1:0]                                                                                  tx_cal_busy,
  output   wire   [ num_channels-1:0]                                                                                  rx_cal_busy,
  output   wire   [ num_channels-1:0]                                                                                  rx_is_lockedtodata,
  
  output wire [latadj_width*num_channels -1 : 0]                                                                       rx_latency_adj,
  output wire [latadj_width*num_channels -1 : 0]                                                                       tx_latency_adj,
  
  // reconfiguration ports and status
  input wire [altera_xcvr_functions::get_custom_reconfig_to_width ("Arria V",operation_mode,num_channels,1,1)-1:0]   reconfig_to_xcvr,
  output wire [altera_xcvr_functions::get_custom_reconfig_from_width("Arria V",operation_mode,num_channels,1,1)-1:0] reconfig_from_xcvr
);

  wire   [num_channels -1 : 0] pll_is_locked;        
  wire   [num_channels -1 : 0] rx_is_lockedtoref;

  wire                  [31:0] pcs_mgmt_readdata;
  wire                  [31:0] common_mgmt_readdata;

  wire   [num_channels -1 : 0] clr_errblk_cnt;
  wire   [num_channels -1 : 0] clr_ber_cnt;
  wire   [num_channels -1 : 0] block_lock_wire;
  wire   [num_channels -1 : 0] rx_data_ready_wire;
  wire   [num_channels -1 : 0] hi_ber_wire;
  wire   [num_channels -1 : 0] tx_fifo_full;
  wire   [num_channels -1 : 0] rx_fifo_full;
  wire   [num_channels -1 : 0] pcs_status;
  wire [num_channels*6 -1 : 0] ber_cnt;
  wire [num_channels*8 -1 : 0] errored_block_cnt;
//wire   [num_channels -1 : 0] rx_sync_head_error;
//wire   [num_channels -1 : 0] rx_scrambler_error;
  wire                         enable_pcs;
//wire                         reconfig_busy;

  wire                         csr_reset_all; // power-up to 1 to trigger auto-init sequence
  wire                         csr_pll_powerdown;
  wire   [num_channels -1 : 0] csr_phy_loopback_serial;
  wire   [num_channels -1 : 0] csr_tx_digitalreset;
  wire   [num_channels -1 : 0] csr_rx_analogreset;
  wire   [num_channels -1 : 0] csr_rx_digitalreset;
  wire                         csr_reset_tx_digital;
  wire                         csr_reset_rx_digital;
  wire   [num_channels -1 : 0] csr_rx_set_locktoref; 
  wire   [num_channels -1 : 0] csr_rx_set_locktodata;
  wire   [num_channels -1 : 0] xgmii_rx_clk_wire;    
  wire   [altera_xcvr_functions::get_custom_reconfig_to_width  ("Arria V",operation_mode,num_channels,1,1)-1:0] reconfig_to_xcvr_merger;
  wire   [altera_xcvr_functions::get_custom_reconfig_from_width("Arria V",operation_mode,num_channels,1,1)-1:0] reconfig_from_xcvr_merger;
    
  localparam reconfig_interfaces  = altera_xcvr_functions::get_custom_reconfig_interfaces("Arria V",operation_mode,num_channels,1,1);

  localparam  TX_ENABLE = (operation_mode != "rx_only");
  localparam  RX_ENABLE = (operation_mode != "tx_only");
  localparam sync_depth_str = sync_depth[7:0] + 8'd48; // number of sync stages specified as string (for timing constraints)

  // Parameter strings for embedded timing constraints
  localparam  SYNC_BLOCK_LOCK_CONSTRAINT = {"-name SDC_STATEMENT \"set regs [get_registers -nowarn *av_xcvr_10gbaser_nr*sync_block_lock[",sync_depth_str,"]*]; if {[llength [query_collection -report -all $regs]] > 0} {set_false_path -to $regs}\""};
  localparam  SYNC_HI_BER_CONSTRAINT = {"-name SDC_STATEMENT \"set regs [get_registers -nowarn *av_xcvr_10gbaser_nr*sync_hi_ber[",sync_depth_str,"]*]; if {[llength [query_collection -report -all $regs]] > 0} {set_false_path -to $regs}\""};
  localparam  SYNC_RX_DATA_READY_CONSTRAINT = {"-name SDC_STATEMENT \"set regs [get_registers -nowarn *av_xcvr_10gbaser_nr*sync_rx_data_ready[",sync_depth_str,"]*]; if {[llength [query_collection -report -all $regs]] > 0} {set_false_path -to $regs}\""};

  //////////////////////////////////
  //reset controller outputs
  //////////////////////////////////
  wire                     reset_controller_pll_powerdown;
  wire  [num_channels-1:0] reset_controller_tx_digitalreset;
  wire  [num_channels-1:0] reset_controller_rx_analogreset;
  wire  [num_channels-1:0] reset_controller_rx_digitalreset;
  wire  [num_channels-1:0] reset_controller_tx_ready;
  wire  [num_channels-1:0] reset_controller_rx_ready;

  // Final reset signals
  wire  [num_channels-1:0] pll_powerdown_fnl;
  wire  [num_channels-1:0] tx_analogreset_fnl;
  wire  [num_channels-1:0] tx_digitalreset_fnl;
  wire  [num_channels-1:0] rx_analogreset_fnl;
  wire  [num_channels-1:0] rx_digitalreset_fnl;

  assign  pll_powerdown_fnl   = (embedded_reset)  ? {num_channels{csr_pll_powerdown}} : pll_powerdown;
  assign  tx_analogreset_fnl  = (embedded_reset)  ? {num_channels{csr_pll_powerdown}} : tx_analogreset;
  assign  tx_digitalreset_fnl = csr_tx_digitalreset | (embedded_reset ? {num_channels{1'b0}} : tx_digitalreset);
  assign  rx_analogreset_fnl  = csr_rx_analogreset  | (embedded_reset ? {num_channels{1'b0}} : rx_analogreset );
  assign  rx_digitalreset_fnl = csr_rx_digitalreset | (embedded_reset ? {num_channels{1'b0}} : rx_digitalreset);

  assign xgmii_rx_clk = xgmii_rx_clk_wire[0];  
  assign pll_locked   = &pll_is_locked;

  genvar i;
  generate
    for (i=0;i<num_channels;i=i+1)
    begin: ch   
        
        //av_xcvr_10gbaser_native is channel based. Create reconfig port in channel based
        //Generally one CDR and one for TXPLL. rx_only=1X, others=2X while X=W_A5_RECONFIG_BUNDLE_TO_XCVR
        wire [W_A5_RECONFIG_BUNDLE_TO_XCVR*reconfig_interfaces/num_channels-1:0] reconfig_to_xcvr_ch; 
        wire [W_A5_RECONFIG_BUNDLE_FROM_XCVR*reconfig_interfaces/num_channels-1:0] reconfig_from_xcvr_ch; 
        genvar i_interface;
      for (i_interface=0;i_interface<reconfig_interfaces;i_interface=i_interface+1)
      begin: reconfig_ch
        if ((i_interface%num_channels)==i)
        begin
            assign reconfig_to_xcvr_ch[(i_interface/num_channels)*W_A5_RECONFIG_BUNDLE_TO_XCVR+:W_A5_RECONFIG_BUNDLE_TO_XCVR] = reconfig_to_xcvr_merger[i_interface*W_A5_RECONFIG_BUNDLE_TO_XCVR+:W_A5_RECONFIG_BUNDLE_TO_XCVR];
            assign reconfig_from_xcvr_merger[i_interface*W_A5_RECONFIG_BUNDLE_FROM_XCVR+:W_A5_RECONFIG_BUNDLE_FROM_XCVR] = reconfig_from_xcvr_ch[(i_interface/num_channels)*W_A5_RECONFIG_BUNDLE_FROM_XCVR+:W_A5_RECONFIG_BUNDLE_FROM_XCVR];
        end
        end
        
      av_xcvr_10gbaser_native #(
        .operation_mode         (operation_mode         ),
        .output_clock_frequency ("5156.25 MHz"          ),
        .output_data_rate       ("10312.5 Mbps"         ),
        .ref_clk_freq           (ref_clk_freq           ),
        .rx_use_coreclk         (rx_use_coreclk         ),
        .high_precision_latadj  (high_precision_latadj  ),
        .latadj_width           (latadj_width           ),
        .pll_type               (pll_type               )
      )av_xcvr_10gbaser_native_inst(
        .mgmt_clk               (mgmt_clk               ),
        .mgmt_clk_rstn          (mgmt_clk_rstn          ),
        .rx_coreclkin           (rx_coreclkin           ),
        .pll_ref_clk            (pll_ref_clk            ),
        .xgmii_tx_clk           (xgmii_tx_clk           ),
        .xgmii_rx_clk           (xgmii_rx_clk_wire[i]   ),
        .tx_digital_rstn        (~tx_digitalreset_fnl[i]),
        .tx_analog_rst          (tx_analogreset_fnl[i]  ),
        .rx_digital_rstn        (~rx_digitalreset_fnl[i]),
        .rx_analog_rstn         (~rx_analogreset_fnl[i] ),
        .tx_cal_busy            (tx_cal_busy[i]         ),
        .rx_cal_busy            (rx_cal_busy[i]         ),
        .pll_rstn               (~pll_powerdown_fnl[i]  ),
        .xgmii_tx_dc            (xgmii_tx_dc[72*i+:72]  ),
        .xgmii_rx_dc            (xgmii_rx_dc[72*i+:72]  ),
        .tx_serial_data         (tx_serial_data[i]      ),
        .rx_serial_data         (rx_serial_data[i]      ),
        .rx_is_lockedtodata     (rx_is_lockedtodata[i]  ),   
        .rx_is_lockedtoref      (rx_is_lockedtoref[i]   ),     
        .rx_recovered_clk       (rx_recovered_clk[i]),
        .pll_locked             (pll_is_locked[i]       ),        
        .rx_set_locktodata      (csr_rx_set_locktodata[i]),
        .rx_set_locktoref       (csr_rx_set_locktoref[i]),
                                 
        .rxseriallpbken         (csr_phy_loopback_serial[i]),
        .rxclrerrorblockcount   (clr_errblk_cnt[i]      ),
        .rxclrbercount          (clr_ber_cnt[i]         ),
        .rxblocklock            (block_lock_wire[i]     ),
        .rxhighber              (hi_ber_wire[i]         ),
        .rx_data_ready          (rx_data_ready_wire[i]  ),
        .rxfifofull             (rx_fifo_full[i]        ),
      //.rxsyncheadererror      (rx_sync_head_error[i]  ),
      //.rxscramblererror       (rx_scrambler_error[i]  ),
        .txfifofull             (tx_fifo_full[i]        ),
      //.rxprbserrorclr         (/*unused*/             ),
      //.rxfifoempty            (/*unused*/             ),
      //.rxfifopartialempty     (/*unused*/             ),
      //.rxfifopartialfull      (/*unused*/             ),
      //.txfifoempty            (/*unused*/             ),
      //.txfifopartialempty     (/*unused*/             ),
      //.txfifopartialfull      (/*unused*/             ),
        .pcsstatus              (pcs_status[i]          ),
        .bercount               (ber_cnt[6*i+:6]        ),
        .errorblockcount        (errored_block_cnt[8*i+:8]),
        .rx_latency_adj         (rx_latency_adj[latadj_width*i+:latadj_width]),
        .tx_latency_adj         (tx_latency_adj[latadj_width*i+:latadj_width]),
        .reconfig_to_xcvr       (reconfig_to_xcvr_ch    ),
        .reconfig_from_xcvr     (reconfig_from_xcvr_ch  )
                                 
      );                         
    end                          
  endgenerate                    

// Merge critical reconfig signals
  sv_reconfig_bundle_merger  #(
      .reconfig_interfaces       (reconfig_interfaces       )
  ) sv_reconfig_bundle_merger_inst (
  // Reconfig buses to/from reconfig controller
    .rcfg_reconfig_to_xcvr       (reconfig_to_xcvr          ), // all inputs from reconfig block to native xcvr reconfig ports
    .rcfg_reconfig_from_xcvr     (reconfig_from_xcvr        ), // all inputs from reconfig block to native xcvr reconfig ports

    // Reconfig buses to/from native xcvr
    .xcvr_reconfig_to_xcvr       (reconfig_to_xcvr_merger   ),
    .xcvr_reconfig_from_xcvr     (reconfig_from_xcvr_merger )
  );

  // Reset Controller
  generate if (embedded_reset) begin : gen_embedded_reset
    localparam  RX_PER_CHANNEL = 1;
    wire  [num_channels-1:0]   rx_manual_mode;

    // Put reset controller into manual mode when we are not in auto lock mode
    assign  rx_manual_mode = (csr_rx_set_locktoref | csr_rx_set_locktodata);
    // We have a single tx_ready, rx_ready output per IP instance
    assign  tx_ready  = &reset_controller_tx_ready;
    assign  rx_ready  = &reset_controller_rx_ready;

    altera_xcvr_reset_control
    #(
        .CHANNELS               (num_channels   ),  // Number of CHANNELS
        .SYNCHRONIZE_RESET      (0              ),  // (0,1) Synchronize the reset input
        .SYNCHRONIZE_PLL_RESET  (0              ),  // (0,1) Use synchronized reset input for PLL powerdown
                                                    // !NOTE! Will prevent PLL merging across reset controllers
                                                    // !NOTE! Requires SYNCHRONIZE_RESET == 1
        // Reset timings
        .SYS_CLK_IN_MHZ         (sys_clk_in_mhz ),  // Clock frequency in MHz. Required for reset timers
        .REDUCED_SIM_TIME       (1              ),  // (0,1) 1=Reduced reset timings for simulation
        // PLL options
        .TX_PLL_ENABLE          (1              ),  // (0,1) Enable TX PLL reset
        .PLLS                   (1              ),  // Number of TX PLLs
        .T_PLL_POWERDOWN        (1000           ),  // pll_powerdown period in ns
        // TX options
        .TX_ENABLE              (TX_ENABLE      ),  // (0,1) Enable TX resets
        .TX_PER_CHANNEL         (0              ),  // (0,1) 1=separate TX reset per channel
        .T_TX_DIGITALRESET      (20             ),  // tx_digitalreset period (after pll_powerdown)
        .T_PLL_LOCK_HYST        (0              ),  // Amount of hysteresis to add to pll_locked status signal
        // RX options
        .RX_ENABLE              (RX_ENABLE      ),  // (0,1) Enable RX resets
        .RX_PER_CHANNEL         (RX_PER_CHANNEL ),  // (0,1) 1=separate RX reset per channel
        .T_RX_ANALOGRESET       (40             ),  // rx_analogreset period
        .T_RX_DIGITALRESET      (4000           )   // rx_digitalreset period (after rx_is_lockedtodata)
    ) reset_controller (
      // User inputs and outputs
      .clock            (mgmt_clk       ),  // System clock
      .reset            (!mgmt_clk_rstn ),  // Asynchronous reset
      // Reset signals
      .pll_powerdown    (reset_controller_pll_powerdown   ),  // reset TX PLL
      .tx_analogreset   (/*unused*/                       ),  // reset TX PMA
      .tx_digitalreset  (reset_controller_tx_digitalreset ),  // reset TX PCS
      .rx_analogreset   (reset_controller_rx_analogreset  ),  // reset RX PMA
      .rx_digitalreset  (reset_controller_rx_digitalreset ),  // reset RX PCS
      // Status output
      .tx_ready         (reset_controller_tx_ready        ),  // TX is not in reset
      .rx_ready         (reset_controller_rx_ready        ),  // RX is not in reset
      // Digital reset override inputs (must by synchronous with clock)
      .tx_digitalreset_or({num_channels{csr_reset_tx_digital}} ), // reset request for tx_digitalreset
      .rx_digitalreset_or({num_channels{csr_reset_rx_digital}} ), // reset request for rx_digitalreset
      // TX control inputs
      .pll_locked         (&pll_is_locked         ),  // TX PLL is locked status
      .pll_select         (1'b0                   ),  // Select TX PLL locked signal 
      .tx_cal_busy        (tx_cal_busy            ),  // TX channel calibration status
      .tx_manual          ({num_channels{1'b1}}   ),  // 1=Manual TX reset mode
      // RX control inputs
      .rx_is_lockedtodata (rx_is_lockedtodata     ),  // RX CDR PLL is locked to data status
      .rx_cal_busy        (rx_cal_busy            ),  // RX channel calibration status
      .rx_manual          (rx_manual_mode         ) // 1=Manual RX reset mode
    );
  end else begin:gen_no_embedded_reset
    assign  reset_controller_pll_powerdown    = 1'b0;
    assign  reset_controller_tx_digitalreset  = {num_channels{1'b0}};
    assign  reset_controller_rx_analogreset   = {num_channels{1'b0}};
    assign  reset_controller_rx_digitalreset  = {num_channels{1'b0}};
    assign  tx_ready = 1'b0;
    assign  rx_ready = 1'b0;
  end
  endgenerate

  // Instantiate memory map logic for given number of lanes & PLL's
  // Includes all except PCS
  alt_xcvr_csr_common #(
    .lanes (num_channels ),
    .plls  (num_channels ),
    .rpc   (1)
  ) generic_csr (
    // user data (avalon-MM formatted) 
    .clk       (mgmt_clk            ),
    .reset     (!mgmt_clk_rstn      ),
    .address   (mgmt_address        ),
    .read      (mgmt_read           ),
    .readdata  (common_mgmt_readdata),
    .write     (mgmt_write          ),
    .writedata (mgmt_writedata      ),

    // transceiver status inputs to this CSR
    .pll_locked         (pll_is_locked     ),
    .rx_is_lockedtoref  (rx_is_lockedtoref ),
    .rx_is_lockedtodata (rx_is_lockedtodata),
    .rx_signaldetect    (1'b0              ),

    // reset controller outputs
    .reset_controller_tx_ready       (tx_ready),
    .reset_controller_rx_ready       (rx_ready),
    .reset_controller_pll_powerdown  (reset_controller_pll_powerdown  ),
    .reset_controller_tx_digitalreset(reset_controller_tx_digitalreset),
    .reset_controller_rx_analogreset (reset_controller_rx_analogreset ),
    .reset_controller_rx_digitalreset(reset_controller_rx_digitalreset),

    // read/write control registers
    // to reset controller
    .csr_reset_tx_digital   (csr_reset_tx_digital   ),
    .csr_reset_rx_digital   (csr_reset_rx_digital   ),
    .csr_reset_all          (csr_reset_all          ), // power-up to 1 to trigger auto-init sequence
    // to PMA and PCS reset inputs
    .csr_pll_powerdown      (csr_pll_powerdown      ), // reset controller or manual
    .csr_tx_digitalreset    (csr_tx_digitalreset    ), // reset controller or manual
    .csr_rx_analogreset     (csr_rx_analogreset     ), // reset controller or manual
    .csr_rx_digitalreset    (csr_rx_digitalreset    ), // reset controller or manual
    .csr_phy_loopback_serial(csr_phy_loopback_serial),
    // common PMA controls
    .csr_rx_set_locktoref   (csr_rx_set_locktoref   ),
    .csr_rx_set_locktodata  (csr_rx_set_locktodata  )
  );

  csr_pcs10gbaser #(
    .lanes              (num_channels      )
  ) pcs_map (
    .clk                (mgmt_clk          ),
    .reset              (!mgmt_clk_rstn    ),
    .address            (mgmt_address      ),
    .read               (mgmt_read         ),
    .readdata           (pcs_mgmt_readdata ),
    .write              (mgmt_write        ),
    .writedata          (mgmt_writedata    ),

    .rx_clk             (xgmii_rx_clk      ),  // to synchronize rx control outputs
    .tx_clk             (xgmii_rx_clk      ),  // to synchronize tx control outputs
    .rx_pma_clk         (rx_recovered_clk  ),  // to synchronize tx control outputs

    //transceiver status inputs to this CSR
    .pcs_status         (pcs_status        ),
    .hi_ber             (hi_ber_wire       ),
    .block_lock         (block_lock_wire   ),
    .rx_data_ready      (rx_data_ready_wire),
    .tx_fifo_full       (tx_fifo_full      ),
    .rx_fifo_full       (rx_fifo_full      ),
    .rx_sync_head_error ({num_channels{1'b0}}),
    .rx_scrambler_error ({num_channels{1'b0}}),
    .ber_cnt            (ber_cnt             ),
    .errored_block_cnt  (errored_block_cnt   ),

    // read/write control outputs
    // PCS controls
    .csr_rclr_errblk_cnt(clr_errblk_cnt    ),
    .csr_rclr_ber_cnt   (clr_ber_cnt       )
  );

  assign enable_pcs    = mgmt_address[7];//200 shift 2 bits at the lsb
  assign mgmt_readdata = (pcs_mgmt_readdata & {32{enable_pcs & !mgmt_waitrequest}}) | (common_mgmt_readdata & {32{!enable_pcs & !mgmt_waitrequest}}) ;

  //waite generate, in read command, sub module will get data 1 clock later.
  altera_wait_generate wait_gen(
    .rst           (!mgmt_clk_rstn  ),
    .clk           (mgmt_clk        ),
    .launch_signal (mgmt_read       ),
    .wait_req      (mgmt_waitrequest)
  );
  

  //spr344487
  (* altera_attribute = SYNC_BLOCK_LOCK_CONSTRAINT *)    reg [num_channels - 1 : 0] sync_block_lock [sync_depth:1];
  (* altera_attribute = SYNC_HI_BER_CONSTRAINT *)        reg [num_channels - 1 : 0] sync_hi_ber [sync_depth:1];
  (* altera_attribute = SYNC_RX_DATA_READY_CONSTRAINT *) reg [num_channels - 1 : 0] sync_rx_data_ready [sync_depth:1];
  integer stage;
  genvar num_ch;
  generate
    for (num_ch = 0; num_ch < num_channels; num_ch = num_ch + 1 )
    begin: sync_block
      always @(posedge mgmt_clk) begin
        sync_block_lock[sync_depth][num_ch] <= block_lock_wire[num_ch];
        sync_hi_ber[sync_depth][num_ch] <= hi_ber_wire[num_ch];
        sync_rx_data_ready[sync_depth][num_ch] <= rx_data_ready_wire[num_ch];
        for (stage=2; stage <= sync_depth; stage = stage + 1 ) begin                   // additional sync stages
          sync_block_lock[stage-1][num_ch] <= sync_block_lock[stage][num_ch];
          sync_hi_ber[stage-1][num_ch] <= sync_hi_ber[stage][num_ch];
          sync_rx_data_ready[stage-1][num_ch] <= sync_rx_data_ready[stage][num_ch];
        end
      end
    end
  endgenerate
  
    assign block_lock = sync_block_lock[1];
    assign hi_ber = sync_hi_ber[1];
    assign rx_data_ready = sync_rx_data_ready[1];

endmodule // av_xcvr_10gbaser_nr
