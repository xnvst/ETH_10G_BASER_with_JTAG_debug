
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
# Auto-generated simulation script

# ----------------------------------------
# Initialize variables
if ![info exists SYSTEM_INSTANCE_NAME] { 
  set SYSTEM_INSTANCE_NAME ""
} elseif { ![ string match "" $SYSTEM_INSTANCE_NAME ] } { 
  set SYSTEM_INSTANCE_NAME "/$SYSTEM_INSTANCE_NAME"
}

if ![info exists TOP_LEVEL_NAME] { 
  set TOP_LEVEL_NAME "qsys_10g"
}

if ![info exists QSYS_SIMDIR] { 
  set QSYS_SIMDIR "./../"
}

if ![info exists QUARTUS_INSTALL_DIR] { 
  set QUARTUS_INSTALL_DIR "C:/altera/14.0/quartus/"
}

# ----------------------------------------
# Initialize simulation properties - DO NOT MODIFY!
set ELAB_OPTIONS ""
set SIM_OPTIONS ""
if ![ string match "*-64 vsim*" [ vsim -version ] ] {
} else {
}

# ----------------------------------------
# Copy ROM/RAM files to simulation directory
alias file_copy {
  echo "\[exec\] file_copy"
}

# ----------------------------------------
# Create compilation libraries
proc ensure_lib { lib } { if ![file isdirectory $lib] { vlib $lib } }
ensure_lib          ./libraries/     
ensure_lib          ./libraries/work/
vmap       work     ./libraries/work/
vmap       work_lib ./libraries/work/
if ![ string match "*ModelSim ALTERA*" [ vsim -version ] ] {
  ensure_lib                     ./libraries/altera_ver/         
  vmap       altera_ver          ./libraries/altera_ver/         
  ensure_lib                     ./libraries/lpm_ver/            
  vmap       lpm_ver             ./libraries/lpm_ver/            
  ensure_lib                     ./libraries/sgate_ver/          
  vmap       sgate_ver           ./libraries/sgate_ver/          
  ensure_lib                     ./libraries/altera_mf_ver/      
  vmap       altera_mf_ver       ./libraries/altera_mf_ver/      
  ensure_lib                     ./libraries/altera_lnsim_ver/   
  vmap       altera_lnsim_ver    ./libraries/altera_lnsim_ver/   
  ensure_lib                     ./libraries/arriav_ver/         
  vmap       arriav_ver          ./libraries/arriav_ver/         
  ensure_lib                     ./libraries/arriav_hssi_ver/    
  vmap       arriav_hssi_ver     ./libraries/arriav_hssi_ver/    
  ensure_lib                     ./libraries/arriav_pcie_hip_ver/
  vmap       arriav_pcie_hip_ver ./libraries/arriav_pcie_hip_ver/
}
ensure_lib                                                           ./libraries/rsp_mux/                                                  
vmap       rsp_mux                                                   ./libraries/rsp_mux/                                                  
ensure_lib                                                           ./libraries/rsp_demux/                                                
vmap       rsp_demux                                                 ./libraries/rsp_demux/                                                
ensure_lib                                                           ./libraries/cmd_mux/                                                  
vmap       cmd_mux                                                   ./libraries/cmd_mux/                                                  
ensure_lib                                                           ./libraries/cmd_demux/                                                
vmap       cmd_demux                                                 ./libraries/cmd_demux/                                                
ensure_lib                                                           ./libraries/router_001/                                               
vmap       router_001                                                ./libraries/router_001/                                               
ensure_lib                                                           ./libraries/router/                                                   
vmap       router                                                    ./libraries/router/                                                   
ensure_lib                                                           ./libraries/crosser/                                                  
vmap       crosser                                                   ./libraries/crosser/                                                  
ensure_lib                                                           ./libraries/altera_avalon_mm_bridge_avalon_universal_master_0_limiter/
vmap       altera_avalon_mm_bridge_avalon_universal_master_0_limiter ./libraries/altera_avalon_mm_bridge_avalon_universal_master_0_limiter/
ensure_lib                                                           ./libraries/mm_interconnect_0/                                        
vmap       mm_interconnect_0                                         ./libraries/mm_interconnect_0/                                        
ensure_lib                                                           ./libraries/line_lb_timing_adapter/                                   
vmap       line_lb_timing_adapter                                    ./libraries/line_lb_timing_adapter/                                   
ensure_lib                                                           ./libraries/line_loopback/                                            
vmap       line_loopback                                             ./libraries/line_loopback/                                            
ensure_lib                                                           ./libraries/lc_splitter_timing_adapter/                               
vmap       lc_splitter_timing_adapter                                ./libraries/lc_splitter_timing_adapter/                               
ensure_lib                                                           ./libraries/mm_interconnect_2/                                        
vmap       mm_interconnect_2                                         ./libraries/mm_interconnect_2/                                        
ensure_lib                                                           ./libraries/mm_interconnect_1/                                        
vmap       mm_interconnect_1                                         ./libraries/mm_interconnect_1/                                        
ensure_lib                                                           ./libraries/rxtx_timing_adapter_pauselen_tx/                          
vmap       rxtx_timing_adapter_pauselen_tx                           ./libraries/rxtx_timing_adapter_pauselen_tx/                          
ensure_lib                                                           ./libraries/rxtx_timing_adapter_pauselen_rx/                          
vmap       rxtx_timing_adapter_pauselen_rx                           ./libraries/rxtx_timing_adapter_pauselen_rx/                          
ensure_lib                                                           ./libraries/txrx_timing_adapter_link_fault_status_export/             
vmap       txrx_timing_adapter_link_fault_status_export              ./libraries/txrx_timing_adapter_link_fault_status_export/             
ensure_lib                                                           ./libraries/txrx_timing_adapter_link_fault_status_rx/                 
vmap       txrx_timing_adapter_link_fault_status_rx                  ./libraries/txrx_timing_adapter_link_fault_status_rx/                 
ensure_lib                                                           ./libraries/rx_st_error_adapter_stat/                                 
vmap       rx_st_error_adapter_stat                                  ./libraries/rx_st_error_adapter_stat/                                 
ensure_lib                                                           ./libraries/rx_eth_packet_overflow_control/                           
vmap       rx_eth_packet_overflow_control                            ./libraries/rx_eth_packet_overflow_control/                           
ensure_lib                                                           ./libraries/rx_eth_crc_pad_rem/                                       
vmap       rx_eth_crc_pad_rem                                        ./libraries/rx_eth_crc_pad_rem/                                       
ensure_lib                                                           ./libraries/rx_eth_frame_status_merger/                               
vmap       rx_eth_frame_status_merger                                ./libraries/rx_eth_frame_status_merger/                               
ensure_lib                                                           ./libraries/rx_timing_adapter_frame_status_out_frame_decoder/         
vmap       rx_timing_adapter_frame_status_out_frame_decoder          ./libraries/rx_timing_adapter_frame_status_out_frame_decoder/         
ensure_lib                                                           ./libraries/rx_st_timing_adapter_frame_status_in/                     
vmap       rx_st_timing_adapter_frame_status_in                      ./libraries/rx_st_timing_adapter_frame_status_in/                     
ensure_lib                                                           ./libraries/rx_eth_lane_decoder/                                      
vmap       rx_eth_lane_decoder                                       ./libraries/rx_eth_lane_decoder/                                      
ensure_lib                                                           ./libraries/rx_eth_link_fault_detection/                              
vmap       rx_eth_link_fault_detection                               ./libraries/rx_eth_link_fault_detection/                              
ensure_lib                                                           ./libraries/rx_register_map/                                          
vmap       rx_register_map                                           ./libraries/rx_register_map/                                          
ensure_lib                                                           ./libraries/tx_eth_link_fault_generation/                             
vmap       tx_eth_link_fault_generation                              ./libraries/tx_eth_link_fault_generation/                             
ensure_lib                                                           ./libraries/tx_st_timing_adapter_splitter_out_0/                      
vmap       tx_st_timing_adapter_splitter_out_0                       ./libraries/tx_st_timing_adapter_splitter_out_0/                      
ensure_lib                                                           ./libraries/tx_st_timing_adapter_splitter_in/                         
vmap       tx_st_timing_adapter_splitter_in                          ./libraries/tx_st_timing_adapter_splitter_in/                         
ensure_lib                                                           ./libraries/tx_eth_xgmii_termination/                                 
vmap       tx_eth_xgmii_termination                                  ./libraries/tx_eth_xgmii_termination/                                 
ensure_lib                                                           ./libraries/tx_eth_packet_formatter/                                  
vmap       tx_eth_packet_formatter                                   ./libraries/tx_eth_packet_formatter/                                  
ensure_lib                                                           ./libraries/tx_st_status_output_delay_to_statistic/                   
vmap       tx_st_status_output_delay_to_statistic                    ./libraries/tx_st_status_output_delay_to_statistic/                   
ensure_lib                                                           ./libraries/tx_eth_statistics_collector/                              
vmap       tx_eth_statistics_collector                               ./libraries/tx_eth_statistics_collector/                              
ensure_lib                                                           ./libraries/tx_st_timing_adapter_splitter_status_output/              
vmap       tx_st_timing_adapter_splitter_status_output               ./libraries/tx_st_timing_adapter_splitter_status_output/              
ensure_lib                                                           ./libraries/tx_st_timing_adapter_splitter_status_in/                  
vmap       tx_st_timing_adapter_splitter_status_in                   ./libraries/tx_st_timing_adapter_splitter_status_in/                  
ensure_lib                                                           ./libraries/tx_st_error_adapter_stat/                                 
vmap       tx_st_error_adapter_stat                                  ./libraries/tx_st_error_adapter_stat/                                 
ensure_lib                                                           ./libraries/tx_eth_frame_decoder/                                     
vmap       tx_eth_frame_decoder                                      ./libraries/tx_eth_frame_decoder/                                     
ensure_lib                                                           ./libraries/tx_st_timing_adapter_frame_decoder/                       
vmap       tx_st_timing_adapter_frame_decoder                        ./libraries/tx_st_timing_adapter_frame_decoder/                       
ensure_lib                                                           ./libraries/tx_st_splitter_1/                                         
vmap       tx_st_splitter_1                                          ./libraries/tx_st_splitter_1/                                         
ensure_lib                                                           ./libraries/tx_st_pipeline_stage_rs/                                  
vmap       tx_st_pipeline_stage_rs                                   ./libraries/tx_st_pipeline_stage_rs/                                  
ensure_lib                                                           ./libraries/tx_eth_crc_inserter/                                      
vmap       tx_eth_crc_inserter                                       ./libraries/tx_eth_crc_inserter/                                      
ensure_lib                                                           ./libraries/tx_eth_address_inserter/                                  
vmap       tx_eth_address_inserter                                   ./libraries/tx_eth_address_inserter/                                  
ensure_lib                                                           ./libraries/tx_st_mux_flow_control_user_frame/                        
vmap       tx_st_mux_flow_control_user_frame                         ./libraries/tx_st_mux_flow_control_user_frame/                        
ensure_lib                                                           ./libraries/tx_st_pause_ctrl_error_adapter/                           
vmap       tx_st_pause_ctrl_error_adapter                            ./libraries/tx_st_pause_ctrl_error_adapter/                           
ensure_lib                                                           ./libraries/tx_eth_pause_ctrl_gen/                                    
vmap       tx_eth_pause_ctrl_gen                                     ./libraries/tx_eth_pause_ctrl_gen/                                    
ensure_lib                                                           ./libraries/tx_eth_pause_beat_conversion/                             
vmap       tx_eth_pause_beat_conversion                              ./libraries/tx_eth_pause_beat_conversion/                             
ensure_lib                                                           ./libraries/tx_eth_pkt_backpressure_control/                          
vmap       tx_eth_pkt_backpressure_control                           ./libraries/tx_eth_pkt_backpressure_control/                          
ensure_lib                                                           ./libraries/tx_eth_pad_inserter/                                      
vmap       tx_eth_pad_inserter                                       ./libraries/tx_eth_pad_inserter/                                      
ensure_lib                                                           ./libraries/tx_eth_packet_underflow_control/                          
vmap       tx_eth_packet_underflow_control                           ./libraries/tx_eth_packet_underflow_control/                          
ensure_lib                                                           ./libraries/tx_register_map/                                          
vmap       tx_register_map                                           ./libraries/tx_register_map/                                          
ensure_lib                                                           ./libraries/eth_10g_design_example_0_mm_pipeline_bridge_burst_adapter/
vmap       eth_10g_design_example_0_mm_pipeline_bridge_burst_adapter ./libraries/eth_10g_design_example_0_mm_pipeline_bridge_burst_adapter/
ensure_lib                                                           ./libraries/eth_10g_design_example_0_mm_pipeline_bridge_agent/        
vmap       eth_10g_design_example_0_mm_pipeline_bridge_agent         ./libraries/eth_10g_design_example_0_mm_pipeline_bridge_agent/        
ensure_lib                                                           ./libraries/mm_bridge_m0_agent/                                       
vmap       mm_bridge_m0_agent                                        ./libraries/mm_bridge_m0_agent/                                       
ensure_lib                                                           ./libraries/eth_10g_design_example_0_mm_pipeline_bridge_translator/   
vmap       eth_10g_design_example_0_mm_pipeline_bridge_translator    ./libraries/eth_10g_design_example_0_mm_pipeline_bridge_translator/   
ensure_lib                                                           ./libraries/eth_mdio/                                                 
vmap       eth_mdio                                                  ./libraries/eth_mdio/                                                 
ensure_lib                                                           ./libraries/eth_fifo_pause_ctrl_adapter/                              
vmap       eth_fifo_pause_ctrl_adapter                               ./libraries/eth_fifo_pause_ctrl_adapter/                              
ensure_lib                                                           ./libraries/pa_pg_after_timing_adapter/                               
vmap       pa_pg_after_timing_adapter                                ./libraries/pa_pg_after_timing_adapter/                               
ensure_lib                                                           ./libraries/pa_pg_before_timing_adapter/                              
vmap       pa_pg_before_timing_adapter                               ./libraries/pa_pg_before_timing_adapter/                              
ensure_lib                                                           ./libraries/dc_fifo_pause_adapt_pause_gen/                            
vmap       dc_fifo_pause_adapt_pause_gen                             ./libraries/dc_fifo_pause_adapt_pause_gen/                            
ensure_lib                                                           ./libraries/tx_sc_fifo/                                               
vmap       tx_sc_fifo                                                ./libraries/tx_sc_fifo/                                               
ensure_lib                                                           ./libraries/eth_loopback_composed/                                    
vmap       eth_loopback_composed                                     ./libraries/eth_loopback_composed/                                    
ensure_lib                                                           ./libraries/eth_10g_mac/                                              
vmap       eth_10g_mac                                               ./libraries/eth_10g_mac/                                              
ensure_lib                                                           ./libraries/altera_10gbaser/                                          
vmap       altera_10gbaser                                           ./libraries/altera_10gbaser/                                          
ensure_lib                                                           ./libraries/altera_avalon_mm_bridge/                                  
vmap       altera_avalon_mm_bridge                                   ./libraries/altera_avalon_mm_bridge/                                  
ensure_lib                                                           ./libraries/rst_controller/                                           
vmap       rst_controller                                            ./libraries/rst_controller/                                           
ensure_lib                                                           ./libraries/mm_bridge/                                                
vmap       mm_bridge                                                 ./libraries/mm_bridge/                                                
ensure_lib                                                           ./libraries/eth_10g_design_example_0/                                 
vmap       eth_10g_design_example_0                                  ./libraries/eth_10g_design_example_0/                                 

