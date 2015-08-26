source parameter.tcl
source basic.tcl
source system_base_addr_map.tcl
source gen_inc.tcl
source mon_inc.tcl
source eth_inc.tcl
source bcm_phy.tcl


proc CONFIG_TRAFFIC {bursttype burstsize pkttype pktsize macsaddr macdaddr} {
	global LOGFILE
	
	puts "\n"
  	puts "\t 	==================================================================================== "
    puts "\t			B E G I N     C O N F I G U R A T I O N        			     				"
  	puts "\t 	==================================================================================== "
  	
  	puts $LOGFILE "\n"
  	puts $LOGFILE "\t 	==================================================================================== "
    puts $LOGFILE "\t			B E G I N     C O N F I G U R A T I O N        			     				"
  	puts $LOGFILE "\t 	==================================================================================== "
  	
	CONFIG_BURST $bursttype $burstsize $pkttype $pktsize	
	SETGEN_MACSA $macsaddr			
	SETGEN_MACDA $macdaddr			
	
	set exp_pkts [format "%#x" [expr $burstsize - 0]] 
	SETMON_RXCNT_RESET 
	SETMON_RXPKTCNT_EXPT $exp_pkts
}

proc CONFIG_MAC_BASIC {macaddr} {
	 puts "\t\t\t\tsetting up mac with a basic working config"
	 SETMAC_PRIMARY_ADDR $macaddr 			
	 SETMAC_STRIP_RX_PADCRC
	 SETMAC_CLR_STATS
}

proc SETHOST_LPBK_XGMII {} {
	 SETMAC_LLPBK_XGMII
	 puts "\t\t\tHost ETH10G_TOP is set in local loopback @XGMII"
}

proc SETHOST_LPBK_SERIALPMA {} {
	 RESETMAC_LLPBK_XGMII
	 SETXAUI_SERIAL_LLPBK
	 puts "\t\t\tHost ETH10G_TOP is set in @pma-serial"
}

proc SETHOST_FUNCTIONAL_MODE {} {
	 RESETMAC_LLPBK_XGMII
	 RESETXAUI_SERIAL_LLPBK
	 puts "\t\t\tHost ETH10G is setup in functional mode"
}

## ________________________________________________________________________________
proc WAITMON_DONE {} {
	set rx_status 0
	set test_done 0
	set total_pkts_rcv -1
	
       global LOGFILE
       global MON_BASE_ADDR
       global MON_RXPKTCNT_GOOD
       global MON_RXPKTCNT_BAD
       global MON_RXCTRL_STATUS
  	puts "\t 				-- MONITOR processing frames received .....\n\n"
       while {$test_done == 0} {  
	      after 8000
	           
	      set rx_status [format "%#x"  [reg_read $MON_BASE_ADDR $MON_RXCTRL_STATUS]]	      
	      set test_done [expr $rx_status & 0x4]    
	      set previous_total_pkts_rcv $total_pkts_rcv
	      
 	      set good_pkts [format %u [reg_read $MON_BASE_ADDR $MON_RXPKTCNT_GOOD]]
 	      set bad_pkts [format %u [reg_read $MON_BASE_ADDR $MON_RXPKTCNT_BAD]]
 	      set total_pkts_rcv [expr $good_pkts + $bad_pkts] 
 	      puts "\t 				-- MONITOR Received  Packet# 	 $total_pkts_rcv "      
 	      
 	      puts $LOGFILE "\t 		-- MONITOR Received  Packet# 	 $total_pkts_rcv "
 	      
 	      if {$previous_total_pkts_rcv == $total_pkts_rcv} {
		      set test_done -1
		      puts "\t 				-- Break : No furtuer packet is being generated or received "
	      }
 	      
     	}
     	
    if {$test_done == 0x4} {	
  		puts "\t				-- DONE! - monitor received all expected sum of packets ..... \n"
  		puts $LOGFILE "\t			-- DONE! - monitor received all expected sum of packets ..... \n"
  		
  		CHKMON_STATUS
	} elseif {$total_pkts_rcv == 0} {
		puts "\t				-- WARNING! - monitor unable to receive any packet ..... \n"
  		puts $LOGFILE "\t			-- WARNING! - monitor unable to receive any packet ..... \n"
	} else {
		puts "\t				-- WARNING! - monitor unable to receive all expected sum of packets ..... \n"
  		puts $LOGFILE "\t			-- WARNING! - monitor unable to receive all expected sum of packets ..... \n"
  		
		CHKMON_STATUS
	}
	
	#puts "pass CHKMAC_TXSTATS & CHKMAC_RXSTATS - Feng\n"
	CHKMAC_TXSTATS
    CHKMAC_RXSTATS
}

proc TEST_SFPLPBK {burst_size} {
	#_____________________________________________________
	# CONFIG_TRAFFIC bursttype burstsize pkttype pktsize macsaddr macdaddr 
	#_____________________________________________________
	source parameter_inc.tcl
	
	CONFIG_TRAFFIC $BURST_TYPE $burst_size $PACKET_TYPE $PACKET_SIZE $MAC_SRC_ADDRESS $MAC_DST_ADDRESS
 	CONFIG_MAC_BASIC $MAC_DST_ADDRESS
 	
 	if {$10G_ETH_MODE == "XAUI"} {
 		SETBCM_XAUI_LANE_SWAP
 		#Disable BCM PMA Loopback
 		RESETBCM_PMA_SYSTEM_LPBK
 		#Disable BCM XGXS Loopback
 		RESETBCM_XGXS_SYSTEM_LPBK
	}
	
	#Disable XGMII Loopback
	RESETMAC_LLPBK_XGMII
	#Disable PMA Serial Loopback, same register map for XAUI and 10G Base R
	RESETXAUI_SERIAL_LLPBK
	
 	SETMON_RXCNT_RESET
 	SETGEN_START
	
	global MON_BASE_ADDR
	global MON_RXPKTCNT_EXPT
	reg_write $MON_BASE_ADDR $MON_RXPKTCNT_EXPT $burst_size 
	
 	WAITMON_DONE
	CHKGEN_CONFIG
	CHKMAC_CONFIG
	
 	if {$10G_ETH_MODE == "XAUI"} {
		CHKBCM_CONFIG
	}
	
	RESET_SYSTEM
}
  	
proc TEST_BCMPMA {burst_size} {
	#_____________________________________________________
	# CONFIG_TRAFFIC bursttype burstsize pkttype pktsize macsaddr macdaddr  
	#_____________________________________________________
	source parameter_inc.tcl
	
 	CONFIG_TRAFFIC $BURST_TYPE $burst_size $PACKET_TYPE $PACKET_SIZE $MAC_SRC_ADDRESS $MAC_DST_ADDRESS
 	CONFIG_MAC_BASIC $MAC_DST_ADDRESS
 	
 	#Disable BCM XGXS Loopback
 	RESETBCM_XGXS_SYSTEM_LPBK
 	#Disable XGMII Loopback
	RESETMAC_LLPBK_XGMII
	#Disable PMA Serial Loopback, same register map for XAUI and 10G Base R
	RESETXAUI_SERIAL_LLPBK
 	#Enable BCM PMA Loopback
	SETBCM_PMA_SYSTEM_LPBK 
	
 	SETMON_RXCNT_RESET
 	SETGEN_START
 	WAITMON_DONE
	CHKGEN_CONFIG
	CHKMAC_CONFIG
	CHKBCM_CONFIG
 	}

proc TEST_BCMXGXS {burst_size} {
	#_____________________________________________________
	# CONFIG_TRAFFIC bursttype burstsize pkttype pktsize macsaddr macdaddr 
	#_____________________________________________________
	source parameter_inc.tcl
	
 	CONFIG_TRAFFIC $BURST_TYPE $burst_size $PACKET_TYPE $PACKET_SIZE $MAC_SRC_ADDRESS $MAC_DST_ADDRESS
 	CONFIG_MAC_BASIC $MAC_DST_ADDRESS
	
 	#Disable BCM PMA Loopback
 	RESETBCM_PMA_SYSTEM_LPBK
 	#Disable XGMII Loopback
	RESETMAC_LLPBK_XGMII
	#Disable PMA Serial Loopback, same register map for XAUI and 10G Base R
	RESETXAUI_SERIAL_LLPBK
	#Enable BCM XGXS Loopback
 	SETBCM_XGXS_SYSTEM_LPBK 
	
 	SETMON_RXCNT_RESET
 	SETGEN_START
 	WAITMON_DONE
	CHKGEN_CONFIG
	CHKMAC_CONFIG
	CHKBCM_CONFIG
 	}

