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


`timescale 1ns/10ps

import altera_xcvr_functions::*;

module av_xcvr_10gbaser_native #(
  parameter operation_mode         = "duplex",
  parameter output_clock_frequency = "5156.25 MHz",
  parameter output_data_rate       = "10312.5 Mbps",
  parameter ref_clk_freq           = "322.265625 Mhz",
  parameter rx_use_coreclk         = 0,
  parameter high_precision_latadj  = 1,
  parameter latadj_width           = 16,
  parameter pll_type               = "AUTO"    // PLL type for each PLL
)(
  input wire                                                                                              mgmt_clk,
  input wire                                                                                              mgmt_clk_rstn,

  input wire                                                                                              rx_coreclkin,
  input wire                                                                                              pll_ref_clk,
  input wire                                                                                              pll_rstn,
  input wire                                                                                              tx_analog_rst,
  input wire                                                                                              tx_digital_rstn,
  input wire                                                                                              rx_analog_rstn,
  input wire                                                                                              rx_digital_rstn,
  input wire  [71:0]                                                                                      xgmii_tx_dc,
  output wire [71:0]                                                                                      xgmii_rx_dc,
  input wire                                                                                              xgmii_tx_clk, 
  output wire                                                                                             xgmii_rx_clk, 
  output wire                                                                                             tx_serial_data,
  input wire                                                                                              rx_serial_data,
  output wire                                                                                             pll_locked,
  output wire                                                                                             rx_recovered_clk,
  output wire                                                                                             rx_is_lockedtodata,
  output wire                                                                                             rx_is_lockedtoref,
  output wire                                                                                             tx_cal_busy,
  output wire                                                                                             rx_cal_busy,

  input wire                                                                                              rx_set_locktodata, //directly connect to rx_pma.ltd
  input wire                                                                                              rx_set_locktoref, //goes thru pcs then to rx_pma.ltr
  input wire                                                                                              rxseriallpbken,
  input wire                                                                                              rxclrerrorblockcount,
  input wire                                                                                              rxclrbercount,
//input wire                                                                                              rxprbserrorclr,
  output wire                                                                                             pcsstatus,
  output wire                                                                                             rxblocklock,
  output wire                                                                                             rxhighber,
  output wire                                                                                             rx_data_ready,
  output wire [ 5:0]                                                                                      bercount,
  output wire [ 7:0]                                                                                      errorblockcount,
//output wire [15:0]                                                                                      randomerrorcount,
//output wire                                                                                             rxfifoempty,
//output wire                                                                                             rxfifopartialempty,
//output wire                                                                                             rxfifopartialfull,
  output wire                                                                                             rxfifofull,
//output wire                                                                                             rxsyncheadererror,
//output wire                                                                                             rxscramblererror,

//output wire                                                                                             txfifoempty,
//output wire                                                                                             txfifopartialempty,
//output wire                                                                                             txfifopartialfull,
  output wire                                                                                             txfifofull,

  output wire [latadj_width-1:0]                                                                          tx_latency_adj,
  output wire [latadj_width-1:0]                                                                          rx_latency_adj,

  input wire  [altera_xcvr_functions::get_custom_reconfig_to_width ("Arria V",operation_mode,1,1,1)-1:0]  reconfig_to_xcvr,
  output wire [altera_xcvr_functions::get_custom_reconfig_from_width("Arria V",operation_mode,1,1,1)-1:0] reconfig_from_xcvr 
  
);

  localparam PMADWIDTH = 64;
  localparam PMADWIDTH_EXT = 80;
  localparam INT_TX_ENABLE = (operation_mode=="duplex")?  1'b1:
                             (operation_mode=="tx_only")? 1'b1:
                             (operation_mode=="rx_only")? 1'b0:1'bx;
  localparam INT_RX_ENABLE = (operation_mode=="duplex")?  1'b1:
                             (operation_mode=="tx_only")? 1'b0:
                             (operation_mode=="rx_only")? 1'b1:1'bx;
  localparam TSWIDTH = 16;
  
  wire               tx_clkout;
  wire    [  PMADWIDTH_EXT-1:0  ] tx_parallel_data;
  wire    [  PMADWIDTH_EXT-1:0  ] rx_parallel_data;
  wire               rx_usr_clk;
  wire               pll5G_locked;
  wire [TSWIDTH-1:0] tx_latency_adj_w;
  wire [TSWIDTH-1:0] rx_latency_adj_w;
  
  // eliminate the last 4 bits of fractional cycle if it is not high_precision_latadj
  assign tx_latency_adj = (high_precision_latadj) ? tx_latency_adj_w : tx_latency_adj_w[TSWIDTH-1:4];
  assign rx_latency_adj = (high_precision_latadj) ? rx_latency_adj_w : rx_latency_adj_w[TSWIDTH-1:4];
  
    alt_10gbaser_pcs #(
        .pma_data_width(PMADWIDTH),
        .pma_external_data_width(PMADWIDTH_EXT),
        .TSWIDTH(TSWIDTH),
        .operation_mode(operation_mode)
        ) av_10gbaser_soft_pcs_inst(
            .tx_ready            (/*unused*/             ),
            .rx_ready            (/*unused*/             ),
            .tx_pma_ready        (/*unused*/             ),
            .rx_pma_ready        (/*unused*/             ),
            
            // AvalonMM signals
            .mgmt_clk            (mgmt_clk               ),  // AvalonMM clock
            .mgmt_rstn           (mgmt_clk_rstn          ),  // AvalonMM active low reset
            .pcs_mgmt_address    (3'b000                 ),  // AvalonMM address
            .pcs_mgmt_read       (1'b0                   ),  // AvalonMM read
            .pcs_mgmt_write      (1'b0                   ),  // AvalonMM write
            .pcs_mgmt_writedata  (16'h00                 ),  // AvalonMM write data
    
            .tx_usr_clk          (xgmii_tx_clk           ),  // xgmii_tx_clk.clk
            .xgmii_rx_clk        (xgmii_rx_clk           ),
            .xgmii_tx_dc         (xgmii_tx_dc            ),  // xgmii_tx_dc_0.data
            .xgmii_rx_dc         (xgmii_rx_dc            ),  // xgmii_rx_dc_0.data
            .rx_usr_clk          (rx_usr_clk             ),
            
            // XGMII inputs from MAC
            .rx_pma_clk          (rx_recovered_clk       ),  // RX PMA Clock
            .pma_data_in         (rx_parallel_data       ),  // Data In from PMA 
    
            // Outputs to PMA
            .tx_pma_clk          (tx_clkout              ),  // TX PMA Clock
            .pma_data_out        (tx_parallel_data       ),  // Data Out to PMA
    
            // Control Signals
            .signal_ok           (rx_is_lockedtodata     ),  // Indicates Data from PMA is valid 
            .clr_errblk_cnt      (rxclrerrorblockcount   ),  // Clear the Errored Block Counter
            .clr_ber_count       (rxclrbercount          ),  // Clear the Errored Block Counter
            .tx_rst_only         (~tx_digital_rstn       ),
            .rx_rst_only         (~rx_digital_rstn       ),

            // Status signals
            .block_lock          (rxblocklock            ),  // Block Locked 
            .rx_data_ready       (rx_data_ready          ),  // Block Locked 
            .hi_ber              (rxhighber              ),  // Indicates High BER detected 
            .ber_count           (bercount               ),  // Indicates BER Count
            .errored_block_count (errorblockcount        ),  // Errored Block Count
            .pcs_status          (pcsstatus              ),  // PCS status
            .tx_fifo_full        (txfifofull             ),  // TX Clock Comp FIFO full
            .rx_fifo_full        (rxfifofull             ),  // RX Clock Comp FIFO full
            .tx_latency_adj      (tx_latency_adj_w       ),
            .rx_latency_adj      (rx_latency_adj_w       )
            );

        altera_xcvr_native_av #(
            .data_path_select          ("pma_direct"),      // legal values "8G" "pma_direct"
            .std_protocol_hint         ("basic"),           // pipe_g1|pipe_g2|cpri|cpri_rx_tx|gige|xaui|srio_2p1|test|basic|disabled_prot_mode
            .rx_enable                 (INT_RX_ENABLE),
            .tx_enable                 (INT_TX_ENABLE),
            .channels                  (1),                 // legal values 1+
            .pma_width                 (PMADWIDTH    ),     // 8G - 8|10|16|20|32|40, PMA_DIR-8|10|16|20|32|40|64|80
            .rx_clkslip_enable         (1),

            // PLL specific parameters
            .data_rate                 (output_data_rate),
            .pll_data_rate             (output_data_rate),
            .pll_refclk_freq           (ref_clk_freq),      // PLL rerefence clock frequency, this will go to TX PLL and CDR PLL
            .cdr_refclk_freq           (ref_clk_freq),
            .bonded_mode               ("non_bonded")               // (non_bonded)
            ) altera_xcvr_native_av_inst (
            // Resets - PLL, RX and TX
            .tx_analogreset            (tx_analog_rst),     // for tx pma
            .pll_powerdown             (~pll_rstn), 
            .tx_digitalreset           (~tx_digital_rstn),  // for TX PCS
            .rx_analogreset            (~rx_analog_rstn),   // for rx pma
            .rx_digitalreset           (~rx_digital_rstn),  // for rx pcs

            // Reconfig interface ports
            .reconfig_to_xcvr          (reconfig_to_xcvr),
            .reconfig_from_xcvr        (reconfig_from_xcvr),
            .tx_cal_busy               (tx_cal_busy),
            .rx_cal_busy               (rx_cal_busy),

            //clk signals
            .tx_pll_refclk             (pll_ref_clk),
            .rx_cdr_refclk             (pll_ref_clk),

            // TX and RX serial ports
            .rx_serial_data            (rx_serial_data),
            .tx_serial_data            (tx_serial_data),
            .tx_std_elecidle           (1'b0),

            // control ports
            .rx_seriallpbken           (rxseriallpbken),
            .rx_set_locktodata         (rx_set_locktodata),
            .rx_set_locktoref          (rx_set_locktoref),

            //status
            .rx_is_lockedtoref         (rx_is_lockedtoref),
            .rx_is_lockedtodata        (rx_is_lockedtodata),
            .pll_locked                (pll5G_locked),

            //parallel data ports
            .tx_pma_parallel_data      (tx_parallel_data),
            .rx_pma_parallel_data      (rx_parallel_data),

            // PMA specific ports
            .tx_pma_clkout             (tx_clkout),   // TX Parallel clock output from PMA
            .rx_pma_clkout             (rx_recovered_clk),   // RX Parallel clock output from PMA
            .rx_clkslip                (),

            //PPM detector clocks
            .rx_clklow                 (),     // RX Low freq recovered clock, PPM detecror specific
            .rx_fref                   ()      // RX PFD reference clock, PPM detecror specific

            );

        wire pll156M_locked;
        assign pll_locked = ((INT_TX_ENABLE)?pll5G_locked:1'b1) & ((rx_use_coreclk)?1'b1:pll156M_locked);

        wire fboutclk1;
        generate
            if (rx_use_coreclk==1'b0)
            begin : gen_fpll
                (* altera_attribute = "-name MERGE_TX_PLL_DRIVEN_BY_REGISTERS_WITH_SAME_CLEAR ON" *)
                generic_pll #(
                        .reference_clock_frequency  (ref_clk_freq  ),
                        .output_clock_frequency     ("156.25 MHz"  )
                ) altera_pll_156M (
                        .outclk              (rx_usr_clk     ),
                        .fboutclk            (fboutclk1      ),
                        .rst                 (~pll_rstn      ),
                        .refclk              (pll_ref_clk    ),
                        .fbclk               (fboutclk1      ),
                        .locked              (pll156M_locked ),

                        .writerefclkdata     (/*unused*/  ),
                        .writeoutclkdata     (/*unused*/  ),
                        .writephaseshiftdata (/*unused*/  ),
                        .writedutycycledata  (/*unused*/  ),
                        .readrefclkdata      (/*unused*/  ),
                        .readoutclkdata      (/*unused*/  ),
                        .readphaseshiftdata  (/*unused*/  ),
                        .readdutycycledata   (/*unused*/  )
                );
            end
        else
            begin : no_gen_fpll
                assign rx_usr_clk = rx_coreclkin;
            end
        endgenerate
        
endmodule                                                               
