#==============================================================================
#                       MAC Register Address Map                
#==============================================================================
# RX path
set 10g_mac_rx_packet_transfer_reg_map		0x00000000
set 10g_mac_rx_pad_crc_remover_reg_map		0x00000100
set	10g_mac_rx_crc_checker_reg_map			0x00000200
set 10g_mac_rx_packet_overflow_reg_map		0x00000300
set 10g_mac_rx_preamble_control_reg_map		0x00000400
set 10g_mac_rx_lane_decoder_reg_map			0x00000500
set 10g_mac_rx_frame_decoder_reg_map		0x00002000
set 10g_mac_rx_statistic_counters_reg_map	0x00003000

# TX path
set 10g_mac_tx_packet_transfer_reg_map		0x00004000
set	10g_mac_tx_pad_inserter_reg_map			0x00004100
set	10g_mac_tx_crc_inserter_reg_map			0x00004200
set	10g_mac_tx_packet_underflow_reg_map		0x00004300
set	10g_mac_tx_preamble_control_reg_map		0x00004400
set	10g_mac_tx_pause_frm_ctrl_gen_reg_map	0x00004500
set	10g_mac_tx_pfc_gen_reg_map				0x00004600
set	10g_mac_tx_address_inserter_reg_map		0x00004800
set	10g_mac_tx_frame_decoder_reg_map		0x00006000
set	10g_mac_tx_statistic_counters_reg_map	0x00007000

#==============================================================================
#		MAC registers Offset
#==============================================================================

# RX Packet Transfer
set	rx_transfer_control						0x0000
set	rx_transfer_status						0x0004
                                			
# RX Pad/CRC Remover            			
set rx_padcrc_control						0x0100
                                			
# RX CRC Checker                			
set	rx_crccheck_control						0x0200
                                			
# RX Packet Overflow            			
set rx_pktovrflow_error_lo					0x0300
set rx_pktovrflow_error_hi					0x0304
set rx_pktovrflow_etherStatsDropEvents_lo	0x0308
set rx_pktovrflow_etherStatsDropEvents_hi	0x030C

# RX Preamble Control
set rx_preamble_inserter_control			0x0400

# RX Lane Decoder
set rx_lane_decoder_preamble_control		0x0500

# RX Frame Decoder
set rx_frame_control						0x2000
set rx_frame_maxlength						0x2004
set rx_frame_addr0							0x2008
set rx_frame_addr1							0x200C
                                    		
set rx_frame_spaddr0_0						0x2010
set rx_frame_spaddr0_1						0x2014
set rx_frame_spaddr1_0						0x2018
set rx_frame_spaddr1_1						0x201C
set rx_frame_spaddr2_0						0x2020
set rx_frame_spaddr2_1						0x2024
set rx_frame_spaddr3_0						0x2028
set rx_frame_spaddr3_1						0x202C
                                    		
set rx_pfc_control							0x2060

# TX Packet Transfer
set tx_transfer_control						0x4000
set tx_transfer_status						0x4004
                                    		
# TX Pad Inserter                   		
set tx_padins_control						0x4100
                                    		
# TX CRC Inserter                   		
set tx_crcins_control						0x4200
                                    		
# TX Packet Underflow               		
set tx_pktunderflow_error_lo				0x4300
set tx_pktunderflow_error_hi				0x4304
                                    		
# TX Preamble Control               		
set tx_preamble_control						0x4400
                                    		
# TX Pause Frame Control and Generator
set tx_pauseframe_control					0x4500
set tx_pauseframe_quanta					0x4504
set tx_pauseframe_enable					0x4508
                                    		
# TX PFC Generator                  		
set pfc_pause_quanta_0						0x4600
set pfc_pause_quanta_1						0x4604
set pfc_pause_quanta_2						0x4608
set pfc_pause_quanta_3						0x460C
set pfc_pause_quanta_4						0x4610
set pfc_pause_quanta_5						0x4614
set pfc_pause_quanta_6						0x4618
set pfc_pause_quanta_7						0x461C
                                    		
