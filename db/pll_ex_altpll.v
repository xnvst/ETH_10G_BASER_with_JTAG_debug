//altpll bandwidth_type="AUTO" CBX_DECLARE_ALL_CONNECTED_PORTS="OFF" clk0_divide_by=644531 clk0_duty_cycle=50 clk0_multiply_by=156250 clk0_phase_shift="0" compensate_clock="CLK0" device_family="Arria V" inclk0_input_frequency=1551 intended_device_family="Stratix IV" lpm_hint="CBX_MODULE_PREFIX=pll_ex" operation_mode="normal" pll_type="AUTO" port_clk0="PORT_USED" port_clk1="PORT_UNUSED" port_clk2="PORT_UNUSED" port_clk3="PORT_UNUSED" port_clk4="PORT_UNUSED" port_clk5="PORT_UNUSED" port_clk6="PORT_UNUSED" port_clk7="PORT_UNUSED" port_clk8="PORT_UNUSED" port_clk9="PORT_UNUSED" port_inclk1="PORT_UNUSED" port_phasecounterselect="PORT_UNUSED" port_phasedone="PORT_UNUSED" port_scandata="PORT_UNUSED" port_scandataout="PORT_UNUSED" self_reset_on_loss_lock="OFF" using_fbmimicbidir_port="OFF" width_clock=10 areset clk inclk locked CARRY_CHAIN="MANUAL" CARRY_CHAIN_LENGTH=48
//VERSION_BEGIN 13.1 cbx_altclkbuf 2014:03:12:18:15:27:SJ cbx_altiobuf_bidir 2014:03:12:18:15:29:SJ cbx_altiobuf_in 2014:03:12:18:15:29:SJ cbx_altiobuf_out 2014:03:12:18:15:29:SJ cbx_altpll 2014:03:12:18:15:29:SJ cbx_cycloneii 2014:03:12:18:15:29:SJ cbx_lpm_add_sub 2014:03:12:18:15:29:SJ cbx_lpm_compare 2014:03:12:18:15:29:SJ cbx_lpm_counter 2014:03:12:18:15:29:SJ cbx_lpm_decode 2014:03:12:18:15:29:SJ cbx_lpm_mux 2014:03:12:18:15:30:SJ cbx_mgl 2014:03:12:18:25:18:SJ cbx_stratix 2014:03:12:18:15:31:SJ cbx_stratixii 2014:03:12:18:15:31:SJ cbx_stratixiii 2014:03:12:18:15:32:SJ cbx_stratixv 2014:03:12:18:15:32:SJ cbx_util_mgl 2014:03:12:18:15:30:SJ  VERSION_END
//CBXI_INSTANCE_NAME="CHIP_ETH10G_TOP_ETH10G_TOP_ETH10G_TOP_eth_10g_design_example_0_eth_10g_design_example_0_altera_xcvr_10gbaser_altera_10gbaser_siv_10gbaser_xcvr_siv_xcvr_with_pma_ctrl_siv_10gbaser_pcs_pma_map_pcs_pma_inst_pll_siv_xgmii_pll_siv_xgmii_clk_altpll_altpll_component"
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



//synthesis_resources = generic_pll 1 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  pll_ex_altpll
	( 
	areset,
	clk,
	fbout,
	inclk,
	locked) /* synthesis synthesis_clearbox=1 */;
	input   areset;
	output   [9:0]  clk;
	output   fbout;
	input   [1:0]  inclk;
	output   locked;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   areset;
	tri0   [1:0]  inclk;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  wire_generic_pll1_fboutclk;
	wire  wire_generic_pll1_locked;
	wire  wire_generic_pll1_outclk;
	wire  fb_clkin;

	generic_pll   generic_pll1
	( 
	.fbclk(fb_clkin),
	.fboutclk(wire_generic_pll1_fboutclk),
	.locked(wire_generic_pll1_locked),
	.outclk(wire_generic_pll1_outclk),
	.refclk(inclk[0]),
	.rst(areset));
	defparam
		generic_pll1.duty_cycle = 50,
		generic_pll1.output_clock_frequency = "6397 ps",
		generic_pll1.phase_shift = "0 ps",
		generic_pll1.reference_clock_frequency = "1551 ps",
		generic_pll1.lpm_type = "generic_pll";
	assign
		clk = {{9{1'b0}}, wire_generic_pll1_outclk},
		fb_clkin = wire_generic_pll1_fboutclk,
		fbout = fb_clkin,
		locked = wire_generic_pll1_locked;
endmodule //pll_ex_altpll
//VALID FILE