proc TEST_ALTPMA {burst_size} {
	#_____________________________________________________
	# CONFIG_TRAFFIC bursttype burstsize pkttype pktsize macsaddr macdaddr 
	#_____________________________________________________
	source parameter_inc.tcl

 	CONFIG_TRAFFIC $BURST_TYPE $burst_size $PACKET_TYPE $PACKET_SIZE $MAC_SRC_ADDRESS $MAC_DST_ADDRESS
	SETMAC_STRIP_RX_PADCRC 
	
	if {$10G_ETH_MODE == "XAUI"} {
		#Disable BCM PMA Loopback
 		RESETBCM_PMA_SYSTEM_LPBK
 		#Disable BCM XGXS Loopback
 		RESETBCM_XGXS_SYSTEM_LPBK
	}
	
	#Disable XGMII Loopback
	RESETMAC_LLPBK_XGMII
	#Enable PMA Serial loopback, both XAUI and 10G Base R
	SETXAUI_SERIAL_LLPBK 
	
 	SETMON_RXCNT_RESET
 	SETGEN_START
 	WAITMON_DONE
	CHKGEN_CONFIG
	CHKMAC_CONFIG
	
	if {$10G_ETH_MODE == "XAUI"} {
		CHKBCM_CONFIG
	}
}

proc TEST_ALTXGMII {burst_size} {
	#_____________________________________________________
	# CONFIG_TRAFFIC bursttype burstsize pkttype pktsize macsaddr macdaddr  
	#_____________________________________________________
	source parameter_inc.tcl
	
 	CONFIG_TRAFFIC $BURST_TYPE $burst_size $PACKET_TYPE $PACKET_SIZE $MAC_SRC_ADDRESS $MAC_DST_ADDRESS
	SETMAC_STRIP_RX_PADCRC 
	
	if {$10G_ETH_MODE == "XAUI"} {
		#Disable BCM PMA Loopback
 		RESETBCM_PMA_SYSTEM_LPBK
 		#Disable BCM XGXS Loopback
 		RESETBCM_XGXS_SYSTEM_LPBK
	}
	
	#Enable XGMII Loopback
	SETMAC_LLPBK_XGMII 
	#Disable PMA Serial Loopback, same register map for XAUI and 10G Base R
	RESETXAUI_SERIAL_LLPBK
	
 	SETMON_RXCNT_RESET
 	SETGEN_START
 	WAITMON_DONE
	CHKGEN_CONFIG
	CHKMAC_CONFIG
	
	if {$10G_ETH_MODE == "XAUI"} {
		CHKBCM_CONFIG
	}
}

##==============================================================================
##		Main Reference Design Test CLI
##==============================================================================  
proc TEST { lpbk_point burst_size loops} {
	global 10G_ETH_MODE	
	global BURST_SIZE
	global BURST_ITERATION
	global LOGFILE
	global filename
	
	
	source parameter_inc.tcl
	PARAM_LIST
	
	
	#set filename REGRESS_${lpbk_point}_${burst_size}_${loops}.LOG
	set filename REGRESS.LOG
	set LOGFILE [open $filename "w"]
	set BURST_ITERATION $loops
	
	set PACKET_SIZE [format %u [expr $burst_size*64]]
	
	for {set i 1} {$i <= $loops} {incr i} {
		set TEST_BURST [format %u [expr $burst_size*$i]]
		set BURST_SIZE $TEST_BURST
		
		puts "\n\n"
  		puts "\t 	==================================================================================== "
 		puts "\t\t	                    == Test Iteration $i : Burst size $TEST_BURST == 			  	"
 		puts "\t 	==================================================================================== "
 		
 		puts $LOGFILE "\n\n"
  		puts $LOGFILE "\t 	==================================================================================== "
 		puts $LOGFILE "\t\t                 == Test Iteration $i :Burst size $TEST_BURST == 			  		"
  		puts $LOGFILE "\t 	==================================================================================== "

 		
 		if {$10G_ETH_MODE == "XAUI"} {						#jier: For XAUI
			if {$lpbk_point == "SFPP"} {
 			    TEST_SFPLPBK $TEST_BURST
			} elseif {$lpbk_point == "BCMPMA"} {			
 			    TEST_BCMPMA $TEST_BURST
			} elseif {$lpbk_point == "BCMXGXS"} {
 			    TEST_BCMXGXS $TEST_BURST
			} elseif {$lpbk_point == "ALTPMA"} {
 			    TEST_ALTPMA $TEST_BURST
			} elseif {$lpbk_point == "XGMII"} {
 			    TEST_ALTXGMII $TEST_BURST
			}
		} else {											#jier: For 10G Base R
			if {$lpbk_point == "SFPP"} {
 			    TEST_SFPLPBK $TEST_BURST
			} elseif {$lpbk_point == "ALTPMA"} {
 			    TEST_ALTPMA $TEST_BURST
			} elseif {$lpbk_point == "XGMII"} {
 			    TEST_ALTXGMII $TEST_BURST
			}
		}
    }
    close $LOGFILE
}

proc CMD_LIST {} {
		source parameter_inc.tcl
		
		puts "\n\n"
  		puts "\t 	==================================================================================== "
 		puts "\t\t	                    == Command List == 			  									"
 		puts "\t 	==================================================================================== "	

 		puts "\n"
 		puts "\t	1. TEST <Loopback Point> <Burst Size> <Iteration>	\n"
 		
 		if {$10G_ETH_MODE == "XAUI"} {			#jier: for XAUI
	 		puts "\t\t	- Loopback Point \t: \tSFPP, BCMPMA, BCMXGXS, ALTPMA, XGMII \n"
 		} else {								#jier: for 10G Base R		
 			puts "\t\t	- Loopback Point \t: \tSFPP, ALTPMA, XGMII \n"
		}
 		 		
 		puts "\t\t	- Burst Size \t: \tTotal number of burst frame \n"
 		puts "\t\t	- Iteration \t: \tTotal test iteration, Burst Size will increase on each iteration \n"
 		
 		puts "\t	2. PARAM_LIST	\n"
 		puts "\t\t	- List all the parameter and display all the current variable\n"
 		
 		puts "\t	3. SET_PARAM <Parameter> <Variable>	\n"
 		puts "\t\t	- Parameter \t: \tAllow user to change any parameter disply on the PARAM_LIST command \n"
 		puts "\t\t	- Variable \t: \tUser desire variable, option refer to PARAM_LIST command \n" 	
 		
 		puts "\t	4. MEM_MAP <Memory Map>	\n"
 		puts "\t\t	- Memory Map \t: \tShow the user selected system memory map define in the system \n"
 		if {$10G_ETH_MODE == "XAUI"} {			#jier: for XAUI
 			puts "\t\t	- Option \t\t: \tBASE_ADDR, GEN_MAP, MON_MAP, 10G_MAC_MAP, PHY_IP_MAP, BCM_PHY_MAP \n" 
		} else {								#jier: for 10G Base R	
			puts "\t\t	- Option \t\t: \tBASE_ADDR, GEN_MAP, MON_MAP, 10G_MAC_MAP, PHY_IP_MAP \n"
		} 
 			
 		puts "\t	5. CMD_LIST \n"
 		puts "\t\t	- List All Valid Command \n"
 		
 		puts "\t	6. DEFAULT \n"
 		puts "\t\t	- Restore All Default Parameter \n"
}

