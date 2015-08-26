global env ;
vlib work
vlog -work work $env(QUARTUS_ROOTDIR)/eda/sim_lib/220model.v -incr 
vlog -work work $env(QUARTUS_ROOTDIR)/eda/sim_lib/altera_mf.v -incr 
vlog -work work $env(QUARTUS_ROOTDIR)/eda/sim_lib/sgate.v -incr 
vlog -work work $env(QUARTUS_ROOTDIR)/eda/sim_lib/stratixiv_atoms.v -incr 

vlog -work work $env(QUARTUS_ROOTDIR)/eda/sim_lib/altera_primitives.v -incr 
vlog -work work -sv $env(QUARTUS_ROOTDIR)/eda/sim_lib/altera_lnsim.sv -incr 
vlog -work work $env(QUARTUS_ROOTDIR)/eda/sim_lib/stratixiv_hssi_atoms.v -incr 
vlog -work work $env(QUARTUS_ROOTDIR)/eda/sim_lib/stratixiv_pcie_hip_atoms.v -incr 


vlog -work work ../PLL/sys_pll.v
vlog -work work ../TRAFFIC_CONTROLLER/alt_mf/crcgen.vo
vlog -work work ../TRAFFIC_CONTROLLER/alt_mf/crcchk.vo

vlog -work work ../TRAFFIC_CONTROLLER/avalon_st_traffic_controller.v
vlog -work work ../TRAFFIC_CONTROLLER/avalon_st_prtmux.v
vlog -work work ../TRAFFIC_CONTROLLER/avalon_st_gen.v
vlog -work work ../TRAFFIC_CONTROLLER/avalon_st_mon.v
vlog -work work ../TRAFFIC_CONTROLLER/shiftreg_ctrl.v
vlog -work work ../TRAFFIC_CONTROLLER/shiftreg_data.v

vlog -work work ../SYSTEM_CONTROLLER/sys_control.v
vlog -work work ../SYSTEM_CONTROLLER/master_slave_decoder.v
vlog -work work ../SYSTEM_CONTROLLER/master_slave_bridge.v
vlog -work work ../LED_CONTROL.v
vlog -work work ../LED_CTRL_MUX.v 
vlog -work work ../CHIP.v 


# Compile contents extracted from QSYS's auto-generated msim_setup.tcl
# For Mentor
set unenc_file_dir ../ETH10G_TOP/simulation/submodules
set enc_file_dir ../ETH10G_TOP/simulation/submodules/mentor

# for Aldec
#set enc_file_dir ../ETH10G_TOP/simulation/submodules/aldec


# for cadence
#set enc_file_dir ../ETH10G_TOP/simulation/submodules/cadence


# for synopsys
#set enc_file_dir ../ETH10G_TOP/simulation/submodules/synopsys

