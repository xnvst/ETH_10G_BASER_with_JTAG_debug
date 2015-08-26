#==============================================================================
#                    High Level System Base Addresses
#==============================================================================

# -- System Controller Base Address
global GEN_BASE_ADDR     			
global MON_BASE_ADDR     			
global SYS_CTRL_LPBK_BASE_ADDR 	

# -- 10G Ethernet XAUI/10G Base R Design Example Base Address
global 10GMAC_BASE_ADDR 			
global PHY_IP_BASE_ADDR			
global MDIO_BASE_ADDR 				
global XGMII_LB_BASE_ADDR 			
global 10G_RX_FIFO_BASE_ADDR 		
global 10G_TX_FIFO_BASE_ADDR		

##==============================================================================
##		Generator Registers Map
##==============================================================================  

global GEN_NUMPKTS 		
global GEN_RANDOMLENGTH 	
global GEN_RANDOMPAYLOAD	
global GEN_START 			
global GEN_STOP 			
global GEN_MACSA0 			
global GEN_MACSA1 			
global GEN_MACDA0 			
global GEN_MACDA1 			
global GEN_TXPKTCNT 		
global GEN_RNDSEED0 		
global GEN_RNDSEED1 		
global GEN_RNDSEED2 		
global GEN_PKTLENGTH 		

##==============================================================================
##		Monitor Registers Map
##==============================================================================

global	MON_RXPKTCNT_EXPT	
global	MON_RXPKTCNT_GOOD		
global	MON_RXPKTCNT_BAD 		
global	MON_RXBYTECNT_LO32 	
global	MON_RXBYTECNT_HI32 	
global	MON_RXCYCLCNT_LO32 	
global	MON_RXCYCLCNT_HI32 	
global	MON_RXCTRL_STATUS 	
global	GEN_MON_LPBK 		

#==============================================================================
#                       MAC Register Address Map                
#==============================================================================
# RX path
global 10g_mac_rx_packet_transfer_reg_map		
global 10g_mac_rx_pad_crc_remover_reg_map		
global	10g_mac_rx_crc_checker_reg_map			
global 10g_mac_rx_packet_overflow_reg_map		
global 10g_mac_rx_preamble_control_reg_map		
global 10g_mac_rx_lane_decoder_reg_map			
global 10g_mac_rx_frame_decoder_reg_map		
global 10g_mac_rx_statistic_counters_reg_map	

# TX path
global 10g_mac_tx_packet_transfer_reg_map		
global	10g_mac_tx_pad_inserter_reg_map			
global	10g_mac_tx_crc_inserter_reg_map			
global	10g_mac_tx_packet_underflow_reg_map		
global	10g_mac_tx_preamble_control_reg_map		
global	10g_mac_tx_pause_frm_ctrl_gen_reg_map	
global	10g_mac_tx_pfc_gen_reg_map				
global	10g_mac_tx_address_inserter_reg_map		
global	10g_mac_tx_frame_decoder_reg_map		
global	10g_mac_tx_statistic_counters_reg_map	

#==============================================================================
#		MAC registers Offglobal
#==============================================================================

# RX Packet Transfer
global	rx_transfer_control						
global	rx_transfer_status						
                                			
# RX Pad/CRC Remover            			
global rx_padcrc_control						
                                			
# RX CRC Checker                			
global	rx_crccheck_control						
                                			
# RX Packet Overflow            			
global rx_pktovrflow_error_lo					
global rx_pktovrflow_error_hi					
global rx_pktovrflow_etherStatsDropEvents_lo	
global rx_pktovrflow_etherStatsDropEvents_hi	

# RX Preamble Control
global rx_preamble_inserter_control			

# RX Lane Decoder
global rx_lane_decoder_preamble_control		

# RX Frame Decoder
global rx_frame_control						
global rx_frame_maxlength						
global rx_frame_addr0							
global rx_frame_addr1							
                                    		
global rx_frame_spaddr0_0						
global rx_frame_spaddr0_1						
global rx_frame_spaddr1_0						
global rx_frame_spaddr1_1						
global rx_frame_spaddr2_0						
global rx_frame_spaddr2_1						
global rx_frame_spaddr3_0						
global rx_frame_spaddr3_1						
                                    		
