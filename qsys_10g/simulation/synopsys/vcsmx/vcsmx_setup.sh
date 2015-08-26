
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
# vcsmx - auto-generated simulation script

# ----------------------------------------
# initialize variables
TOP_LEVEL_NAME="qsys_10g"
QSYS_SIMDIR="./../../"
QUARTUS_INSTALL_DIR="C:/altera/14.0/quartus/"
SKIP_FILE_COPY=0
SKIP_DEV_COM=0
SKIP_COM=0
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
# create compilation libraries
mkdir -p ./libraries/work/
mkdir -p ./libraries/rsp_mux/
mkdir -p ./libraries/rsp_demux/
mkdir -p ./libraries/cmd_mux/
mkdir -p ./libraries/cmd_demux/
mkdir -p ./libraries/router_001/
mkdir -p ./libraries/router/
mkdir -p ./libraries/crosser/
mkdir -p ./libraries/altera_avalon_mm_bridge_avalon_universal_master_0_limiter/
mkdir -p ./libraries/mm_interconnect_0/
mkdir -p ./libraries/line_lb_timing_adapter/
mkdir -p ./libraries/line_loopback/
mkdir -p ./libraries/lc_splitter_timing_adapter/
mkdir -p ./libraries/mm_interconnect_2/
mkdir -p ./libraries/mm_interconnect_1/
mkdir -p ./libraries/rxtx_timing_adapter_pauselen_tx/
mkdir -p ./libraries/rxtx_timing_adapter_pauselen_rx/
mkdir -p ./libraries/txrx_timing_adapter_link_fault_status_export/
mkdir -p ./libraries/txrx_timing_adapter_link_fault_status_rx/
mkdir -p ./libraries/rx_st_error_adapter_stat/
mkdir -p ./libraries/rx_eth_crc_pad_rem/
mkdir -p ./libraries/rx_timing_adapter_frame_status_out_frame_decoder/
mkdir -p ./libraries/rx_st_timing_adapter_frame_status_in/
mkdir -p ./libraries/rx_register_map/
mkdir -p ./libraries/tx_st_timing_adapter_splitter_out_0/
mkdir -p ./libraries/tx_st_timing_adapter_splitter_in/
mkdir -p ./libraries/tx_st_status_output_delay_to_statistic/
mkdir -p ./libraries/tx_st_timing_adapter_splitter_status_output/
mkdir -p ./libraries/tx_st_timing_adapter_splitter_status_in/
mkdir -p ./libraries/tx_st_error_adapter_stat/
mkdir -p ./libraries/tx_eth_frame_decoder/
mkdir -p ./libraries/tx_st_timing_adapter_frame_decoder/
mkdir -p ./libraries/tx_st_splitter_1/
mkdir -p ./libraries/tx_st_pipeline_stage_rs/
mkdir -p ./libraries/tx_st_mux_flow_control_user_frame/
mkdir -p ./libraries/tx_st_pause_ctrl_error_adapter/
mkdir -p ./libraries/tx_register_map/
mkdir -p ./libraries/eth_10g_design_example_0_mm_pipeline_bridge_burst_adapter/
mkdir -p ./libraries/eth_10g_design_example_0_mm_pipeline_bridge_agent/
mkdir -p ./libraries/mm_bridge_m0_agent/
mkdir -p ./libraries/eth_10g_design_example_0_mm_pipeline_bridge_translator/
mkdir -p ./libraries/eth_mdio/
mkdir -p ./libraries/eth_fifo_pause_ctrl_adapter/
mkdir -p ./libraries/pa_pg_after_timing_adapter/
mkdir -p ./libraries/pa_pg_before_timing_adapter/
mkdir -p ./libraries/dc_fifo_pause_adapt_pause_gen/
mkdir -p ./libraries/tx_sc_fifo/
mkdir -p ./libraries/eth_loopback_composed/
mkdir -p ./libraries/eth_10g_mac/
mkdir -p ./libraries/altera_10gbaser/
mkdir -p ./libraries/altera_avalon_mm_bridge/
mkdir -p ./libraries/rst_controller/
mkdir -p ./libraries/mm_bridge/
mkdir -p ./libraries/eth_10g_design_example_0/
mkdir -p ./libraries/altera_ver/
mkdir -p ./libraries/lpm_ver/
mkdir -p ./libraries/sgate_ver/
mkdir -p ./libraries/altera_mf_ver/
mkdir -p ./libraries/altera_lnsim_ver/
mkdir -p ./libraries/arriav_ver/
mkdir -p ./libraries/arriav_hssi_ver/
mkdir -p ./libraries/arriav_pcie_hip_ver/

