
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

# ACDS 14.0 205 win32 2014.11.09.00:39:19

# ----------------------------------------
# vcsmx - auto-generated simulation script

# ----------------------------------------
# initialize variables
TOP_LEVEL_NAME="jtag_system"
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
mkdir -p ./libraries/mm_bridge_master_m0_limiter/
mkdir -p ./libraries/router_001/
mkdir -p ./libraries/router/
mkdir -p ./libraries/mm_bridge_master_s0_agent/
mkdir -p ./libraries/jtag_master_master_agent/
mkdir -p ./libraries/mm_bridge_master_s0_translator/
mkdir -p ./libraries/jtag_master_master_translator/
mkdir -p ./libraries/p2b_adapter/
mkdir -p ./libraries/b2p_adapter/
mkdir -p ./libraries/transacto/
mkdir -p ./libraries/p2b/
mkdir -p ./libraries/b2p/
mkdir -p ./libraries/fifo/
mkdir -p ./libraries/timing_adt/
mkdir -p ./libraries/jtag_phy_embedded_in_jtag_master/
mkdir -p ./libraries/rst_controller/
mkdir -p ./libraries/mm_interconnect_1/
mkdir -p ./libraries/mm_interconnect_0/
mkdir -p ./libraries/mm_bridge_master/
mkdir -p ./libraries/jtag_master/
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
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                 -work rsp_mux                         
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/jtag_system_mm_interconnect_1_rsp_mux.sv"    -work rsp_mux                         
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/jtag_system_mm_interconnect_1_rsp_demux.sv"  -work rsp_demux                       
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                 -work cmd_mux                         
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/jtag_system_mm_interconnect_1_cmd_mux.sv"    -work cmd_mux                         
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/jtag_system_mm_interconnect_1_cmd_demux.sv"  -work cmd_demux                       
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_merlin_traffic_limiter.sv"            -work mm_bridge_master_m0_limiter     
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_merlin_reorder_memory.sv"             -work mm_bridge_master_m0_limiter     
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_avalon_sc_fifo.v"                     -work mm_bridge_master_m0_limiter     
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_base.v"            -work mm_bridge_master_m0_limiter     
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/jtag_system_mm_interconnect_1_router_001.sv" -work router_001                      
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/jtag_system_mm_interconnect_1_router.sv"     -work router                          
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                 -work rsp_mux                         
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/jtag_system_mm_interconnect_0_rsp_mux.sv"    -work rsp_mux                         
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                 -work cmd_mux                         
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/jtag_system_mm_interconnect_0_cmd_mux.sv"    -work cmd_mux                         
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/jtag_system_mm_interconnect_0_cmd_demux.sv"  -work cmd_demux                       
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/jtag_system_mm_interconnect_0_router_001.sv" -work router_001                      
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/jtag_system_mm_interconnect_0_router.sv"     -work router                          
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_merlin_slave_agent.sv"                -work mm_bridge_master_s0_agent       
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_merlin_burst_uncompressor.sv"         -work mm_bridge_master_s0_agent       
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_merlin_master_agent.sv"               -work jtag_master_master_agent        
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_merlin_slave_translator.sv"           -work mm_bridge_master_s0_translator  
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_merlin_master_translator.sv"          -work jtag_master_master_translator   
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/jtag_system_jtag_master_p2b_adapter.sv"      -work p2b_adapter                     
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/jtag_system_jtag_master_b2p_adapter.sv"      -work b2p_adapter                     
  vlogan +v2k           "$QSYS_SIMDIR/submodules/altera_avalon_packets_to_master.v"           -work transacto                       
  vlogan +v2k           "$QSYS_SIMDIR/submodules/altera_avalon_st_packets_to_bytes.v"         -work p2b                             
  vlogan +v2k           "$QSYS_SIMDIR/submodules/altera_avalon_st_bytes_to_packets.v"         -work b2p                             
  vlogan +v2k           "$QSYS_SIMDIR/submodules/altera_avalon_sc_fifo.v"                     -work fifo                            
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/jtag_system_jtag_master_timing_adt.sv"       -work timing_adt                      
  vlogan +v2k           "$QSYS_SIMDIR/submodules/altera_avalon_st_jtag_interface.v"           -work jtag_phy_embedded_in_jtag_master
  vlogan +v2k           "$QSYS_SIMDIR/submodules/altera_jtag_dc_streaming.v"                  -work jtag_phy_embedded_in_jtag_master
  vlogan +v2k           "$QSYS_SIMDIR/submodules/altera_jtag_sld_node.v"                      -work jtag_phy_embedded_in_jtag_master
  vlogan +v2k           "$QSYS_SIMDIR/submodules/altera_jtag_streaming.v"                     -work jtag_phy_embedded_in_jtag_master
  vlogan +v2k           "$QSYS_SIMDIR/submodules/altera_pli_streaming.v"                      -work jtag_phy_embedded_in_jtag_master
  vlogan +v2k           "$QSYS_SIMDIR/submodules/altera_avalon_st_clock_crosser.v"            -work jtag_phy_embedded_in_jtag_master
  vlogan +v2k           "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_base.v"            -work jtag_phy_embedded_in_jtag_master
  vlogan +v2k           "$QSYS_SIMDIR/submodules/altera_avalon_st_idle_remover.v"             -work jtag_phy_embedded_in_jtag_master
  vlogan +v2k           "$QSYS_SIMDIR/submodules/altera_avalon_st_idle_inserter.v"            -work jtag_phy_embedded_in_jtag_master
  vlogan +v2k -sverilog "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_stage.sv"          -work jtag_phy_embedded_in_jtag_master
  vlogan +v2k           "$QSYS_SIMDIR/submodules/altera_reset_controller.v"                   -work rst_controller                  
  vlogan +v2k           "$QSYS_SIMDIR/submodules/altera_reset_synchronizer.v"                 -work rst_controller                  
  vlogan +v2k           "$QSYS_SIMDIR/submodules/jtag_system_mm_interconnect_1.v"             -work mm_interconnect_1               
  vlogan +v2k           "$QSYS_SIMDIR/submodules/jtag_system_mm_interconnect_0.v"             -work mm_interconnect_0               
  vlogan +v2k           "$QSYS_SIMDIR/submodules/altera_avalon_mm_bridge.v"                   -work mm_bridge_master                
  vlogan +v2k           "$QSYS_SIMDIR/submodules/jtag_system_jtag_master.v"                   -work jtag_master                     
  vlogan +v2k           "$QSYS_SIMDIR/jtag_system.v"                                                                                
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