vlog  +incdir+$enc_file_dir -sv $enc_file_dir/altera_10gbaser_phy_params.sv
vlog  +incdir+$enc_file_dir -sv $enc_file_dir/altera_10gbaser_phy_random_ver_10g.sv
vlog  +incdir+$enc_file_dir -sv $enc_file_dir/altera_10gbaser_phy_word_align.v
vlog  +incdir+$enc_file_dir -sv $enc_file_dir/altera_10gbaser_phy_tx_top.v
vlog  +incdir+$enc_file_dir -sv $enc_file_dir/altera_10gbaser_phy_tx_sm_ns.sv
vlog  +incdir+$enc_file_dir -sv $enc_file_dir/altera_10gbaser_phy_tx_sm_datapath.sv
vlog  +incdir+$enc_file_dir -sv $enc_file_dir/altera_10gbaser_phy_square_wave_gen.v
vlog  +incdir+$enc_file_dir -sv $enc_file_dir/altera_10gbaser_phy_scramble.v
vlog  +incdir+$enc_file_dir -sv $enc_file_dir/altera_10gbaser_phy_rx_top.v
vlog  +incdir+$enc_file_dir -sv $enc_file_dir/altera_10gbaser_phy_rx_sm_ns.sv
vlog  +incdir+$enc_file_dir -sv $enc_file_dir/altera_10gbaser_phy_rx_sm_datapath.sv
vlog  +incdir+$enc_file_dir -sv $enc_file_dir/altera_10gbaser_phy_register_with_byte_enable.v
vlog  +incdir+$enc_file_dir -sv $enc_file_dir/altera_10gbaser_phy_random_ver.sv
vlog  +incdir+$enc_file_dir -sv $enc_file_dir/altera_10gbaser_phy_random_gen.sv
vlog  +incdir+$enc_file_dir -sv $enc_file_dir/altera_10gbaser_phy_random_err_cnt_ns.sv
vlog  +incdir+$enc_file_dir -sv $enc_file_dir/altera_10gbaser_phy_prbs_ver_xg.v
vlog  +incdir+$enc_file_dir -sv $enc_file_dir/altera_10gbaser_phy_prbs_gen_xg.v
vlog  +incdir+$enc_file_dir -sv $enc_file_dir/altera_10gbaser_phy_pcs_10g_top.sv
vlog  +incdir+$enc_file_dir -sv $enc_file_dir/altera_10gbaser_phy_pcs_10g.v
vlog  +incdir+$enc_file_dir -sv $enc_file_dir/altera_10gbaser_phy_nto1mux.v
vlog  +incdir+$enc_file_dir -sv $enc_file_dir/altera_10gbaser_phy_lock_sm.v
vlog  +incdir+$enc_file_dir -sv $enc_file_dir/altera_10gbaser_phy_gearbox_red.v
vlog  +incdir+$enc_file_dir -sv $enc_file_dir/altera_10gbaser_phy_gearbox_exp.v
vlog  +incdir+$enc_file_dir -sv $enc_file_dir/altera_10gbaser_phy_encode_type.sv
vlog  +incdir+$enc_file_dir -sv $enc_file_dir/altera_10gbaser_phy_encode.sv
vlog  +incdir+$enc_file_dir -sv $enc_file_dir/altera_10gbaser_phy_descramble.v
vlog  +incdir+$enc_file_dir -sv $enc_file_dir/altera_10gbaser_phy_decode_type.sv
vlog  +incdir+$enc_file_dir -sv $enc_file_dir/altera_10gbaser_phy_decode.sv
vlog  +incdir+$enc_file_dir -sv $enc_file_dir/altera_10gbaser_phy_clockcomp.sv
vlog  +incdir+$enc_file_dir -sv $enc_file_dir/altera_10gbaser_phy_clk_ctrl.v
vlog  +incdir+$enc_file_dir -sv $enc_file_dir/altera_10gbaser_phy_blksync_datapath.v
vlog  +incdir+$enc_file_dir -sv $enc_file_dir/altera_10gbaser_phy_blksync.v
vlog  +incdir+$enc_file_dir -sv $enc_file_dir/altera_10gbaser_phy_bitsync.v
vlog  +incdir+$enc_file_dir -sv $enc_file_dir/altera_10gbaser_phy_ber_sm.v
vlog  +incdir+$enc_file_dir -sv $enc_file_dir/altera_10gbaser_phy_ber_cnt_ns.v
vlog  +incdir+$enc_file_dir -sv $enc_file_dir/altera_10gbaser_phy_ber.v
vlog  +incdir+$enc_file_dir -sv $enc_file_dir/altera_10gbaser_phy_reg_map_av.sv
vlog  +incdir+$enc_file_dir -sv $enc_file_dir/altera_10gbaser_phy_async_fifo.sv
vlog  +incdir+$enc_file_dir -sv $enc_file_dir/alt_10gbaser_pcs.v
vlog  +incdir+$enc_file_dir -sv $enc_file_dir/altera_10gbaser_phy_rx_fifo_wrap.v 
vlog  +incdir+$enc_file_dir -sv $enc_file_dir/altera_10gbaser_phy_rx_fifo.v
vlog  +incdir+$enc_file_dir -sv $enc_file_dir/altera_10gbaser_phy_async_fifo_fpga.sv 




vlog -work work -sv $unenc_file_dir/alt_pma_functions.sv
vlog -work work -sv $unenc_file_dir/altera_xcvr_functions.sv
vlog -work work -sv $unenc_file_dir/alt_xcvr_csr_common_h.sv
vlog -work work -sv $unenc_file_dir/csr_pcs10gbaser_h.sv
vlog -work work -sv $unenc_file_dir/alt_xcvr_csr_pcs8g_h.sv
vlog -work work -sv $unenc_file_dir/*.sv
vlog -work work $unenc_file_dir/*.vo
vlog -work work $unenc_file_dir/*.v

vlog -work work ../ETH10G_TOP/simulation/ETH10G_TOP.v

# compile the BFM and the TB at the end
vlog -work work ./altera_jtag_avalon_master.v
vlog -work work ./tb.v 
# Start simulation

do runsim.tcl