set pfc_holdoff_quanta_0					0x4640
set pfc_holdoff_quanta_1					0x4644
set pfc_holdoff_quanta_2					0x4648
set pfc_holdoff_quanta_3					0x464C
set pfc_holdoff_quanta_4					0x4650
set pfc_holdoff_quanta_5					0x4654
set pfc_holdoff_quanta_6					0x4658
set pfc_holdoff_quanta_7					0x465C
                                    		
set tx_pfc_priority_enable					0x4680
                                    		
# TX Address Inserter               		
set tx_addrins_control						0x4800
set tx_addrins_macaddr0						0x4804
set tx_addrins_macaddr1						0x4808
                                    		
# TX Frame Decoder                  		
set tx_frame_maxlength						0x6004

# 64-bits Statistic Counter High & Low Byte (Reg Map: 10g_mac_rx_statistic_counters_reg_map & 10g_mac_tx_statistic_counters_reg_map)
set ClearStats             					0x0000
set framesOK_lo            					0x0008
set framesOK_hi								0x000C
set framesErr_lo           					0x0010
set framesErr_hi							0x0014
set framesCRCErr_lo        					0x0018
set framesCRCErr_hi							0x001C
set octetsOK_lo            					0x0020
set octetsOK_hi            					0x0024
set pauseMACCtrlFrames_lo  					0x0028
set pauseMACCtrlFrames_hi  					0x002C 
set ifErrors_lo            					0x0030
set ifErrors_hi            					0x0034
set unicastFramesOK_lo     					0x0038
set unicastFramesOK_hi     					0x003C
set unicastFramesErr_lo    					0x0040
set unicastFramesErr_hi    					0x0044
set multicastFramesOK_lo   					0x0048
set multicastFramesOK_hi   					0x004C
set multicastFramesErr_lo  					0x0050
set multicastFramesErr_hi  					0x0054
set broadcastFramesOK_lo   					0x0058
set broadcastFramesOK_hi   					0x005C
set broadcastFramesErr_lo  					0x0060
set broadcastFramesErr_hi  					0x0064
set etherStatsOctets_lo    					0x0068
set etherStatsOctets_hi    					0x006C
set etherStatsPkts_lo      					0x0070
set etherStatsPkts_hi      					0x0074
set etherStatsUndersizePkts_lo         		0x0078
set etherStatsUndersizePkts_hi         		0x007C
set etherStatsOversizePkts_lo          		0x0080
set etherStatsOversizePkts_hi          		0x0084
set etherStatsPkts64Octets_lo          		0x0088
set etherStatsPkts64Octets_hi          		0x008C
set etherStatsPkts65to127Octets_lo     		0x0090
set etherStatsPkts65to127Octets_hi     		0x0094
set etherStatsPkts128to255Octets_lo    		0x0098
set etherStatsPkts128to255Octets_hi    		0x009C
set etherStatsPkts256to511Octets_lo    		0x00A0
set etherStatsPkts256to511Octets_hi    		0x00A4
set etherStatsPkts512to1023Octets_lo   		0x00A8
set etherStatsPkts512to1023Octets_hi   		0x00AC
set etherStatPkts1024to1518Octets_lo   		0x00B0
set etherStatPkts1024to1518Octets_hi   		0x00B4
set etherStatsPkts1519toXOctets_lo     		0x00B8
set etherStatsPkts1519toXOctets_hi     		0x00Bc
set etherStatsFragments_lo             		0x00C0
set etherStatsFragments_hi             		0x00C4
set etherStatsJabbers_lo               		0x00C8
set etherStatsJabbers_hi               		0x00CC
set etherStatsCRCErr_lo                		0x00D0
set etherStatsCRCErr_hi                		0x00D4
set unicastMACCtrlFrames_lo            		0x00D8
set unicastMACCtrlFrames_hi            		0x00DC
set multicastMACCtrlFrames_lo          		0x00E0
set multicastMACCtrlFrames_hi          		0x00E4
set broadcastMACCtrlFrames_lo          		0x00E8
set broadcastMACCtrlFrames_hi          		0x00EC

## Jier: confirm on this register
## _____________________________________________________________________   
##LKSIM: missing		
set RXFIFO_DROP_ON_ERROR                 	0x104	
   
##LOCAL LOOPBACK
set XGMII_LLPBK                           	0x08