proc PARAM_LIST {} {

		source parameter_inc.tcl
		
		puts "\n\n"
  		puts "\t 	==================================================================================== "
 		puts "\t\t	                    == Parameter List == 			  									"
 		puts "\t 	==================================================================================== "	
	
 		puts "\t	1. 10G_ETH_MODE \t: \t $10G_ETH_MODE \n"
 		puts "\t\t	- Define 10G Ethernet PHY IP Option  \n"
 		puts "\t\t	- Option \t : XAUI or 10G_BASE_R \n"
 		puts "\t	2. MAC_SRC_ADDRESS \t: \t $MAC_SRC_ADDRESS \n"
 		puts "\t\t	- Define MAC Source Address  \n"
 		puts "\t\t	- Option \t: Valid 48 bits MAC Address  \n"
 		puts "\t	3. MAC_DST_ADDRESS \t: \t $MAC_DST_ADDRESS \n"
 		puts "\t\t	- Define MAC Destination Address  \n" 
 		puts "\t\t	- Option \t: Valid 48 bits MAC Address  \n"		
		puts "\t	4. PACKET_TYPE \t: \t $PACKET_TYPE \n"
		puts "\t\t	- Define Ethernet Payload Type  \n"
		puts "\t\t	- Option \t: RANDOM or INCREMENT \n"
		puts "\t	5. PACKET_SIZE \t: \t $PACKET_SIZE \n"
		puts "\t\t	- Define Ethernet Payload Length  \n"
		#puts "\t\t	- Option \t: Any valid size from 6 to 9600 (Only valid if packet type is random) \n"
		puts "\t	6. BURST_TYPE \t: \t $BURST_TYPE \n"
		puts "\t\t	- Define Ethernet Packet Length Type  \n"
		puts "\t\t	- Option \t: RANDOM or FIXED \n"
		puts "\t	7. BURST_SIZE \t: \t $BURST_SIZE \n"
		puts "\t\t	- Define Total Number of Ethernet Packets In Single Burst Iteration  \n"
		puts "\t\t	- Option \t: Any valid size from 1 to 2^32-1 \n"
		puts "\t	8. BURST_ITERATION \t: \t $BURST_ITERATION \n"
		puts "\t\t	- Define Total Number of Burst Iteration  \n"
		puts "\t\t	- Option \t: Any valid size from 1 to 10000 \n"
}

proc SET_PARAM {parameter value} {
	
	source parameter_inc.tcl

	set $parameter $value
	
	PARAM_LIST
}

