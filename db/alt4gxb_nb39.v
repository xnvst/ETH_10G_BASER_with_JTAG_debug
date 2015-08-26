//alt4gxb CBX_DECLARE_ALL_CONNECTED_PORTS="OFF" cmu_pll_inclk_log_index=0 cmu_pll_log_index=0 device_family="Arria V" effective_data_rate="3125 Mbps" enable_lc_tx_pll="false" enable_pll_inclk_drive_rx_cru="true" enable_pma_direct="true" enable_pma_xn_bonding="true" equalizer_ctrl_a_setting=7 equalizer_ctrl_b_setting=7 equalizer_ctrl_c_setting=7 equalizer_ctrl_d_setting=7 equalizer_ctrl_v_setting=5 equalizer_dcgain_setting=0 gen_reconfig_pll="false" gx_channel_type="auto" gxb_analog_power="AUTO" gxb_powerdown_width=1 input_clock_frequency="156.25 MHz" intended_device_speed_grade="3_H3" intended_device_variant="ST Extended Features" loopback_mode="slb" number_of_channels=1 number_of_quads=1 operation_mode="duplex" pll_control_width=1 preemphasis_ctrl_1stposttap_setting=5 preemphasis_ctrl_2ndposttap_inv_setting="false" preemphasis_ctrl_2ndposttap_setting=0 preemphasis_ctrl_pretap_inv_setting="false" preemphasis_ctrl_pretap_setting=0 protocol="basic" receiver_termination="OCT_100_OHMS" reconfig_calibration="true" reconfig_dprio_mode=1 reconfig_fromgxb_port_width=17 reconfig_pll_inclk_width=1 reconfig_protocol="basic" reconfig_togxb_port_width=4 rx_8b_10b_mode="none" rx_allow_align_polarity_inversion="false" rx_allow_pipe_polarity_inversion="false" rx_bitslip_enable="true" rx_byte_ordering_mode="none" rx_channel_width=16 rx_common_mode="0.82v" rx_cru_bandwidth_type="auto" rx_datapath_low_latency_mode="true" rx_datapath_protocol="basic" rx_digitalreset_port_width=1 rx_dwidth_factor=2 rx_enable_bit_reversal="false" rx_enable_deep_align_byte_swap="false" rx_enable_lock_to_data_sig="true" rx_enable_lock_to_refclk_sig="true" rx_enable_self_test_mode="false" rx_flip_rx_out="false" rx_force_signal_detect="true" rx_phfiforegmode="false" rx_ppmselect=32 rx_rate_match_fifo_mode="none" rx_reconfig_clk_scheme="indv_clk_source" rx_signal_detect_threshold=2 rx_use_align_state_machine="true" rx_use_clkout="true" rx_use_coreclk="false" rx_use_cruclk="false" rx_use_deserializer_double_data_mode="true" rx_use_deskew_fifo="false" rx_use_double_data_mode="false" rx_word_aligner_num_byte=2 starting_channel_number=0 transmitter_termination="OCT_100_OHMS" tx_analog_power="auto" tx_bitslip_enable="false" tx_channel_width=16 tx_clkout_width=1 tx_common_mode="0.65v" tx_datapath_low_latency_mode="true" tx_digitalreset_port_width=1 tx_dwidth_factor=2 tx_enable_bit_reversal="false" tx_enable_self_test_mode="false" tx_flip_tx_in="false" tx_pll_bandwidth_type="auto" tx_pll_inclk0_period=6400 tx_pll_type="CMU" tx_reconfig_clk_scheme="tx_ch0_clk_source" tx_slew_rate="low" tx_transmit_protocol="basic" tx_use_coreclk="false" tx_use_double_data_mode="false" tx_use_serializer_double_data_mode="true" use_calibration_block="true" use_global_clk_divider="false" vod_ctrl_setting=1 cal_blk_clk cal_blk_powerdown gxb_powerdown pll_inclk pll_locked pll_powerdown reconfig_clk reconfig_fromgxb reconfig_togxb rx_analogreset rx_clkout rx_datain rx_dataout rx_freqlocked rx_locktodata rx_locktorefclk rx_pll_locked rx_seriallpbken tx_clkout tx_datain tx_dataout
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



