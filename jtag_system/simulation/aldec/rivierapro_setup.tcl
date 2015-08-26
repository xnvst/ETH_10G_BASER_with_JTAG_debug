
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

# ACDS 14.0 205 win32 2014.11.09.00:39:20

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
  set TOP_LEVEL_NAME "jtag_system"
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

set Aldec "Riviera"
if { [ string match "*Active-HDL*" [ vsim -version ] ] } {
  set Aldec "Active"
}

if { [ string match "Active" $Aldec ] } {
  scripterconf -tcl
  createdesign "$TOP_LEVEL_NAME"  "."
  opendesign "$TOP_LEVEL_NAME"
}

# ----------------------------------------
# Copy ROM/RAM files to simulation directory
alias file_copy {
  echo "\[exec\] file_copy"
}

# ----------------------------------------
# Create compilation libraries
proc ensure_lib { lib } { if ![file isdirectory $lib] { vlib $lib } }
ensure_lib      ./libraries     
ensure_lib      ./libraries/work
vmap       work ./libraries/work
ensure_lib                     ./libraries/altera_ver         
vmap       altera_ver          ./libraries/altera_ver         
ensure_lib                     ./libraries/lpm_ver            
vmap       lpm_ver             ./libraries/lpm_ver            
ensure_lib                     ./libraries/sgate_ver          
vmap       sgate_ver           ./libraries/sgate_ver          
ensure_lib                     ./libraries/altera_mf_ver      
vmap       altera_mf_ver       ./libraries/altera_mf_ver      
ensure_lib                     ./libraries/altera_lnsim_ver   
vmap       altera_lnsim_ver    ./libraries/altera_lnsim_ver   
ensure_lib                     ./libraries/arriav_ver         
vmap       arriav_ver          ./libraries/arriav_ver         
ensure_lib                     ./libraries/arriav_hssi_ver    
vmap       arriav_hssi_ver     ./libraries/arriav_hssi_ver    
ensure_lib                     ./libraries/arriav_pcie_hip_ver
vmap       arriav_pcie_hip_ver ./libraries/arriav_pcie_hip_ver
ensure_lib                                  ./libraries/rsp_mux                         
vmap       rsp_mux                          ./libraries/rsp_mux                         
ensure_lib                                  ./libraries/rsp_demux                       
vmap       rsp_demux                        ./libraries/rsp_demux                       
ensure_lib                                  ./libraries/cmd_mux                         
vmap       cmd_mux                          ./libraries/cmd_mux                         
ensure_lib                                  ./libraries/cmd_demux                       
vmap       cmd_demux                        ./libraries/cmd_demux                       
ensure_lib                                  ./libraries/mm_bridge_master_m0_limiter     
vmap       mm_bridge_master_m0_limiter      ./libraries/mm_bridge_master_m0_limiter     
ensure_lib                                  ./libraries/router_001                      
vmap       router_001                       ./libraries/router_001                      
ensure_lib                                  ./libraries/router                          
vmap       router                           ./libraries/router                          
ensure_lib                                  ./libraries/mm_bridge_master_s0_agent       
vmap       mm_bridge_master_s0_agent        ./libraries/mm_bridge_master_s0_agent       
ensure_lib                                  ./libraries/jtag_master_master_agent        
vmap       jtag_master_master_agent         ./libraries/jtag_master_master_agent        
ensure_lib                                  ./libraries/mm_bridge_master_s0_translator  
vmap       mm_bridge_master_s0_translator   ./libraries/mm_bridge_master_s0_translator  
ensure_lib                                  ./libraries/jtag_master_master_translator   
vmap       jtag_master_master_translator    ./libraries/jtag_master_master_translator   
ensure_lib                                  ./libraries/p2b_adapter                     
vmap       p2b_adapter                      ./libraries/p2b_adapter                     
ensure_lib                                  ./libraries/b2p_adapter                     
vmap       b2p_adapter                      ./libraries/b2p_adapter                     
ensure_lib                                  ./libraries/transacto                       
vmap       transacto                        ./libraries/transacto                       
ensure_lib                                  ./libraries/p2b                             
vmap       p2b                              ./libraries/p2b                             
ensure_lib                                  ./libraries/b2p                             
vmap       b2p                              ./libraries/b2p                             
ensure_lib                                  ./libraries/fifo                            
vmap       fifo                             ./libraries/fifo                            
ensure_lib                                  ./libraries/timing_adt                      
vmap       timing_adt                       ./libraries/timing_adt                      
ensure_lib                                  ./libraries/jtag_phy_embedded_in_jtag_master
vmap       jtag_phy_embedded_in_jtag_master ./libraries/jtag_phy_embedded_in_jtag_master
ensure_lib                                  ./libraries/rst_controller                  
vmap       rst_controller                   ./libraries/rst_controller                  
ensure_lib                                  ./libraries/mm_interconnect_1               
vmap       mm_interconnect_1                ./libraries/mm_interconnect_1               
ensure_lib                                  ./libraries/mm_interconnect_0               
vmap       mm_interconnect_0                ./libraries/mm_interconnect_0               
ensure_lib                                  ./libraries/mm_bridge_master                
vmap       mm_bridge_master                 ./libraries/mm_bridge_master                
ensure_lib                                  ./libraries/jtag_master                     
vmap       jtag_master                      ./libraries/jtag_master                     

