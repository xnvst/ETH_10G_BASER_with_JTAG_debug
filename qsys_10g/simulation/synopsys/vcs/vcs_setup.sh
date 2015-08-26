
# (C) 2001-2014 Altera Corporation. All rights reserved.
# Your use of Altera Corporation's design tools, logic functions and 
# other software and tools, and its AMPP partner logic functions, and 
# any output files any of the foregoing (including device programming 
# or simulation files), and any associated documentation or information 
# are expressly subject to the terms and conditions of the Altera 
# Program License Subscription Agreement, Altera MegaCore Function 
# License Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by Altera 
# or its authorized distributors. Please refer to the applicable 
# agreement for further details.

# ACDS 14.0 205 win32 2014.10.27.20:38:28

# ----------------------------------------
# vcs - auto-generated simulation script

# ----------------------------------------
# initialize variables
TOP_LEVEL_NAME="qsys_10g"
QSYS_SIMDIR="./../../"
QUARTUS_INSTALL_DIR="C:/altera/14.0/quartus/"
SKIP_FILE_COPY=0
SKIP_ELAB=0
SKIP_SIM=0
USER_DEFINED_ELAB_OPTIONS=""
USER_DEFINED_SIM_OPTIONS="+vcs+finish+100"
# ----------------------------------------
# overwrite variables - DO NOT MODIFY!
# This block evaluates each command line argument, typically used for 
# overwriting variables. An example usage:
#   sh <simulator>_setup.sh SKIP_ELAB=1 SKIP_SIM=1
for expression in "$@"; do
  eval $expression
  if [ $? -ne 0 ]; then
    echo "Error: This command line argument, \"$expression\", is/has an invalid expression." >&2
    exit $?
  fi
done

# ----------------------------------------
# initialize simulation properties - DO NOT MODIFY!
ELAB_OPTIONS=""
SIM_OPTIONS=""
if [[ `vcs -platform` != *"amd64"* ]]; then
  :
else
  :
fi

# ----------------------------------------
# copy RAM/ROM files to simulation directory

