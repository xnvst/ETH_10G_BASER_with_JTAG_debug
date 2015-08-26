# (C) 2001-2014 Altera Corporation. All rights reserved.
# Your use of Altera Corporation's design tools, logic functions and other 
# software and tools, and its AMPP partner logic functions, and any output 
# files any of the foregoing (including device programming or simulation 
# files), and any associated documentation or information are expressly subject 
# to the terms and conditions of the Altera Program License Subscription 
# Agreement, Altera MegaCore Function License Agreement, or other applicable 
# license agreement, including, without limitation, that your use is for the 
# sole purpose of programming logic devices manufactured by Altera and sold by 
# Altera or its authorized distributors.  Please refer to the applicable 
# agreement for further details.


#**************************************************************
# Time Information
#**************************************************************

#**************************************************************
# Create Clock
#**************************************************************

#**************************************************************
# Create Generated Clock
#**************************************************************

#**************************************************************
# Set Clock Latency
#**************************************************************

#**************************************************************
# Set Clock Uncertainty
#**************************************************************

#**************************************************************
# Set Input Delay
#**************************************************************

set_false_path -from  [get_registers *av_xcvr_10gbaser_nr_inst*phcomp_wren_reg] -to [get_registers *bitsync2_phcomp_wren*sync_regs[0]]
set_false_path -from  [get_registers *av_xcvr_10gbaser_nr_inst*cur_data_in*] -to [get_registers *bitsync2_block_lock*sync_regs[0]]
set_false_path -from  [get_registers *altera_10gbaser_phy_rx_fifo*octet_del_num*] -to [get_registers *altera_10gbaser_phy_rx_fifo*sync_del_en_rdclk*sync_regs[0]]

set_false_path -from  [get_registers *pcs_10g_top_0*blk_lock_*] -to [get_registers *pcs_map*mux_pcs_status*]
set_false_path -from  [get_registers *pcs_10g_top_0*data_out_valid*] -to [get_registers *pcs_map*mux_pcs_status*]
set_false_path -from  [get_registers *pcs_10g_top_0*errblk_cnt*] -to [get_registers *pcs_map*mux_pcs_status*]
set_false_path -from  [get_registers *pcs_10g_top_0*ber_count*] -to [get_registers *pcs_map*mux_pcs_status*]
set_false_path -from  [get_registers *pcs_10g_top_0*hi_ber*] -to [get_registers *pcs_map*mux_pcs_status*]
set_false_path -from  [get_registers *pcs_10g_top_0*async_fifo_fpga*|wr_full] -to [get_registers *pcs_map*mux_pcs_status*]

set_false_path -to {*altera_10gbaser_phy_clk_ctrl*tx_pma_rstn}
set_false_path -to {*altera_10gbaser_phy_clk_ctrl*rx_pma_rstn}
set_false_path -to {*altera_10gbaser_phy_clk_ctrl*rx_usr_rstn}
set_false_path -to {*altera_10gbaser_phy_clk_ctrl*tx_usr_rstn}
set_false_path -to {*altera_10gbaser_phy_clk_ctrl*tx_pma_rstn_r}
set_false_path -to {*altera_10gbaser_phy_clk_ctrl*rx_pma_rstn_r}
set_false_path -to {*altera_10gbaser_phy_clk_ctrl*rx_usr_rstn_r}
set_false_path -to {*altera_10gbaser_phy_clk_ctrl*tx_usr_rstn_r}

# DCFIFO async reset constraint
set_false_path -to [get_registers *altera_10gbaser_phy_async_fifo_fpga*dffpipe*rdaclr*]
set_false_path -to [get_registers *altera_10gbaser_phy_async_fifo_fpga*dffpipe*wraclr*]