# ----------------------------------------
# Compile device library files
alias dev_com {
  echo "\[exec\] dev_com"
  vlog  "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.v"                  -work altera_ver         
  vlog  "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v"                           -work lpm_ver            
  vlog  "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.v"                              -work sgate_ver          
  vlog  "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.v"                          -work altera_mf_ver      
  vlog  "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv"                      -work altera_lnsim_ver   
  vlog  "$QUARTUS_INSTALL_DIR/eda/sim_lib/aldec/arriav_atoms_ncrypt.v"          -work arriav_ver         
  vlog  "$QUARTUS_INSTALL_DIR/eda/sim_lib/aldec/arriav_hmi_atoms_ncrypt.v"      -work arriav_ver         
  vlog  "$QUARTUS_INSTALL_DIR/eda/sim_lib/arriav_atoms.v"                       -work arriav_ver         
  vlog  "$QUARTUS_INSTALL_DIR/eda/sim_lib/aldec/arriav_hssi_atoms_ncrypt.v"     -work arriav_hssi_ver    
  vlog  "$QUARTUS_INSTALL_DIR/eda/sim_lib/arriav_hssi_atoms.v"                  -work arriav_hssi_ver    
  vlog  "$QUARTUS_INSTALL_DIR/eda/sim_lib/aldec/arriav_pcie_hip_atoms_ncrypt.v" -work arriav_pcie_hip_ver
  vlog  "$QUARTUS_INSTALL_DIR/eda/sim_lib/arriav_pcie_hip_atoms.v"              -work arriav_pcie_hip_ver
}

