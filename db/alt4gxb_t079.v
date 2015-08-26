//alt4gxb CBX_DECLARE_ALL_CONNECTED_PORTS="OFF" cmu_pll_inclk_log_index=0 cmu_pll_log_index=0 device_family="Arria V" effective_data_rate="10312.5 Mbps" enable_lc_tx_pll="false" enable_pll_inclk_drive_rx_cru="true" enable_pma_direct="false" enable_pma_xn_bonding="false" equalizer_ctrl_a_setting=0 equalizer_ctrl_b_setting=0 equalizer_ctrl_c_setting=0 equalizer_ctrl_d_setting=0 equalizer_ctrl_v_setting=0 equalizer_dcgain_setting=0 gen_reconfig_pll="false" gx_channel_type="auto" gxb_analog_power="AUTO" gxb_powerdown_width=1 input_clock_frequency="644.53125 MHz" intended_device_speed_grade="3_H3" intended_device_variant="ST Extended Features" loopback_mode="slb" number_of_channels=1 number_of_quads=1 operation_mode="duplex" pll_control_width=1 preemphasis_ctrl_1stposttap_setting=29 preemphasis_ctrl_2ndposttap_inv_setting="false" preemphasis_ctrl_2ndposttap_setting=0 preemphasis_ctrl_pretap_inv_setting="false" preemphasis_ctrl_pretap_setting=0 protocol="basic" receiver_termination="OCT_100_OHMS" reconfig_calibration="true" reconfig_dprio_mode=1 reconfig_fromgxb_port_width=17 reconfig_pll_inclk_width=1 reconfig_protocol="basic" reconfig_togxb_port_width=4 rx_8b_10b_mode="none" rx_allow_align_polarity_inversion="false" rx_allow_pipe_polarity_inversion="false" rx_bitslip_enable="true" rx_byte_ordering_mode="none" rx_channel_width=40 rx_common_mode="0.82v" rx_cru_bandwidth_type="auto" rx_datapath_low_latency_mode="true" rx_datapath_protocol="basic" rx_digitalreset_port_width=1 rx_dwidth_factor=4 rx_enable_bit_reversal="false" rx_enable_deep_align_byte_swap="false" rx_enable_lock_to_data_sig="true" rx_enable_lock_to_refclk_sig="true" rx_enable_self_test_mode="false" rx_flip_rx_out="false" rx_force_signal_detect="true" rx_phfiforegmode="false" rx_ppmselect=32 rx_rate_match_fifo_mode="none" rx_reconfig_clk_scheme="indv_clk_source" rx_signal_detect_threshold=2 rx_use_align_state_machine="true" rx_use_clkout="true" rx_use_coreclk="false" rx_use_cruclk="false" rx_use_deserializer_double_data_mode="true" rx_use_deskew_fifo="false" rx_use_double_data_mode="true" rx_word_aligner_num_byte=2 starting_channel_number=0 transmitter_termination="OCT_100_OHMS" tx_analog_power="auto" tx_bitslip_enable="false" tx_channel_width=40 tx_clkout_width=1 tx_common_mode="0.65v" tx_datapath_low_latency_mode="true" tx_digitalreset_port_width=1 tx_dwidth_factor=4 tx_enable_bit_reversal="false" tx_enable_self_test_mode="false" tx_flip_tx_in="false" tx_pll_bandwidth_type="auto" tx_pll_inclk0_period=3496503 tx_pll_type="CMU" tx_reconfig_clk_scheme="tx_ch0_clk_source" tx_slew_rate="off" tx_transmit_protocol="basic" tx_use_coreclk="false" tx_use_double_data_mode="true" tx_use_serializer_double_data_mode="true" use_calibration_block="true" use_global_clk_divider="false" vod_ctrl_setting=7 cal_blk_clk cal_blk_powerdown gxb_powerdown pll_inclk pll_locked pll_powerdown reconfig_clk reconfig_fromgxb reconfig_togxb rx_analogreset rx_clkout rx_datain rx_dataout rx_digitalreset rx_freqlocked rx_locktodata rx_locktorefclk rx_pll_locked rx_seriallpbken tx_clkout tx_datain tx_dataout tx_digitalreset
//VERSION_BEGIN 13.1 cbx_alt4gxb 2014:03:12:18:15:26:SJ cbx_mgl 2014:03:12:18:25:18:SJ cbx_tgx 2014:03:12:18:15:29:SJ  VERSION_END
// synthesis VERILOG_INPUT_VERSION VERILOG_2001
// altera message_off 10463



// Copyright (C) 1991-2014 Altera Corporation
//  Your use of Altera Corporation's design tools, logic functions 
//  and other software and tools, and its AMPP partner logic 
//  functions, and any output files from any of the foregoing 
//  (including device programming or simulation files), and any 
//  associated documentation or information are expressly subject 
//  to the terms and conditions of the Altera Program License 
//  Subscription Agreement, Altera MegaCore Function License 
//  Agreement, or other applicable license agreement, including, 
//  without limitation, that your use is for the sole purpose of 
//  programming logic devices manufactured by Altera and sold by 
//  Altera or its authorized distributors.  Please refer to the 
//  applicable agreement for further details.