global rx_pfc_control							

# TX Packet Transfer
global tx_transfer_control						
global tx_transfer_status						
                                    		
# TX Pad Inserter                   		
global tx_padins_control						
                                    		
# TX CRC Inserter                   		
global tx_crcins_control						
                                    		
# TX Packet Underflow               		
global tx_pktunderflow_error_lo				
global tx_pktunderflow_error_hi				
                                    		
# TX Preamble Control               		
global tx_preamble_control						
                                    		
# TX Pause Frame Control and Generator
global tx_pauseframe_control					
global tx_pauseframe_quanta					
global tx_pauseframe_enable					
                                    		
# TX PFC Generator                  		
global pfc_pause_quanta_0						
global pfc_pause_quanta_1						
global pfc_pause_quanta_2						
global pfc_pause_quanta_3						
global pfc_pause_quanta_4						
global pfc_pause_quanta_5						
global pfc_pause_quanta_6						
global pfc_pause_quanta_7						
                                    		
global pfc_holdoff_quanta_0					
global pfc_holdoff_quanta_1					
global pfc_holdoff_quanta_2					
global pfc_holdoff_quanta_3					
global pfc_holdoff_quanta_4					
global pfc_holdoff_quanta_5					
global pfc_holdoff_quanta_6					
global pfc_holdoff_quanta_7					
                                    		
global tx_pfc_priority_enable					
                                    		
# TX Address Inserter               		
global tx_addrins_control						
global tx_addrins_macaddr0						
global tx_addrins_macaddr1						
                                    		
# TX Frame Decoder                  		
global tx_frame_maxlength						

# 64-bits Statistic Counter High & Low Byte (Reg Map: 10g_mac_rx_statistic_counters_reg_map & 10g_mac_tx_statistic_counters_reg_map)
global ClearStats             					
global framesOK_lo            					
global framesOK_hi								
global framesErr_lo           					
global framesErr_hi							
global framesCRCErr_lo        					
global framesCRCErr_hi							
global octetsOK_lo            					
global octetsOK_hi            					
global pauseMACCtrlFrames_lo  					
global pauseMACCtrlFrames_hi  					 
global ifErrors_lo            					
global ifErrors_hi            					
global unicastFramesOK_lo     					
global unicastFramesOK_hi     					
global unicastFramesErr_lo    					
global unicastFramesErr_hi    					
global multicastFramesOK_lo   					
global multicastFramesOK_hi   					
global multicastFramesErr_lo  					
global multicastFramesErr_hi  					
global broadcastFramesOK_lo   					
global broadcastFramesOK_hi   					
global broadcastFramesErr_lo  					
global broadcastFramesErr_hi  					
global etherStatsOctets_lo    					
global etherStatsOctets_hi    					
global etherStatsPkts_lo      					
global etherStatsPkts_hi      					
global etherStatsUndersizePkts_lo         		
global etherStatsUndersizePkts_hi         		
global etherStatsOversizePkts_lo          		
global etherStatsOversizePkts_hi          		
global etherStatsPkts64Octets_lo          		
global etherStatsPkts64Octets_hi          		
global etherStatsPkts65to127Octets_lo     		
global etherStatsPkts65to127Octets_hi     		
global etherStatsPkts128to255Octets_lo    		
global etherStatsPkts128to255Octets_hi    		
global etherStatsPkts256to511Octets_lo    		
global etherStatsPkts256to511Octets_hi    		
global etherStatsPkts512to1023Octets_lo   		
global etherStatsPkts512to1023Octets_hi   		
global etherStatPkts1024to1518Octets_lo   		
global etherStatPkts1024to1518Octets_hi   		
global etherStatsPkts1519toXOctets_lo     		
global etherStatsPkts1519toXOctets_hi     		
global etherStatsFragments_lo             		
global etherStatsFragments_hi             		
global etherStatsJabbers_lo               		
global etherStatsJabbers_hi               		
global etherStatsCRCErr_lo                		
global etherStatsCRCErr_hi                		
global unicastMACCtrlFrames_lo            		
global unicastMACCtrlFrames_hi            		
global multicastMACCtrlFrames_lo          		
global multicastMACCtrlFrames_hi          		
global broadcastMACCtrlFrames_lo          		
global broadcastMACCtrlFrames_hi          		

