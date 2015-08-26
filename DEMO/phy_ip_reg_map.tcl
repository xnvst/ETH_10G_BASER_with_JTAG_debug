#==============================================================================
#                       XAUI / 10G Base R Register Address Map                
#==============================================================================
# XAUI Register Map
set	xaui_pma_common_ctrl_stats_reg_map			0x00000080
set xaui_reset_ctrl_reg_map						0x00000100
set xaui_pma_ctrl_stats_reg_map					0x00000180
set	xaui_xaui_pcs_reg_map						0x00000200

# 10G Base R Register Map
set 10g_baser_pma_common_ctrl_stats_reg_map		0x00000080
set	10g_baser_reset_ctrl_reg_map				0x00000100
set 10g_baser_pma_ch_ctrl_stats_reg_map			0x00000180
set	10g_baser_pcs_reg_map						0x00000200

#==============================================================================
#						XAUI / 10G Base R Register Offset
#==============================================================================
# PMA Common Control and Status Register
set	cal_blk_powerdown				0x084;		#word addr: 0x021, RW
set	pma_tx_pll_is_locked			0x088;		#word addr: 0x022, R

# Reset Control Registers - Automatic Reset Controller
set reset_ch_bitmask				0x104;		#word addr: 0x041, RW
set reset_control					0x108;		#word addr: 0x042, W
set reset_status					0x108;		#word addr: 0x042, R

# Reset Controls - Manual Mode
set manual_reset_control			0x110;		#word addr: 0x044, RW

# PMA Control and Status Register
set phy_serial_loopback				0x184;		#word addr: 0x061, RW
set	pma_rx_signaldetect				0x18c;		#word addr: 0x063, R
set	pma_rx_set_locktodata			0x190;		#word addr: 0x064, RW
set	pma_rx_set_locktoref			0x194;		#word addr: 0x065, RW
set	pma_rx_is_lockedtodata			0x198;		#word addr: 0x066, R
set pma_rx_is_lockedtoref			0x19c;		#word addr: 0x067, R

##============================================================================== 
# XAUI PCS Register
##============================================================================== 
set	xaui_gxb_digitalreset			0x204;		#word addr: 0x081, RW
set xaui_rx_invpolarity				0x208;		#word addr: 0x082, RW
set xaui_tx_invpolarity				0x20c;		#word addr: 0x083, RW
set xaui_gxb_status					0x210;		#word addr: 0x084, R
set xaui_gxb_err_status_1			0x214;		#word addr: 0x085, R
set xaui_gxb_err_status_2			0x218;		#word addr: 0x086, R
set xaui_gxb_rmfifo_ins_del			0x21c;		#word addr: 0x087, R
set xaui_gxb_rmfifo_full_empty		0x220;		#word addr: 0x088, R
set xaui_phase_comp_fifo_error		0x224;		#word addr: 0x089, R
set	xaui_simulation_flag			0x228;		#word addr: 0x08A, RW

##============================================================================== 
# 10G Base R PCS Register
##============================================================================== 
set 10g_baser_indirect_addr			0x200;		#word addr: 0x080, RW
set 10g_baser_err_count_clr			0x204;		#word addr: 0x081, RW
set 10g_baser_pcs_status			0x208;		#word addr: 0x082, R
set 10g_baser_err_count				0x20c;		#word addr: 0x083, R