//synthesis_resources = stratixiv_hssi_calibration_block 1 stratixiv_hssi_clock_divider 1 stratixiv_hssi_cmu 1 stratixiv_hssi_pll 2 stratixiv_hssi_rx_pcs 1 stratixiv_hssi_rx_pma 1 stratixiv_hssi_tx_pcs 1 stratixiv_hssi_tx_pma 1 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
(* ALTERA_ATTRIBUTE = {"AUTO_SHIFT_REGISTER_RECOGNITION=OFF"} *)
module  alt4gxb_t079
	( 
	cal_blk_clk,
	cal_blk_powerdown,
	gxb_powerdown,
	pll_inclk,
	pll_locked,
	pll_powerdown,
	reconfig_clk,
	reconfig_fromgxb,
	reconfig_togxb,
	rx_analogreset,
	rx_clkout,
	rx_datain,
	rx_dataout,
	rx_digitalreset,
	rx_freqlocked,
	rx_locktodata,
	rx_locktorefclk,
	rx_pll_locked,
	rx_seriallpbken,
	tx_clkout,
	tx_datain,
	tx_dataout,
	tx_digitalreset) /* synthesis synthesis_clearbox=1 */;
	input   cal_blk_clk;
	input   cal_blk_powerdown;
	input   [0:0]  gxb_powerdown;
	input   pll_inclk;
	output   [0:0]  pll_locked;
	input   [0:0]  pll_powerdown;
	input   reconfig_clk;
	output   [16:0]  reconfig_fromgxb;
	input   [3:0]  reconfig_togxb;
	input   [0:0]  rx_analogreset;
	output   [0:0]  rx_clkout;
	input   [0:0]  rx_datain;
	output   [39:0]  rx_dataout;
	input   [0:0]  rx_digitalreset;
	output   [0:0]  rx_freqlocked;
	input   [0:0]  rx_locktodata;
	input   [0:0]  rx_locktorefclk;
	output   [0:0]  rx_pll_locked;
	input   [0:0]  rx_seriallpbken;
	output   [0:0]  tx_clkout;
	input   [39:0]  tx_datain;
	output   [0:0]  tx_dataout;
	input   [0:0]  tx_digitalreset;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   cal_blk_clk;
	tri0   cal_blk_powerdown;
	tri0   [0:0]  gxb_powerdown;
	tri0   pll_inclk;
	tri0   [0:0]  pll_powerdown;
	tri0   reconfig_clk;
	tri0   [0:0]  rx_analogreset;
	tri0   [0:0]  rx_digitalreset;
	tri0   [0:0]  rx_locktodata;
	tri0   [0:0]  rx_locktorefclk;
	tri0   [0:0]  rx_seriallpbken;
	tri0   [39:0]  tx_datain;
	tri0   [0:0]  tx_digitalreset;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif


	parameter	starting_channel_number = 0;


	wire  wire_cal_blk0_nonusertocmu;
	wire  [1:0]   wire_ch_clk_div0_analogfastrefclkout;
	wire  [1:0]   wire_ch_clk_div0_analogrefclkout;
	wire  wire_ch_clk_div0_analogrefclkpulse;
	wire  [99:0]   wire_ch_clk_div0_dprioout;
	wire  [599:0]   wire_cent_unit0_cmudividerdprioout;
	wire  [1799:0]   wire_cent_unit0_cmuplldprioout;
	wire  wire_cent_unit0_dpriodisableout;
	wire  wire_cent_unit0_dprioout;
	wire  [1:0]   wire_cent_unit0_pllpowerdn;
	wire  [1:0]   wire_cent_unit0_pllresetout;
	wire  wire_cent_unit0_quadresetout;
	wire  [5:0]   wire_cent_unit0_rxanalogresetout;
	wire  [5:0]   wire_cent_unit0_rxcrupowerdown;
	wire  [5:0]   wire_cent_unit0_rxcruresetout;
	wire  [3:0]   wire_cent_unit0_rxdigitalresetout;
	wire  [5:0]   wire_cent_unit0_rxibpowerdown;
	wire  [1599:0]   wire_cent_unit0_rxpcsdprioout;
	wire  [1799:0]   wire_cent_unit0_rxpmadprioout;
	wire  [5:0]   wire_cent_unit0_txanalogresetout;
	wire  [3:0]   wire_cent_unit0_txctrlout;
	wire  [31:0]   wire_cent_unit0_txdataout;
	wire  [5:0]   wire_cent_unit0_txdetectrxpowerdown;
	wire  [3:0]   wire_cent_unit0_txdigitalresetout;
	wire  [5:0]   wire_cent_unit0_txobpowerdown;
	wire  [599:0]   wire_cent_unit0_txpcsdprioout;
	wire  [1799:0]   wire_cent_unit0_txpmadprioout;
	wire  [3:0]   wire_rx_cdr_pll0_clk;
	wire  [1:0]   wire_rx_cdr_pll0_dataout;
	wire  [299:0]   wire_rx_cdr_pll0_dprioout;
	wire  wire_rx_cdr_pll0_freqlocked;
	wire  wire_rx_cdr_pll0_locked;
	wire  wire_rx_cdr_pll0_pfdrefclkout;
	wire  [3:0]   wire_tx_pll0_clk;
	wire  [299:0]   wire_tx_pll0_dprioout;
	wire  wire_tx_pll0_locked;
	wire  wire_receive_pcs0_cdrctrllocktorefclkout;
	wire  wire_receive_pcs0_clkout;
	wire  [39:0]   wire_receive_pcs0_dataout;
	wire  [399:0]   wire_receive_pcs0_dprioout;
	wire  wire_receive_pcs0_signaldetect;
	wire  [7:0]   wire_receive_pma0_analogtestbus;
	wire  wire_receive_pma0_clockout;
	wire  wire_receive_pma0_dataout;
	wire  [299:0]   wire_receive_pma0_dprioout;
	wire  wire_receive_pma0_locktorefout;
	wire  [63:0]   wire_receive_pma0_recoverdataout;
	wire  wire_receive_pma0_signaldetect;
	wire  wire_transmit_pcs0_clkout;
	wire  [19:0]   wire_transmit_pcs0_dataout;
	wire  [149:0]   wire_transmit_pcs0_dprioout;
	wire  wire_transmit_pcs0_forceelecidleout;
	wire  wire_transmit_pcs0_txdetectrx;
	wire  wire_transmit_pma0_clockout;
	wire  wire_transmit_pma0_dataout;
	wire  [299:0]   wire_transmit_pma0_dprioout;
	wire  wire_transmit_pma0_seriallpbkout;
	wire  [1:0]  analogfastrefclkout;
	wire  [1:0]  analogrefclkout;
	wire  [0:0]  analogrefclkpulse;
	wire  [599:0]  cent_unit_cmudividerdprioout;
	wire  [1799:0]  cent_unit_cmuplldprioout;
	wire  [1:0]  cent_unit_pllpowerdn;
	wire  [1:0]  cent_unit_pllresetout;
	wire  [0:0]  cent_unit_quadresetout;
	wire  [5:0]  cent_unit_rxcrupowerdn;
	wire  [5:0]  cent_unit_rxibpowerdn;
	wire  [1599:0]  cent_unit_rxpcsdprioin;
	wire  [1599:0]  cent_unit_rxpcsdprioout;
	wire  [1799:0]  cent_unit_rxpmadprioin;
	wire  [1799:0]  cent_unit_rxpmadprioout;
	wire  [1199:0]  cent_unit_tx_dprioin;
	wire  [31:0]  cent_unit_tx_xgmdataout;
	wire  [3:0]  cent_unit_txctrlout;
	wire  [5:0]  cent_unit_txdetectrxpowerdn;
	wire  [599:0]  cent_unit_txdprioout;
	wire  [5:0]  cent_unit_txobpowerdn;
	wire  [1799:0]  cent_unit_txpmadprioin;
	wire  [1799:0]  cent_unit_txpmadprioout;
	wire  [599:0]  clk_div_cmudividerdprioin;
	wire  [5:0]  fixedclk_to_cmu;
	wire  [0:0]  nonusertocmu_out;
	wire  [9:0]  pll0_clkin;
	wire  [299:0]  pll0_dprioin;
	wire  [299:0]  pll0_dprioout;
	wire  [3:0]  pll0_out;
	wire  [1:0]  pll_ch_dataout_wire;
	wire  [299:0]  pll_ch_dprioout;
	wire  [1799:0]  pll_cmuplldprioout;
	wire  [0:0]  pll_inclk_wire;
	wire  [0:0]  pll_locked_out;
	wire  [1:0]  pllpowerdn_in;
	wire  [1:0]  pllreset_in;
	wire  [0:0]  reconfig_togxb_busy;
	wire  [0:0]  reconfig_togxb_disable;
	wire  [0:0]  reconfig_togxb_in;
	wire  [0:0]  reconfig_togxb_load;
	wire  [5:0]  rx_analogreset_in;
	wire  [5:0]  rx_analogreset_out;
	wire  [0:0]  rx_clkout_wire;
	wire  [0:0]  rx_coreclk_in;
	wire  [9:0]  rx_cruclk_in;
	wire  [3:0]  rx_deserclock_in;
	wire  [3:0]  rx_digitalreset_in;
	wire  [3:0]  rx_digitalreset_out;
	wire [0:0]  rx_enapatternalign;
	wire  [0:0]  rx_freqlocked_wire;
	wire  [0:0]  rx_locktodata_wire;
	wire  [0:0]  rx_locktorefclk_wire;
	wire  [39:0]  rx_out_wire;
	wire  [1599:0]  rx_pcsdprioin_wire;
	wire  [1599:0]  rx_pcsdprioout;
	wire [0:0]  rx_phfifordenable;
	wire [0:0]  rx_phfiforeset;
	wire [0:0]  rx_phfifowrdisable;
	wire  [0:0]  rx_pldcruclk_in;
	wire  [3:0]  rx_pll_clkout;
	wire  [0:0]  rx_pll_pfdrefclkout_wire;
	wire  [0:0]  rx_plllocked_wire;
	wire  [16:0]  rx_pma_analogtestbus;
	wire  [0:0]  rx_pma_clockout;
	wire  [0:0]  rx_pma_dataout;
	wire  [0:0]  rx_pma_locktorefout;
	wire  [19:0]  rx_pma_recoverdataout_wire;
	wire  [1799:0]  rx_pmadprioin_wire;
	wire  [1799:0]  rx_pmadprioout;
	wire [0:0]  rx_powerdown;
	wire  [5:0]  rx_powerdown_in;
	wire [0:0]  rx_prbscidenable;
	wire  [5:0]  rx_rxcruresetout;
	wire  [0:0]  rx_signaldetect_wire;
	wire  [1799:0]  rxpll_dprioin;
	wire  [5:0]  tx_analogreset_out;
	wire  [0:0]  tx_clkout_int_wire;
	wire  [0:0]  tx_core_clkout_wire;
	wire  [0:0]  tx_coreclk_in;
	wire  [39:0]  tx_datain_wire;
	wire  [19:0]  tx_dataout_pcs_to_pma;
	wire  [3:0]  tx_digitalreset_in;
	wire  [3:0]  tx_digitalreset_out;
	wire  [1199:0]  tx_dprioin_wire;
	wire [0:0]  tx_invpolarity;
	wire  [0:0]  tx_localrefclk;
	wire [0:0]  tx_phfiforeset;
	wire  [1799:0]  tx_pmadprioin_wire;
	wire  [1799:0]  tx_pmadprioout;
	wire  [0:0]  tx_serialloopbackout;
	wire  [599:0]  tx_txdprioout;
	wire  [0:0]  txdetectrxout;
	wire  [0:0]  w_cent_unit_dpriodisableout1w;

	stratixiv_hssi_calibration_block   cal_blk0
	( 
	.calibrationstatus(),
	.clk(cal_blk_clk),
	.enabletestbus(1'b1),
	.nonusertocmu(wire_cal_blk0_nonusertocmu),
	.powerdn(cal_blk_powerdown)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.testctrl(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	stratixiv_hssi_clock_divider   ch_clk_div0
	( 
	.analogfastrefclkout(wire_ch_clk_div0_analogfastrefclkout),
	.analogfastrefclkoutshifted(),
	.analogrefclkout(wire_ch_clk_div0_analogrefclkout),
	.analogrefclkoutshifted(),
	.analogrefclkpulse(wire_ch_clk_div0_analogrefclkpulse),
	.analogrefclkpulseshifted(),
	.clk0in(pll0_out[3:0]),
	.coreclkout(),
	.dpriodisable(w_cent_unit_dpriodisableout1w[0]),
	.dprioin(cent_unit_cmudividerdprioout[99:0]),
	.dprioout(wire_ch_clk_div0_dprioout),
	.quadreset(cent_unit_quadresetout[0]),
	.rateswitchbaseclock(),
	.rateswitchdone(),
	.rateswitchout(),
	.refclkout()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clk1in({4{1'b0}}),
	.powerdn(1'b0),
	.rateswitch(1'b0),
	.rateswitchbaseclkin({2{1'b0}}),
	.rateswitchdonein({2{1'b0}}),
	.refclkdig(1'b0),
	.refclkin({2{1'b0}}),
	.vcobypassin(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		ch_clk_div0.channel_num = ((starting_channel_number + 0) % 4),
		ch_clk_div0.divide_by = 5,
		ch_clk_div0.divider_type = "CHANNEL_REGULAR",
		ch_clk_div0.effective_data_rate = "10312.5 Mbps",
		ch_clk_div0.enable_dynamic_divider = "false",
		ch_clk_div0.enable_refclk_out = "false",
		ch_clk_div0.inclk_select = 0,
		ch_clk_div0.logical_channel_address = (starting_channel_number + 0),
		ch_clk_div0.pre_divide_by = 1,
		ch_clk_div0.select_local_rate_switch_done = "false",
		ch_clk_div0.sim_analogfastrefclkout_phase_shift = 0,
		ch_clk_div0.sim_analogrefclkout_phase_shift = 0,
		ch_clk_div0.sim_coreclkout_phase_shift = 0,
		ch_clk_div0.sim_refclkout_phase_shift = 0,
		ch_clk_div0.use_coreclk_out_post_divider = "false",
		ch_clk_div0.use_refclk_post_divider = "false",
		ch_clk_div0.use_vco_bypass = "false",
		ch_clk_div0.lpm_type = "stratixiv_hssi_clock_divider";
	stratixiv_hssi_cmu   cent_unit0
	( 
	.adet({4{1'b0}}),
	.alignstatus(),
	.autospdx4configsel(),
	.autospdx4rateswitchout(),
	.autospdx4spdchg(),
	.clkdivpowerdn(),
	.cmudividerdprioin({clk_div_cmudividerdprioin[599:0]}),
	.cmudividerdprioout(wire_cent_unit0_cmudividerdprioout),
	.cmuplldprioin(pll_cmuplldprioout[1799:0]),
	.cmuplldprioout(wire_cent_unit0_cmuplldprioout),
	.coreclkout(),
	.digitaltestout(),
	.dpclk(reconfig_clk),
	.dpriodisable(reconfig_togxb_disable),
	.dpriodisableout(wire_cent_unit0_dpriodisableout),
	.dprioin(reconfig_togxb_in),
	.dprioload(reconfig_togxb_load),
	.dpriooe(),
	.dprioout(wire_cent_unit0_dprioout),
	.enabledeskew(),
	.extra10gout(),
	.fiforesetrd(),
	.fixedclk({{5{1'b0}}, fixedclk_to_cmu[0]}),
	.lccmutestbus(),
	.nonuserfromcal(nonusertocmu_out[0]),
	.phfifiox4ptrsreset(),
	.pllpowerdn(wire_cent_unit0_pllpowerdn),
	.pllresetout(wire_cent_unit0_pllresetout),
	.quadreset(gxb_powerdown[0]),
	.quadresetout(wire_cent_unit0_quadresetout),
	.rdalign({4{1'b0}}),
	.rdenablesync(1'b0),
	.recovclk(1'b0),
	.refclkdividerdprioin({2{1'b0}}),
	.refclkdividerdprioout(),
	.refclkout(),
	.rxadcepowerdown(),
	.rxadceresetout(),
	.rxanalogreset({{2{1'b0}}, rx_analogreset_in[3:0]}),
	.rxanalogresetout(wire_cent_unit0_rxanalogresetout),
	.rxcrupowerdown(wire_cent_unit0_rxcrupowerdown),
	.rxcruresetout(wire_cent_unit0_rxcruresetout),
	.rxctrl({4{1'b0}}),
	.rxctrlout(),
	.rxdatain({32{1'b0}}),
	.rxdataout(),
	.rxdatavalid({4{1'b0}}),
	.rxdigitalreset({rx_digitalreset_in[3:0]}),
	.rxdigitalresetout(wire_cent_unit0_rxdigitalresetout),
	.rxibpowerdown(wire_cent_unit0_rxibpowerdown),
	.rxpcsdprioin({cent_unit_rxpcsdprioin[1599:0]}),
	.rxpcsdprioout(wire_cent_unit0_rxpcsdprioout),
	.rxphfifox4byteselout(),
	.rxphfifox4rdenableout(),
	.rxphfifox4wrclkout(),
	.rxphfifox4wrenableout(),
	.rxpmadprioin({cent_unit_rxpmadprioin[1799:0]}),
	.rxpmadprioout(wire_cent_unit0_rxpmadprioout),
	.rxpowerdown({{2{1'b0}}, rx_powerdown_in[3:0]}),
	.rxrunningdisp({4{1'b0}}),
	.scanout(),
	.syncstatus({4{1'b0}}),
	.testout(),
	.txanalogresetout(wire_cent_unit0_txanalogresetout),
	.txctrl({4{1'b0}}),
	.txctrlout(wire_cent_unit0_txctrlout),
	.txdatain({32{1'b0}}),
	.txdataout(wire_cent_unit0_txdataout),
	.txdetectrxpowerdown(wire_cent_unit0_txdetectrxpowerdown),
	.txdigitalreset({tx_digitalreset_in[3:0]}),
	.txdigitalresetout(wire_cent_unit0_txdigitalresetout),
	.txdividerpowerdown(),
	.txobpowerdown(wire_cent_unit0_txobpowerdown),
	.txpcsdprioin({cent_unit_tx_dprioin[599:0]}),
	.txpcsdprioout(wire_cent_unit0_txpcsdprioout),
	.txphfifox4byteselout(),
	.txphfifox4rdclkout(),
	.txphfifox4rdenableout(),
	.txphfifox4wrenableout(),
	.txpllreset({{1{1'b0}}, pll_powerdown[0]}),
	.txpmadprioin({cent_unit_txpmadprioin[1799:0]}),
	.txpmadprioout(wire_cent_unit0_txpmadprioout)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.extra10gin({7{1'b0}}),
	.lccmurtestbussel({3{1'b0}}),
	.pmacramtest(1'b0),
	.rateswitch(1'b0),
	.rateswitchdonein(1'b0),
	.refclkdig(1'b0),
	.rxclk(1'b0),
	.rxcoreclk(1'b0),
	.rxphfifordenable(1'b1),
	.rxphfiforeset(1'b0),
	.rxphfifowrdisable(1'b0),
	.scanclk(1'b0),
	.scanin({23{1'b0}}),
	.scanmode(1'b0),
	.scanshift(1'b0),
	.testin({10000{1'b0}}),
	.txclk(1'b0),
	.txcoreclk(1'b0),
	.txphfiforddisable(1'b0),
	.txphfiforeset(1'b0),
	.txphfifowrenable(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		cent_unit0.auto_spd_deassert_ph_fifo_rst_count = 8,
		cent_unit0.auto_spd_phystatus_notify_count = 14,
		cent_unit0.bonded_quad_mode = "none",
		cent_unit0.devaddr = ((((starting_channel_number / 4) + 0) % 32) + 1),
		cent_unit0.in_xaui_mode = "false",
		cent_unit0.offset_all_errors_align = "false",
		cent_unit0.pipe_auto_speed_nego_enable = "false",
		cent_unit0.pipe_freq_scale_mode = "Frequency",
		cent_unit0.pma_done_count = 249950,
		cent_unit0.portaddr = (((starting_channel_number + 0) / 128) + 1),
		cent_unit0.rx0_auto_spd_self_switch_enable = "false",
		cent_unit0.rx0_channel_bonding = "none",
		cent_unit0.rx0_clk1_mux_select = "recovered clock",
		cent_unit0.rx0_clk2_mux_select = "recovered clock",
		cent_unit0.rx0_ph_fifo_reg_mode = "false",
		cent_unit0.rx0_rd_clk_mux_select = "core clock",
		cent_unit0.rx0_recovered_clk_mux_select = "recovered clock",
		cent_unit0.rx0_reset_clock_output_during_digital_reset = "false",
		cent_unit0.rx0_use_double_data_mode = "true",
		cent_unit0.tx0_auto_spd_self_switch_enable = "false",
		cent_unit0.tx0_channel_bonding = "none",
		cent_unit0.tx0_ph_fifo_reg_mode = "false",
		cent_unit0.tx0_rd_clk_mux_select = "cmu_clock_divider",
		cent_unit0.tx0_use_double_data_mode = "true",
		cent_unit0.tx0_wr_clk_mux_select = "core_clk",
		cent_unit0.use_deskew_fifo = "false",
		cent_unit0.vcceh_voltage = "Auto",
		cent_unit0.lpm_type = "stratixiv_hssi_cmu";
	stratixiv_hssi_pll   rx_cdr_pll0
	( 
	.areset(rx_rxcruresetout[0]),
	.clk(wire_rx_cdr_pll0_clk),
	.datain(rx_pma_dataout[0]),
	.dataout(wire_rx_cdr_pll0_dataout),
	.dpriodisable(w_cent_unit_dpriodisableout1w[0]),
	.dprioin(rxpll_dprioin[299:0]),
	.dprioout(wire_rx_cdr_pll0_dprioout),
	.freqlocked(wire_rx_cdr_pll0_freqlocked),
	.inclk({rx_cruclk_in[9:0]}),
	.locked(wire_rx_cdr_pll0_locked),
	.locktorefclk(rx_pma_locktorefout[0]),
	.pfdfbclkout(),
	.pfdrefclkout(wire_rx_cdr_pll0_pfdrefclkout),
	.powerdown(cent_unit_rxcrupowerdn[0]),
	.vcobypassout()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.earlyeios(1'b0),
	.extra10gin({6{1'b0}}),
	.pfdfbclk(1'b0),
	.rateswitch(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		rx_cdr_pll0.bandwidth_type = "Auto",
		rx_cdr_pll0.channel_num = ((starting_channel_number + 0) % 4),
		rx_cdr_pll0.dprio_config_mode = 8'h00,
		rx_cdr_pll0.effective_data_rate = "10312.5 Mbps",
		rx_cdr_pll0.enable_dynamic_divider = "false",
		rx_cdr_pll0.fast_lock_control = "false",
		rx_cdr_pll0.input_clock_frequency = "644.53125 MHz",
		rx_cdr_pll0.m = 0,
		rx_cdr_pll0.n = 1,
		rx_cdr_pll0.pfd_clk_select = 0,
		rx_cdr_pll0.pll_type = "RX CDR",
		rx_cdr_pll0.use_refclk_pin = "false",
		rx_cdr_pll0.vco_post_scale = 1,
		rx_cdr_pll0.lpm_type = "stratixiv_hssi_pll";
	stratixiv_hssi_pll   tx_pll0
	( 
	.areset(pllreset_in[0]),
	.clk(wire_tx_pll0_clk),
	.dataout(),
	.dpriodisable(w_cent_unit_dpriodisableout1w[0]),
	.dprioin(pll0_dprioin[299:0]),
	.dprioout(wire_tx_pll0_dprioout),
	.freqlocked(),
	.inclk({pll0_clkin[9:0]}),
	.locked(wire_tx_pll0_locked),
	.pfdfbclkout(),
	.pfdrefclkout(),
	.powerdown(pllpowerdn_in[0]),
	.vcobypassout()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.datain(1'b0),
	.earlyeios(1'b0),
	.extra10gin({6{1'b0}}),
	.locktorefclk(1'b1),
	.pfdfbclk(1'b0),
	.rateswitch(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		tx_pll0.bandwidth_type = "Auto",
		tx_pll0.channel_num = 4,
		tx_pll0.dprio_config_mode = 8'h00,
		tx_pll0.inclk0_input_period = 3496503,
		tx_pll0.input_clock_frequency = "644.53125 MHz",
		tx_pll0.logical_tx_pll_number = 0,
		tx_pll0.m = 0,
		tx_pll0.n = 1,
		tx_pll0.pfd_clk_select = 0,
		tx_pll0.pfd_fb_select = "internal",
		tx_pll0.pll_type = "CMU",
		tx_pll0.use_refclk_pin = "false",
		tx_pll0.vco_post_scale = 1,
		tx_pll0.lpm_type = "stratixiv_hssi_pll";
	stratixiv_hssi_rx_pcs   receive_pcs0
	( 
	.a1a2size(1'b0),
	.a1a2sizeout(),
	.a1detect(),
	.a2detect(),
	.adetectdeskew(),
	.alignstatus(1'b0),
	.alignstatussync(1'b0),
	.alignstatussyncout(),
	.autospdrateswitchout(),
	.autospdspdchgout(),
	.bistdone(),
	.bisterr(),
	.bitslipboundaryselectout(),
	.byteorderalignstatus(),
	.cdrctrlearlyeios(),
	.cdrctrllocktorefcl((reconfig_togxb_busy | rx_locktorefclk[0])),
	.cdrctrllocktorefclkout(wire_receive_pcs0_cdrctrllocktorefclkout),
	.clkout(wire_receive_pcs0_clkout),
	.coreclk(rx_coreclk_in[0]),
	.coreclkout(),
	.ctrldetect(),
	.datain(rx_pma_recoverdataout_wire[19:0]),
	.dataout(wire_receive_pcs0_dataout),
	.dataoutfull(),
	.digitalreset(rx_digitalreset_out[0]),
	.digitaltestout(),
	.disablefifordin(1'b0),
	.disablefifordout(),
	.disablefifowrin(1'b0),
	.disablefifowrout(),
	.disperr(),
	.dpriodisable(w_cent_unit_dpriodisableout1w[0]),
	.dprioin(rx_pcsdprioin_wire[399:0]),
	.dprioout(wire_receive_pcs0_dprioout),
	.enabledeskew(1'b0),
	.enabyteord(1'b0),
	.enapatternalign(rx_enapatternalign[0]),
	.errdetect(),
	.fifordin(1'b0),
	.fifordout(),
	.fiforesetrd(1'b0),
	.hipdataout(),
	.hipdatavalid(),
	.hipelecidle(),
	.hipphydonestatus(),
	.hipstatus(),
	.invpol(1'b0),
	.iqpphfifobyteselout(),
	.iqpphfifoptrsresetout(),
	.iqpphfifordenableout(),
	.iqpphfifowrclkout(),
	.iqpphfifowrenableout(),
	.k1detect(),
	.k2detect(),
	.localrefclk(1'b0),
	.masterclk(1'b0),
	.parallelfdbk({20{1'b0}}),
	.patterndetect(),
	.phfifobyteselout(),
	.phfifobyteserdisableout(),
	.phfifooverflow(),
	.phfifoptrsresetout(),
	.phfifordenable(rx_phfifordenable[0]),
	.phfifordenableout(),
	.phfiforeset(rx_phfiforeset[0]),
	.phfiforesetout(),
	.phfifounderflow(),
	.phfifowrclkout(),
	.phfifowrdisable(rx_phfifowrdisable[0]),
	.phfifowrdisableout(),
	.phfifowrenableout(),
	.pipebufferstat(),
	.pipedatavalid(),
	.pipeelecidle(),
	.pipephydonestatus(),
	.pipepowerdown({2{1'b0}}),
	.pipepowerstate({4{1'b0}}),
	.pipestatetransdoneout(),
	.pipestatus(),
	.prbscidenable(rx_prbscidenable[0]),
	.quadreset(cent_unit_quadresetout[0]),
	.rateswitchout(),
	.rdalign(),
	.recoveredclk(rx_pma_clockout[0]),
	.revbitorderwa(1'b0),
	.revbyteorderwa(1'b0),
	.revparallelfdbkdata(),
	.rlv(),
	.rmfifoalmostempty(),
	.rmfifoalmostfull(),
	.rmfifodatadeleted(),
	.rmfifodatainserted(),
	.rmfifoempty(),
	.rmfifofull(),
	.rmfifordena(1'b0),
	.rmfiforeset(1'b0),
	.rmfifowrena(1'b0),
	.runningdisp(),
	.rxdetectvalid(1'b0),
	.rxfound({2{1'b0}}),
	.signaldetect(wire_receive_pcs0_signaldetect),
	.signaldetected(rx_signaldetect_wire[0]),
	.syncstatus(),
	.syncstatusdeskew(),
	.xauidelcondmetout(),
	.xauififoovrout(),
	.xauiinsertincompleteout(),
	.xauilatencycompout(),
	.xgmctrldet(),
	.xgmctrlin(1'b0),
	.xgmdatain({8{1'b0}}),
	.xgmdataout(),
	.xgmdatavalid(),
	.xgmrunningdisp()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.autospdxnconfigsel({3{1'b0}}),
	.autospdxnspdchg({3{1'b0}}),
	.bitslip(1'b0),
	.elecidleinfersel({3{1'b0}}),
	.grayelecidleinferselfromtx({3{1'b0}}),
	.hip8b10binvpolarity(1'b0),
	.hipelecidleinfersel({3{1'b0}}),
	.hippowerdown({2{1'b0}}),
	.hiprateswitch(1'b0),
	.iqpautospdxnspgchg({2{1'b0}}),
	.iqpphfifoxnbytesel({2{1'b0}}),
	.iqpphfifoxnptrsreset({2{1'b0}}),
	.iqpphfifoxnrdenable({2{1'b0}}),
	.iqpphfifoxnwrclk({2{1'b0}}),
	.iqpphfifoxnwrenable({2{1'b0}}),
	.phfifox4bytesel(1'b0),
	.phfifox4rdenable(1'b0),
	.phfifox4wrclk(1'b0),
	.phfifox4wrenable(1'b0),
	.phfifox8bytesel(1'b0),
	.phfifox8rdenable(1'b0),
	.phfifox8wrclk(1'b0),
	.phfifox8wrenable(1'b0),
	.phfifoxnbytesel({3{1'b0}}),
	.phfifoxnptrsreset({3{1'b0}}),
	.phfifoxnrdenable({3{1'b0}}),
	.phfifoxnwrclk({3{1'b0}}),
	.phfifoxnwrenable({3{1'b0}}),
	.pipe8b10binvpolarity(1'b0),
	.pipeenrevparallellpbkfromtx(1'b0),
	.pmatestbusin({8{1'b0}}),
	.powerdn({2{1'b0}}),
	.ppmdetectdividedclk(1'b0),
	.ppmdetectrefclk(1'b0),
	.rateswitch(1'b0),
	.rateswitchisdone(1'b0),
	.rateswitchxndone(1'b0),
	.refclk(1'b0),
	.rxelecidlerateswitch(1'b0),
	.wareset(1'b0),
	.xauidelcondmet(1'b0),
	.xauififoovr(1'b0),
	.xauiinsertincomplete(1'b0),
	.xauilatencycomp(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		receive_pcs0.align_pattern = "0000000000",
		receive_pcs0.align_pattern_length = 10,
		receive_pcs0.align_to_deskew_pattern_pos_disp_only = "false",
		receive_pcs0.allow_align_polarity_inversion = "false",
		receive_pcs0.allow_pipe_polarity_inversion = "false",
		receive_pcs0.auto_spd_deassert_ph_fifo_rst_count = 8,
		receive_pcs0.auto_spd_phystatus_notify_count = 14,
		receive_pcs0.auto_spd_self_switch_enable = "false",
		receive_pcs0.bit_slip_enable = "true",
		receive_pcs0.byte_order_mode = "none",
		receive_pcs0.byte_order_pad_pattern = "0",
		receive_pcs0.byte_order_pattern = "0",
		receive_pcs0.byte_order_pld_ctrl_enable = "false",
		receive_pcs0.cdrctrl_bypass_ppm_detector_cycle = 1000,
		receive_pcs0.cdrctrl_enable = "false",
		receive_pcs0.cdrctrl_rxvalid_mask = "false",
		receive_pcs0.channel_bonding = "none",
		receive_pcs0.channel_number = ((starting_channel_number + 0) % 4),
		receive_pcs0.channel_width = 40,
		receive_pcs0.clk1_mux_select = "recovered clock",
		receive_pcs0.clk2_mux_select = "recovered clock",
		receive_pcs0.core_clock_0ppm = "false",
		receive_pcs0.datapath_low_latency_mode = "true",
		receive_pcs0.datapath_protocol = "basic",
		receive_pcs0.dec_8b_10b_compatibility_mode = "true",
		receive_pcs0.dec_8b_10b_mode = "none",
		receive_pcs0.dec_8b_10b_polarity_inv_enable = "false",
		receive_pcs0.deskew_pattern = "0",
		receive_pcs0.disable_auto_idle_insertion = "true",
		receive_pcs0.disable_running_disp_in_word_align = "false",
		receive_pcs0.disallow_kchar_after_pattern_ordered_set = "false",
		receive_pcs0.dprio_config_mode = 8'h01,
		receive_pcs0.elec_idle_infer_enable = "false",
		receive_pcs0.elec_idle_num_com_detect = 0,
		receive_pcs0.enable_bit_reversal = "false",
		receive_pcs0.enable_deep_align = "true",
		receive_pcs0.enable_deep_align_byte_swap = "false",
		receive_pcs0.enable_self_test_mode = "false",
		receive_pcs0.enable_true_complement_match_in_word_align = "true",
		receive_pcs0.force_signal_detect_dig = "true",
		receive_pcs0.hip_enable = "false",
		receive_pcs0.infiniband_invalid_code = 0,
		receive_pcs0.insert_pad_on_underflow = "false",
		receive_pcs0.logical_channel_address = (starting_channel_number + 0),
		receive_pcs0.num_align_code_groups_in_ordered_set = 0,
		receive_pcs0.num_align_cons_good_data = 1,
		receive_pcs0.num_align_cons_pat = 1,
		receive_pcs0.num_align_loss_sync_error = 1,
		receive_pcs0.ph_fifo_low_latency_enable = "true",
		receive_pcs0.ph_fifo_reg_mode = "false",
		receive_pcs0.ph_fifo_xn_mapping0 = "none",
		receive_pcs0.ph_fifo_xn_mapping1 = "none",
		receive_pcs0.ph_fifo_xn_mapping2 = "none",
		receive_pcs0.ph_fifo_xn_select = 1,
		receive_pcs0.pipe_auto_speed_nego_enable = "false",
		receive_pcs0.pipe_freq_scale_mode = "Frequency",
		receive_pcs0.pma_done_count = 249950,
		receive_pcs0.protocol_hint = "basic",
		receive_pcs0.rate_match_almost_empty_threshold = 11,
		receive_pcs0.rate_match_almost_full_threshold = 13,
		receive_pcs0.rate_match_back_to_back = "true",
		receive_pcs0.rate_match_delete_threshold = 13,
		receive_pcs0.rate_match_empty_threshold = 5,
		receive_pcs0.rate_match_fifo_mode = "false",
		receive_pcs0.rate_match_full_threshold = 20,
		receive_pcs0.rate_match_insert_threshold = 11,
		receive_pcs0.rate_match_ordered_set_based = "false",
		receive_pcs0.rate_match_pattern1 = "0",
		receive_pcs0.rate_match_pattern2 = "0",
		receive_pcs0.rate_match_pattern_size = 10,
		receive_pcs0.rate_match_reset_enable = "false",
		receive_pcs0.rate_match_skip_set_based = "false",
		receive_pcs0.rate_match_start_threshold = 7,
		receive_pcs0.rd_clk_mux_select = "core clock",
		receive_pcs0.recovered_clk_mux_select = "recovered clock",
		receive_pcs0.run_length = 40,
		receive_pcs0.run_length_enable = "true",
		receive_pcs0.rx_detect_bypass = "false",
		receive_pcs0.rx_phfifo_wait_cnt = 0,
		receive_pcs0.rxstatus_error_report_mode = 1,
		receive_pcs0.self_test_mode = "incremental",
		receive_pcs0.use_alignment_state_machine = "true",
		receive_pcs0.use_deserializer_double_data_mode = "true",
		receive_pcs0.use_deskew_fifo = "false",
		receive_pcs0.use_double_data_mode = "true",
		receive_pcs0.use_parallel_loopback = "false",
		receive_pcs0.use_rising_edge_triggered_pattern_align = "true",
		receive_pcs0.lpm_type = "stratixiv_hssi_rx_pcs";
	stratixiv_hssi_rx_pma   receive_pma0
	( 
	.adaptdone(),
	.analogtestbus(wire_receive_pma0_analogtestbus),
	.clockout(wire_receive_pma0_clockout),
	.datain(rx_datain[0]),
	.dataout(wire_receive_pma0_dataout),
	.dataoutfull(),
	.datastrobeout(),
	.deserclock(rx_deserclock_in[3:0]),
	.diagnosticlpbkout(),
	.dpriodisable(w_cent_unit_dpriodisableout1w[0]),
	.dprioin(rx_pmadprioin_wire[299:0]),
	.dprioout(wire_receive_pma0_dprioout),
	.freqlock(1'b0),
	.freqlocked(),
	.ignorephslck(1'b0),
	.locktodata(rx_locktodata_wire[0]),
	.locktoref(rx_locktorefclk_wire[0]),
	.locktorefout(wire_receive_pma0_locktorefout),
	.offsetcancellationen(1'b0),
	.plllocked(rx_plllocked_wire[0]),
	.powerdn(cent_unit_rxibpowerdn[0]),
	.ppmdetectclkrel(),
	.ppmdetectrefclk(rx_pll_pfdrefclkout_wire[0]),
	.recoverdatain(pll_ch_dataout_wire[1:0]),
	.recoverdataout(wire_receive_pma0_recoverdataout),
	.reverselpbkout(),
	.revserialfdbkout(),
	.rxpmareset(rx_analogreset_out[0]),
	.seriallpbken(rx_seriallpbken[0]),
	.seriallpbkin(tx_serialloopbackout[0]),
	.signaldetect(wire_receive_pma0_signaldetect),
	.testbussel(4'b0110)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.adaptcapture(1'b0),
	.adcepowerdn(1'b0),
	.adcereset(1'b0),
	.adcestandby(1'b0),
	.crupowerdn(1'b0),
	.dpashift(1'b0),
	.extra10gin({38{1'b0}}),
	.ppmdetectdividedclk(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		receive_pma0.adaptive_equalization_mode = "none",
		receive_pma0.allow_serial_loopback = "true",
		receive_pma0.channel_number = ((starting_channel_number + 0) % 4),
		receive_pma0.channel_type = "auto",
		receive_pma0.common_mode = "0.82V",
		receive_pma0.deserialization_factor = 20,
		receive_pma0.dprio_config_mode = 8'h01,
		receive_pma0.enable_ltd = "true",
		receive_pma0.enable_ltr = "true",
		receive_pma0.eq_dc_gain = 0,
		receive_pma0.eqa_ctrl = 0,
		receive_pma0.eqb_ctrl = 0,
		receive_pma0.eqc_ctrl = 0,
		receive_pma0.eqd_ctrl = 0,
		receive_pma0.eqv_ctrl = 0,
		receive_pma0.eyemon_bandwidth = 0,
		receive_pma0.force_signal_detect = "true",
		receive_pma0.logical_channel_address = (starting_channel_number + 0),
		receive_pma0.low_speed_test_select = 0,
		receive_pma0.offset_cancellation = 1,
		receive_pma0.ppmselect = 32,
		receive_pma0.protocol_hint = "basic",
		receive_pma0.send_direct_reverse_serial_loopback = "None",
		receive_pma0.signal_detect_hysteresis = 2,
		receive_pma0.signal_detect_hysteresis_valid_threshold = 0,
		receive_pma0.signal_detect_loss_threshold = 0,
		receive_pma0.termination = "OCT 100 Ohms",
		receive_pma0.use_deser_double_data_width = "true",
		receive_pma0.use_external_termination = "false",
		receive_pma0.use_pma_direct = "false",
		receive_pma0.lpm_type = "stratixiv_hssi_rx_pma";
	stratixiv_hssi_tx_pcs   transmit_pcs0
	( 
	.clkout(wire_transmit_pcs0_clkout),
	.coreclk(tx_coreclk_in[0]),
	.coreclkout(),
	.ctrlenable({{4{1'b0}}}),
	.datain({tx_datain_wire[39:0]}),
	.datainfull({44{1'b0}}),
	.dataout(wire_transmit_pcs0_dataout),
	.detectrxloop(1'b0),
	.digitalreset(tx_digitalreset_out[0]),
	.dispval({{4{1'b0}}}),
	.dpriodisable(w_cent_unit_dpriodisableout1w[0]),
	.dprioin(tx_dprioin_wire[149:0]),
	.dprioout(wire_transmit_pcs0_dprioout),
	.enrevparallellpbk(1'b0),
	.forcedisp({{4{1'b0}}}),
	.forcedispcompliance(1'b0),
	.forceelecidleout(wire_transmit_pcs0_forceelecidleout),
	.grayelecidleinferselout(),
	.hiptxclkout(),
	.invpol(tx_invpolarity[0]),
	.iqpphfifobyteselout(),
	.iqpphfifordclkout(),
	.iqpphfifordenableout(),
	.iqpphfifowrenableout(),
	.localrefclk(tx_localrefclk[0]),
	.parallelfdbkout(),
	.phfifobyteselout(),
	.phfifooverflow(),
	.phfifordclkout(),
	.phfiforddisable(1'b0),
	.phfiforddisableout(),
	.phfifordenableout(),
	.phfiforeset(tx_phfiforeset[0]),
	.phfiforesetout(),
	.phfifounderflow(),
	.phfifowrenable(1'b1),
	.phfifowrenableout(),
	.pipeenrevparallellpbkout(),
	.pipepowerdownout(),
	.pipepowerstateout(),
	.pipestatetransdone(1'b0),
	.powerdn({2{1'b0}}),
	.quadreset(cent_unit_quadresetout[0]),
	.rateswitchout(),
	.rdenablesync(),
	.revparallelfdbk({20{1'b0}}),
	.txdetectrx(wire_transmit_pcs0_txdetectrx),
	.xgmctrl(cent_unit_txctrlout[0]),
	.xgmctrlenable(),
	.xgmdatain(cent_unit_tx_xgmdataout[7:0]),
	.xgmdataout()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.bitslipboundaryselect({5{1'b0}}),
	.elecidleinfersel({3{1'b0}}),
	.forceelecidle(1'b0),
	.freezptr(1'b0),
	.hipdatain({10{1'b0}}),
	.hipdetectrxloop(1'b0),
	.hipelecidleinfersel({3{1'b0}}),
	.hipforceelecidle(1'b0),
	.hippowerdn({2{1'b0}}),
	.hiptxdeemph(1'b0),
	.hiptxmargin({3{1'b0}}),
	.iqpphfifoxnbytesel({2{1'b0}}),
	.iqpphfifoxnrdclk({2{1'b0}}),
	.iqpphfifoxnrdenable({2{1'b0}}),
	.iqpphfifoxnwrenable({2{1'b0}}),
	.phfifobyteserdisable(1'b0),
	.phfifoptrsreset(1'b0),
	.phfifox4bytesel(1'b0),
	.phfifox4rdclk(1'b0),
	.phfifox4rdenable(1'b0),
	.phfifox4wrenable(1'b0),
	.phfifoxnbottombytesel(1'b0),
	.phfifoxnbottomrdclk(1'b0),
	.phfifoxnbottomrdenable(1'b0),
	.phfifoxnbottomwrenable(1'b0),
	.phfifoxnbytesel({3{1'b0}}),
	.phfifoxnptrsreset({3{1'b0}}),
	.phfifoxnrdclk({3{1'b0}}),
	.phfifoxnrdenable({3{1'b0}}),
	.phfifoxntopbytesel(1'b0),
	.phfifoxntoprdclk(1'b0),
	.phfifoxntoprdenable(1'b0),
	.phfifoxntopwrenable(1'b0),
	.phfifoxnwrenable({3{1'b0}}),
	.pipetxdeemph(1'b0),
	.pipetxmargin({3{1'b0}}),
	.pipetxswing(1'b0),
	.prbscidenable(1'b0),
	.rateswitch(1'b0),
	.rateswitchisdone(1'b0),
	.rateswitchxndone(1'b0),
	.refclk(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		transmit_pcs0.allow_polarity_inversion = "false",
		transmit_pcs0.auto_spd_self_switch_enable = "false",
		transmit_pcs0.bitslip_enable = "false",
		transmit_pcs0.channel_bonding = "none",
		transmit_pcs0.channel_number = ((starting_channel_number + 0) % 4),
		transmit_pcs0.channel_width = 40,
		transmit_pcs0.core_clock_0ppm = "false",
		transmit_pcs0.datapath_low_latency_mode = "true",
		transmit_pcs0.datapath_protocol = "basic",
		transmit_pcs0.disable_ph_low_latency_mode = "false",
		transmit_pcs0.disparity_mode = "none",
		transmit_pcs0.dprio_config_mode = 8'h01,
		transmit_pcs0.elec_idle_delay = 3,
		transmit_pcs0.enable_bit_reversal = "false",
		transmit_pcs0.enable_idle_selection = "false",
		transmit_pcs0.enable_reverse_parallel_loopback = "false",
		transmit_pcs0.enable_self_test_mode = "false",
		transmit_pcs0.enable_symbol_swap = "false",
		transmit_pcs0.enc_8b_10b_compatibility_mode = "true",
		transmit_pcs0.enc_8b_10b_mode = "none",
		transmit_pcs0.force_echar = "false",
		transmit_pcs0.force_kchar = "false",
		transmit_pcs0.hip_enable = "false",
		transmit_pcs0.logical_channel_address = (starting_channel_number + 0),
		transmit_pcs0.ph_fifo_reg_mode = "false",
		transmit_pcs0.ph_fifo_xn_mapping0 = "none",
		transmit_pcs0.ph_fifo_xn_mapping1 = "none",
		transmit_pcs0.ph_fifo_xn_mapping2 = "none",
		transmit_pcs0.ph_fifo_xn_select = 1,
		transmit_pcs0.pipe_auto_speed_nego_enable = "false",
		transmit_pcs0.pipe_freq_scale_mode = "Frequency",
		transmit_pcs0.prbs_cid_pattern = "false",
		transmit_pcs0.protocol_hint = "basic",
		transmit_pcs0.refclk_select = "local",
		transmit_pcs0.self_test_mode = "incremental",
		transmit_pcs0.use_double_data_mode = "true",
		transmit_pcs0.use_serializer_double_data_mode = "true",
		transmit_pcs0.wr_clk_mux_select = "core_clk",
		transmit_pcs0.lpm_type = "stratixiv_hssi_tx_pcs";
	stratixiv_hssi_tx_pma   transmit_pma0
	( 
	.clockout(wire_transmit_pma0_clockout),
	.datain({{44{1'b0}}, tx_dataout_pcs_to_pma[19:0]}),
	.dataout(wire_transmit_pma0_dataout),
	.detectrxpowerdown(cent_unit_txdetectrxpowerdn[0]),
	.dftout(),
	.dpriodisable(w_cent_unit_dpriodisableout1w[0]),
	.dprioin(tx_pmadprioin_wire[299:0]),
	.dprioout(wire_transmit_pma0_dprioout),
	.fastrefclk0in(analogfastrefclkout[1:0]),
	.fastrefclk1in({2{1'b0}}),
	.fastrefclk2in({2{1'b0}}),
	.fastrefclk4in({2{1'b0}}),
	.forceelecidle(1'b0),
	.powerdn(cent_unit_txobpowerdn[0]),
	.refclk0in({analogrefclkout[1:0]}),
	.refclk0inpulse(analogrefclkpulse[0]),
	.refclk1in({2{1'b0}}),
	.refclk1inpulse(1'b0),
	.refclk2in({2{1'b0}}),
	.refclk2inpulse(1'b0),
	.refclk4in({2{1'b0}}),
	.refclk4inpulse(1'b0),
	.revserialfdbk(1'b0),
	.rxdetecten(txdetectrxout[0]),
	.rxdetectvalidout(),
	.rxfoundout(),
	.seriallpbkout(wire_transmit_pma0_seriallpbkout),
	.txpmareset(tx_analogreset_out[0])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.cgbpowerdn(1'b0),
	.datainfull({20{1'b0}}),
	.diagnosticlpbkin(1'b0),
	.extra10gin({11{1'b0}}),
	.fastrefclk3in({2{1'b0}}),
	.pclk({5{1'b0}}),
	.refclk3in({2{1'b0}}),
	.refclk3inpulse(1'b0),
	.reverselpbkin(1'b0),
	.rxdetectclk(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		transmit_pma0.analog_power = "auto",
		transmit_pma0.channel_number = ((starting_channel_number + 0) % 4),
		transmit_pma0.channel_type = "auto",
		transmit_pma0.clkin_select = 0,
		transmit_pma0.clkmux_delay = "false",
		transmit_pma0.common_mode = "0.65V",
		transmit_pma0.dprio_config_mode = 8'h01,
		transmit_pma0.enable_reverse_serial_loopback = "false",
		transmit_pma0.logical_channel_address = (starting_channel_number + 0),
		transmit_pma0.logical_protocol_hint_0 = "basic",
		transmit_pma0.low_speed_test_select = 0,
		transmit_pma0.physical_clkin0_mapping = "x1",
		transmit_pma0.preemp_pretap = 0,
		transmit_pma0.preemp_pretap_inv = "false",
		transmit_pma0.preemp_tap_1 = 29,
		transmit_pma0.preemp_tap_2 = 0,
		transmit_pma0.preemp_tap_2_inv = "false",
		transmit_pma0.protocol_hint = "basic",
		transmit_pma0.rx_detect = 0,
		transmit_pma0.serialization_factor = 20,
		transmit_pma0.slew_rate = "off",
		transmit_pma0.termination = "OCT 100 Ohms",
		transmit_pma0.use_external_termination = "false",
		transmit_pma0.use_pma_direct = "false",
		transmit_pma0.use_ser_double_data_mode = "true",
		transmit_pma0.vod_selection = 7,
		transmit_pma0.lpm_type = "stratixiv_hssi_tx_pma";
	assign
		analogfastrefclkout = {wire_ch_clk_div0_analogfastrefclkout},
		analogrefclkout = {wire_ch_clk_div0_analogrefclkout},
		analogrefclkpulse = {wire_ch_clk_div0_analogrefclkpulse},
		cent_unit_cmudividerdprioout = {wire_cent_unit0_cmudividerdprioout},
		cent_unit_cmuplldprioout = {wire_cent_unit0_cmuplldprioout},
		cent_unit_pllpowerdn = {wire_cent_unit0_pllpowerdn[1:0]},
		cent_unit_pllresetout = {wire_cent_unit0_pllresetout[1:0]},
		cent_unit_quadresetout = {wire_cent_unit0_quadresetout},
		cent_unit_rxcrupowerdn = {wire_cent_unit0_rxcrupowerdown[5:0]},
		cent_unit_rxibpowerdn = {wire_cent_unit0_rxibpowerdown[5:0]},
		cent_unit_rxpcsdprioin = {{1200{1'b0}}, rx_pcsdprioout[399:0]},
		cent_unit_rxpcsdprioout = {wire_cent_unit0_rxpcsdprioout[1599:0]},
		cent_unit_rxpmadprioin = {{1500{1'b0}}, rx_pmadprioout[299:0]},
		cent_unit_rxpmadprioout = {wire_cent_unit0_rxpmadprioout[1799:0]},
		cent_unit_tx_dprioin = {{1050{1'b0}}, tx_txdprioout[149:0]},
		cent_unit_tx_xgmdataout = {wire_cent_unit0_txdataout[31:0]},
		cent_unit_txctrlout = {wire_cent_unit0_txctrlout},
		cent_unit_txdetectrxpowerdn = {wire_cent_unit0_txdetectrxpowerdown[5:0]},
		cent_unit_txdprioout = {wire_cent_unit0_txpcsdprioout[599:0]},
		cent_unit_txobpowerdn = {wire_cent_unit0_txobpowerdown[5:0]},
		cent_unit_txpmadprioin = {{1500{1'b0}}, tx_pmadprioout[299:0]},
		cent_unit_txpmadprioout = {wire_cent_unit0_txpmadprioout[1799:0]},
		clk_div_cmudividerdprioin = {{500{1'b0}}, wire_ch_clk_div0_dprioout},
		fixedclk_to_cmu = {6{reconfig_clk}},
		nonusertocmu_out = {wire_cal_blk0_nonusertocmu},
		pll0_clkin = {{9{1'b0}}, pll_inclk_wire[0]},
		pll0_dprioin = {cent_unit_cmuplldprioout[1499:1200]},
		pll0_dprioout = {wire_tx_pll0_dprioout},
		pll0_out = {wire_tx_pll0_clk[3:0]},
		pll_ch_dataout_wire = {wire_rx_cdr_pll0_dataout},
		pll_ch_dprioout = {wire_rx_cdr_pll0_dprioout},
		pll_cmuplldprioout = {{300{1'b0}}, pll0_dprioout[299:0], {900{1'b0}}, pll_ch_dprioout[299:0]},
		pll_inclk_wire = {pll_inclk},
		pll_locked = {pll_locked_out[0]},
		pll_locked_out = {wire_tx_pll0_locked},
		pllpowerdn_in = {1'b0, cent_unit_pllpowerdn[0]},
		pllreset_in = {1'b0, cent_unit_pllresetout[0]},
		reconfig_fromgxb = {rx_pma_analogtestbus[16:1], wire_cent_unit0_dprioout},
		reconfig_togxb_busy = reconfig_togxb[3],
		reconfig_togxb_disable = reconfig_togxb[1],
		reconfig_togxb_in = reconfig_togxb[0],
		reconfig_togxb_load = reconfig_togxb[2],
		rx_analogreset_in = {{5{1'b0}}, ((~ reconfig_togxb_busy) & rx_analogreset[0])},
		rx_analogreset_out = {wire_cent_unit0_rxanalogresetout[5:0]},
		rx_clkout = {rx_clkout_wire[0]},
		rx_clkout_wire = {wire_receive_pcs0_clkout},
		rx_coreclk_in = {rx_clkout_wire[0]},
		rx_cruclk_in = {{9{1'b0}}, rx_pldcruclk_in[0]},
		rx_dataout = {rx_out_wire[39:0]},
		rx_deserclock_in = {rx_pll_clkout[3:0]},
		rx_digitalreset_in = {{3{1'b0}}, rx_digitalreset[0]},
		rx_digitalreset_out = {wire_cent_unit0_rxdigitalresetout[3:0]},
		rx_enapatternalign = 1'b0,
		rx_freqlocked = {(rx_freqlocked_wire[0] & (~ rx_analogreset[0]))},
		rx_freqlocked_wire = {wire_rx_cdr_pll0_freqlocked},
		rx_locktodata_wire = {((~ reconfig_togxb_busy) & rx_locktodata[0])},
		rx_locktorefclk_wire = {wire_receive_pcs0_cdrctrllocktorefclkout},
		rx_out_wire = {wire_receive_pcs0_dataout[39:0]},
		rx_pcsdprioin_wire = {{1200{1'b0}}, cent_unit_rxpcsdprioout[399:0]},
		rx_pcsdprioout = {{1200{1'b0}}, wire_receive_pcs0_dprioout},
		rx_phfifordenable = 1'b1,
		rx_phfiforeset = 1'b0,
		rx_phfifowrdisable = 1'b0,
		rx_pldcruclk_in = {pll_inclk},
		rx_pll_clkout = {wire_rx_cdr_pll0_clk},
		rx_pll_locked = {(rx_plllocked_wire[0] & (~ rx_analogreset[0]))},
		rx_pll_pfdrefclkout_wire = {wire_rx_cdr_pll0_pfdrefclkout},
		rx_plllocked_wire = {wire_rx_cdr_pll0_locked},
		rx_pma_analogtestbus = {{12{1'b0}}, wire_receive_pma0_analogtestbus[5:2], 1'b0},
		rx_pma_clockout = {wire_receive_pma0_clockout},
		rx_pma_dataout = {wire_receive_pma0_dataout},
		rx_pma_locktorefout = {wire_receive_pma0_locktorefout},
		rx_pma_recoverdataout_wire = {wire_receive_pma0_recoverdataout[19:0]},
		rx_pmadprioin_wire = {{1500{1'b0}}, cent_unit_rxpmadprioout[299:0]},
		rx_pmadprioout = {{1500{1'b0}}, wire_receive_pma0_dprioout},
		rx_powerdown = 1'b0,
		rx_powerdown_in = {{5{1'b0}}, rx_powerdown[0]},
		rx_prbscidenable = 1'b0,
		rx_rxcruresetout = {wire_cent_unit0_rxcruresetout[5:0]},
		rx_signaldetect_wire = {wire_receive_pma0_signaldetect},
		rxpll_dprioin = {{1500{1'b0}}, cent_unit_cmuplldprioout[299:0]},
		tx_analogreset_out = {wire_cent_unit0_txanalogresetout[5:0]},
		tx_clkout = {tx_core_clkout_wire[0]},
		tx_clkout_int_wire = {wire_transmit_pcs0_clkout},
		tx_core_clkout_wire = {tx_clkout_int_wire[0]},
		tx_coreclk_in = {tx_core_clkout_wire[0]},
		tx_datain_wire = {tx_datain[39:0]},
		tx_dataout = {wire_transmit_pma0_dataout},
		tx_dataout_pcs_to_pma = {wire_transmit_pcs0_dataout},
		tx_digitalreset_in = {{3{1'b0}}, tx_digitalreset[0]},
		tx_digitalreset_out = {wire_cent_unit0_txdigitalresetout[3:0]},
		tx_dprioin_wire = {{1050{1'b0}}, cent_unit_txdprioout[149:0]},
		tx_invpolarity = 1'b0,
		tx_localrefclk = {wire_transmit_pma0_clockout},
		tx_phfiforeset = 1'b0,
		tx_pmadprioin_wire = {{1500{1'b0}}, cent_unit_txpmadprioout[299:0]},
		tx_pmadprioout = {{1500{1'b0}}, wire_transmit_pma0_dprioout},
		tx_serialloopbackout = {wire_transmit_pma0_seriallpbkout},
		tx_txdprioout = {{450{1'b0}}, wire_transmit_pcs0_dprioout},
		txdetectrxout = {wire_transmit_pcs0_txdetectrx},
		w_cent_unit_dpriodisableout1w = {wire_cent_unit0_dpriodisableout};
	initial/*synthesis enable_verilog_initial_construct*/
 	begin
		$display("Warning: MGL_INTERNAL_WARNING: ( The parameter value is not one of the pre-specified values in the value list.) alt4gxb|intended_device_variant The value assigned is ST Extended Features and the valid value list is UNUSED|GT");
		$display("Error: The chosen data rate or input clock frequency cannot be implemented. (The value of tx_pll_m_divider is invalid)");
		$display("Error: The chosen data rate or input clock frequency cannot be implemented. (The value of rx_cru_m_divider is invalid)");
	end
endmodule //alt4gxb_t079
//ERROR FILE