# ----------------------------------------
# Compile the design files in correct order
alias com {
  echo "\[exec\] com"
  vlog  "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                 -work rsp_mux                         
  vlog  "$QSYS_SIMDIR/submodules/jtag_system_mm_interconnect_1_rsp_mux.sv"    -work rsp_mux                         
  vlog  "$QSYS_SIMDIR/submodules/jtag_system_mm_interconnect_1_rsp_demux.sv"  -work rsp_demux                       
  vlog  "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                 -work cmd_mux                         
  vlog  "$QSYS_SIMDIR/submodules/jtag_system_mm_interconnect_1_cmd_mux.sv"    -work cmd_mux                         
  vlog  "$QSYS_SIMDIR/submodules/jtag_system_mm_interconnect_1_cmd_demux.sv"  -work cmd_demux                       
  vlog  "$QSYS_SIMDIR/submodules/altera_merlin_traffic_limiter.sv"            -work mm_bridge_master_m0_limiter     
  vlog  "$QSYS_SIMDIR/submodules/altera_merlin_reorder_memory.sv"             -work mm_bridge_master_m0_limiter     
  vlog  "$QSYS_SIMDIR/submodules/altera_avalon_sc_fifo.v"                     -work mm_bridge_master_m0_limiter     
  vlog  "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_base.v"            -work mm_bridge_master_m0_limiter     
  vlog  "$QSYS_SIMDIR/submodules/jtag_system_mm_interconnect_1_router_001.sv" -work router_001                      
  vlog  "$QSYS_SIMDIR/submodules/jtag_system_mm_interconnect_1_router.sv"     -work router                          
  vlog  "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                 -work rsp_mux                         
  vlog  "$QSYS_SIMDIR/submodules/jtag_system_mm_interconnect_0_rsp_mux.sv"    -work rsp_mux                         
  vlog  "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                 -work cmd_mux                         
  vlog  "$QSYS_SIMDIR/submodules/jtag_system_mm_interconnect_0_cmd_mux.sv"    -work cmd_mux                         
  vlog  "$QSYS_SIMDIR/submodules/jtag_system_mm_interconnect_0_cmd_demux.sv"  -work cmd_demux                       
  vlog  "$QSYS_SIMDIR/submodules/jtag_system_mm_interconnect_0_router_001.sv" -work router_001                      
  vlog  "$QSYS_SIMDIR/submodules/jtag_system_mm_interconnect_0_router.sv"     -work router                          
  vlog  "$QSYS_SIMDIR/submodules/altera_merlin_slave_agent.sv"                -work mm_bridge_master_s0_agent       
  vlog  "$QSYS_SIMDIR/submodules/altera_merlin_burst_uncompressor.sv"         -work mm_bridge_master_s0_agent       
  vlog  "$QSYS_SIMDIR/submodules/altera_merlin_master_agent.sv"               -work jtag_master_master_agent        
  vlog  "$QSYS_SIMDIR/submodules/altera_merlin_slave_translator.sv"           -work mm_bridge_master_s0_translator  
  vlog  "$QSYS_SIMDIR/submodules/altera_merlin_master_translator.sv"          -work jtag_master_master_translator   
  vlog  "$QSYS_SIMDIR/submodules/jtag_system_jtag_master_p2b_adapter.sv"      -work p2b_adapter                     
  vlog  "$QSYS_SIMDIR/submodules/jtag_system_jtag_master_b2p_adapter.sv"      -work b2p_adapter                     
  vlog  "$QSYS_SIMDIR/submodules/altera_avalon_packets_to_master.v"           -work transacto                       
  vlog  "$QSYS_SIMDIR/submodules/altera_avalon_st_packets_to_bytes.v"         -work p2b                             
  vlog  "$QSYS_SIMDIR/submodules/altera_avalon_st_bytes_to_packets.v"         -work b2p                             
  vlog  "$QSYS_SIMDIR/submodules/altera_avalon_sc_fifo.v"                     -work fifo                            
  vlog  "$QSYS_SIMDIR/submodules/jtag_system_jtag_master_timing_adt.sv"       -work timing_adt                      
  vlog  "$QSYS_SIMDIR/submodules/altera_avalon_st_jtag_interface.v"           -work jtag_phy_embedded_in_jtag_master
  vlog  "$QSYS_SIMDIR/submodules/altera_jtag_dc_streaming.v"                  -work jtag_phy_embedded_in_jtag_master
  vlog  "$QSYS_SIMDIR/submodules/altera_jtag_sld_node.v"                      -work jtag_phy_embedded_in_jtag_master
  vlog  "$QSYS_SIMDIR/submodules/altera_jtag_streaming.v"                     -work jtag_phy_embedded_in_jtag_master
  vlog  "$QSYS_SIMDIR/submodules/altera_pli_streaming.v"                      -work jtag_phy_embedded_in_jtag_master
  vlog  "$QSYS_SIMDIR/submodules/altera_avalon_st_clock_crosser.v"            -work jtag_phy_embedded_in_jtag_master
  vlog  "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_base.v"            -work jtag_phy_embedded_in_jtag_master
  vlog  "$QSYS_SIMDIR/submodules/altera_avalon_st_idle_remover.v"             -work jtag_phy_embedded_in_jtag_master
  vlog  "$QSYS_SIMDIR/submodules/altera_avalon_st_idle_inserter.v"            -work jtag_phy_embedded_in_jtag_master
  vlog  "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_stage.sv"          -work jtag_phy_embedded_in_jtag_master
  vlog  "$QSYS_SIMDIR/submodules/altera_reset_controller.v"                   -work rst_controller                  
  vlog  "$QSYS_SIMDIR/submodules/altera_reset_synchronizer.v"                 -work rst_controller                  
  vlog  "$QSYS_SIMDIR/submodules/jtag_system_mm_interconnect_1.v"             -work mm_interconnect_1               
  vlog  "$QSYS_SIMDIR/submodules/jtag_system_mm_interconnect_0.v"             -work mm_interconnect_0               
  vlog  "$QSYS_SIMDIR/submodules/altera_avalon_mm_bridge.v"                   -work mm_bridge_master                
  vlog  "$QSYS_SIMDIR/submodules/jtag_system_jtag_master.v"                   -work jtag_master                     
  vlog  "$QSYS_SIMDIR/jtag_system.v"                                                                                
}