vcs -lca -timescale=1ps/1ps -sverilog +verilog2001ext+.v -ntb_opts dtm $ELAB_OPTIONS $USER_DEFINED_ELAB_OPTIONS \
  -v $QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.v \
  -v $QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v \
  -v $QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.v \
  -v $QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.v \
  $QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv \
  -v $QUARTUS_INSTALL_DIR/eda/sim_lib/synopsys/arriav_atoms_ncrypt.v \
  -v $QUARTUS_INSTALL_DIR/eda/sim_lib/synopsys/arriav_hmi_atoms_ncrypt.v \
  -v $QUARTUS_INSTALL_DIR/eda/sim_lib/arriav_atoms.v \
  -v $QUARTUS_INSTALL_DIR/eda/sim_lib/synopsys/arriav_hssi_atoms_ncrypt.v \
  -v $QUARTUS_INSTALL_DIR/eda/sim_lib/arriav_hssi_atoms.v \
  -v $QUARTUS_INSTALL_DIR/eda/sim_lib/synopsys/arriav_pcie_hip_atoms_ncrypt.v \
  -v $QUARTUS_INSTALL_DIR/eda/sim_lib/arriav_pcie_hip_atoms.v \
  $QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv \
  $QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_loopback_composed_mm_interconnect_0_rsp_mux.sv \
  $QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_loopback_composed_mm_interconnect_0_rsp_demux.sv \
  $QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_loopback_composed_mm_interconnect_0_cmd_mux.sv \
  $QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_loopback_composed_mm_interconnect_0_cmd_demux.sv \
  $QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_loopback_composed_mm_interconnect_0_router_001.sv \
  $QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_loopback_composed_mm_interconnect_0_router.sv \
  $QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_2_rsp_mux.sv \
  $QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_2_rsp_demux.sv \
  $QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_2_cmd_mux.sv \
  $QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_2_cmd_demux.sv \
  $QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_2_router_001.sv \
  $QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_2_router.sv \
  $QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_1_rsp_mux.sv \
  $QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_1_rsp_demux.sv \
  $QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_1_cmd_mux.sv \
  $QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_1_cmd_demux.sv \
  $QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_1_router_001.sv \
  $QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_1_router.sv \
  $QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_0_rsp_mux.sv \
  $QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_0_rsp_demux.sv \
  $QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_0_cmd_mux.sv \
  $QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_0_cmd_demux.sv \
  $QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_0_router_001.sv \
  $QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_0_router.sv \
  $QSYS_SIMDIR/submodules/altera_avalon_st_handshake_clock_crosser.v \
  $QSYS_SIMDIR/submodules/altera_avalon_st_clock_crosser.v \
  $QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_base.v \
  $QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_mm_interconnect_0_rsp_mux.sv \
  $QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_mm_interconnect_0_rsp_demux.sv \
  $QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_mm_interconnect_0_cmd_mux.sv \
  $QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_mm_interconnect_0_cmd_demux.sv \
  $QSYS_SIMDIR/submodules/altera_merlin_traffic_limiter.sv \
  $QSYS_SIMDIR/submodules/altera_merlin_reorder_memory.sv \
  $QSYS_SIMDIR/submodules/altera_avalon_sc_fifo.v \
  $QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_mm_interconnect_0_router_001.sv \
  $QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_mm_interconnect_0_router.sv \
  $QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_loopback_composed_mm_interconnect_0.v \
  $QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_loopback_composed_line_lb_timing_adapter.sv \
  $QSYS_SIMDIR/submodules/altera_eth_loopback.v \
  $QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_loopback_composed_lc_splitter_timing_adapter.sv \
  $QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_2.v \
  $QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_1.v \
  $QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_0.v \
  $QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_rxtx_timing_adapter_pauselen_tx.sv \
  $QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_rxtx_timing_adapter_pauselen_rx.sv \
  $QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_txrx_timing_adapter_link_fault_status_export.sv \
  $QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_txrx_timing_adapter_link_fault_status_rx.sv \
  $QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_rx_st_error_adapter_stat.sv \
  $QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_stage.sv \
  $QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_rx_timing_adapter_frame_status_out_frame_decoder.sv \
  $QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_rx_st_timing_adapter_frame_status_in.sv \
  $QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_tx_st_timing_adapter_splitter_out_0.sv \
  $QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_tx_st_timing_adapter_splitter_in.sv \
  $QSYS_SIMDIR/submodules/altera_avalon_st_delay.sv \
  $QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_tx_st_timing_adapter_splitter_status_output.sv \
  $QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_tx_st_timing_adapter_splitter_status_in.sv \
  $QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_tx_st_error_adapter_stat.sv \
  $QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_tx_st_timing_adapter_frame_decoder.sv \
  $QSYS_SIMDIR/submodules/altera_avalon_st_splitter.sv \
  $QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_tx_st_mux_flow_control_user_frame.sv \
  $QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_tx_st_pause_ctrl_error_adapter.sv \
  $QSYS_SIMDIR/submodules/qsys_10g_mm_interconnect_0_rsp_mux.sv \
  $QSYS_SIMDIR/submodules/qsys_10g_mm_interconnect_0_cmd_mux.sv \
  $QSYS_SIMDIR/submodules/qsys_10g_mm_interconnect_0_cmd_demux.sv \
  $QSYS_SIMDIR/submodules/altera_merlin_burst_adapter_13_1.sv \
  $QSYS_SIMDIR/submodules/altera_merlin_burst_adapter.sv \
  $QSYS_SIMDIR/submodules/altera_merlin_burst_adapter_new.sv \
  $QSYS_SIMDIR/submodules/altera_merlin_address_alignment.sv \
  $QSYS_SIMDIR/submodules/altera_wrap_burst_converter.sv \
  $QSYS_SIMDIR/submodules/altera_incr_burst_converter.sv \
  $QSYS_SIMDIR/submodules/altera_default_burst_converter.sv \
  $QSYS_SIMDIR/submodules/qsys_10g_mm_interconnect_0_router_001.sv \
  $QSYS_SIMDIR/submodules/qsys_10g_mm_interconnect_0_router.sv \
  $QSYS_SIMDIR/submodules/altera_merlin_slave_agent.sv \
  $QSYS_SIMDIR/submodules/altera_merlin_burst_uncompressor.sv \
  $QSYS_SIMDIR/submodules/altera_merlin_master_agent.sv \
  $QSYS_SIMDIR/submodules/altera_merlin_slave_translator.sv \
  $QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_mm_interconnect_0.v \
  $QSYS_SIMDIR/submodules/altera_eth_mdio.v \
  $QSYS_SIMDIR/submodules/altera_eth_fifo_pause_ctrl_adapter.v \
  $QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_pa_pg_after_timing_adapter.sv \
  $QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_pa_pg_before_timing_adapter.sv \
  $QSYS_SIMDIR/submodules/altera_avalon_dc_fifo.v \
  $QSYS_SIMDIR/submodules/altera_dcfifo_synchronizer_bundle.v \
  $QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_loopback_composed.v \
  $QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac.v \
  $QSYS_SIMDIR/submodules/altera_xcvr_functions.sv \
  $QSYS_SIMDIR/submodules/alt_reset_ctrl_lego.sv \
  $QSYS_SIMDIR/submodules/alt_reset_ctrl_tgx_cdrauto.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_resync.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_csr_common_h.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_csr_common.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_csr_pcs8g_h.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_csr_pcs8g.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_csr_selector.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_mgmt2dec.sv \
  $QSYS_SIMDIR/submodules/altera_wait_generate.v \
  $QSYS_SIMDIR/submodules/csr_pcs10gbaser_h.sv \
  $QSYS_SIMDIR/submodules/csr_pcs10gbaser.sv \
  $QSYS_SIMDIR/submodules/sv_reconfig_bundle_to_xcvr.sv \
  $QSYS_SIMDIR/submodules/sv_reconfig_bundle_to_ip.sv \
  $QSYS_SIMDIR/submodules/sv_reconfig_bundle_merger.sv \
  $QSYS_SIMDIR/submodules/av_xcvr_h.sv \
  $QSYS_SIMDIR/submodules/av_xcvr_avmm_csr.sv \
  $QSYS_SIMDIR/submodules/av_tx_pma_ch.sv \
  $QSYS_SIMDIR/submodules/av_tx_pma.sv \
  $QSYS_SIMDIR/submodules/av_rx_pma.sv \
  $QSYS_SIMDIR/submodules/av_pma.sv \
  $QSYS_SIMDIR/submodules/av_pcs_ch.sv \
  $QSYS_SIMDIR/submodules/av_pcs.sv \
  $QSYS_SIMDIR/submodules/av_xcvr_avmm.sv \
  $QSYS_SIMDIR/submodules/av_xcvr_native.sv \
  $QSYS_SIMDIR/submodules/av_xcvr_plls.sv \
  $QSYS_SIMDIR/submodules/av_xcvr_data_adapter.sv \
  $QSYS_SIMDIR/submodules/av_reconfig_bundle_to_basic.sv \
  $QSYS_SIMDIR/submodules/av_reconfig_bundle_to_xcvr.sv \
  $QSYS_SIMDIR/submodules/av_hssi_8g_rx_pcs_rbc.sv \
  $QSYS_SIMDIR/submodules/av_hssi_8g_tx_pcs_rbc.sv \
  $QSYS_SIMDIR/submodules/av_hssi_common_pcs_pma_interface_rbc.sv \
  $QSYS_SIMDIR/submodules/av_hssi_common_pld_pcs_interface_rbc.sv \
  $QSYS_SIMDIR/submodules/av_hssi_pipe_gen1_2_rbc.sv \
  $QSYS_SIMDIR/submodules/av_hssi_rx_pcs_pma_interface_rbc.sv \
  $QSYS_SIMDIR/submodules/av_hssi_rx_pld_pcs_interface_rbc.sv \
  $QSYS_SIMDIR/submodules/av_hssi_tx_pcs_pma_interface_rbc.sv \
  $QSYS_SIMDIR/submodules/av_hssi_tx_pld_pcs_interface_rbc.sv \
  $QSYS_SIMDIR/submodules/av_xcvr_10gbaser_nr.sv \
  $QSYS_SIMDIR/submodules/av_xcvr_10gbaser_native.sv \
  $QSYS_SIMDIR/submodules/altera_xcvr_native_av_functions_h.sv \
  $QSYS_SIMDIR/submodules/altera_xcvr_native_av.sv \
  $QSYS_SIMDIR/submodules/altera_xcvr_10gbaser.sv \
  $QSYS_SIMDIR/submodules/altera_xcvr_reset_control.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_reset_counter.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_arbiter.sv \
  $QSYS_SIMDIR/submodules/alt_xcvr_m2s.sv \
  $QSYS_SIMDIR/submodules/altera_merlin_master_translator.sv \
  $QSYS_SIMDIR/submodules/altera_reset_controller.v \
  $QSYS_SIMDIR/submodules/altera_reset_synchronizer.v \
  $QSYS_SIMDIR/submodules/qsys_10g_mm_interconnect_0.v \
  $QSYS_SIMDIR/submodules/altera_avalon_mm_bridge.v \
  $QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0.v \
  $QSYS_SIMDIR/qsys_10g.v \
  -top $TOP_LEVEL_NAME
# ----------------------------------------
# simulate
if [ $SKIP_SIM -eq 0 ]; then
  ./simv $SIM_OPTIONS $USER_DEFINED_SIM_OPTIONS
fi