# ----------------------------------------
# Compile device library files
alias dev_com {
  echo "\[exec\] dev_com"
  if ![ string match "*ModelSim ALTERA*" [ vsim -version ] ] {
    vlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.v"                   -work altera_ver         
    vlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v"                            -work lpm_ver            
    vlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.v"                               -work sgate_ver          
    vlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.v"                           -work altera_mf_ver      
    vlog -sv "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv"                       -work altera_lnsim_ver   
    vlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/mentor/arriav_atoms_ncrypt.v"          -work arriav_ver         
    vlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/mentor/arriav_hmi_atoms_ncrypt.v"      -work arriav_ver         
    vlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/arriav_atoms.v"                        -work arriav_ver         
    vlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/mentor/arriav_hssi_atoms_ncrypt.v"     -work arriav_hssi_ver    
    vlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/arriav_hssi_atoms.v"                   -work arriav_hssi_ver    
    vlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/mentor/arriav_pcie_hip_atoms_ncrypt.v" -work arriav_pcie_hip_ver
    vlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/arriav_pcie_hip_atoms.v"               -work arriav_pcie_hip_ver
  }
}

# ----------------------------------------
# Compile the design files in correct order
alias com {
  echo "\[exec\] com"
  vlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                                       -work rsp_mux                                                  
  vlog -sv "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_loopback_composed_mm_interconnect_0_rsp_mux.sv"              -work rsp_mux                                                  
  vlog -sv "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_loopback_composed_mm_interconnect_0_rsp_demux.sv"            -work rsp_demux                                                
  vlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                                       -work cmd_mux                                                  
  vlog -sv "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_loopback_composed_mm_interconnect_0_cmd_mux.sv"              -work cmd_mux                                                  
  vlog -sv "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_loopback_composed_mm_interconnect_0_cmd_demux.sv"            -work cmd_demux                                                
  vlog -sv "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_loopback_composed_mm_interconnect_0_router_001.sv"           -work router_001                                               
  vlog -sv "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_loopback_composed_mm_interconnect_0_router.sv"               -work router                                                   
  vlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                                       -work rsp_mux                                                  
  vlog -sv "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_2_rsp_mux.sv"                        -work rsp_mux                                                  
  vlog -sv "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_2_rsp_demux.sv"                      -work rsp_demux                                                
  vlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                                       -work cmd_mux                                                  
  vlog -sv "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_2_cmd_mux.sv"                        -work cmd_mux                                                  
  vlog -sv "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_2_cmd_demux.sv"                      -work cmd_demux                                                
  vlog -sv "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_2_router_001.sv"                     -work router_001                                               
  vlog -sv "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_2_router.sv"                         -work router                                                   
  vlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                                       -work rsp_mux                                                  
  vlog -sv "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_1_rsp_mux.sv"                        -work rsp_mux                                                  
  vlog -sv "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_1_rsp_demux.sv"                      -work rsp_demux                                                
  vlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                                       -work cmd_mux                                                  
  vlog -sv "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_1_cmd_mux.sv"                        -work cmd_mux                                                  
  vlog -sv "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_1_cmd_demux.sv"                      -work cmd_demux                                                
  vlog -sv "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_1_router_001.sv"                     -work router_001                                               
  vlog -sv "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_1_router.sv"                         -work router                                                   
  vlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                                       -work rsp_mux                                                  
  vlog -sv "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_0_rsp_mux.sv"                        -work rsp_mux                                                  
  vlog -sv "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_0_rsp_demux.sv"                      -work rsp_demux                                                
  vlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                                       -work cmd_mux                                                  
  vlog -sv "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_0_cmd_mux.sv"                        -work cmd_mux                                                  
  vlog -sv "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_0_cmd_demux.sv"                      -work cmd_demux                                                
  vlog -sv "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_0_router_001.sv"                     -work router_001                                               
  vlog -sv "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_0_router.sv"                         -work router                                                   
  vlog -sv "$QSYS_SIMDIR/submodules/altera_avalon_st_handshake_clock_crosser.v"                                                        -work crosser                                                  
  vlog -sv "$QSYS_SIMDIR/submodules/altera_avalon_st_clock_crosser.v"                                                                  -work crosser                                                  
  vlog -sv "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_base.v"                                                                  -work crosser                                                  
  vlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                                       -work rsp_mux                                                  
  vlog -sv "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_mm_interconnect_0_rsp_mux.sv"                                    -work rsp_mux                                                  
  vlog -sv "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_mm_interconnect_0_rsp_demux.sv"                                  -work rsp_demux                                                
  vlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                                       -work cmd_mux                                                  
  vlog -sv "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_mm_interconnect_0_cmd_mux.sv"                                    -work cmd_mux                                                  
  vlog -sv "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_mm_interconnect_0_cmd_demux.sv"                                  -work cmd_demux                                                
  vlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_traffic_limiter.sv"                                                                  -work altera_avalon_mm_bridge_avalon_universal_master_0_limiter
  vlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_reorder_memory.sv"                                                                   -work altera_avalon_mm_bridge_avalon_universal_master_0_limiter
  vlog -sv "$QSYS_SIMDIR/submodules/altera_avalon_sc_fifo.v"                                                                           -work altera_avalon_mm_bridge_avalon_universal_master_0_limiter
  vlog -sv "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_base.v"                                                                  -work altera_avalon_mm_bridge_avalon_universal_master_0_limiter
  vlog -sv "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_mm_interconnect_0_router_001.sv"                                 -work router_001                                               
  vlog -sv "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_mm_interconnect_0_router.sv"                                     -work router                                                   
  vlog     "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_loopback_composed_mm_interconnect_0.v"                       -work mm_interconnect_0                                        
  vlog -sv "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_loopback_composed_line_lb_timing_adapter.sv"                 -work line_lb_timing_adapter                                   
  vlog     "$QSYS_SIMDIR/submodules/altera_eth_loopback.v"                                                                             -work line_loopback                                            
  vlog -sv "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_loopback_composed_lc_splitter_timing_adapter.sv"             -work lc_splitter_timing_adapter                               
  vlog     "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_2.v"                                 -work mm_interconnect_2                                        
  vlog     "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_1.v"                                 -work mm_interconnect_1                                        
  vlog     "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_mm_interconnect_0.v"                                 -work mm_interconnect_0                                        
  vlog -sv "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_rxtx_timing_adapter_pauselen_tx.sv"                  -work rxtx_timing_adapter_pauselen_tx                          
  vlog -sv "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_rxtx_timing_adapter_pauselen_rx.sv"                  -work rxtx_timing_adapter_pauselen_rx                          
  vlog -sv "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_txrx_timing_adapter_link_fault_status_export.sv"     -work txrx_timing_adapter_link_fault_status_export             
  vlog -sv "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_txrx_timing_adapter_link_fault_status_rx.sv"         -work txrx_timing_adapter_link_fault_status_rx                 
  vlog -sv "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_rx_st_error_adapter_stat.sv"                         -work rx_st_error_adapter_stat                                 
  vlog     "$QSYS_SIMDIR/submodules/mentor/altera_eth_packet_overflow_control.v"                                                       -work rx_eth_packet_overflow_control                           
  vlog     "$QSYS_SIMDIR/submodules/mentor/altera_eth_crc_pad_rem.v"                                                                   -work rx_eth_crc_pad_rem                                       
  vlog     "$QSYS_SIMDIR/submodules/mentor/altera_eth_crc_rem.v"                                                                       -work rx_eth_crc_pad_rem                                       
  vlog     "$QSYS_SIMDIR/submodules/mentor/altera_packet_stripper.v"                                                                   -work rx_eth_crc_pad_rem                                       
  vlog -sv "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_stage.sv"                                                                -work rx_eth_crc_pad_rem                                       
  vlog     "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_base.v"                                                                  -work rx_eth_crc_pad_rem                                       
  vlog     "$QSYS_SIMDIR/submodules/mentor/altera_eth_frame_status_merger.v"                                                           -work rx_eth_frame_status_merger                               
  vlog -sv "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_rx_timing_adapter_frame_status_out_frame_decoder.sv" -work rx_timing_adapter_frame_status_out_frame_decoder         
  vlog -sv "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_rx_st_timing_adapter_frame_status_in.sv"             -work rx_st_timing_adapter_frame_status_in                     
  vlog     "$QSYS_SIMDIR/submodules/mentor/altera_eth_lane_decoder.v"                                                                  -work rx_eth_lane_decoder                                      
  vlog     "$QSYS_SIMDIR/submodules/mentor/altera_eth_link_fault_detection.v"                                                          -work rx_eth_link_fault_detection                              
  vlog     "$QSYS_SIMDIR/submodules/mentor/altera_eth_10g_rx_register_map.v"                                                           -work rx_register_map                                          
  vlog     "$QSYS_SIMDIR/submodules/altera_avalon_st_clock_crosser.v"                                                                  -work rx_register_map                                          
  vlog     "$QSYS_SIMDIR/submodules/mentor/altera_eth_link_fault_generation.v"                                                         -work tx_eth_link_fault_generation                             
  vlog -sv "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_tx_st_timing_adapter_splitter_out_0.sv"              -work tx_st_timing_adapter_splitter_out_0                      
  vlog -sv "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_tx_st_timing_adapter_splitter_in.sv"                 -work tx_st_timing_adapter_splitter_in                         
  vlog     "$QSYS_SIMDIR/submodules/mentor/altera_eth_xgmii_termination.v"                                                             -work tx_eth_xgmii_termination                                 
  vlog     "$QSYS_SIMDIR/submodules/mentor/altera_eth_packet_formatter.v"                                                              -work tx_eth_packet_formatter                                  
  vlog -sv "$QSYS_SIMDIR/submodules/altera_avalon_st_delay.sv"                                                                         -work tx_st_status_output_delay_to_statistic                   
  vlog     "$QSYS_SIMDIR/submodules/mentor/altera_eth_10gmem_statistics_collector.v"                                                   -work tx_eth_statistics_collector                              
  vlog -sv "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_tx_st_timing_adapter_splitter_status_output.sv"      -work tx_st_timing_adapter_splitter_status_output              
  vlog -sv "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_tx_st_timing_adapter_splitter_status_in.sv"          -work tx_st_timing_adapter_splitter_status_in                  
  vlog -sv "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_tx_st_error_adapter_stat.sv"                         -work tx_st_error_adapter_stat                                 
  vlog     "$QSYS_SIMDIR/submodules/mentor/altera_eth_frame_decoder.v"                                                                 -work tx_eth_frame_decoder                                     
  vlog -sv "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_stage.sv"                                                                -work tx_eth_frame_decoder                                     
  vlog     "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_base.v"                                                                  -work tx_eth_frame_decoder                                     
  vlog -sv "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_tx_st_timing_adapter_frame_decoder.sv"               -work tx_st_timing_adapter_frame_decoder                       
  vlog -sv "$QSYS_SIMDIR/submodules/altera_avalon_st_splitter.sv"                                                                      -work tx_st_splitter_1                                         
  vlog -sv "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_stage.sv"                                                                -work tx_st_pipeline_stage_rs                                  
  vlog -sv "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_base.v"                                                                  -work tx_st_pipeline_stage_rs                                  
  vlog     "$QSYS_SIMDIR/submodules/mentor/altera_eth_crc.v"                                                                           -work tx_eth_crc_inserter                                      
  vlog     "$QSYS_SIMDIR/submodules/mentor/crc32.v"                                                                                    -work tx_eth_crc_inserter                                      
  vlog     "$QSYS_SIMDIR/submodules/mentor/gf_mult32_kc.v"                                                                             -work tx_eth_crc_inserter                                      
  vlog     "$QSYS_SIMDIR/submodules/mentor/altera_eth_address_inserter.v"                                                              -work tx_eth_address_inserter                                  
  vlog -sv "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_tx_st_mux_flow_control_user_frame.sv"                -work tx_st_mux_flow_control_user_frame                        
  vlog -sv "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac_tx_st_pause_ctrl_error_adapter.sv"                   -work tx_st_pause_ctrl_error_adapter                           
  vlog     "$QSYS_SIMDIR/submodules/mentor/altera_eth_pause_ctrl_gen.v"                                                                -work tx_eth_pause_ctrl_gen                                    
  vlog     "$QSYS_SIMDIR/submodules/mentor/altera_eth_pause_controller.v"                                                              -work tx_eth_pause_ctrl_gen                                    
  vlog     "$QSYS_SIMDIR/submodules/mentor/altera_eth_pause_gen.v"                                                                     -work tx_eth_pause_ctrl_gen                                    
  vlog     "$QSYS_SIMDIR/submodules/mentor/altera_eth_pause_beat_conversion.v"                                                         -work tx_eth_pause_beat_conversion                             
  vlog     "$QSYS_SIMDIR/submodules/mentor/altera_eth_pkt_backpressure_control.v"                                                      -work tx_eth_pkt_backpressure_control                          
  vlog     "$QSYS_SIMDIR/submodules/mentor/altera_eth_pad_inserter.v"                                                                  -work tx_eth_pad_inserter                                      
  vlog     "$QSYS_SIMDIR/submodules/mentor/altera_eth_packet_underflow_control.v"                                                      -work tx_eth_packet_underflow_control                          
  vlog     "$QSYS_SIMDIR/submodules/mentor/altera_eth_10g_tx_register_map.v"                                                           -work tx_register_map                                          
  vlog     "$QSYS_SIMDIR/submodules/altera_avalon_st_clock_crosser.v"                                                                  -work tx_register_map                                          
  vlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                                       -work rsp_mux                                                  
  vlog -sv "$QSYS_SIMDIR/submodules/qsys_10g_mm_interconnect_0_rsp_mux.sv"                                                             -work rsp_mux                                                  
  vlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                                       -work cmd_mux                                                  
  vlog -sv "$QSYS_SIMDIR/submodules/qsys_10g_mm_interconnect_0_cmd_mux.sv"                                                             -work cmd_mux                                                  
  vlog -sv "$QSYS_SIMDIR/submodules/qsys_10g_mm_interconnect_0_cmd_demux.sv"                                                           -work cmd_demux                                                
  vlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_burst_adapter_13_1.sv"                                                               -work eth_10g_design_example_0_mm_pipeline_bridge_burst_adapter
  vlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_burst_adapter.sv"                                                                    -work eth_10g_design_example_0_mm_pipeline_bridge_burst_adapter
  vlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_burst_adapter_new.sv"                                                                -work eth_10g_design_example_0_mm_pipeline_bridge_burst_adapter
  vlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_address_alignment.sv"                                                                -work eth_10g_design_example_0_mm_pipeline_bridge_burst_adapter
  vlog -sv "$QSYS_SIMDIR/submodules/altera_wrap_burst_converter.sv"                                                                    -work eth_10g_design_example_0_mm_pipeline_bridge_burst_adapter
  vlog -sv "$QSYS_SIMDIR/submodules/altera_incr_burst_converter.sv"                                                                    -work eth_10g_design_example_0_mm_pipeline_bridge_burst_adapter
  vlog -sv "$QSYS_SIMDIR/submodules/altera_default_burst_converter.sv"                                                                 -work eth_10g_design_example_0_mm_pipeline_bridge_burst_adapter
  vlog -sv "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_stage.sv"                                                                -work eth_10g_design_example_0_mm_pipeline_bridge_burst_adapter
  vlog -sv "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_base.v"                                                                  -work eth_10g_design_example_0_mm_pipeline_bridge_burst_adapter
  vlog -sv "$QSYS_SIMDIR/submodules/qsys_10g_mm_interconnect_0_router_001.sv"                                                          -work router_001                                               
  vlog -sv "$QSYS_SIMDIR/submodules/qsys_10g_mm_interconnect_0_router.sv"                                                              -work router                                                   
  vlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_slave_agent.sv"                                                                      -work eth_10g_design_example_0_mm_pipeline_bridge_agent        
  vlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_burst_uncompressor.sv"                                                               -work eth_10g_design_example_0_mm_pipeline_bridge_agent        
  vlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_master_agent.sv"                                                                     -work mm_bridge_m0_agent                                       
  vlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_slave_translator.sv"                                                                 -work eth_10g_design_example_0_mm_pipeline_bridge_translator   
  vlog     "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_mm_interconnect_0.v"                                             -work mm_interconnect_0                                        
  vlog     "$QSYS_SIMDIR/submodules/altera_eth_mdio.v"                                                                                 -work eth_mdio                                                 
  vlog     "$QSYS_SIMDIR/submodules/altera_eth_fifo_pause_ctrl_adapter.v"                                                              -work eth_fifo_pause_ctrl_adapter                              
  vlog -sv "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_pa_pg_after_timing_adapter.sv"                                   -work pa_pg_after_timing_adapter                               
  vlog -sv "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_pa_pg_before_timing_adapter.sv"                                  -work pa_pg_before_timing_adapter                              
  vlog     "$QSYS_SIMDIR/submodules/altera_avalon_dc_fifo.v"                                                                           -work dc_fifo_pause_adapt_pause_gen                            
  vlog     "$QSYS_SIMDIR/submodules/altera_dcfifo_synchronizer_bundle.v"                                                               -work dc_fifo_pause_adapt_pause_gen                            
  vlog     "$QSYS_SIMDIR/submodules/altera_avalon_sc_fifo.v"                                                                           -work tx_sc_fifo                                               
  vlog     "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_loopback_composed.v"                                         -work eth_loopback_composed                                    
  vlog     "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0_eth_10g_mac.v"                                                   -work eth_10g_mac                                              
  vlog -sv "$QSYS_SIMDIR/submodules/altera_xcvr_functions.sv"                                                                          -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/altera_xcvr_functions.sv"                                                                   -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/alt_reset_ctrl_lego.sv"                                                                            -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/alt_reset_ctrl_tgx_cdrauto.sv"                                                                     -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_resync.sv"                                                                                -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/alt_reset_ctrl_lego.sv"                                                                     -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/alt_reset_ctrl_tgx_cdrauto.sv"                                                              -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/alt_xcvr_resync.sv"                                                                         -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_csr_common_h.sv"                                                                          -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_csr_common.sv"                                                                            -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_csr_pcs8g_h.sv"                                                                           -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_csr_pcs8g.sv"                                                                             -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_csr_selector.sv"                                                                          -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_mgmt2dec.sv"                                                                              -work altera_10gbaser                                          
  vlog     "$QSYS_SIMDIR/submodules/altera_wait_generate.v"                                                                            -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/alt_xcvr_csr_common_h.sv"                                                                   -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/alt_xcvr_csr_common.sv"                                                                     -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/alt_xcvr_csr_pcs8g_h.sv"                                                                    -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/alt_xcvr_csr_pcs8g.sv"                                                                      -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/alt_xcvr_csr_selector.sv"                                                                   -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/alt_xcvr_mgmt2dec.sv"                                                                       -work altera_10gbaser                                          
  vlog     "$QSYS_SIMDIR/submodules/mentor/altera_wait_generate.v"                                                                     -work altera_10gbaser                                          
  vlog     "$QSYS_SIMDIR/submodules/altera_avalon_st_handshake_clock_crosser.v"                                                        -work altera_10gbaser                                          
  vlog     "$QSYS_SIMDIR/submodules/mentor/altera_avalon_st_handshake_clock_crosser.v"                                                 -work altera_10gbaser                                          
  vlog     "$QSYS_SIMDIR/submodules/altera_avalon_st_clock_crosser.v"                                                                  -work altera_10gbaser                                          
  vlog     "$QSYS_SIMDIR/submodules/mentor/altera_avalon_st_clock_crosser.v"                                                           -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_stage.sv"                                                                -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/altera_avalon_st_pipeline_stage.sv"                                                         -work altera_10gbaser                                          
  vlog     "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_base.v"                                                                  -work altera_10gbaser                                          
  vlog     "$QSYS_SIMDIR/submodules/mentor/altera_avalon_st_pipeline_base.v"                                                           -work altera_10gbaser                                          
  vlog     "$QSYS_SIMDIR/submodules/mentor/alt_10gbaser_pcs.v"                                                                         -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/altera_10gbaser_phy_params.sv"                                                              -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/altera_10gbaser_phy_async_fifo_fpga.sv"                                                     -work altera_10gbaser                                          
  vlog     "$QSYS_SIMDIR/submodules/mentor/altera_10gbaser_phy_bitsync.v"                                                              -work altera_10gbaser                                          
  vlog     "$QSYS_SIMDIR/submodules/mentor/altera_10gbaser_phy_bitsync2.v"                                                             -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/altera_10gbaser_phy_clockcomp.sv"                                                           -work altera_10gbaser                                          
  vlog     "$QSYS_SIMDIR/submodules/mentor/altera_10gbaser_phy_clk_ctrl.v"                                                             -work altera_10gbaser                                          
  vlog     "$QSYS_SIMDIR/submodules/mentor/altera_10gbaser_phy_gearbox_exp.v"                                                          -work altera_10gbaser                                          
  vlog     "$QSYS_SIMDIR/submodules/mentor/altera_10gbaser_phy_gearbox_red.v"                                                          -work altera_10gbaser                                          
  vlog     "$QSYS_SIMDIR/submodules/mentor/altera_10gbaser_phy_pcs_10g.v"                                                              -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/altera_10gbaser_phy_pcs_10g_top.sv"                                                         -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/altera_10gbaser_phy_reg_map_av.sv"                                                          -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/altera_10gbaser_phy_rx_fifo.sv"                                                             -work altera_10gbaser                                          
  vlog     "$QSYS_SIMDIR/submodules/mentor/altera_10gbaser_phy_rx_fifo_wrap.v"                                                         -work altera_10gbaser                                          
  vlog     "$QSYS_SIMDIR/submodules/mentor/altera_10gbaser_phy_rx_top.v"                                                               -work altera_10gbaser                                          
  vlog     "$QSYS_SIMDIR/submodules/mentor/altera_10gbaser_phy_tx_top.v"                                                               -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/altera_10gbaser_phy_1588_latency.sv"                                                        -work altera_10gbaser                                          
  vlog     "$QSYS_SIMDIR/submodules/mentor/altera_10gbaser_phy_ber.v"                                                                  -work altera_10gbaser                                          
  vlog     "$QSYS_SIMDIR/submodules/mentor/altera_10gbaser_phy_ber_cnt_ns.v"                                                           -work altera_10gbaser                                          
  vlog     "$QSYS_SIMDIR/submodules/mentor/altera_10gbaser_phy_ber_sm.v"                                                               -work altera_10gbaser                                          
  vlog     "$QSYS_SIMDIR/submodules/mentor/altera_10gbaser_phy_blksync.v"                                                              -work altera_10gbaser                                          
  vlog     "$QSYS_SIMDIR/submodules/mentor/altera_10gbaser_phy_blksync_datapath.v"                                                     -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/altera_10gbaser_phy_decode.sv"                                                              -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/altera_10gbaser_phy_decode_type.sv"                                                         -work altera_10gbaser                                          
  vlog     "$QSYS_SIMDIR/submodules/mentor/altera_10gbaser_phy_descramble.v"                                                           -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/altera_10gbaser_phy_encode.sv"                                                              -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/altera_10gbaser_phy_encode_type.sv"                                                         -work altera_10gbaser                                          
  vlog     "$QSYS_SIMDIR/submodules/mentor/altera_10gbaser_phy_lock_sm.v"                                                              -work altera_10gbaser                                          
  vlog     "$QSYS_SIMDIR/submodules/mentor/altera_10gbaser_phy_nto1mux.v"                                                              -work altera_10gbaser                                          
  vlog     "$QSYS_SIMDIR/submodules/mentor/altera_10gbaser_phy_prbs_gen_xg.v"                                                          -work altera_10gbaser                                          
  vlog     "$QSYS_SIMDIR/submodules/mentor/altera_10gbaser_phy_prbs_ver_xg.v"                                                          -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/altera_10gbaser_phy_random_err_cnt_ns.sv"                                                   -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/altera_10gbaser_phy_random_gen.sv"                                                          -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/altera_10gbaser_phy_random_ver.sv"                                                          -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/altera_10gbaser_phy_random_ver_10g.sv"                                                      -work altera_10gbaser                                          
  vlog     "$QSYS_SIMDIR/submodules/mentor/altera_10gbaser_phy_register_with_byte_enable.v"                                            -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/altera_10gbaser_phy_rx_sm_datapath.sv"                                                      -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/altera_10gbaser_phy_rx_sm_ns.sv"                                                            -work altera_10gbaser                                          
  vlog     "$QSYS_SIMDIR/submodules/mentor/altera_10gbaser_phy_scramble.v"                                                             -work altera_10gbaser                                          
  vlog     "$QSYS_SIMDIR/submodules/mentor/altera_10gbaser_phy_square_wave_gen.v"                                                      -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/altera_10gbaser_phy_tx_sm_datapath.sv"                                                      -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/altera_10gbaser_phy_tx_sm_ns.sv"                                                            -work altera_10gbaser                                          
  vlog     "$QSYS_SIMDIR/submodules/mentor/altera_10gbaser_phy_word_align.v"                                                           -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/csr_pcs10gbaser_h.sv"                                                                              -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/csr_pcs10gbaser.sv"                                                                                -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/csr_pcs10gbaser_h.sv"                                                                       -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/csr_pcs10gbaser.sv"                                                                         -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/sv_reconfig_bundle_to_xcvr.sv"                                                                     -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/sv_reconfig_bundle_to_ip.sv"                                                                       -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/sv_reconfig_bundle_merger.sv"                                                                      -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/sv_reconfig_bundle_to_xcvr.sv"                                                              -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/sv_reconfig_bundle_to_ip.sv"                                                                -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/sv_reconfig_bundle_merger.sv"                                                               -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/av_xcvr_h.sv"                                                                                      -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/av_xcvr_avmm_csr.sv"                                                                               -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/av_tx_pma_ch.sv"                                                                                   -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/av_tx_pma.sv"                                                                                      -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/av_rx_pma.sv"                                                                                      -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/av_pma.sv"                                                                                         -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/av_pcs_ch.sv"                                                                                      -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/av_pcs.sv"                                                                                         -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/av_xcvr_avmm.sv"                                                                                   -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/av_xcvr_native.sv"                                                                                 -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/av_xcvr_plls.sv"                                                                                   -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/av_xcvr_data_adapter.sv"                                                                           -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/av_reconfig_bundle_to_basic.sv"                                                                    -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/av_reconfig_bundle_to_xcvr.sv"                                                                     -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/av_xcvr_h.sv"                                                                               -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/av_xcvr_avmm_csr.sv"                                                                        -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/av_tx_pma_ch.sv"                                                                            -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/av_tx_pma.sv"                                                                               -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/av_rx_pma.sv"                                                                               -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/av_pma.sv"                                                                                  -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/av_pcs_ch.sv"                                                                               -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/av_pcs.sv"                                                                                  -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/av_xcvr_avmm.sv"                                                                            -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/av_xcvr_native.sv"                                                                          -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/av_xcvr_plls.sv"                                                                            -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/av_xcvr_data_adapter.sv"                                                                    -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/av_reconfig_bundle_to_basic.sv"                                                             -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/av_reconfig_bundle_to_xcvr.sv"                                                              -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/av_hssi_8g_rx_pcs_rbc.sv"                                                                          -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/av_hssi_8g_tx_pcs_rbc.sv"                                                                          -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/av_hssi_common_pcs_pma_interface_rbc.sv"                                                           -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/av_hssi_common_pld_pcs_interface_rbc.sv"                                                           -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/av_hssi_pipe_gen1_2_rbc.sv"                                                                        -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/av_hssi_rx_pcs_pma_interface_rbc.sv"                                                               -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/av_hssi_rx_pld_pcs_interface_rbc.sv"                                                               -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/av_hssi_tx_pcs_pma_interface_rbc.sv"                                                               -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/av_hssi_tx_pld_pcs_interface_rbc.sv"                                                               -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/av_hssi_8g_rx_pcs_rbc.sv"                                                                   -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/av_hssi_8g_tx_pcs_rbc.sv"                                                                   -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/av_hssi_common_pcs_pma_interface_rbc.sv"                                                    -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/av_hssi_common_pld_pcs_interface_rbc.sv"                                                    -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/av_hssi_pipe_gen1_2_rbc.sv"                                                                 -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/av_hssi_rx_pcs_pma_interface_rbc.sv"                                                        -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/av_hssi_rx_pld_pcs_interface_rbc.sv"                                                        -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/av_hssi_tx_pcs_pma_interface_rbc.sv"                                                        -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/av_hssi_tx_pld_pcs_interface_rbc.sv"                                                        -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/av_xcvr_10gbaser_nr.sv"                                                                            -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/av_xcvr_10gbaser_native.sv"                                                                        -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/av_xcvr_10gbaser_nr.sv"                                                                     -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/av_xcvr_10gbaser_native.sv"                                                                 -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/altera_xcvr_native_av_functions_h.sv"                                                              -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/altera_xcvr_native_av.sv"                                                                          -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/altera_xcvr_native_av_functions_h.sv"                                                       -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/altera_xcvr_native_av.sv"                                                                   -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/altera_xcvr_10gbaser.sv"                                                                           -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/altera_xcvr_10gbaser.sv"                                                                    -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/altera_xcvr_reset_control.sv"                                                                      -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_reset_counter.sv"                                                                         -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/altera_xcvr_reset_control.sv"                                                               -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/alt_xcvr_reset_counter.sv"                                                                  -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_arbiter.sv"                                                                               -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/alt_xcvr_m2s.sv"                                                                                   -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/alt_xcvr_arbiter.sv"                                                                        -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/mentor/alt_xcvr_m2s.sv"                                                                            -work altera_10gbaser                                          
  vlog -sv "$QSYS_SIMDIR/submodules/altera_merlin_master_translator.sv"                                                                -work altera_avalon_mm_bridge                                  
  vlog     "$QSYS_SIMDIR/submodules/altera_reset_controller.v"                                                                         -work rst_controller                                           
  vlog     "$QSYS_SIMDIR/submodules/altera_reset_synchronizer.v"                                                                       -work rst_controller                                           
  vlog     "$QSYS_SIMDIR/submodules/qsys_10g_mm_interconnect_0.v"                                                                      -work mm_interconnect_0                                        
  vlog     "$QSYS_SIMDIR/submodules/altera_avalon_mm_bridge.v"                                                                         -work mm_bridge                                                
  vlog     "$QSYS_SIMDIR/submodules/qsys_10g_eth_10g_design_example_0.v"                                                               -work eth_10g_design_example_0                                 
  vlog     "$QSYS_SIMDIR/qsys_10g.v"                                                                                                                                                                  
}