proc MEM_MAP {memory_map} {

	source parameter_inc.tcl
	source mem_map_inc.tcl
	
	if {$memory_map == "BASE_ADDR"} {
		puts "\n\n"
  		puts "\t 	==================================================================================== "
 		puts "\t\t	                    == System Base Address == 			  							"
 		puts "\t 	==================================================================================== "	

 		puts "\n"
 		puts "\t	1. GEN_BASE_ADDR \t\t : \t $GEN_BASE_ADDR	\n"
 		puts "\t	2. MON_BASE_ADDR \t\t : \t $MON_BASE_ADDR	\n"
 		puts "\t	3. SYS_CTRL_LPBK_BASE_ADDR \t : \t $SYS_CTRL_LPBK_BASE_ADDR	\n"
 		puts "\t	4. 10GMAC_BASE_ADDR \t\t : \t $10GMAC_BASE_ADDR	\n"
		puts "\t\t	=============== 10GMAC RX Path Register Map =============== \n"
 		puts "\t\t	a. 10g_mac_rx_packet_transfer_reg_map \t : \t $10g_mac_rx_packet_transfer_reg_map	\n"
 		puts "\t\t	b. 10g_mac_rx_pad_crc_remover_reg_map \t : \t $10g_mac_rx_pad_crc_remover_reg_map	\n"
 		puts "\t\t	c. 10g_mac_rx_crc_checker_reg_map \t : \t $10g_mac_rx_crc_checker_reg_map	\n"
 		puts "\t\t	d. 10g_mac_rx_packet_overflow_reg_map \t : \t $10g_mac_rx_packet_overflow_reg_map	\n"
 		puts "\t\t	e. 10g_mac_rx_preamble_control_reg_map \t : \t $10g_mac_rx_preamble_control_reg_map	\n"
 		puts "\t\t	f. 10g_mac_rx_lane_decoder_reg_map \t : \t $10g_mac_rx_lane_decoder_reg_map	\n"
 		puts "\t\t	g. 10g_mac_rx_frame_decoder_reg_map \t : \t $10g_mac_rx_frame_decoder_reg_map	\n"
 		puts "\t\t	h. 10g_mac_rx_statistic_counters_reg_map \t : \t $10g_mac_rx_statistic_counters_reg_map	\n"
		puts "\t\t	=============== 10GMAC TX Path Register Map =============== \n"
 		puts "\t\t	a. 10g_mac_tx_packet_transfer_reg_map \t : \t $10g_mac_tx_packet_transfer_reg_map	\n"
 		puts "\t\t	b. 10g_mac_tx_pad_inserter_reg_map \t : \t $10g_mac_tx_pad_inserter_reg_map	\n"
 		puts "\t\t	c. 10g_mac_tx_crc_inserter_reg_map \t : \t $10g_mac_tx_crc_inserter_reg_map	\n"
 		puts "\t\t	d. 10g_mac_tx_packet_underflow_reg_map \t : \t $10g_mac_tx_packet_underflow_reg_map	\n"
 		puts "\t\t	e. 10g_mac_tx_preamble_control_reg_map \t : \t $10g_mac_tx_preamble_control_reg_map	\n"
 		puts "\t\t	f. 10g_mac_tx_pause_frm_ctrl_gen_reg_map \t : \t $10g_mac_tx_pause_frm_ctrl_gen_reg_map	\n"
 		puts "\t\t	g. 10g_mac_tx_pfc_gen_reg_map \t\t : \t $10g_mac_tx_pfc_gen_reg_map	\n"
 		puts "\t\t	h. 10g_mac_tx_address_inserter_reg_map \t : \t $10g_mac_tx_address_inserter_reg_map	\n"
 		puts "\t\t	i. 10g_mac_tx_frame_decoder_reg_map \t : \t $10g_mac_tx_frame_decoder_reg_map	\n"
 		puts "\t\t	j. 10g_mac_tx_statistic_counters_reg_map \t : \t $10g_mac_tx_statistic_counters_reg_map	\n"
 		
 		puts "\t	5. PHY_IP_BASE_ADDR \t\t : \t $PHY_IP_BASE_ADDR	\n"
 		if {$10G_ETH_MODE == "XAUI"} {
 			puts "\t\t	=============== XAUI PHY IP Register Map =============== \n"
 			puts "\t\t	a. xaui_pma_common_ctrl_stats_reg_map \t : \t $xaui_pma_common_ctrl_stats_reg_map	\n"
 			puts "\t\t	b. xaui_reset_ctrl_reg_map \t\t : \t $xaui_reset_ctrl_reg_map	\n"
 			puts "\t\t	c. xaui_pma_ctrl_stats_reg_map \t : \t $xaui_pma_ctrl_stats_reg_map	\n"
 			puts "\t\t	d. xaui_xaui_pcs_reg_map \t\t : \t $xaui_xaui_pcs_reg_map	\n"
		} else {
 			puts "\t\t	=============== 10G Base R PHY IP Register Map =============== \n"
 			puts "\t\t	a. 10g_baser_pma_common_ctrl_stats_reg_map : \t $10g_baser_pma_common_ctrl_stats_reg_map	\n"
 			puts "\t\t	b. 10g_baser_reset_ctrl_reg_map \t : \t $10g_baser_reset_ctrl_reg_map	\n"
 			puts "\t\t	c. 10g_baser_pma_ch_ctrl_stats_reg_map \t : \t $10g_baser_pma_ch_ctrl_stats_reg_map	\n"
 			puts "\t\t	d. 10g_baser_pcs_reg_map \t\t : \t $10g_baser_pcs_reg_map	\n"
		}
	
		puts "\t	6. MDIO_BASE_ADDR \t\t : \t $MDIO_BASE_ADDR	\n"
 		puts "\t	7. XGMII_LB_BASE_ADDR \t : \t $XGMII_LB_BASE_ADDR	\n"
 		puts "\t	8. 10G_RX_FIFO_BASE_ADDR \t : \t $10G_RX_FIFO_BASE_ADDR	\n"
 		puts "\t	9. 10G_TX_FIFO_BASE_ADDR \t : \t $10G_TX_FIFO_BASE_ADDR	\n"
 	} elseif {$memory_map == "GEN_MAP"} {
	 	puts "\n\n"
  		puts "\t 	==================================================================================== "
 		puts "\t\t	                    == Generator Register Register Address ==						"
 		puts "\t\t	                    == Generator Base Address = $GEN_BASE_ADDR ==					" 		
 		puts "\t 	==================================================================================== "	

 		puts "\n"
 		puts "\t	1. GEN_NUMPKTS \t\t : \t [format "%#x" [expr $GEN_BASE_ADDR + $GEN_NUMPKTS]]	\n"
 		puts "\t	2. GEN_RANDOMLENGTH \t\t : \t [format "%#x" [expr $GEN_BASE_ADDR + $GEN_RANDOMLENGTH]]	\n"
 		puts "\t	3. GEN_RANDOMPAYLOAD \t : \t [format "%#x" [expr $GEN_BASE_ADDR + $GEN_RANDOMPAYLOAD]]	\n"
 		puts "\t	4. GEN_START \t\t : \t [format "%#x" [expr $GEN_BASE_ADDR + $GEN_START]]	\n"
 		puts "\t	5. GEN_STOP \t\t : \t [format "%#x" [expr $GEN_BASE_ADDR + $GEN_STOP]]	\n"
 		puts "\t	6. GEN_MACSA0 \t\t : \t [format "%#x" [expr $GEN_BASE_ADDR + $GEN_MACSA0]]	\n"
 		puts "\t	7. GEN_MACSA1 \t\t : \t [format "%#x" [expr $GEN_BASE_ADDR + $GEN_MACSA1]]	\n"
 		puts "\t	8. GEN_MACDA0 \t\t : \t [format "%#x" [expr $GEN_BASE_ADDR + $GEN_MACDA0]]	\n"
 		puts "\t	9. GEN_MACDA1 \t\t : \t [format "%#x" [expr $GEN_BASE_ADDR + $GEN_MACDA1]]	\n" 	    
 		puts "\t	10. GEN_TXPKTCNT \t\t : \t [format "%#x" [expr $GEN_BASE_ADDR + $GEN_TXPKTCNT]]	\n"
 		puts "\t	11. GEN_RNDSEED0 \t\t : \t [format "%#x" [expr $GEN_BASE_ADDR + $GEN_RNDSEED0]]	\n"
 		puts "\t	12. GEN_RNDSEED1 \t\t : \t [format "%#x" [expr $GEN_BASE_ADDR + $GEN_RNDSEED1]]	\n"
 		puts "\t	13. GEN_RNDSEED2 \t\t : \t [format "%#x" [expr $GEN_BASE_ADDR + $GEN_RNDSEED2]]	\n"
 		puts "\t	14. GEN_PKTLENGTH \t\t : \t [format "%#x" [expr $GEN_BASE_ADDR + $GEN_PKTLENGTH]]	\n" 
	} elseif {$memory_map == "MON_MAP"} { 
		puts "\n\n"
  		puts "\t 	==================================================================================== "
 		puts "\t\t	                    == Monitor Register Register Address ==							"
 		puts "\t\t	                    == Monitor Base Address = $MON_BASE_ADDR ==					" 		 		
 		puts "\t 	==================================================================================== "	

 		puts "\n"
 		puts "\t	1. MON_RXPKTCNT_EXPT \t : \t [format "%#x" [expr $MON_BASE_ADDR + $MON_RXPKTCNT_EXPT]]	\n"
 		puts "\t	2. MON_RXPKTCNT_GOOD \t : \t [format "%#x" [expr $MON_BASE_ADDR + $MON_RXPKTCNT_GOOD]]	\n"
 		puts "\t	3. MON_RXPKTCNT_BAD \t\t : \t [format "%#x" [expr $MON_BASE_ADDR + $MON_RXPKTCNT_BAD]]	\n"
 		puts "\t	4. MON_RXBYTECNT_LO32 \t : \t [format "%#x" [expr $MON_BASE_ADDR + $MON_RXBYTECNT_LO32]]	\n"
 		puts "\t	5. MON_RXBYTECNT_HI32 \t : \t [format "%#x" [expr $MON_BASE_ADDR + $MON_RXBYTECNT_HI32]]	\n"
 		puts "\t	6. MON_RXCYCLCNT_LO32 \t : \t [format "%#x" [expr $MON_BASE_ADDR + $MON_RXCYCLCNT_LO32]]	\n"
 		puts "\t	7. MON_RXCYCLCNT_HI32 \t : \t [format "%#x" [expr $MON_BASE_ADDR + $MON_RXCYCLCNT_HI32]]	\n"
 		puts "\t	8. MON_RXCTRL_STATUS \t : \t [format "%#x" [expr $MON_BASE_ADDR + $MON_RXCTRL_STATUS]]	\n"
 		puts "\t	9. GEN_MON_LPBK \t\t : \t [format "%#x" [expr $MON_BASE_ADDR + $GEN_MON_LPBK]]	\n" 	    
	} elseif {$memory_map == "10G_MAC_MAP"} {
	 	puts "\n\n"
  		puts "\t 	==================================================================================== "
 		puts "\t\t	                    == 10G MAC Register Register Address ==							"
 		puts "\t\t	                    == 10G MAC Base Address = $10GMAC_BASE_ADDR ==					" 		 		 		
 		puts "\t 	==================================================================================== "	

 		puts "\n"
 		puts "\t	1. rx_transfer_control \t\t\t : \t $rx_transfer_control	\n"
 		puts "\t	2. rx_transfer_status \t\t\t : \t $rx_transfer_status	\n"
 		puts "\t	3. rx_padcrc_control \t\t\t : \t $rx_padcrc_control	\n"
 		puts "\t	4. rx_crccheck_control \t\t\t : \t $rx_crccheck_control	\n"
 		puts "\t	5. rx_pktovrflow_error_lo \t\t\t : \t $rx_pktovrflow_error_lo	\n"
 		puts "\t	6. rx_pktovrflow_error_hi \t\t\t : \t $rx_pktovrflow_error_hi	\n"
 		puts "\t	7. rx_pktovrflow_etherStatsDropEvents_lo \t\t : \t $rx_pktovrflow_etherStatsDropEvents_lo	\n"
 		puts "\t	8. rx_pktovrflow_etherStatsDropEvents_hi \t\t : \t $rx_pktovrflow_etherStatsDropEvents_hi	\n"
 		puts "\t	9. rx_preamble_inserter_control \t\t : \t $rx_preamble_inserter_control	\n" 	    
 		puts "\t	10. rx_lane_decoder_preamble_control \t\t : \t $rx_lane_decoder_preamble_control	\n"
 		puts "\t	11. rx_frame_control \t\t\t : \t $rx_frame_control	\n"
 		puts "\t	12. rx_frame_maxlength \t\t\t : \t $rx_frame_maxlength	\n"
 		puts "\t	13. rx_frame_addr0 \t\t\t\t : \t $rx_frame_addr0	\n"
 		puts "\t	14. rx_frame_addr1 \t\t\t\t : \t $rx_frame_addr1	\n" 	
 		
 		puts "\t	15. rx_frame_spaddr0_0 \t\t\t : \t $rx_frame_spaddr0_0	\n"
 		puts "\t	16. rx_frame_spaddr0_1 \t\t\t : \t $rx_frame_spaddr0_1	\n"
 		puts "\t	17. rx_frame_spaddr1_0 \t\t\t : \t $rx_frame_spaddr1_0	\n"
 		puts "\t	18. rx_frame_spaddr1_1 \t\t\t : \t $rx_frame_spaddr1_1	\n"
 		puts "\t	19. rx_frame_spaddr2_0 \t\t\t : \t $rx_frame_spaddr2_0	\n"
 		puts "\t	20. rx_frame_spaddr2_1 \t\t\t : \t $rx_frame_spaddr2_1	\n"
 		puts "\t	21. rx_frame_spaddr3_0 \t\t\t : \t $rx_frame_spaddr3_0	\n"
 		puts "\t	22. rx_frame_spaddr3_1 \t\t\t : \t $rx_frame_spaddr3_1	\n"
 		puts "\t	23. rx_pfc_control \t\t\t\t : \t $rx_pfc_control	\n" 	  
 		  
 		puts "\t	24. tx_transfer_control \t\t\t : \t $tx_transfer_control	\n"
 		puts "\t	25. tx_transfer_status \t\t\t : \t $tx_transfer_status	\n"
 		puts "\t	26. tx_padins_control \t\t\t : \t $tx_padins_control	\n"
 		puts "\t	27. tx_crcins_control \t\t\t : \t $tx_crcins_control	\n"
 		puts "\t	28. tx_pktunderflow_error_lo \t\t\t : \t $tx_pktunderflow_error_lo	\n" 	
 		puts "\t	29. tx_pktunderflow_error_hi \t\t\t : \t $tx_pktunderflow_error_hi	\n"
 		puts "\t	30. tx_preamble_control \t\t\t : \t $tx_preamble_control	\n"
 		puts "\t	31. tx_pauseframe_control \t\t\t : \t $tx_pauseframe_control	\n"
 		puts "\t	32. tx_pauseframe_quanta \t\t\t : \t $tx_pauseframe_quanta	\n"
 		puts "\t	33. tx_pauseframe_enable \t\t\t : \t $tx_pauseframe_enable	\n" 
 		
 		puts "\t	34. pfc_pause_quanta_0 \t\t\t : \t $pfc_pause_quanta_0	\n"
 		puts "\t	35. pfc_pause_quanta_1 \t\t\t : \t $pfc_pause_quanta_1	\n"
 		puts "\t	36. pfc_pause_quanta_2 \t\t\t : \t $pfc_pause_quanta_2	\n"
 		puts "\t	37. pfc_pause_quanta_3 \t\t\t : \t $pfc_pause_quanta_3	\n"
 		puts "\t	38. pfc_pause_quanta_4 \t\t\t : \t $pfc_pause_quanta_4	\n" 	
 		puts "\t	39. pfc_pause_quanta_5 \t\t\t : \t $pfc_pause_quanta_5	\n"
 		puts "\t	40. pfc_pause_quanta_6 \t\t\t : \t $pfc_pause_quanta_6	\n"
 		puts "\t	41. pfc_pause_quanta_7 \t\t\t : \t $pfc_pause_quanta_7	\n"
 		
 		puts "\t	42. pfc_holdoff_quanta_0 \t\t\t : \t $pfc_holdoff_quanta_0	\n"
 		puts "\t	43. pfc_holdoff_quanta_1 \t\t\t : \t $pfc_holdoff_quanta_1	\n" 
 		puts "\t	44. pfc_holdoff_quanta_2 \t\t\t : \t $pfc_holdoff_quanta_2	\n"
 		puts "\t	45. pfc_holdoff_quanta_3 \t\t\t : \t $pfc_holdoff_quanta_3	\n"
 		puts "\t	46. pfc_holdoff_quanta_4 \t\t\t : \t $pfc_holdoff_quanta_4	\n"
 		puts "\t	47. pfc_holdoff_quanta_5 \t\t\t : \t $pfc_holdoff_quanta_5	\n"
 		puts "\t	48. pfc_holdoff_quanta_6 \t\t\t : \t $pfc_holdoff_quanta_6	\n" 	
 		puts "\t	49. pfc_holdoff_quanta_7 \t\t\t : \t $pfc_holdoff_quanta_7	\n"
 		
 		puts "\t	50. tx_pfc_priority_enable \t\t\t : \t $tx_pfc_priority_enable	\n"
 		puts "\t	51. tx_addrins_control \t\t\t : \t $tx_addrins_control	\n"
 		puts "\t	52. tx_addrins_macaddr0 \t\t\t : \t $tx_addrins_macaddr0	\n"
 		puts "\t	53. tx_addrins_macaddr1 \t\t\t : \t $tx_addrins_macaddr1	\n" 
 		puts "\t	54. tx_frame_maxlength \t\t\t : \t $tx_frame_maxlength	\n"
 		
 		#Jier, Still need to display the correct reg address
 		#for TX stat
 		puts "\t\t	                    == 10G MAC Register TX Statistic Register Address ==						"
 		puts "\t	55. tx_stats_ClearStats \t\t\t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $ClearStats]]	\n" 				
 		puts "\t	56. tx_stats_framesOK_lo \t\t\t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $framesOK_lo]]	\n"
 		puts "\t	57. tx_stats_framesOK_hi \t\t\t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $framesOK_hi]]	\n"
 		puts "\t	58. tx_stats_framesErr_lo \t\t\t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $framesErr_lo]]	\n"
 		puts "\t	59. tx_stats_framesErr_hi \t\t\t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $framesErr_hi]]	\n"
 		puts "\t	60. tx_stats_framesCRCErr_lo \t\t\t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $framesCRCErr_lo]]	\n"
 		puts "\t	61. tx_stats_framesCRCErr_hi \t\t\t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $framesCRCErr_hi]]	\n"
 		puts "\t	62. tx_stats_octetsOK_lo \t\t\t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $octetsOK_lo]]	\n"
 		puts "\t	63. tx_stats_octetsOK_hi \t\t\t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $octetsOK_hi]]	\n" 	    
 		puts "\t	64. tx_stats_pauseMACCtrlFrames_lo \t\t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $pauseMACCtrlFrames_lo]]	\n"
 		puts "\t	65. tx_stats_pauseMACCtrlFrames_hi \t\t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $pauseMACCtrlFrames_hi]]	\n"
 		puts "\t	66. tx_stats_ifErrors_lo \t\t\t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $ifErrors_lo]]	\n"
 		puts "\t	67. tx_stats_ifErrors_hi \t\t\t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $ifErrors_hi]]	\n"
 		puts "\t	68. tx_stats_unicastFramesOK_lo \t\t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $unicastFramesOK_lo]]	\n" 	
 		puts "\t	69. tx_stats_unicastFramesOK_hi \t\t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $unicastFramesOK_hi]]	\n"
 		puts "\t	70. tx_stats_unicastFramesErr_lo \t\t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $unicastFramesErr_lo]]	\n"
 		puts "\t	71. tx_stats_unicastFramesErr_hi \t\t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $unicastFramesErr_hi]]	\n"
 		puts "\t	72. tx_stats_multicastFramesOK_lo \t\t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $multicastFramesOK_lo]]	\n"
 		puts "\t	73. tx_stats_multicastFramesOK_hi \t\t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $multicastFramesOK_hi]]	\n"
 		puts "\t	74. tx_stats_multicastFramesErr_lo \t\t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $multicastFramesErr_lo]]	\n"
 		puts "\t	75. tx_stats_multicastFramesErr_hi \t\t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $multicastFramesErr_hi]]	\n"
 		puts "\t	76. tx_stats_broadcastFramesOK_lo \t\t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $broadcastFramesOK_lo]]	\n"
 		puts "\t	77. tx_stats_broadcastFramesOK_hi \t\t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $broadcastFramesOK_hi]]	\n" 	
 		puts "\t	78. tx_stats_broadcastFramesErr_lo \t\t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $broadcastFramesErr_lo]]	\n"
 		puts "\t	79. tx_stats_broadcastFramesErr_hi \t\t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $broadcastFramesErr_hi]]	\n"
 		puts "\t	80. tx_stats_etherStatsOctets_lo \t\t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $etherStatsOctets_lo]]	\n"
 		puts "\t	81. tx_stats_etherStatsOctets_hi \t\t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $etherStatsOctets_hi]]	\n"
 		puts "\t	82. tx_stats_etherStatsPkts_lo \t\t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $etherStatsPkts_lo]]	\n"
 		puts "\t	83. tx_stats_etherStatsPkts_hi \t\t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $etherStatsPkts_hi]]	\n" 	
 		puts "\t	84. tx_pktunderflow_error_hi \t\t\t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $tx_pktunderflow_error_hi]]	\n"
 		puts "\t	85. tx_stats_etherStatsUndersizePkts_lo \t\t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $etherStatsUndersizePkts_lo]]	\n"
 		puts "\t	86. tx_stats_etherStatsUndersizePkts_hi \t\t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $etherStatsUndersizePkts_hi]]	\n"
 		puts "\t	87. tx_stats_etherStatsOversizePkts_lo \t\t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $etherStatsOversizePkts_lo]]	\n"
 		puts "\t	88. tx_stats_etherStatsOversizePkts_hi \t\t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $etherStatsOversizePkts_hi]]	\n" 
 		puts "\t	89. tx_stats_etherStatsPkts64Octets_lo \t\t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $etherStatsPkts64Octets_lo]]	\n"
 		puts "\t	90. tx_stats_etherStatsPkts64Octets_hi \t\t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $etherStatsPkts64Octets_hi]]	\n"
 		puts "\t	91. tx_stats_etherStatsPkts65to127Octets_lo \t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $etherStatsPkts65to127Octets_lo]]	\n"
 		puts "\t	92. tx_stats_etherStatsPkts65to127Octets_hi \t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $etherStatsPkts65to127Octets_hi]]	\n"
 		puts "\t	93. tx_stats_etherStatsPkts128to255Octets_lo \t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $etherStatsPkts128to255Octets_lo]]	\n" 	
 		puts "\t	94. tx_stats_etherStatsPkts128to255Octets_hi \t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $etherStatsPkts128to255Octets_hi]]	\n"
 		puts "\t	95. tx_stats_etherStatsPkts256to511Octets_lo \t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $etherStatsPkts256to511Octets_lo]]	\n"
 		puts "\t	96. tx_stats_etherStatsPkts256to511Octets_hi \t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $etherStatsPkts256to511Octets_hi]]	\n"  
 		puts "\t	97. tx_stats_etherStatsPkts512to1023Octets_lo \t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $etherStatsPkts512to1023Octets_lo]]	\n"
 		puts "\t	98. tx_stats_etherStatsPkts512to1023Octets_hi \t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $etherStatsPkts512to1023Octets_hi]]	\n" 
 		puts "\t	99. tx_stats_etherStatPkts1024to1518Octets_lo \t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $etherStatPkts1024to1518Octets_lo]]	\n"
 		puts "\t	100. tx_stats_etherStatPkts1024to1518Octets_hi \t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $etherStatPkts1024to1518Octets_hi]]	\n"
 		puts "\t	101. tx_stats_etherStatsPkts1519toXOctets_lo \t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $etherStatsPkts1519toXOctets_lo]]	\n"
 		puts "\t	102. tx_stats_etherStatsPkts1519toXOctets_hi \t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $etherStatsPkts1519toXOctets_hi]]	\n"
 		puts "\t	103. tx_stats_etherStatsFragments_lo \t\t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $etherStatsFragments_lo]]	\n" 	
 		puts "\t	104. tx_stats_etherStatsFragments_hi \t\t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $etherStatsFragments_hi]]	\n"
 		puts "\t	105. tx_stats_etherStatsJabbers_lo \t\t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $etherStatsJabbers_lo]]	\n"
 		puts "\t	106. tx_stats_etherStatsJabbers_hi \t\t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $etherStatsJabbers_hi]]	\n"
 		puts "\t	107. tx_stats_etherStatsCRCErr_lo \t\t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $etherStatsCRCErr_lo]]	\n"
 		puts "\t	108. tx_stats_etherStatsCRCErr_hi \t\t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $etherStatsCRCErr_hi]]	\n" 
 		puts "\t	109. tx_stats_unicastMACCtrlFrames_lo \t\t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $unicastMACCtrlFrames_lo]]	\n"
 		puts "\t	110. tx_stats_unicastMACCtrlFrames_hi \t\t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $unicastMACCtrlFrames_hi]]	\n"
 		puts "\t	111. tx_stats_multicastMACCtrlFrames_lo \t\t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $multicastMACCtrlFrames_lo]]	\n"
 		puts "\t	112. tx_stats_multicastMACCtrlFrames_hi \t\t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $multicastMACCtrlFrames_hi]]	\n"
 		puts "\t	113. tx_stats_broadcastMACCtrlFrames_lo \t\t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $broadcastMACCtrlFrames_lo]]	\n" 
 		puts "\t	114. tx_stats_broadcastMACCtrlFrames_hi \t\t : \t [format "%#x" [expr $10g_mac_tx_statistic_counters_reg_map + $broadcastMACCtrlFrames_hi]]	\n"
 		
 		# for RX Stat
 		puts "\t\t	                    == 10G MAC Register RX Statistic Register Address ==						"
 		puts "\t	115. rx_stats_ClearStats \t\t\t : \t [format "%#x" [expr $10g_mac_rx_statistic_counters_reg_map + $ClearStats]]	\n" 				
 		puts "\t	116. rx_stats_framesOK_lo \t\t\t : \t [format "%#x" [expr $10g_mac_rx_statistic_counters_reg_map + $framesOK_lo]]	\n"
 		puts "\t	117. rx_stats_framesOK_hi \t\t\t : \t [format "%#x" [expr $10g_mac_rx_statistic_counters_reg_map + $framesOK_hi]]	\n"
 		puts "\t	118. rx_stats_framesErr_lo \t\t\t : \t [format "%#x" [expr $10g_mac_rx_statistic_counters_reg_map + $framesErr_lo]]	\n"
 		puts "\t	119. rx_stats_framesErr_hi \t\t\t : \t [format "%#x" [expr $10g_mac_rx_statistic_counters_reg_map + $framesErr_hi]]	\n"
 		puts "\t	120. rx_stats_framesCRCErr_lo \t\t\t : \t [format "%#x" [expr $10g_mac_rx_statistic_counters_reg_map + $framesCRCErr_lo]]	\n"
 		puts "\t	121. rx_stats_framesCRCErr_hi \t\t\t : \t [format "%#x" [expr $10g_mac_rx_statistic_counters_reg_map + $framesCRCErr_hi]]	\n"
 		puts "\t	122. rx_stats_octetsOK_lo \t\t\t : \t [format "%#x" [expr $10g_mac_rx_statistic_counters_reg_map + $octetsOK_lo]]	\n"
 		puts "\t	123. rx_stats_octetsOK_hi \t\t\t : \t [format "%#x" [expr $10g_mac_rx_statistic_counters_reg_map + $octetsOK_hi]]	\n" 	    
 		puts "\t	124. rx_stats_pauseMACCtrlFrames_lo \t\t : \t [format "%#x" [expr $10g_mac_rx_statistic_counters_reg_map + $pauseMACCtrlFrames_lo]]	\n"
 		puts "\t	125. rx_stats_pauseMACCtrlFrames_hi \t\t : \t [format "%#x" [expr $10g_mac_rx_statistic_counters_reg_map + $pauseMACCtrlFrames_hi]]	\n"
 		puts "\t	126. rx_stats_ifErrors_lo \t\t\t : \t [format "%#x" [expr $10g_mac_rx_statistic_counters_reg_map + $ifErrors_lo]]	\n"
 		puts "\t	127. rx_stats_ifErrors_hi \t\t\t : \t [format "%#x" [expr $10g_mac_rx_statistic_counters_reg_map + $ifErrors_hi]]	\n"
 		puts "\t	128. rx_stats_unicastFramesOK_lo \t\t : \t [format "%#x" [expr $10g_mac_rx_statistic_counters_reg_map + $unicastFramesOK_lo]]	\n" 	
 		puts "\t	129. rx_stats_unicastFramesOK_hi \t\t : \t [format "%#x" [expr $10g_mac_rx_statistic_counters_reg_map + $unicastFramesOK_hi]]	\n"
 		puts "\t	130. rx_stats_unicastFramesErr_lo \t\t : \t [format "%#x" [expr $10g_mac_rx_statistic_counters_reg_map + $unicastFramesErr_lo]]	\n"
 		puts "\t	131. rx_stats_unicastFramesErr_hi \t\t : \t [format "%#x" [expr $10g_mac_rx_statistic_counters_reg_map + $unicastFramesErr_hi]]	\n"
 		puts "\t	132. rx_stats_multicastFramesOK_lo \t\t : \t [format "%#x" [expr $10g_mac_rx_statistic_counters_reg_map + $multicastFramesOK_lo]]	\n"
 		puts "\t	133. rx_stats_multicastFramesOK_hi \t\t : \t [format "%#x" [expr $10g_mac_rx_statistic_counters_reg_map + $multicastFramesOK_hi]]	\n"
 		puts "\t	134. rx_stats_multicastFramesErr_lo \t\t : \t [format "%#x" [expr $10g_mac_rx_statistic_counters_reg_map + $multicastFramesErr_lo]]	\n"
 		puts "\t	135. rx_stats_multicastFramesErr_hi \t\t : \t [format "%#x" [expr $10g_mac_rx_statistic_counters_reg_map + $multicastFramesErr_hi]]	\n"
 		puts "\t	136. rx_stats_broadcastFramesOK_lo \t\t : \t [format "%#x" [expr $10g_mac_rx_statistic_counters_reg_map + $broadcastFramesOK_lo]]	\n"
 		puts "\t	137. rx_stats_broadcastFramesOK_hi \t\t : \t [format "%#x" [expr $10g_mac_rx_statistic_counters_reg_map + $broadcastFramesOK_hi]]	\n" 	
 		puts "\t	138. rx_stats_broadcastFramesErr_lo \t\t : \t [format "%#x" [expr $10g_mac_rx_statistic_counters_reg_map + $broadcastFramesErr_lo]]	\n"
 		puts "\t	139. rx_stats_broadcastFramesErr_hi \t\t : \t [format "%#x" [expr $10g_mac_rx_statistic_counters_reg_map + $broadcastFramesErr_hi]]	\n"
 		puts "\t	140. rx_stats_etherStatsOctets_lo \t\t : \t [format "%#x" [expr $10g_mac_rx_statistic_counters_reg_map + $etherStatsOctets_lo]]	\n"
 		puts "\t	141. rx_stats_etherStatsOctets_hi \t\t : \t [format "%#x" [expr $10g_mac_rx_statistic_counters_reg_map + $etherStatsOctets_hi]]	\n"
 		puts "\t	142. rx_stats_etherStatsPkts_lo \t\t : \t [format "%#x" [expr $10g_mac_rx_statistic_counters_reg_map + $etherStatsPkts_lo]]	\n"
 		puts "\t	143. rx_stats_etherStatsPkts_hi \t\t : \t [format "%#x" [expr $10g_mac_rx_statistic_counters_reg_map + $etherStatsPkts_hi]]	\n" 	
 		puts "\t	145. rx_stats_etherStatsUndersizePkts_lo \t\t : \t [format "%#x" [expr $10g_mac_rx_statistic_counters_reg_map + $etherStatsUndersizePkts_lo]]	\n"
 		puts "\t	146. rx_stats_etherStatsUndersizePkts_hi \t\t : \t [format "%#x" [expr $10g_mac_rx_statistic_counters_reg_map + $etherStatsUndersizePkts_hi]]	\n"
 		puts "\t	147. rx_stats_etherStatsOversizePkts_lo \t\t : \t [format "%#x" [expr $10g_mac_rx_statistic_counters_reg_map + $etherStatsOversizePkts_lo]]	\n"
 		puts "\t	148. rx_stats_etherStatsOversizePkts_hi \t\t : \t [format "%#x" [expr $10g_mac_rx_statistic_counters_reg_map + $etherStatsOversizePkts_hi]]	\n" 
 		puts "\t	149. rx_stats_etherStatsPkts64Octets_lo \t\t : \t [format "%#x" [expr $10g_mac_rx_statistic_counters_reg_map + $etherStatsPkts64Octets_lo]]	\n"
 		puts "\t	150. rx_stats_etherStatsPkts64Octets_hi \t\t : \t [format "%#x" [expr $10g_mac_rx_statistic_counters_reg_map + $etherStatsPkts64Octets_hi]]	\n"
 		puts "\t	151. rx_stats_etherStatsPkts65to127Octets_lo \t : \t [format "%#x" [expr $10g_mac_rx_statistic_counters_reg_map + $etherStatsPkts65to127Octets_lo]]	\n"
 		puts "\t	152. rx_stats_etherStatsPkts65to127Octets_hi \t : \t [format "%#x" [expr $10g_mac_rx_statistic_counters_reg_map + $etherStatsPkts65to127Octets_hi]]	\n"
 		puts "\t	153. rx_stats_etherStatsPkts128to255Octets_lo \t : \t [format "%#x" [expr $10g_mac_rx_statistic_counters_reg_map + $etherStatsPkts128to255Octets_lo]]	\n" 	
 		puts "\t	154. rx_stats_etherStatsPkts128to255Octets_hi \t : \t [format "%#x" [expr $10g_mac_rx_statistic_counters_reg_map + $etherStatsPkts128to255Octets_hi]]	\n"
 		puts "\t	155. rx_stats_etherStatsPkts256to511Octets_lo \t : \t [format "%#x" [expr $10g_mac_rx_statistic_counters_reg_map + $etherStatsPkts256to511Octets_lo]]	\n"
 		puts "\t	156. rx_stats_etherStatsPkts256to511Octets_hi \t : \t [format "%#x" [expr $10g_mac_rx_statistic_counters_reg_map + $etherStatsPkts256to511Octets_hi]]	\n"  
 		puts "\t	157. rx_stats_etherStatsPkts512to1023Octets_lo \t : \t [format "%#x" [expr $10g_mac_rx_statistic_counters_reg_map + $etherStatsPkts512to1023Octets_lo]]	\n"
 		puts "\t	158. rx_stats_etherStatsPkts512to1023Octets_hi \t : \t [format "%#x" [expr $10g_mac_rx_statistic_counters_reg_map + $etherStatsPkts512to1023Octets_hi]]	\n" 
 		puts "\t	159. rx_stats_etherStatPkts1024to1518Octets_lo \t : \t [format "%#x" [expr $10g_mac_rx_statistic_counters_reg_map + $etherStatPkts1024to1518Octets_lo]]	\n"
 		puts "\t	160. rx_stats_etherStatPkts1024to1518Octets_hi \t : \t [format "%#x" [expr $10g_mac_rx_statistic_counters_reg_map + $etherStatPkts1024to1518Octets_hi]]	\n"
 		puts "\t	161. rx_stats_etherStatsPkts1519toXOctets_lo \t : \t [format "%#x" [expr $10g_mac_rx_statistic_counters_reg_map + $etherStatsPkts1519toXOctets_lo]]	\n"
 		puts "\t	162. rx_stats_etherStatsPkts1519toXOctets_hi \t : \t [format "%#x" [expr $10g_mac_rx_statistic_counters_reg_map + $etherStatsPkts1519toXOctets_hi]]	\n"
 		puts "\t	163. rx_stats_etherStatsFragments_lo \t\t : \t [format "%#x" [expr $10g_mac_rx_statistic_counters_reg_map + $etherStatsFragments_lo]]	\n" 	
 		puts "\t	164. rx_stats_etherStatsFragments_hi \t\t : \t [format "%#x" [expr $10g_mac_rx_statistic_counters_reg_map + $etherStatsFragments_hi]]	\n"
 		puts "\t	165. rx_stats_etherStatsJabbers_lo \t\t : \t [format "%#x" [expr $10g_mac_rx_statistic_counters_reg_map + $etherStatsJabbers_lo]]	\n"
 		puts "\t	166. rx_stats_etherStatsJabbers_hi \t\t : \t [format "%#x" [expr $10g_mac_rx_statistic_counters_reg_map + $etherStatsJabbers_hi]]	\n"
 		puts "\t	167. rx_stats_etherStatsCRCErr_lo \t\t : \t [format "%#x" [expr $10g_mac_rx_statistic_counters_reg_map + $etherStatsCRCErr_lo]]	\n"
 		puts "\t	168. rx_stats_etherStatsCRCErr_hi \t\t : \t [format "%#x" [expr $10g_mac_rx_statistic_counters_reg_map + $etherStatsCRCErr_hi]]	\n" 
 		puts "\t	169. rx_stats_unicastMACCtrlFrames_lo \t\t : \t [format "%#x" [expr $10g_mac_rx_statistic_counters_reg_map + $unicastMACCtrlFrames_lo]]	\n"
 		puts "\t	170. rx_stats_unicastMACCtrlFrames_hi \t\t : \t [format "%#x" [expr $10g_mac_rx_statistic_counters_reg_map + $unicastMACCtrlFrames_hi]]	\n"
 		puts "\t	171. rx_stats_multicastMACCtrlFrames_lo \t\t : \t [format "%#x" [expr $10g_mac_rx_statistic_counters_reg_map + $multicastMACCtrlFrames_lo]]	\n"
 		puts "\t	172. rx_stats_multicastMACCtrlFrames_hi \t\t : \t [format "%#x" [expr $10g_mac_rx_statistic_counters_reg_map + $multicastMACCtrlFrames_hi]]	\n"
 		puts "\t	173. rx_stats_broadcastMACCtrlFrames_lo \t\t : \t [format "%#x" [expr $10g_mac_rx_statistic_counters_reg_map + $broadcastMACCtrlFrames_lo]]	\n" 
 		puts "\t	174. rx_stats_broadcastMACCtrlFrames_hi \t\t : \t [format "%#x" [expr $10g_mac_rx_statistic_counters_reg_map + $broadcastMACCtrlFrames_hi]]	\n"
 		
 		puts "\t\t	==================================================================			"
 		puts "\t	175. RXFIFO_DROP_ON_ERROR \t\t\t : \t [format "%#x" [expr $10G_RX_FIFO_BASE_ADDR + $RXFIFO_DROP_ON_ERROR]]	\n" 
 		puts "\t	176. XGMII_LLPBK \t\t\t\t : \t [format "%#x" [expr $XGMII_LB_BASE_ADDR + $XGMII_LLPBK]]	\n"
	} elseif {$memory_map == "PHY_IP_MAP"} { 
		puts "\n\n"
  		puts "\t 	==================================================================================== "
 		puts "\t\t	                    == $10G_ETH_MODE PHY IP Register Register Address ==			"
 		puts "\t\t	                    == $10G_ETH_MODE PHY IP Base Address = $PHY_IP_BASE_ADDR ==		" 		 		 		 		
 		puts "\t 	==================================================================================== "	

 		puts "\n"
 		puts "\t	1. cal_blk_powerdown \t : \t [format "%#x" [expr $PHY_IP_BASE_ADDR + $cal_blk_powerdown]]	\n"
 		puts "\t	2. pma_tx_pll_is_locked \t : \t [format "%#x" [expr $PHY_IP_BASE_ADDR + $pma_tx_pll_is_locked]]	\n"
 		puts "\t	3. reset_ch_bitmask \t\t : \t [format "%#x" [expr $PHY_IP_BASE_ADDR + $reset_ch_bitmask]]	\n"
 		puts "\t	4. reset_control \t\t : \t [format "%#x" [expr $PHY_IP_BASE_ADDR + $reset_control]]	\n"
 		puts "\t	5. reset_status \t\t : \t [format "%#x" [expr $PHY_IP_BASE_ADDR + $reset_status]]	\n"
 		puts "\t	6. manual_reset_control \t : \t [format "%#x" [expr $PHY_IP_BASE_ADDR + $manual_reset_control]]	\n"
 		puts "\t	7. phy_serial_loopback \t : \t [format "%#x" [expr $PHY_IP_BASE_ADDR + $phy_serial_loopback]]	\n"
 		puts "\t	8. pma_rx_signaldetect \t : \t [format "%#x" [expr $PHY_IP_BASE_ADDR + $pma_rx_signaldetect]]	\n"
 		puts "\t	9. pma_rx_set_locktodata \t : \t [format "%#x" [expr $PHY_IP_BASE_ADDR + $pma_rx_set_locktodata]]	\n" 	
 		puts "\t	10. pma_rx_set_locktoref \t : \t [format "%#x" [expr $PHY_IP_BASE_ADDR + $pma_rx_set_locktoref]]	\n"
 		puts "\t	11. pma_rx_is_lockedtodata \t : \t [format "%#x" [expr $PHY_IP_BASE_ADDR + $pma_rx_is_lockedtodata]]	\n"
 		puts "\t	12. pma_rx_is_lockedtoref \t : \t [format "%#x" [expr $PHY_IP_BASE_ADDR + $pma_rx_is_lockedtoref]]	\n"
 		
 		if {$10G_ETH_MODE == "XAUI"} {
 			puts "\t	13. xaui_gxb_digitalreset \t : \t [format "%#x" [expr $PHY_IP_BASE_ADDR + $xaui_gxb_digitalreset]]	\n"
 			puts "\t	14. xaui_rx_invpolarity \t : \t [format "%#x" [expr $PHY_IP_BASE_ADDR + $xaui_rx_invpolarity]]	\n" 	
 			puts "\t	15. xaui_tx_invpolarity \t : \t [format "%#x" [expr $PHY_IP_BASE_ADDR + $xaui_tx_invpolarity]]	\n"
 			puts "\t	16. xaui_gxb_status \t\t : \t [format "%#x" [expr $PHY_IP_BASE_ADDR + $xaui_gxb_status]]	\n"
 			puts "\t	17. xaui_gxb_err_status_1 \t : \t [format "%#x" [expr $PHY_IP_BASE_ADDR + $xaui_gxb_err_status_1]]	\n"
 			puts "\t	18. xaui_gxb_err_status_2 \t : \t [format "%#x" [expr $PHY_IP_BASE_ADDR + $xaui_gxb_err_status_2]]	\n"
 			puts "\t	19. xaui_gxb_rmfifo_ins_del \t : \t [format "%#x" [expr $PHY_IP_BASE_ADDR + $xaui_gxb_rmfifo_ins_del]]	\n"
 			puts "\t	20. xaui_gxb_rmfifo_full_empty  : \t [format "%#x" [expr $PHY_IP_BASE_ADDR + $xaui_gxb_rmfifo_full_empty]]	\n"
 			puts "\t	21. xaui_phase_comp_fifo_error  : \t [format "%#x" [expr $PHY_IP_BASE_ADDR + $xaui_phase_comp_fifo_error]]	\n"
 			puts "\t	22. xaui_simulation_flag \t : \t [format "%#x" [expr $PHY_IP_BASE_ADDR + $xaui_simulation_flag]]	\n"
		} else {
			puts "\t	13. 10g_baser_indirect_addr \t : \t [format "%#x" [expr $PHY_IP_BASE_ADDR + $10g_baser_indirect_addr]]	\n"
 			puts "\t	14. 10g_baser_err_count_clr \t : \t [format "%#x" [expr $PHY_IP_BASE_ADDR + $10g_baser_err_count_clr]]	\n" 	
 			puts "\t	15. 10g_baser_pcs_status \t : \t [format "%#x" [expr $PHY_IP_BASE_ADDR + $10g_baser_pcs_status]]	\n"
 			puts "\t	16. 10g_baser_err_count \t : \t [format "%#x" [expr $PHY_IP_BASE_ADDR + $10g_baser_err_count]]	\n"
		}
	} elseif {($memory_map == "BCM_PHY_MAP") && ($10G_ETH_MODE == "XAUI")} { 
		puts "\n\n"
  		puts "\t 	==================================================================================== "
 		puts "\t\t	                    == BroadCom 8728 PHY Register Register Address ==				"
 		puts "\t\t	                    == MDIO Base Address = $MDIO_BASE_ADDR ==		" 		 		 		 		 		
 		puts "\t 	==================================================================================== "	

 		puts "\n"
 		puts "\t	1. CHIP_ID \t\t : \t $CHIP_ID	\n"
 		puts "\t	2. XGXS_CONTROL \t\t : \t $XGXS_CONTROL	\n"
 		puts "\t	3. XGXS_STATUS \t\t : \t $XGXS_STATUS	\n"
 		puts "\t	4. XGXS_RXLANE_SWAP \t\t : \t $XGXS_RXLANE_SWAP	\n"
 		puts "\t	5. XGXS_TXLANE_SWAP \t\t : \t $XGXS_TXLANE_SWAP	\n"
 		puts "\t	6. XGXS_MODE_CONTROL \t : \t $XGXS_MODE_CONTROL	\n"
 		puts "\t	7. SFI_PMAPMD_CONTROL \t : \t $SFI_PMAPMD_CONTROL	\n"
 		puts "\t	8. SFI_PCS_CONTROL \t\t : \t $SFI_PCS_CONTROL	\n"
	} else {
		puts "\n\n"
		puts "\t 	==================================================================================== "
  		puts "\t 	Please Key In A Valid Mamory Map Symbols "
  		if {$10G_ETH_MODE == "XAUI"} {					#jier: for XAUI
 			puts "\t\t	Option \t: \tBASE_ADDR, GEN_MAP, MON_MAP, 10G_MAC_MAP, PHY_IP_MAP, BCM_PHY_MAP \n"
		} else {										#jier: for 10G Base R
			puts "\t\t	Option \t: \tBASE_ADDR, GEN_MAP, MON_MAP, 10G_MAC_MAP, PHY_IP_MAP \n"
		}
		
 		puts "\t 	==================================================================================== "
	}
}

proc DEFAULT {} {
	source demo.tcl
}

#Display the Command List when the demo.tcl is sourced. This help user to understand what are the command available
CMD_LIST