//synthesis_resources = stratixiv_hssi_calibration_block 2 stratixiv_hssi_clock_divider 1 stratixiv_hssi_cmu 2 stratixiv_hssi_pll 2 stratixiv_hssi_rx_pma 1 stratixiv_hssi_tx_pma 1 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
(* ALTERA_ATTRIBUTE = {"AUTO_SHIFT_REGISTER_RECOGNITION=OFF"} *)
module  alt4gxb_nb39
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
	rx_freqlocked,
	rx_locktodata,
	rx_locktorefclk,
	rx_pll_locked,
	rx_seriallpbken,
	tx_clkout,
	tx_datain,
	tx_dataout) /* synthesis synthesis_clearbox=1 */;
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
	output   [15:0]  rx_dataout;
	output   [0:0]  rx_freqlocked;
	input   [0:0]  rx_locktodata;
	input   [0:0]  rx_locktorefclk;
	output   [0:0]  rx_pll_locked;
	input   [0:0]  rx_seriallpbken;
	output   [0:0]  tx_clkout;
	input   [15:0]  tx_datain;
	output   [0:0]  tx_dataout;
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
	tri0   [0:0]  rx_locktodata;
	tri0   [0:0]  rx_locktorefclk;
	tri0   [0:0]  rx_seriallpbken;
	tri0   [15:0]  tx_datain;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif


	parameter	starting_channel_number = 0;


	wire  wire_cal_blk0_nonusertocmu;
	wire  wire_pll_cal_blk0_nonusertocmu;
	wire  [1:0]   wire_central_clk_div0_analogfastrefclkout;
	wire  [1:0]   wire_central_clk_div0_analogrefclkout;
	wire  wire_central_clk_div0_analogrefclkpulse;
	wire  [99:0]   wire_central_clk_div0_dprioout;
	wire  wire_central_clk_div0_refclkout;
	wire  [1799:0]   wire_cent_unit0_cmuplldprioout;
	wire  wire_cent_unit0_dpriodisableout;
	wire  wire_cent_unit0_dprioout;
	wire  wire_cent_unit0_quadresetout;
	wire  [5:0]   wire_cent_unit0_rxanalogresetout;
	wire  [5:0]   wire_cent_unit0_rxcrupowerdown;
	wire  [5:0]   wire_cent_unit0_rxcruresetout;
	wire  [5:0]   wire_cent_unit0_rxibpowerdown;
	wire  [1799:0]   wire_cent_unit0_rxpmadprioout;
	wire  [5:0]   wire_cent_unit0_txanalogresetout;
	wire  [5:0]   wire_cent_unit0_txdetectrxpowerdown;
	wire  [5:0]   wire_cent_unit0_txobpowerdown;
	wire  [1799:0]   wire_cent_unit0_txpmadprioout;
	wire  [1:0]   wire_tx_pll_cent_unit0_clkdivpowerdn;
	wire  [599:0]   wire_tx_pll_cent_unit0_cmudividerdprioout;
	wire  [1799:0]   wire_tx_pll_cent_unit0_cmuplldprioout;
	wire  wire_tx_pll_cent_unit0_dpriodisableout;
	wire  [1:0]   wire_tx_pll_cent_unit0_pllpowerdn;
	wire  [1:0]   wire_tx_pll_cent_unit0_pllresetout;
	wire  wire_tx_pll_cent_unit0_quadresetout;
	wire  [3:0]   wire_rx_cdr_pll0_clk;
	wire  [1:0]   wire_rx_cdr_pll0_dataout;
	wire  [299:0]   wire_rx_cdr_pll0_dprioout;
	wire  wire_rx_cdr_pll0_freqlocked;
	wire  wire_rx_cdr_pll0_locked;
	wire  wire_rx_cdr_pll0_pfdrefclkout;
	wire  [3:0]   wire_tx_pll_edge0_clk;
	wire  [299:0]   wire_tx_pll_edge0_dprioout;
	wire  wire_tx_pll_edge0_locked;
	wire  [7:0]   wire_receive_pma0_analogtestbus;
	wire  wire_receive_pma0_clockout;
	wire  wire_receive_pma0_dataout;
	wire  [299:0]   wire_receive_pma0_dprioout;
	wire  wire_receive_pma0_locktorefout;
	wire  [63:0]   wire_receive_pma0_recoverdataout;
	wire  wire_receive_pma0_signaldetect;
	wire  wire_transmit_pma0_clockout;
	wire  wire_transmit_pma0_dataout;
	wire  [299:0]   wire_transmit_pma0_dprioout;
	wire  wire_transmit_pma0_seriallpbkout;
	wire  [1799:0]  cent_unit_cmuplldprioout;
	wire  [5:0]  cent_unit_rxcrupowerdn;
	wire  [5:0]  cent_unit_rxibpowerdn;
	wire  [299:0]  cent_unit_rxpmadprioin;
	wire  [299:0]  cent_unit_rxpmadprioout;
	wire  [5:0]  cent_unit_txdetectrxpowerdn;
	wire  [599:0]  cent_unit_txdprioout;
	wire  [5:0]  cent_unit_txobpowerdn;
	wire  [299:0]  cent_unit_txpmadprioin;
	wire  [299:0]  cent_unit_txpmadprioout;
	wire  [3:0]  clock_divider_clk0in;
	wire  [599:0]  edge_clk_div_cmudividerdprioin;
	wire  [0:0]  edge_cmu_clkdivpowerdn;
	wire  [99:0]  edge_cmu_cmudividerdprioout;
	wire  [299:0]  edge_cmu_cmuplldprioout;
	wire  [0:0]  edge_cmu_dpriodisableout;
	wire  [0:0]  edge_cmu_pllpowerdn;
	wire  [0:0]  edge_cmu_pllresetout;
	wire  [0:0]  edge_cmu_quadresetout;
	wire  [1:0]  edge_pll_analogfastrefclkout;
	wire  [1:0]  edge_pll_analogrefclkout;
	wire  [0:0]  edge_pll_analogrefclkpulse;
	wire  [9:0]  edge_pll_clkin;
	wire  [299:0]  edge_pll_cmuplldprioout;
	wire  [299:0]  edge_pll_dprioin;
	wire  [299:0]  edge_pll_dprioout;
	wire  [3:0]  edge_pll_out;
	wire  [0:0]  edge_pllpowerdn_in;
	wire  [0:0]  edge_pllreset_in;
	wire  [5:0]  fixedclk_to_cmu;
	wire  [0:0]  nonusertocmu_out;
	wire  [0:0]  nonusertocmu_out_pll;
	wire  [1:0]  pll_ch_dataout_wire;
	wire  [299:0]  pll_ch_dprioout;
	wire  [1799:0]  pll_cmuplldprioout;
	wire  [0:0]  pll_edge_locked_out;
	wire  [0:0]  pll_inclk_wire;
	wire  [0:0]  reconfig_togxb_busy;
	wire  [0:0]  reconfig_togxb_disable;
	wire  [0:0]  reconfig_togxb_in;
	wire  [0:0]  reconfig_togxb_load;
	wire  [0:0]  refclk_pma_wire;
	wire  [5:0]  rx_analogreset_in;
	wire  [5:0]  rx_analogreset_out;
	wire  [0:0]  rx_clkout_wire;
	wire  [9:0]  rx_cruclk_in;
	wire  [3:0]  rx_deserclock_in;
	wire  [0:0]  rx_freqlocked_wire;
	wire  [0:0]  rx_locktodata_wire;
	wire  [1599:0]  rx_pcsdprioout;
	wire  [0:0]  rx_pldcruclk_in;
	wire  [3:0]  rx_pll_clkout;
	wire  [0:0]  rx_pll_pfdrefclkout_wire;
	wire  [0:0]  rx_plllocked_wire;
	wire  [16:0]  rx_pma_analogtestbus;
	wire  [0:0]  rx_pma_clockout;
	wire  [0:0]  rx_pma_dataout;
	wire  [0:0]  rx_pma_locktorefout;
	wire  [19:0]  rx_pma_recoverdataout_wire;
	wire  [299:0]  rx_pmadprioin_wire;
	wire  [299:0]  rx_pmadprioout;
	wire [0:0]  rx_powerdown;
	wire  [5:0]  rx_powerdown_in;
	wire  [5:0]  rx_rxcruresetout;
	wire  [299:0]  rxpll_dprioin;
	wire  [5:0]  tx_analogreset_out;
	wire  [0:0]  tx_core_clkout_wire;
	wire  [15:0]  tx_datain_wire;
	wire  [0:0]  tx_localrefclk;
	wire  [299:0]  tx_pmadprioin_wire;
	wire  [299:0]  tx_pmadprioout;
	wire  [0:0]  tx_serialloopbackout;
	wire  [599:0]  tx_txdprioout;
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
	stratixiv_hssi_calibration_block   pll_cal_blk0
	( 
	.calibrationstatus(),
	.clk(cal_blk_clk),
	.enabletestbus(1'b1),
	.nonusertocmu(wire_pll_cal_blk0_nonusertocmu),
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
	stratixiv_hssi_clock_divider   central_clk_div0
	( 
	.analogfastrefclkout(wire_central_clk_div0_analogfastrefclkout),
	.analogfastrefclkoutshifted(),
	.analogrefclkout(wire_central_clk_div0_analogrefclkout),
	.analogrefclkoutshifted(),
	.analogrefclkpulse(wire_central_clk_div0_analogrefclkpulse),
	.analogrefclkpulseshifted(),
	.clk0in(clock_divider_clk0in[3:0]),
	.coreclkout(),
	.dpriodisable(edge_cmu_dpriodisableout[0]),
	.dprioin(edge_cmu_cmudividerdprioout[99:0]),
	.dprioout(wire_central_clk_div0_dprioout),
	.powerdn(edge_cmu_clkdivpowerdn[0]),
	.quadreset(edge_cmu_quadresetout[0]),
	.rateswitchbaseclock(),
	.rateswitchdone(),
	.rateswitchout(),
	.refclkout(wire_central_clk_div0_refclkout)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.clk1in({4{1'b0}}),
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
		central_clk_div0.divide_by = 4,
		central_clk_div0.divider_type = "CENTRAL_ENHANCED",
		central_clk_div0.effective_data_rate = "3125 Mbps",
		central_clk_div0.enable_dynamic_divider = "false",
		central_clk_div0.enable_refclk_out = "true",
		central_clk_div0.inclk_select = 0,
		central_clk_div0.logical_channel_address = 0,
		central_clk_div0.pre_divide_by = 1,
		central_clk_div0.select_local_rate_switch_base_clock = "true",
		central_clk_div0.select_local_refclk = "true",
		central_clk_div0.sim_analogfastrefclkout_phase_shift = 0,
		central_clk_div0.sim_analogrefclkout_phase_shift = 0,
		central_clk_div0.sim_coreclkout_phase_shift = 0,
		central_clk_div0.sim_refclkout_phase_shift = 0,
		central_clk_div0.use_coreclk_out_post_divider = "false",
		central_clk_div0.use_refclk_post_divider = "true",
		central_clk_div0.use_vco_bypass = "false",
		central_clk_div0.lpm_type = "stratixiv_hssi_clock_divider";
	stratixiv_hssi_cmu   cent_unit0
	( 
	.adet({4{1'b0}}),
	.alignstatus(),
	.autospdx4configsel(),
	.autospdx4rateswitchout(),
	.autospdx4spdchg(),
	.clkdivpowerdn(),
	.cmudividerdprioout(),
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
	.pllpowerdn(),
	.pllresetout(),
	.quadreset(gxb_powerdown[0]),
	.quadresetout(wire_cent_unit0_quadresetout),
	.rdalign({4{1'b0}}),
	.rdenablesync(1'b0),
	.recovclk(1'b0),
	.refclkdividerdprioout(),
	.refclkout(),
	.rxadcepowerdown(),
	.rxadceresetout(),
	.rxanalogreset({{5{1'b0}}, rx_analogreset_in[0]}),
	.rxanalogresetout(wire_cent_unit0_rxanalogresetout),
	.rxcrupowerdown(wire_cent_unit0_rxcrupowerdown),
	.rxcruresetout(wire_cent_unit0_rxcruresetout),
	.rxctrl({4{1'b0}}),
	.rxctrlout(),
	.rxdatain({32{1'b0}}),
	.rxdataout(),
	.rxdatavalid({4{1'b0}}),
	.rxdigitalresetout(),
	.rxibpowerdown(wire_cent_unit0_rxibpowerdown),
	.rxpcsdprioout(),
	.rxphfifox4byteselout(),
	.rxphfifox4rdenableout(),
	.rxphfifox4wrclkout(),
	.rxphfifox4wrenableout(),
	.rxpmadprioin({{1500{1'b0}}, cent_unit_rxpmadprioin[299:0]}),
	.rxpmadprioout(wire_cent_unit0_rxpmadprioout),
	.rxpowerdown({{5{1'b0}}, rx_powerdown_in[0]}),
	.rxrunningdisp({4{1'b0}}),
	.scanout(),
	.syncstatus({4{1'b0}}),
	.testout(),
	.txanalogresetout(wire_cent_unit0_txanalogresetout),
	.txctrl({4{1'b0}}),
	.txctrlout(),
	.txdatain({32{1'b0}}),
	.txdataout(),
	.txdetectrxpowerdown(wire_cent_unit0_txdetectrxpowerdown),
	.txdigitalresetout(),
	.txdividerpowerdown(),
	.txobpowerdown(wire_cent_unit0_txobpowerdown),
	.txpcsdprioout(),
	.txphfifox4byteselout(),
	.txphfifox4rdclkout(),
	.txphfifox4rdenableout(),
	.txphfifox4wrenableout(),
	.txpmadprioin({{1500{1'b0}}, cent_unit_txpmadprioin[299:0]}),
	.txpmadprioout(wire_cent_unit0_txpmadprioout)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.cmudividerdprioin({600{1'b0}}),
	.extra10gin({7{1'b0}}),
	.lccmurtestbussel({3{1'b0}}),
	.pmacramtest(1'b0),
	.rateswitch(1'b0),
	.rateswitchdonein(1'b0),
	.refclkdig(1'b0),
	.refclkdividerdprioin({2{1'b0}}),
	.rxclk(1'b0),
	.rxcoreclk(1'b0),
	.rxdigitalreset({4{1'b0}}),
	.rxpcsdprioin({1600{1'b0}}),
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
	.txdigitalreset({4{1'b0}}),
	.txpcsdprioin({600{1'b0}}),
	.txphfiforddisable(1'b0),
	.txphfiforeset(1'b0),
	.txphfifowrenable(1'b0),
	.txpllreset({2{1'b0}})
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
		cent_unit0.rx0_use_double_data_mode = "false",
		cent_unit0.tx0_auto_spd_self_switch_enable = "false",
		cent_unit0.tx0_channel_bonding = "none",
		cent_unit0.tx0_ph_fifo_reg_mode = "false",
		cent_unit0.tx0_rd_clk_mux_select = "cmu_clock_divider",
		cent_unit0.tx0_use_double_data_mode = "false",
		cent_unit0.tx0_wr_clk_mux_select = "core_clk",
		cent_unit0.use_deskew_fifo = "false",
		cent_unit0.vcceh_voltage = "Auto",
		cent_unit0.lpm_type = "stratixiv_hssi_cmu";
	stratixiv_hssi_cmu   tx_pll_cent_unit0
	( 
	.alignstatus(),
	.autospdx4configsel(),
	.autospdx4rateswitchout(),
	.autospdx4spdchg(),
	.clkdivpowerdn(wire_tx_pll_cent_unit0_clkdivpowerdn),
	.cmudividerdprioin(edge_clk_div_cmudividerdprioin[599:0]),
	.cmudividerdprioout(wire_tx_pll_cent_unit0_cmudividerdprioout),
	.cmuplldprioin({{300{1'b0}}, edge_pll_cmuplldprioout[299:0], {1200{1'b0}}}),
	.cmuplldprioout(wire_tx_pll_cent_unit0_cmuplldprioout),
	.coreclkout(),
	.digitaltestout(),
	.dpclk(reconfig_clk),
	.dpriodisable(reconfig_togxb_disable),
	.dpriodisableout(wire_tx_pll_cent_unit0_dpriodisableout),
	.dprioin(reconfig_togxb_in),
	.dprioload(reconfig_togxb_load),
	.dpriooe(),
	.dprioout(),
	.enabledeskew(),
	.extra10gout(),
	.fiforesetrd(),
	.lccmutestbus(),
	.nonuserfromcal(nonusertocmu_out_pll[0]),
	.phfifiox4ptrsreset(),
	.pllpowerdn(wire_tx_pll_cent_unit0_pllpowerdn),
	.pllresetout(wire_tx_pll_cent_unit0_pllresetout),
	.quadreset(gxb_powerdown[0]),
	.quadresetout(wire_tx_pll_cent_unit0_quadresetout),
	.refclkdividerdprioout(),
	.refclkout(),
	.rxadcepowerdown(),
	.rxadceresetout(),
	.rxanalogresetout(),
	.rxcrupowerdown(),
	.rxcruresetout(),
	.rxctrlout(),
	.rxdataout(),
	.rxdigitalresetout(),
	.rxibpowerdown(),
	.rxpcsdprioout(),
	.rxphfifox4byteselout(),
	.rxphfifox4rdenableout(),
	.rxphfifox4wrclkout(),
	.rxphfifox4wrenableout(),
	.rxpmadprioout(),
	.scanout(),
	.testout(),
	.txanalogresetout(),
	.txctrlout(),
	.txdataout(),
	.txdetectrxpowerdown(),
	.txdigitalresetout(),
	.txdividerpowerdown(),
	.txobpowerdown(),
	.txpcsdprioout(),
	.txphfifox4byteselout(),
	.txphfifox4rdclkout(),
	.txphfifox4rdenableout(),
	.txphfifox4wrenableout(),
	.txpllreset({{1{1'b0}}, pll_powerdown[0]}),
	.txpmadprioout()
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.adet({4{1'b0}}),
	.extra10gin({7{1'b0}}),
	.fixedclk({6{1'b0}}),
	.lccmurtestbussel({3{1'b0}}),
	.pmacramtest(1'b0),
	.rateswitch(1'b0),
	.rateswitchdonein(1'b0),
	.rdalign({4{1'b0}}),
	.rdenablesync(1'b1),
	.recovclk(1'b0),
	.refclkdig(1'b0),
	.refclkdividerdprioin({2{1'b0}}),
	.rxanalogreset({6{1'b0}}),
	.rxclk(1'b0),
	.rxcoreclk(1'b0),
	.rxctrl({4{1'b0}}),
	.rxdatain({32{1'b0}}),
	.rxdatavalid({4{1'b0}}),
	.rxdigitalreset({4{1'b0}}),
	.rxpcsdprioin({1600{1'b0}}),
	.rxphfifordenable(1'b1),
	.rxphfiforeset(1'b0),
	.rxphfifowrdisable(1'b0),
	.rxpmadprioin({1800{1'b0}}),
	.rxpowerdown({6{1'b0}}),
	.rxrunningdisp({4{1'b0}}),
	.scanclk(1'b0),
	.scanin({23{1'b0}}),
	.scanmode(1'b0),
	.scanshift(1'b0),
	.syncstatus({4{1'b0}}),
	.testin({10000{1'b0}}),
	.txclk(1'b0),
	.txcoreclk(1'b0),
	.txctrl({4{1'b0}}),
	.txdatain({32{1'b0}}),
	.txdigitalreset({4{1'b0}}),
	.txpcsdprioin({600{1'b0}}),
	.txphfiforddisable(1'b0),
	.txphfiforeset(1'b0),
	.txphfifowrenable(1'b0),
	.txpmadprioin({1800{1'b0}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		tx_pll_cent_unit0.auto_spd_deassert_ph_fifo_rst_count = 8,
		tx_pll_cent_unit0.auto_spd_phystatus_notify_count = 14,
		tx_pll_cent_unit0.devaddr = ((((starting_channel_number / 4) + 1) % 32) + 1),
		tx_pll_cent_unit0.offset_all_errors_align = "false",
		tx_pll_cent_unit0.pipe_freq_scale_mode = "Frequency",
		tx_pll_cent_unit0.pma_done_count = 249950,
		tx_pll_cent_unit0.portaddr = (((starting_channel_number + 4) / 128) + 1),
		tx_pll_cent_unit0.rx0_clk1_mux_select = "recovered clock",
		tx_pll_cent_unit0.rx0_clk2_mux_select = "recovered clock",
		tx_pll_cent_unit0.rx0_rd_clk_mux_select = "core clock",
		tx_pll_cent_unit0.rx0_recovered_clk_mux_select = "recovered clock",
		tx_pll_cent_unit0.rx0_use_double_data_mode = "false",
		tx_pll_cent_unit0.tx0_rd_clk_mux_select = "cmu_clock_divider",
		tx_pll_cent_unit0.tx0_use_double_data_mode = "false",
		tx_pll_cent_unit0.tx0_wr_clk_mux_select = "core_clk",
		tx_pll_cent_unit0.use_deskew_fifo = "false",
		tx_pll_cent_unit0.vcceh_voltage = "Auto",
		tx_pll_cent_unit0.lpm_type = "stratixiv_hssi_cmu";
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
		rx_cdr_pll0.channel_num = (starting_channel_number % 4),
		rx_cdr_pll0.dprio_config_mode = 8'h00,
		rx_cdr_pll0.effective_data_rate = "3125 Mbps",
		rx_cdr_pll0.enable_dynamic_divider = "false",
		rx_cdr_pll0.fast_lock_control = "false",
		rx_cdr_pll0.input_clock_frequency = "156.25 MHz",
		rx_cdr_pll0.m = 0,
		rx_cdr_pll0.n = 1,
		rx_cdr_pll0.pfd_clk_select = 0,
		rx_cdr_pll0.pll_type = "RX CDR",
		rx_cdr_pll0.use_refclk_pin = "false",
		rx_cdr_pll0.vco_post_scale = 1,
		rx_cdr_pll0.lpm_type = "stratixiv_hssi_pll";
	stratixiv_hssi_pll   tx_pll_edge0
	( 
	.areset(edge_pllreset_in[0]),
	.clk(wire_tx_pll_edge0_clk),
	.dataout(),
	.dpriodisable(edge_cmu_dpriodisableout[0]),
	.dprioin(edge_pll_dprioin[299:0]),
	.dprioout(wire_tx_pll_edge0_dprioout),
	.freqlocked(),
	.inclk({edge_pll_clkin[9:0]}),
	.locked(wire_tx_pll_edge0_locked),
	.pfdfbclkout(),
	.pfdrefclkout(),
	.powerdown(edge_pllpowerdn_in[0]),
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
		tx_pll_edge0.bandwidth_type = "Auto",
		tx_pll_edge0.channel_num = 4,
		tx_pll_edge0.dprio_config_mode = 8'h00,
		tx_pll_edge0.inclk0_input_period = 6400,
		tx_pll_edge0.input_clock_frequency = "156.25 MHz",
		tx_pll_edge0.logical_channel_address = (starting_channel_number + 4),
		tx_pll_edge0.logical_tx_pll_number = 2,
		tx_pll_edge0.m = 0,
		tx_pll_edge0.n = 1,
		tx_pll_edge0.pfd_clk_select = 0,
		tx_pll_edge0.pll_type = "CMU",
		tx_pll_edge0.use_refclk_pin = "false",
		tx_pll_edge0.vco_post_scale = 1,
		tx_pll_edge0.lpm_type = "stratixiv_hssi_pll";
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
	.locktoref((reconfig_togxb_busy | rx_locktorefclk[0])),
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
		receive_pma0.channel_number = (starting_channel_number % 4),
		receive_pma0.channel_type = "auto",
		receive_pma0.common_mode = "0.82V",
		receive_pma0.deserialization_factor = 16,
		receive_pma0.dprio_config_mode = 8'h01,
		receive_pma0.enable_ltd = "true",
		receive_pma0.enable_ltr = "true",
		receive_pma0.eq_dc_gain = 0,
		receive_pma0.eqa_ctrl = 7,
		receive_pma0.eqb_ctrl = 7,
		receive_pma0.eqc_ctrl = 7,
		receive_pma0.eqd_ctrl = 7,
		receive_pma0.eqv_ctrl = 5,
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
		receive_pma0.use_pma_direct = "true",
		receive_pma0.lpm_type = "stratixiv_hssi_rx_pma";
	stratixiv_hssi_tx_pma   transmit_pma0
	( 
	.clockout(wire_transmit_pma0_clockout),
	.datain({{48{1'b0}}, tx_datain_wire[15:0]}),
	.dataout(wire_transmit_pma0_dataout),
	.detectrxpowerdown(cent_unit_txdetectrxpowerdn[0]),
	.dftout(),
	.dpriodisable(w_cent_unit_dpriodisableout1w[0]),
	.dprioin(tx_pmadprioin_wire[299:0]),
	.dprioout(wire_transmit_pma0_dprioout),
	.fastrefclk0in({2{1'b0}}),
	.fastrefclk1in({2{1'b0}}),
	.fastrefclk2in(edge_pll_analogfastrefclkout[1:0]),
	.fastrefclk4in({2{1'b0}}),
	.forceelecidle(1'b0),
	.pclk({{2{1'b0}}, refclk_pma_wire, {2{1'b0}}}),
	.powerdn(cent_unit_txobpowerdn[0]),
	.refclk0in({2{1'b0}}),
	.refclk0inpulse(1'b0),
	.refclk1in({2{1'b0}}),
	.refclk1inpulse(1'b0),
	.refclk2in(edge_pll_analogrefclkout[1:0]),
	.refclk2inpulse(edge_pll_analogrefclkpulse[0]),
	.refclk4in({2{1'b0}}),
	.refclk4inpulse(1'b0),
	.revserialfdbk(1'b0),
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
	.refclk3in({2{1'b0}}),
	.refclk3inpulse(1'b0),
	.reverselpbkin(1'b0),
	.rxdetectclk(1'b0),
	.rxdetecten(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		transmit_pma0.analog_power = "auto",
		transmit_pma0.channel_number = (starting_channel_number % 4),
		transmit_pma0.channel_type = "auto",
		transmit_pma0.clkin_select = 2,
		transmit_pma0.clkmux_delay = "false",
		transmit_pma0.common_mode = "0.65V",
		transmit_pma0.dprio_config_mode = 8'h01,
		transmit_pma0.enable_reverse_serial_loopback = "false",
		transmit_pma0.logical_channel_address = (starting_channel_number + 0),
		transmit_pma0.logical_protocol_hint_2 = "basic",
		transmit_pma0.low_speed_test_select = 0,
		transmit_pma0.physical_clkin2_mapping = "xn_top",
		transmit_pma0.preemp_pretap = 0,
		transmit_pma0.preemp_pretap_inv = "false",
		transmit_pma0.preemp_tap_1 = 5,
		transmit_pma0.preemp_tap_2 = 0,
		transmit_pma0.preemp_tap_2_inv = "false",
		transmit_pma0.protocol_hint = "basic",
		transmit_pma0.rx_detect = 0,
		transmit_pma0.serialization_factor = 16,
		transmit_pma0.slew_rate = "low",
		transmit_pma0.termination = "OCT 100 Ohms",
		transmit_pma0.use_external_termination = "false",
		transmit_pma0.use_pclk = "true",
		transmit_pma0.use_pma_direct = "true",
		transmit_pma0.use_ser_double_data_mode = "true",
		transmit_pma0.vod_selection = 1,
		transmit_pma0.lpm_type = "stratixiv_hssi_tx_pma";
	assign
		cent_unit_cmuplldprioout = {wire_cent_unit0_cmuplldprioout},
		cent_unit_rxcrupowerdn = {{5{1'b0}}, wire_cent_unit0_rxcrupowerdown[0]},
		cent_unit_rxibpowerdn = {{5{1'b0}}, wire_cent_unit0_rxibpowerdown[0]},
		cent_unit_rxpmadprioin = {rx_pmadprioout[299:0]},
		cent_unit_rxpmadprioout = {wire_cent_unit0_rxpmadprioout[299:0]},
		cent_unit_txdetectrxpowerdn = {{5{1'b0}}, wire_cent_unit0_txdetectrxpowerdown[0]},
		cent_unit_txobpowerdn = {{5{1'b0}}, wire_cent_unit0_txobpowerdown[0]},
		cent_unit_txpmadprioin = {tx_pmadprioout[299:0]},
		cent_unit_txpmadprioout = {wire_cent_unit0_txpmadprioout[299:0]},
		clock_divider_clk0in = {edge_pll_out[3:0]},
		edge_clk_div_cmudividerdprioin = {{100{1'b0}}, wire_central_clk_div0_dprioout, {400{1'b0}}},
		edge_cmu_clkdivpowerdn = {wire_tx_pll_cent_unit0_clkdivpowerdn[0]},
		edge_cmu_cmudividerdprioout = {wire_tx_pll_cent_unit0_cmudividerdprioout[499:400]},
		edge_cmu_cmuplldprioout = {wire_tx_pll_cent_unit0_cmuplldprioout[1499:1200]},
		edge_cmu_dpriodisableout = {wire_tx_pll_cent_unit0_dpriodisableout},
		edge_cmu_pllpowerdn = {wire_tx_pll_cent_unit0_pllpowerdn[0]},
		edge_cmu_pllresetout = {wire_tx_pll_cent_unit0_pllresetout[0]},
		edge_cmu_quadresetout = {wire_tx_pll_cent_unit0_quadresetout},
		edge_pll_analogfastrefclkout = {wire_central_clk_div0_analogfastrefclkout},
		edge_pll_analogrefclkout = {wire_central_clk_div0_analogrefclkout},
		edge_pll_analogrefclkpulse = {wire_central_clk_div0_analogrefclkpulse},
		edge_pll_clkin = {{9{1'b0}}, pll_inclk_wire[0]},
		edge_pll_cmuplldprioout = {edge_pll_dprioout[299:0]},
		edge_pll_dprioin = {edge_cmu_cmuplldprioout[299:0]},
		edge_pll_dprioout = {wire_tx_pll_edge0_dprioout},
		edge_pll_out = {wire_tx_pll_edge0_clk[3:0]},
		edge_pllpowerdn_in = {edge_cmu_pllpowerdn[0]},
		edge_pllreset_in = {edge_cmu_pllresetout[0]},
		fixedclk_to_cmu = {{5{1'b0}}, reconfig_clk},
		nonusertocmu_out = {wire_cal_blk0_nonusertocmu},
		nonusertocmu_out_pll = {wire_pll_cal_blk0_nonusertocmu},
		pll_ch_dataout_wire = {wire_rx_cdr_pll0_dataout},
		pll_ch_dprioout = {wire_rx_cdr_pll0_dprioout},
		pll_cmuplldprioout = {{600{1'b0}}, {900{1'b0}}, pll_ch_dprioout[299:0]},
		pll_edge_locked_out = {wire_tx_pll_edge0_locked},
		pll_inclk_wire = {pll_inclk},
		pll_locked = {pll_edge_locked_out[0]},
		reconfig_fromgxb = {rx_pma_analogtestbus[16:1], wire_cent_unit0_dprioout},
		reconfig_togxb_busy = reconfig_togxb[3],
		reconfig_togxb_disable = reconfig_togxb[1],
		reconfig_togxb_in = reconfig_togxb[0],
		reconfig_togxb_load = reconfig_togxb[2],
		refclk_pma_wire = {wire_central_clk_div0_refclkout},
		rx_analogreset_in = {{5{1'b0}}, ((~ reconfig_togxb_busy) & rx_analogreset[0])},
		rx_analogreset_out = {{5{1'b0}}, wire_cent_unit0_rxanalogresetout[0]},
		rx_clkout = {rx_pma_clockout[0]},
		rx_cruclk_in = {{9{1'b0}}, rx_pldcruclk_in[0]},
		rx_dataout = {rx_pma_recoverdataout_wire[15:0]},
		rx_deserclock_in = {rx_pll_clkout[3:0]},
		rx_freqlocked = {(rx_freqlocked_wire[0] & (~ rx_analogreset[0]))},
		rx_freqlocked_wire = {wire_rx_cdr_pll0_freqlocked},
		rx_locktodata_wire = {((~ reconfig_togxb_busy) & rx_locktodata[0])},
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
		rx_pmadprioin_wire = {cent_unit_rxpmadprioout[299:0]},
		rx_pmadprioout = {wire_receive_pma0_dprioout},
		rx_powerdown = 1'b0,
		rx_powerdown_in = {{5{1'b0}}, rx_powerdown[0]},
		rx_rxcruresetout = {{5{1'b0}}, wire_cent_unit0_rxcruresetout[0]},
		rxpll_dprioin = {cent_unit_cmuplldprioout[299:0]},
		tx_analogreset_out = {{5{1'b0}}, wire_cent_unit0_txanalogresetout[0]},
		tx_clkout = {tx_localrefclk[0]},
		tx_datain_wire = {tx_datain[15:0]},
		tx_dataout = {wire_transmit_pma0_dataout},
		tx_localrefclk = {wire_transmit_pma0_clockout},
		tx_pmadprioin_wire = {cent_unit_txpmadprioout[299:0]},
		tx_pmadprioout = {wire_transmit_pma0_dprioout},
		tx_serialloopbackout = {wire_transmit_pma0_seriallpbkout},
		w_cent_unit_dpriodisableout1w = {wire_cent_unit0_dpriodisableout};
	initial/*synthesis enable_verilog_initial_construct*/
 	begin
		$display("Warning: MGL_INTERNAL_WARNING: ( The parameter value is not one of the pre-specified values in the value list.) alt4gxb|intended_device_variant The value assigned is ST Extended Features and the valid value list is UNUSED|GT");
		$display("Error: The chosen data rate or input clock frequency cannot be implemented. (The value of tx_pll_m_divider is invalid)");
		$display("Error: The chosen data rate or input clock frequency cannot be implemented. (The value of rx_cru_m_divider is invalid)");
	end
endmodule //alt4gxb_nb39
//ERROR FILE