# ----------------------------------------
# Elaborate top level design
alias elab {
  echo "\[exec\] elab"
  eval vsim -t ps $ELAB_OPTIONS -L work -L work_lib -L rsp_mux -L rsp_demux -L cmd_mux -L cmd_demux -L router_001 -L router -L crosser -L altera_avalon_mm_bridge_avalon_universal_master_0_limiter -L mm_interconnect_0 -L line_lb_timing_adapter -L line_loopback -L lc_splitter_timing_adapter -L mm_interconnect_2 -L mm_interconnect_1 -L rxtx_timing_adapter_pauselen_tx -L rxtx_timing_adapter_pauselen_rx -L txrx_timing_adapter_link_fault_status_export -L txrx_timing_adapter_link_fault_status_rx -L rx_st_error_adapter_stat -L rx_eth_packet_overflow_control -L rx_eth_crc_pad_rem -L rx_eth_frame_status_merger -L rx_timing_adapter_frame_status_out_frame_decoder -L rx_st_timing_adapter_frame_status_in -L rx_eth_lane_decoder -L rx_eth_link_fault_detection -L rx_register_map -L tx_eth_link_fault_generation -L tx_st_timing_adapter_splitter_out_0 -L tx_st_timing_adapter_splitter_in -L tx_eth_xgmii_termination -L tx_eth_packet_formatter -L tx_st_status_output_delay_to_statistic -L tx_eth_statistics_collector -L tx_st_timing_adapter_splitter_status_output -L tx_st_timing_adapter_splitter_status_in -L tx_st_error_adapter_stat -L tx_eth_frame_decoder -L tx_st_timing_adapter_frame_decoder -L tx_st_splitter_1 -L tx_st_pipeline_stage_rs -L tx_eth_crc_inserter -L tx_eth_address_inserter -L tx_st_mux_flow_control_user_frame -L tx_st_pause_ctrl_error_adapter -L tx_eth_pause_ctrl_gen -L tx_eth_pause_beat_conversion -L tx_eth_pkt_backpressure_control -L tx_eth_pad_inserter -L tx_eth_packet_underflow_control -L tx_register_map -L eth_10g_design_example_0_mm_pipeline_bridge_burst_adapter -L eth_10g_design_example_0_mm_pipeline_bridge_agent -L mm_bridge_m0_agent -L eth_10g_design_example_0_mm_pipeline_bridge_translator -L eth_mdio -L eth_fifo_pause_ctrl_adapter -L pa_pg_after_timing_adapter -L pa_pg_before_timing_adapter -L dc_fifo_pause_adapt_pause_gen -L tx_sc_fifo -L eth_loopback_composed -L eth_10g_mac -L altera_10gbaser -L altera_avalon_mm_bridge -L rst_controller -L mm_bridge -L eth_10g_design_example_0 -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L arriav_ver -L arriav_hssi_ver -L arriav_pcie_hip_ver $TOP_LEVEL_NAME
}

