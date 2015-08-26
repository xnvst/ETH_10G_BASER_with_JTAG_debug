
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

# ACDS 14.0 205 win32 2014.11.06.21:36:35

# ----------------------------------------
# ncsim - auto-generated simulation script

# ----------------------------------------
# initialize variables
TOP_LEVEL_NAME="avalon_dc_fifo"
QSYS_SIMDIR="./../"
QUARTUS_INSTALL_DIR="C:/altera/14.0/quartus/"
SKIP_FILE_COPY=0
SKIP_DEV_COM=0
SKIP_COM=0
SKIP_ELAB=0
SKIP_SIM=0
USER_DEFINED_ELAB_OPTIONS=""
USER_DEFINED_SIM_OPTIONS="-input \"@run 100; exit\""

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
if [[ `ncsim -version` != *"ncsim(64)"* ]]; then
  :
else
  :
fi

# ----------------------------------------
# create compilation libraries
mkdir -p ./libraries/work/
mkdir -p ./libraries/rst_controller/
mkdir -p ./libraries/dc_fifo/
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
  ncvlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.v"                    -work altera_ver         
  ncvlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v"                             -work lpm_ver            
  ncvlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.v"                                -work sgate_ver          
  ncvlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.v"                            -work altera_mf_ver      
  ncvlog -sv "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv"                        -work altera_lnsim_ver   
  ncvlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cadence/arriav_atoms_ncrypt.v"          -work arriav_ver         
  ncvlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cadence/arriav_hmi_atoms_ncrypt.v"      -work arriav_ver         
  ncvlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/arriav_atoms.v"                         -work arriav_ver         
  ncvlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cadence/arriav_hssi_atoms_ncrypt.v"     -work arriav_hssi_ver    
  ncvlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/arriav_hssi_atoms.v"                    -work arriav_hssi_ver    
  ncvlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/cadence/arriav_pcie_hip_atoms_ncrypt.v" -work arriav_pcie_hip_ver
  ncvlog     "$QUARTUS_INSTALL_DIR/eda/sim_lib/arriav_pcie_hip_atoms.v"                -work arriav_pcie_hip_ver
fi

# ----------------------------------------
# compile design files in correct order
if [ $SKIP_COM -eq 0 ]; then
  ncvlog "$QSYS_SIMDIR/submodules/altera_reset_controller.v"           -work rst_controller -cdslib ./cds_libs/rst_controller.cds.lib
  ncvlog "$QSYS_SIMDIR/submodules/altera_reset_synchronizer.v"         -work rst_controller -cdslib ./cds_libs/rst_controller.cds.lib
  ncvlog "$QSYS_SIMDIR/submodules/altera_avalon_dc_fifo.v"             -work dc_fifo        -cdslib ./cds_libs/dc_fifo.cds.lib       
  ncvlog "$QSYS_SIMDIR/submodules/altera_dcfifo_synchronizer_bundle.v" -work dc_fifo        -cdslib ./cds_libs/dc_fifo.cds.lib       
  ncvlog "$QSYS_SIMDIR/avalon_dc_fifo.v"                                                                                             
fi

# ----------------------------------------
# elaborate top level design
if [ $SKIP_ELAB -eq 0 ]; then
  ncelab -access +w+r+c -namemap_mixgen $ELAB_OPTIONS $USER_DEFINED_ELAB_OPTIONS $TOP_LEVEL_NAME
fi

# ----------------------------------------
# simulate
if [ $SKIP_SIM -eq 0 ]; then
  eval ncsim -licqueue $SIM_OPTIONS $USER_DEFINED_SIM_OPTIONS $TOP_LEVEL_NAME
fi