# ----------------------------------------
# copy RAM/ROM files to simulation directory

# ----------------------------------------
# compile device library files
if [ $SKIP_DEV_COM -eq 0 ]; then
  vlogan +v2k           "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.v"                     -work altera_ver         
  vlogan +v2k           "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v"                              -work lpm_ver            
  vlogan +v2k           "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.v"                                 -work sgate_ver          
  vlogan +v2k           "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.v"                             -work altera_mf_ver      
  vlogan +v2k -sverilog "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv"                         -work altera_lnsim_ver   
  vlogan +v2k           "$QUARTUS_INSTALL_DIR/eda/sim_lib/synopsys/arriav_atoms_ncrypt.v"          -work arriav_ver         
  vlogan +v2k           "$QUARTUS_INSTALL_DIR/eda/sim_lib/synopsys/arriav_hmi_atoms_ncrypt.v"      -work arriav_ver         
  vlogan +v2k           "$QUARTUS_INSTALL_DIR/eda/sim_lib/arriav_atoms.v"                          -work arriav_ver         
  vlogan +v2k           "$QUARTUS_INSTALL_DIR/eda/sim_lib/synopsys/arriav_hssi_atoms_ncrypt.v"     -work arriav_hssi_ver    
  vlogan +v2k           "$QUARTUS_INSTALL_DIR/eda/sim_lib/arriav_hssi_atoms.v"                     -work arriav_hssi_ver    
  vlogan +v2k           "$QUARTUS_INSTALL_DIR/eda/sim_lib/synopsys/arriav_pcie_hip_atoms_ncrypt.v" -work arriav_pcie_hip_ver
  vlogan +v2k           "$QUARTUS_INSTALL_DIR/eda/sim_lib/arriav_pcie_hip_atoms.v"                 -work arriav_pcie_hip_ver
fi