# ----------------------------------------
# Elaborate the top level design with novopt option
alias elab_debug {
  echo "\[exec\] elab_debug"
  eval vsim -novopt -t ps $ELAB_OPTIONS -L work -L work_lib -L rsp_mux -L rsp_demux -L cmd_mux -L cmd_demux -L router_001 -L router -L crosser -L altera_avalon_mm_bridge_avalon_universal_master_0_limiter -L mm_interconnect_0 -L line_lb_timing_adapter -L line_loopback -L lc_splitter_timing_adapter -L mm_interconnect_2 -L mm_interconnect_1 -L rxtx_timing_adapter_pauselen_tx -L rxtx_timing_adapter_pauselen_rx -L txrx_timing_adapter_link_fault_status_export -L txrx_timing_adapter_link_fault_status_rx -L rx_st_error_adapter_stat -L rx_eth_packet_overflow_control -L rx_eth_crc_pad_rem -L rx_eth_frame_status_merger -L rx_timing_adapter_frame_status_out_frame_decoder -L rx_st_timing_adapter_frame_status_in -L rx_eth_lane_decoder -L rx_eth_link_fault_detection -L rx_register_map -L tx_eth_link_fault_generation -L tx_st_timing_adapter_splitter_out_0 -L tx_st_timing_adapter_splitter_in -L tx_eth_xgmii_termination -L tx_eth_packet_formatter -L tx_st_status_output_delay_to_statistic -L tx_eth_statistics_collector -L tx_st_timing_adapter_splitter_status_output -L tx_st_timing_adapter_splitter_status_in -L tx_st_error_adapter_stat -L tx_eth_frame_decoder -L tx_st_timing_adapter_frame_decoder -L tx_st_splitter_1 -L tx_st_pipeline_stage_rs -L tx_eth_crc_inserter -L tx_eth_address_inserter -L tx_st_mux_flow_control_user_frame -L tx_st_pause_ctrl_error_adapter -L tx_eth_pause_ctrl_gen -L tx_eth_pause_beat_conversion -L tx_eth_pkt_backpressure_control -L tx_eth_pad_inserter -L tx_eth_packet_underflow_control -L tx_register_map -L eth_10g_design_example_0_mm_pipeline_bridge_burst_adapter -L eth_10g_design_example_0_mm_pipeline_bridge_agent -L mm_bridge_m0_agent -L eth_10g_design_example_0_mm_pipeline_bridge_translator -L eth_mdio -L eth_fifo_pause_ctrl_adapter -L pa_pg_after_timing_adapter -L pa_pg_before_timing_adapter -L dc_fifo_pause_adapt_pause_gen -L tx_sc_fifo -L eth_loopback_composed -L eth_10g_mac -L altera_10gbaser -L altera_avalon_mm_bridge -L rst_controller -L mm_bridge -L eth_10g_design_example_0 -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L arriav_ver -L arriav_hssi_ver -L arriav_pcie_hip_ver $TOP_LEVEL_NAME
}