# ----------------------------------------
# Elaborate top level design
alias elab {
  echo "\[exec\] elab"
  eval vsim +access +r -t ps $ELAB_OPTIONS -L work -L rsp_mux -L rsp_demux -L cmd_mux -L cmd_demux -L mm_bridge_master_m0_limiter -L router_001 -L router -L mm_bridge_master_s0_agent -L jtag_master_master_agent -L mm_bridge_master_s0_translator -L jtag_master_master_translator -L p2b_adapter -L b2p_adapter -L transacto -L p2b -L b2p -L fifo -L timing_adt -L jtag_phy_embedded_in_jtag_master -L rst_controller -L mm_interconnect_1 -L mm_interconnect_0 -L mm_bridge_master -L jtag_master -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L arriav_ver -L arriav_hssi_ver -L arriav_pcie_hip_ver $TOP_LEVEL_NAME
}

# ----------------------------------------
# Elaborate the top level design with -dbg -O2 option
alias elab_debug {
  echo "\[exec\] elab_debug"
  eval vsim -dbg -O2 +access +r -t ps $ELAB_OPTIONS -L work -L rsp_mux -L rsp_demux -L cmd_mux -L cmd_demux -L mm_bridge_master_m0_limiter -L router_001 -L router -L mm_bridge_master_s0_agent -L jtag_master_master_agent -L mm_bridge_master_s0_translator -L jtag_master_master_translator -L p2b_adapter -L b2p_adapter -L transacto -L p2b -L b2p -L fifo -L timing_adt -L jtag_phy_embedded_in_jtag_master -L rst_controller -L mm_interconnect_1 -L mm_interconnect_0 -L mm_bridge_master -L jtag_master -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L arriav_ver -L arriav_hssi_ver -L arriav_pcie_hip_ver $TOP_LEVEL_NAME
}

# ----------------------------------------
# Compile all the design files and elaborate the top level design
alias ld "
  dev_com
  com
  elab
"

# ----------------------------------------
# Compile all the design files and elaborate the top level design with -dbg -O2
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
  echo "elab_debug                    -- Elaborate the top level design with -dbg -O2 option"
  echo
  echo "ld                            -- Compile all the design files and elaborate the top level design"
  echo
  echo "ld_debug                      -- Compile all the design files and elaborate the top level design with -dbg -O2"
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