# ----------------------------------------
# compile design files in correct order
if [ $SKIP_COM -eq 0 ]; then
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                                       -work rsp_mux                                                  
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_loopback_composed_mm_interconnect_0_rsp_mux.sv"              -work rsp_mux                                                  
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_loopback_composed_mm_interconnect_0_rsp_demux.sv"            -work rsp_demux                                                
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                                       -work cmd_mux                                                  
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_loopback_composed_mm_interconnect_0_cmd_mux.sv"              -work cmd_mux                                                  
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_loopback_composed_mm_interconnect_0_cmd_demux.sv"            -work cmd_demux                                                
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_loopback_composed_mm_interconnect_0_router_001.sv"           -work router_001                                               
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_loopback_composed_mm_interconnect_0_router.sv"               -work router                                                   
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                                       -work rsp_mux                                                  
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_2_rsp_mux.sv"                        -work rsp_mux                                                  
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_2_rsp_demux.sv"                      -work rsp_demux                                                
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                                       -work cmd_mux                                                  
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_2_cmd_mux.sv"                        -work cmd_mux                                                  
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_2_cmd_demux.sv"                      -work cmd_demux                                                
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_2_router_001.sv"                     -work router_001                                               
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_2_router.sv"                         -work router                                                   
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                                       -work rsp_mux                                                  
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_1_rsp_mux.sv"                        -work rsp_mux                                                  
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_1_rsp_demux.sv"                      -work rsp_demux                                                
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                                       -work cmd_mux                                                  
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_1_cmd_mux.sv"                        -work cmd_mux                                                  
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_1_cmd_demux.sv"                      -work cmd_demux                                                
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_1_router_001.sv"                     -work router_001                                               
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_1_router.sv"                         -work router                                                   
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                                       -work rsp_mux                                                  
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_0_rsp_mux.sv"                        -work rsp_mux                                                  
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_0_rsp_demux.sv"                      -work rsp_demux                                                
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                                       -work cmd_mux                                                  
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_0_cmd_mux.sv"                        -work cmd_mux                                                  
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_0_cmd_demux.sv"                      -work cmd_demux                                                
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_0_router_001.sv"                     -work router_001                                               
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_0_router.sv"                         -work router                                                   
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_avalon_st_handshake_clock_crosser.v"                                                        -work crosser                                                  
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_avalon_st_clock_crosser.v"                                                                  -work crosser                                                  
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_base.v"                                                                  -work crosser                                                  
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                                       -work rsp_mux                                                  
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_mm_interconnect_0_rsp_mux.sv"                                    -work rsp_mux                                                  
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_mm_interconnect_0_rsp_demux.sv"                                  -work rsp_demux                                                
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                                       -work cmd_mux                                                  
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_mm_interconnect_0_cmd_mux.sv"                                    -work cmd_mux                                                  
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_mm_interconnect_0_cmd_demux.sv"                                  -work cmd_demux                                                
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_merlin_traffic_limiter.sv"                                                                  -work altera_avalon_mm_bridge_avalon_universal_master_0_limiter
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_merlin_reorder_memory.sv"                                                                   -work altera_avalon_mm_bridge_avalon_universal_master_0_limiter
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_avalon_sc_fifo.v"                                                                           -work altera_avalon_mm_bridge_avalon_universal_master_0_limiter
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_base.v"                                                                  -work altera_avalon_mm_bridge_avalon_universal_master_0_limiter
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_mm_interconnect_0_router_001.sv"                                 -work router_001                                               
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_mm_interconnect_0_router.sv"                                     -work router                                                   
  vlogan +v2k           "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_loopback_composed_mm_interconnect_0.v"                       -work mm_interconnect_0                                        
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_loopback_composed_line_lb_timing_adapter.sv"                 -work line_lb_timing_adapter                                   
  vlogan +v2k           "$QSYS_SIMDIR/submodules/altera_eth_loopback.v"                                                                             -work line_loopback                                            
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_loopback_composed_lc_splitter_timing_adapter.sv"             -work lc_splitter_timing_adapter                               
  vlogan +v2k           "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_2.v"                                 -work mm_interconnect_2                                        
  vlogan +v2k           "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_1.v"                                 -work mm_interconnect_1                                        
  vlogan +v2k           "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_0.v"                                 -work mm_interconnect_0                                        
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_rxtx_timing_adapter_pauselen_tx.sv"                  -work rxtx_timing_adapter_pauselen_tx                          
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_rxtx_timing_adapter_pauselen_rx.sv"                  -work rxtx_timing_adapter_pauselen_rx                          
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_txrx_timing_adapter_link_fault_status_export.sv"     -work txrx_timing_adapter_link_fault_status_export             
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_txrx_timing_adapter_link_fault_status_rx.sv"         -work txrx_timing_adapter_link_fault_status_rx                 
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_rx_st_error_adapter_stat.sv"                         -work rx_st_error_adapter_stat                                 
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_stage.sv"                                                                -work rx_eth_crc_pad_rem                                       
  vlogan +v2k           "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_base.v"                                                                  -work rx_eth_crc_pad_rem                                       
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_rx_timing_adapter_frame_status_out_frame_decoder.sv" -work rx_timing_adapter_frame_status_out_frame_decoder         
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_rx_st_timing_adapter_frame_status_in.sv"             -work rx_st_timing_adapter_frame_status_in                     
  vlogan +v2k           "$QSYS_SIMDIR/submodules/altera_avalon_st_clock_crosser.v"                                                                  -work rx_register_map                                          
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_tx_st_timing_adapter_splitter_out_0.sv"              -work tx_st_timing_adapter_splitter_out_0                      
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_tx_st_timing_adapter_splitter_in.sv"                 -work tx_st_timing_adapter_splitter_in                         
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_avalon_st_delay.sv"                                                                         -work tx_st_status_output_delay_to_statistic                   
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_tx_st_timing_adapter_splitter_status_output.sv"      -work tx_st_timing_adapter_splitter_status_output              
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_tx_st_timing_adapter_splitter_status_in.sv"          -work tx_st_timing_adapter_splitter_status_in                  
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_tx_st_error_adapter_stat.sv"                         -work tx_st_error_adapter_stat                                 
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_stage.sv"                                                                -work tx_eth_frame_decoder                                     
  vlogan +v2k           "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_base.v"                                                                  -work tx_eth_frame_decoder                                     
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_tx_st_timing_adapter_frame_decoder.sv"               -work tx_st_timing_adapter_frame_decoder                       
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_avalon_st_splitter.sv"                                                                      -work tx_st_splitter_1                                         
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_stage.sv"                                                                -work tx_st_pipeline_stage_rs                                  
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_base.v"                                                                  -work tx_st_pipeline_stage_rs                                  
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_tx_st_mux_flow_control_user_frame.sv"                -work tx_st_mux_flow_control_user_frame                        
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_tx_st_pause_ctrl_error_adapter.sv"                   -work tx_st_pause_ctrl_error_adapter                           
  vlogan +v2k           "$QSYS_SIMDIR/submodules/altera_avalon_st_clock_crosser.v"                                                                  -work tx_register_map                                          
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                                       -work rsp_mux                                                  
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/qsys_10g_mm_interconnect_0_rsp_mux.sv"                                                             -work rsp_mux                                                  
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                                       -work cmd_mux                                                  
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/qsys_10g_mm_interconnect_0_cmd_mux.sv"                                                             -work cmd_mux                                                  
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/qsys_10g_mm_interconnect_0_cmd_demux.sv"                                                           -work cmd_demux                                                
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_merlin_burst_adapter_13_1.sv"                                                               -work eth_10g_design_example_0_mm_pipeline_bridge_burst_adapter
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_merlin_burst_adapter.sv"                                                                    -work eth_10g_design_example_0_mm_pipeline_bridge_burst_adapter
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_merlin_burst_adapter_new.sv"                                                                -work eth_10g_design_example_0_mm_pipeline_bridge_burst_adapter
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_merlin_address_alignment.sv"                                                                -work eth_10g_design_example_0_mm_pipeline_bridge_burst_adapter
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_wrap_burst_converter.sv"                                                                    -work eth_10g_design_example_0_mm_pipeline_bridge_burst_adapter
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_incr_burst_converter.sv"                                                                    -work eth_10g_design_example_0_mm_pipeline_bridge_burst_adapter
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_default_burst_converter.sv"                                                                 -work eth_10g_design_example_0_mm_pipeline_bridge_burst_adapter
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_stage.sv"                                                                -work eth_10g_design_example_0_mm_pipeline_bridge_burst_adapter
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_base.v"                                                                  -work eth_10g_design_example_0_mm_pipeline_bridge_burst_adapter
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/qsys_10g_mm_interconnect_0_router_001.sv"                                                          -work router_001                                               
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/qsys_10g_mm_interconnect_0_router.sv"                                                              -work router                                                   
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_merlin_slave_agent.sv"                                                                      -work eth_10g_design_example_0_mm_pipeline_bridge_agent        
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_merlin_burst_uncompressor.sv"                                                               -work eth_10g_design_example_0_mm_pipeline_bridge_agent        
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_merlin_master_agent.sv"                                                                     -work mm_bridge_m0_agent                                       
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_merlin_slave_translator.sv"                                                                 -work eth_10g_design_example_0_mm_pipeline_bridge_translator   
  vlogan +v2k           "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_mm_interconnect_0.v"                                             -work mm_interconnect_0                                        
  vlogan +v2k           "$QSYS_SIMDIR/submodules/altera_eth_mdio.v"                                                                                 -work eth_mdio                                                 
  vlogan +v2k           "$QSYS_SIMDIR/submodules/altera_eth_fifo_pause_ctrl_adapter.v"                                                              -work eth_fifo_pause_ctrl_adapter                              
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_pa_pg_after_timing_adapter.sv"                                   -work pa_pg_after_timing_adapter                               
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_pa_pg_before_timing_adapter.sv"                                  -work pa_pg_before_timing_adapter                              
  vlogan +v2k           "$QSYS_SIMDIR/submodules/altera_avalon_dc_fifo.v"                                                                           -work dc_fifo_pause_adapt_pause_gen                            
  vlogan +v2k           "$QSYS_SIMDIR/submodules/altera_dcfifo_synchronizer_bundle.v"                                                               -work dc_fifo_pause_adapt_pause_gen                            
  vlogan +v2k           "$QSYS_SIMDIR/submodules/altera_avalon_sc_fifo.v"                                                                           -work tx_sc_fifo                                               
  vlogan +v2k           "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_loopback_composed.v"                                         -work eth_loopback_composed                                    
  vlogan +v2k           "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac.v"                                                   -work eth_10g_mac                                              
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_xcvr_functions.sv"                                                                          -work altera_10gbaser                                          
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/alt_reset_ctrl_lego.sv"                                                                            -work altera_10gbaser                                          
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/alt_reset_ctrl_tgx_cdrauto.sv"                                                                     -work altera_10gbaser                                          
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/alt_xcvr_resync.sv"                                                                                -work altera_10gbaser                                          
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/alt_xcvr_csr_common_h.sv"                                                                          -work altera_10gbaser                                          
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/alt_xcvr_csr_common.sv"                                                                            -work altera_10gbaser                                          
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/alt_xcvr_csr_pcs8g_h.sv"                                                                           -work altera_10gbaser                                          
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/alt_xcvr_csr_pcs8g.sv"                                                                             -work altera_10gbaser                                          
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/alt_xcvr_csr_selector.sv"                                                                          -work altera_10gbaser                                          
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/alt_xcvr_mgmt2dec.sv"                                                                              -work altera_10gbaser                                          
  vlogan +v2k           "$QSYS_SIMDIR/submodules/altera_wait_generate.v"                                                                            -work altera_10gbaser                                          
  vlogan +v2k           "$QSYS_SIMDIR/submodules/altera_avalon_st_handshake_clock_crosser.v"                                                        -work altera_10gbaser                                          
  vlogan +v2k           "$QSYS_SIMDIR/submodules/altera_avalon_st_clock_crosser.v"                                                                  -work altera_10gbaser                                          
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_stage.sv"                                                                -work altera_10gbaser                                          
  vlogan +v2k           "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_base.v"                                                                  -work altera_10gbaser                                          
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/csr_pcs10gbaser_h.sv"                                                                              -work altera_10gbaser                                          
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/csr_pcs10gbaser.sv"                                                                                -work altera_10gbaser                                          
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/sv_reconfig_bundle_to_xcvr.sv"                                                                     -work altera_10gbaser                                          
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/sv_reconfig_bundle_to_ip.sv"                                                                       -work altera_10gbaser                                          
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/sv_reconfig_bundle_merger.sv"                                                                      -work altera_10gbaser                                          
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/av_xcvr_h.sv"                                                                                      -work altera_10gbaser                                          
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/av_xcvr_avmm_csr.sv"                                                                               -work altera_10gbaser                                          
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/av_tx_pma_ch.sv"                                                                                   -work altera_10gbaser                                          
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/av_tx_pma.sv"                                                                                      -work altera_10gbaser                                          
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/av_rx_pma.sv"                                                                                      -work altera_10gbaser                                          
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/av_pma.sv"                                                                                         -work altera_10gbaser                                          
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/av_pcs_ch.sv"                                                                                      -work altera_10gbaser                                          
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/av_pcs.sv"                                                                                         -work altera_10gbaser                                          
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/av_xcvr_avmm.sv"                                                                                   -work altera_10gbaser                                          
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/av_xcvr_native.sv"                                                                                 -work altera_10gbaser                                          
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/av_xcvr_plls.sv"                                                                                   -work altera_10gbaser                                          
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/av_xcvr_data_adapter.sv"                                                                           -work altera_10gbaser                                          
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/av_reconfig_bundle_to_basic.sv"                                                                    -work altera_10gbaser                                          
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/av_reconfig_bundle_to_xcvr.sv"                                                                     -work altera_10gbaser                                          
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/av_hssi_8g_rx_pcs_rbc.sv"                                                                          -work altera_10gbaser                                          
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/av_hssi_8g_tx_pcs_rbc.sv"                                                                          -work altera_10gbaser                                          
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/av_hssi_common_pcs_pma_interface_rbc.sv"                                                           -work altera_10gbaser                                          
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/av_hssi_common_pld_pcs_interface_rbc.sv"                                                           -work altera_10gbaser                                          
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/av_hssi_pipe_gen1_2_rbc.sv"                                                                        -work altera_10gbaser                                          
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/av_hssi_rx_pcs_pma_interface_rbc.sv"                                                               -work altera_10gbaser                                          
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/av_hssi_rx_pld_pcs_interface_rbc.sv"                                                               -work altera_10gbaser                                          
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/av_hssi_tx_pcs_pma_interface_rbc.sv"                                                               -work altera_10gbaser                                          
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/av_hssi_tx_pld_pcs_interface_rbc.sv"                                                               -work altera_10gbaser                                          
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/av_xcvr_10gbaser_nr.sv"                                                                            -work altera_10gbaser                                          
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/av_xcvr_10gbaser_native.sv"                                                                        -work altera_10gbaser                                          
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_xcvr_native_av_functions_h.sv"                                                              -work altera_10gbaser                                          
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_xcvr_native_av.sv"                                                                          -work altera_10gbaser                                          
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_xcvr_10gbaser.sv"                                                                           -work altera_10gbaser                                          
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_xcvr_reset_control.sv"                                                                      -work altera_10gbaser                                          
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/alt_xcvr_reset_counter.sv"                                                                         -work altera_10gbaser                                          
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/alt_xcvr_arbiter.sv"                                                                               -work altera_10gbaser                                          
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/alt_xcvr_m2s.sv"                                                                                   -work altera_10gbaser                                          
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_merlin_master_translator.sv"                                                                -work altera_avalon_mm_bridge                                  
  vlogan +v2k           "$QSYS_SIMDIR/submodules/altera_reset_controller.v"                                                                         -work rst_controller                                           
  vlogan +v2k           "$QSYS_SIMDIR/submodules/altera_reset_synchronizer.v"                                                                       -work rst_controller                                           
  vlogan +v2k           "$QSYS_SIMDIR/submodules/qsys_10g_mm_interconnect_0.v"                                                                      -work mm_interconnect_0                                        
  vlogan +v2k           "$QSYS_SIMDIR/submodules/altera_avalon_mm_bridge.v"                                                                         -work mm_bridge                                                
  vlogan +v2k           "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0.v"                                                               -work eth_10g_design_example_0                                 
  vlogan +v2k           "$QSYS_SIMDIR/qsys_10g.v"                                                                                                                                                                  
fi

# ----------------------------------------
# elaborate top level design
if [ $SKIP_ELAB -eq 0 ]; then
  vcs -lca -t ps $ELAB_OPTIONS $USER_DEFINED_ELAB_OPTIONS $TOP_LEVEL_NAME
fi

# ----------------------------------------
# simulate
if [ $SKIP_SIM -eq 0 ]; then
  ./simv $SIM_OPTIONS $USER_DEFINED_SIM_OPTIONS
fi