# ----------------------------------------
# Compile all the design files and elaborate the top level design
alias ld "
  dev_com
  com
  elab
"

# ----------------------------------------
# Compile all the design files and elaborate the top level design with -novopt
alias ld_debug "
  dev_com
  com
  elab_debug
"

# ----------------------------------------
# Print out user commmand line aliases
alias h {
  echo "List Of Command Line Aliases"
  echo
  echo "file_copy                     -- Copy ROM/RAM files to simulation directory"
  echo
  echo "dev_com                       -- Compile device library files"
  echo
  echo "com                           -- Compile the design files in correct order"
  echo
  echo "elab                          -- Elaborate top level design"
  echo
  echo "elab_debug                    -- Elaborate the top level design with novopt option"
  echo
  echo "ld                            -- Compile all the design files and elaborate the top level design"
  echo
  echo "ld_debug                      -- Compile all the design files and elaborate the top level design with -novopt"
  echo
  echo 
  echo
  echo "List Of Variables"
  echo
  echo "TOP_LEVEL_NAME                -- Top level module name."
  echo
  echo "SYSTEM_INSTANCE_NAME          -- Instantiated system module name inside top level module."
  echo
  echo "QSYS_SIMDIR                   -- Qsys base simulation directory."
  echo
  echo "QUARTUS_INSTALL_DIR           -- Quartus installation directory."
}
file_copy
h