## Jier: confirm on this register
## _____________________________________________________________________   
##LKSIM: missing		
global RXFIFO_DROP_ON_ERROR                 	
   
##LOCAL LOOPBACK
global XGMII_LLPBK                           	

#==============================================================================
#                       XAUI / 10G Base R Register Address Map                
#==============================================================================
# XAUI Register Map
global	xaui_pma_common_ctrl_stats_reg_map			
global xaui_reset_ctrl_reg_map						
global xaui_pma_ctrl_stats_reg_map					
global	xaui_xaui_pcs_reg_map						

# 10G Base R Register Map
global 10g_baser_pma_common_ctrl_stats_reg_map		
global	10g_baser_reglobal_ctrl_reg_map				
global 10g_baser_pma_ch_ctrl_stats_reg_map			
global	10g_baser_pcs_reg_map						

#==============================================================================
#						XAUI / 10G Base R Register Offglobal
#==============================================================================
# PMA Common Control and Status Register
global	cal_blk_powerdown						
global	pma_tx_pll_is_locked					

# Reglobal Control Registers - Automatic Reglobal Controller
global reset_ch_bitmask					
global reset_control						
global reset_status						

# Reglobal Controls - Manual Mode
global manual_reset_control

# PMA Control and Status Register
global phy_serial_loopback				
global pma_rx_signaldetect				
global pma_rx_set_locktodata			
global pma_rx_set_locktoref			
global pma_rx_is_lockedtodata			
global pma_rx_is_lockedtoref			

##============================================================================== 
# XAUI PCS Register
##============================================================================== 
global xaui_gxb_digitalreset			
global xaui_rx_invpolarity				
global xaui_tx_invpolarity				
global xaui_gxb_status					
global xaui_gxb_err_status_1			
global xaui_gxb_err_status_2			
global xaui_gxb_rmfifo_ins_del			
global xaui_gxb_rmfifo_full_empty		
global xaui_phase_comp_fifo_error		
global xaui_simulation_flag			

##============================================================================== 
# 10G Base R PCS Register
##============================================================================== 
global 10g_baser_indirect_addr			
global 10g_baser_err_count_clr			
global 10g_baser_pcs_status			
global 10g_baser_err_count				

#==============================================================================
#                BroadCom PHY BCM 8727 PHY Register Address Map                
#==============================================================================

global CHIP_ID				

# ________________________________________________
#	XGXS registers
# ________________________________________________

# XGXS Control register bit[14]: xgxs system lpbk
# ________________________________________________
global XGXS_CONTROL 		

# ________________________________________________
# xgxs Lane Status register
# bit[12:]: Lanes aligned
# bits[3:0]: Lanes in sync
# ________________________________________________
global XGXS_STATUS  		


# ________________________________________________
# global bits[15:0] of RXA_LANESWAP to 11
# and bit[15] of TXA_LANESWAP to 1 for
# both directions lane swapped
# ________________________________________________
global XGXS_RXLANE_SWAP  	
global XGXS_TXLANE_SWAP  	

# ________________________________________________
# xgxs Mode Control
# bit[11:8] = 0000 for xgxs local loopback
# bit[6] = 1 for xgxs remote loopback
# ________________________________________________
global XGXS_MODE_CONTROL  	


# ________________________________________________
#	PMA-PMD registers
# ________________________________________________

# ________________________________________________
#	PMA-PMD control register bit[0]: pma lpbk
#				 bit[15]: reglobal 
#	reglobal value = 0x2040
# ________________________________________________
global SFI_PMAPMD_CONTROL 	

# ________________________________________________
#	PCS control register bit[14]: pcs system lpbk
# ________________________________________________
global SFI_PCS_CONTROL 	