 ## ___________________________________________________________________________
 ##		XAUI Registers
 ## ___________________________________________________________________________
source	phy_ip_reg_map.tcl

 ## ___________________________________________________________________________
 ##		MAC registers
 ## ___________________________________________________________________________
source	10g_mac_reg_map.tcl

 ## _______________________________________________________________________________________________
 ##	Handy routines to control and observe registers
 ## _______________________________________________________________________________________________

 proc SETMAC_PRIMARY_ADDR {value} {
    global 10GMAC_BASE_ADDR
    global rx_frame_addr0
    global rx_frame_addr1
    set rx_mac_primaddr1 0x[string range $value 0 3]
    puts "\t 			setting $rx_mac_primaddr1 into rxmac primary address Reg-1"
    reg_write $10GMAC_BASE_ADDR $rx_frame_addr1 $rx_mac_primaddr1

    set rx_mac_primaddr0 0x[string range $value 4 11]
    puts "\t 			setting $rx_mac_primaddr0 into rxmac primary address Reg-0"
    reg_write $10GMAC_BASE_ADDR $rx_frame_addr0 $rx_mac_primaddr0
   }

 ## ______________________________________________________
 ## 

 proc SETMAC_STRIP_RX_PADCRC {} {
    	global 10GMAC_BASE_ADDR
    	global rx_padcrc_control
       	puts "\t 			enabling: pad and crc stripping in rx mac"
       	reg_write $10GMAC_BASE_ADDR $rx_padcrc_control 0x00000003
  }

 proc CHKMAC_STRIP_RX_PADCRC {} {
    	global 10GMAC_BASE_ADDR
    	global rx_padcrc_control
        puts "\t 			rxmac pad-crc stripping setting = "
        reg_read $10GMAC_BASE_ADDR $rx_padcrc_control 
      }

 ## ______________________________________________________
 ## 

 proc RESETMAC_LLPBK_XGMII {} {
    	global XGMII_LB_BASE_ADDR
    	global XGMII_LLPBK
        puts "\t 			disabling: local loopback at xgmii interface "
        reg_write $XGMII_LB_BASE_ADDR $XGMII_LLPBK 0x0 
      }
 proc CHKMAC_LLPBK_XGMII {} {
    	global XGMII_LB_BASE_ADDR
    	global XGMII_LLPBK
        puts "\t 			local loopback at xgmii setting = [reg_read $XGMII_LB_BASE_ADDR $XGMII_LLPBK]"  
     }

 proc SETMAC_LLPBK_XGMII {} {
    	global XGMII_LB_BASE_ADDR
    	global XGMII_LLPBK
        puts "\t 			enabling: local loopback at xgmii interface "
        reg_write $XGMII_LB_BASE_ADDR $XGMII_LLPBK 0x1 
      }

 proc SETFIFO_DROP_ON_ERROR {value} {
    	global 10G_RX_FIFO_BASE_ADDR
    	global RX_FIFO_DROP_ON_ERROR
        puts "\t 			enabling: drop on error in rx fifo"
    	reg_write $10G_RX_FIFO_BASE_ADDR $RXFIFO_DROP_ON_ERROR $value
	}

 proc SETMAC_CLR_STATS {} {
    	global  ClearStats             	  
    	global 	10g_mac_tx_statistic_counters_reg_map    
    	global 	10g_mac_rx_statistic_counters_reg_map    
        puts "\t 			clearing mac stats registers"
    	reg_write $10g_mac_tx_statistic_counters_reg_map $ClearStats 0x01
    	reg_write $10g_mac_rx_statistic_counters_reg_map $ClearStats 0x01
	}
 ## ______________________________________________________
 ## 

 proc SETXAUI_GXB_PWRDWN {} {
    	global PHY_IP_BASE_ADDR
    	global cal_blk_powerdown
        puts "\t 			asserting gxb powerdown "
        reg_write $PHY_IP_BASE_ADDR $cal_blk_powerdown 0x00000002 
	puts "\t 			asserting gxb powerdown "
        reg_write $PHY_IP_BASE_ADDR $cal_blk_powerdown 0x00000000 
       }

 proc SETXAUI_SERIAL_LLPBK {} {
    	global PHY_IP_BASE_ADDR
    	global phy_serial_loopback
        puts "\t 			Enabling serial PMA Loopback (local)"
        reg_write $PHY_IP_BASE_ADDR $phy_serial_loopback 0x0000000f 
        puts "				Read back Serial PMA loopback register = [reg_read $PHY_IP_BASE_ADDR $phy_serial_loopback] " 
       }

 proc RESETXAUI_SERIAL_LLPBK {} {
    	global PHY_IP_BASE_ADDR
    	global phy_serial_loopback
        puts "\t			Disabling serial PMA Loopback (local)"
        reg_write $PHY_IP_BASE_ADDR $phy_serial_loopback 0x00000000 
        puts "\t			Read back Serial PMA loopback register = [reg_read $PHY_IP_BASE_ADDR $phy_serial_loopback] " 
       }

 proc CHKXAUI_SERIAL_LLPBK {} {
    	global PHY_IP_BASE_ADDR
    	global phy_serial_loopback
        puts "\t		Read Serial PMA loopback register = [reg_read $PHY_IP_BASE_ADDR $phy_serial_loopback] " 
       }

 proc CHKXAUI_RXSTATUS_0 {} {
    	global PHY_IP_BASE_ADDR
    	global phy_serial_loopback
        puts "\t		Read Serial PMA loopback register = [reg_read $PHY_IP_BASE_ADDR $phy_serial_loopback] " 
       }


 ## =======================================================================================
 #		mac sanity check utilities
 ## =======================================================================================

  proc CHKMAC_RXSTATS {} {
        global 	LOGFILE    
    	global  10GMAC_BASE_ADDR
    	global	rx_frame_addr0     		
    	global	rx_frame_addr1     		
    	global	rx_frame_maxlength  		
    	
    	global	rx_frame_spaddr0_0  		
    	global	rx_frame_spaddr0_1  		
    	global	rx_frame_spaddr1_0  		
    	global	rx_frame_spaddr1_1  		
    	global	rx_frame_spaddr2_0  		
    	global	rx_frame_spaddr2_1  		
    	global	rx_frame_spaddr3_0  		
    	global	rx_frame_spaddr3_1  		

    	global	rx_padcrc_control     		
    	global 	RXFIFO_DROP_ON_ERROR                 
    	global 	XGMII_LLPBK                           

    	global 	tx_addrins_control    	
    	global 	tx_addrins_macaddr0    
    	global 	tx_addrins_macaddr1    
    	global 	10g_mac_tx_statistic_counters_reg_map    
    	global 	10g_mac_rx_statistic_counters_reg_map    
    
    ## _____________________________________________________________________
    ## 	Statistics Registers
    ## _____________________________________________________________________
    	global framesOK_lo             	  
    	global framesErr_lo            	  
    	global framesCRCErr_lo         	  
    	global octetsOK_lo             	  
    	global pauseMACCtrlFrames_lo   	  
    	global ifErrors_lo             	  
    	global unicastFramesOK_lo      	  
    	global unicastFramesErr_lo     	  
    	global multicastFramesOK_lo    	  
    	global multicastFramesErr_lo   	  
    	global broadcastFramesOK_lo    	  
    	global broadcastFramesErr_lo   	  
    	global etherStatsOctets_lo     	  
    	global etherStatsPkts_lo       	  
    	global etherStatsUndersizePkts_lo      
    	global etherStatsOversizePkts_lo       
    	global etherStatsPkts64Octets_lo       
    	global etherStatsPkts65to127Octets_lo  
    	global etherStatsPkts128to255Octets_lo 
    	global etherStatsPkts256to511Octets_lo 
    	global etherStatsPkts512to1023Octets_lo  
    	global etherStatPkts1024to1518Octets_lo  
    	global etherStatsPkts1519toXOctets_lo    
    	global etherStatsFragments_lo            
    	global etherStatsJabbers_lo              
    	global etherStatsCRCErr_lo               
    	global unicastMACCtrlFrames_lo           
    	global multicastMACCtrlFrames_lo         
    	global broadcastMACCtrlFrames_lo         

       	puts "\t 		       ======================================================================"
	puts "\t			|  MAC RX STATS REGISTER CHECK					     "
       	puts "\t 		       ======================================================================"
  	puts "\t			|# FRAMES_RECEIVED_WITH_ERROR         	= [format %u [reg_read $10g_mac_rx_statistic_counters_reg_map $framesErr_lo]]"
  	puts "\t			|# UNICAST_FRAMES_WITH_ERROR     	= [format %u [reg_read $10g_mac_rx_statistic_counters_reg_map $unicastFramesErr_lo]]"
  	puts "\t			|# MULTICAST_FRAMES_RECEIVED_WITH_ERROR = [format %u [reg_read $10g_mac_rx_statistic_counters_reg_map $multicastFramesErr_lo]]"
  	puts "\t			|# BRDCAST_FRAMES_WITH_ERROR   		= [format %u [reg_read $10g_mac_rx_statistic_counters_reg_map $broadcastFramesErr_lo]]"
  	puts "\t			|# FRAMES_RECEIVED_WITH_ONLY_CRCERROR 	= [format %u [reg_read $10g_mac_rx_statistic_counters_reg_map $framesCRCErr_lo]]"
  	puts "\t			|# VALID_LENGTH_FRAMES_WITH_CRC_ERROR   = [format %u [reg_read $10g_mac_rx_statistic_counters_reg_map $etherStatsCRCErr_lo]]"
  	puts "\t			|# JABBER_FRAMES                	= [format %u [reg_read $10g_mac_rx_statistic_counters_reg_map $etherStatsJabbers_lo]]"
  	puts "\t			|# FRAGMENTED_FRAMES                	= [format %u [reg_read $10g_mac_rx_statistic_counters_reg_map $etherStatsFragments_lo]]"
  	puts "\t			|# INVALID_FRAMES_RECEIVED             	= [format %u [reg_read $10g_mac_rx_statistic_counters_reg_map $ifErrors_lo]]"

  	puts "\t			|# FRAMES_RECEIVED_GOOD	 		= [format %u [reg_read $10g_mac_rx_statistic_counters_reg_map $framesOK_lo]]"
  	puts "\t			|# PAUSE_FRAMES_RECEIVED   		= [format %u [reg_read $10g_mac_rx_statistic_counters_reg_map $pauseMACCtrlFrames_lo]]"
  	puts "\t			|# UNICAST_CONTROL_FRAMES              	= [format %u [reg_read $10g_mac_rx_statistic_counters_reg_map $unicastMACCtrlFrames_lo]]"
  	puts "\t			|# MULTICAST_CONTROL_FRAMES            	= [format %u [reg_read $10g_mac_rx_statistic_counters_reg_map $multicastMACCtrlFrames_lo]]"
  	puts "\t			|# UNICAST_FRAMES_RECEIVED_GOOD   	= [format %u [reg_read $10g_mac_rx_statistic_counters_reg_map $unicastFramesOK_lo]]"
  	puts "\t			|# MULTICAST_FRAMES_RECEIVED_GOOD 	= [format %u [reg_read $10g_mac_rx_statistic_counters_reg_map $multicastFramesOK_lo]]"
  	puts "\t			|# BRDCAST_FRAMES_GOOD    		= [format %u [reg_read $10g_mac_rx_statistic_counters_reg_map $broadcastFramesOK_lo]]"
  	puts "\t			|# DATA_AND_PADDING_OCTETS_RECEIVED_GOOD= [format %u [reg_read $10g_mac_rx_statistic_counters_reg_map $octetsOK_lo]]"

  	puts "\t			|# COMPREHENSICE_OCTETS_RECEIVED       	= [format %u [reg_read $10g_mac_rx_statistic_counters_reg_map $etherStatsOctets_lo     	]]"
  	puts "\t			|# FRAMES_WITH_SIZE_64_BYTES            = [format %u [reg_read $10g_mac_rx_statistic_counters_reg_map $etherStatsPkts64Octets_lo]]"
  	puts "\t			|# FRAMES_BETWEEN_SIZE_64AND127_BYTES   = [format %u [reg_read $10g_mac_rx_statistic_counters_reg_map $etherStatsPkts65to127Octets_lo  ]]"
  	puts "\t			|# FRAMES_BETWEEN_SIZE_128AND255_BYTES  = [format %u [reg_read $10g_mac_rx_statistic_counters_reg_map $etherStatsPkts128to255Octets_lo ]]"
  	puts "\t			|# FRAMES_BETWEEN_SIZE_256AND511_BYTES  = [format %u [reg_read $10g_mac_rx_statistic_counters_reg_map $etherStatsPkts256to511Octets_lo ]]"
  	puts "\t			|# FRAMES_BETWEEN_SIZE_512AND1K_BYTES   = [format %u [reg_read $10g_mac_rx_statistic_counters_reg_map $etherStatsPkts512to1023Octets_lo]]"
  	puts "\t			|# FRAMES_BETWEEN_SIZE_1KND1518_BYTES   = [format %u [reg_read $10g_mac_rx_statistic_counters_reg_map $etherStatPkts1024to1518Octets_lo]]"
  	puts "\t			|# FRAMES_BETWEEN_SIZE_ABOVE1519_BYTES  = [format %u [reg_read $10g_mac_rx_statistic_counters_reg_map $etherStatsPkts1519toXOctets_lo  ]]"

       	puts $LOGFILE "\t 	       ======================================================================"
	puts $LOGFILE "\t		|  MAC RX STATS REGISTER CHECK					     "
       	puts $LOGFILE "\t 	       ======================================================================"
  	puts $LOGFILE "\t		|# FRAMES_RECEIVED_WITH_ERROR         	= [format %u [reg_read $10g_mac_rx_statistic_counters_reg_map $framesErr_lo]]"
  	puts $LOGFILE "\t		|# UNICAST_FRAMES_WITH_ERROR     	= [format %u [reg_read $10g_mac_rx_statistic_counters_reg_map $unicastFramesErr_lo]]"
  	puts $LOGFILE "\t		|# MULTICAST_FRAMES_RECEIVED_WITH_ERROR = [format %u [reg_read $10g_mac_rx_statistic_counters_reg_map $multicastFramesErr_lo]]"
  	puts $LOGFILE "\t		|# BRDCAST_FRAMES_WITH_ERROR   		= [format %u [reg_read $10g_mac_rx_statistic_counters_reg_map $broadcastFramesErr_lo]]"
  	puts $LOGFILE "\t		|# FRAMES_RECEIVED_WITH_ONLY_CRCERROR 	= [format %u [reg_read $10g_mac_rx_statistic_counters_reg_map $framesCRCErr_lo]]"
  	puts $LOGFILE "\t		|# VALID_LENGTH_FRAMES_WITH_CRC_ERROR   = [format %u [reg_read $10g_mac_rx_statistic_counters_reg_map $etherStatsCRCErr_lo]]"
  	puts $LOGFILE "\t		|# JABBER_FRAMES                	= [format %u [reg_read $10g_mac_rx_statistic_counters_reg_map $etherStatsJabbers_lo]]"
  	puts $LOGFILE "\t		|# FRAGMENTED_FRAMES                	= [format %u [reg_read $10g_mac_rx_statistic_counters_reg_map $etherStatsFragments_lo]]"
  	puts $LOGFILE "\t		|# INVALID_FRAMES_RECEIVED             	= [format %u [reg_read $10g_mac_rx_statistic_counters_reg_map $ifErrors_lo]]"

  	puts $LOGFILE "\t		|# FRAMES_RECEIVED_GOOD	 		= [format %u [reg_read $10g_mac_rx_statistic_counters_reg_map $framesOK_lo]]"
  	puts $LOGFILE "\t		|# PAUSE_FRAMES_RECEIVED   		= [format %u [reg_read $10g_mac_rx_statistic_counters_reg_map $pauseMACCtrlFrames_lo]]"
  	puts $LOGFILE "\t		|# UNICAST_CONTROL_FRAMES              	= [format %u [reg_read $10g_mac_rx_statistic_counters_reg_map $unicastMACCtrlFrames_lo]]"
  	puts $LOGFILE "\t		|# MULTICAST_CONTROL_FRAMES            	= [format %u [reg_read $10g_mac_rx_statistic_counters_reg_map $multicastMACCtrlFrames_lo]]"
  	puts $LOGFILE "\t		|# UNICAST_FRAMES_RECEIVED_GOOD   	= [format %u [reg_read $10g_mac_rx_statistic_counters_reg_map $unicastFramesOK_lo]]"
  	puts $LOGFILE "\t		|# MULTICAST_FRAMES_RECEIVED_GOOD 	= [format %u [reg_read $10g_mac_rx_statistic_counters_reg_map $multicastFramesOK_lo]]"
  	puts $LOGFILE "\t		|# BRDCAST_FRAMES_GOOD    		= [format %u [reg_read $10g_mac_rx_statistic_counters_reg_map $broadcastFramesOK_lo]]"
  	puts $LOGFILE "\t		|# DATA_AND_PADDING_OCTETS_RECEIVED_GOOD= [format %u [reg_read $10g_mac_rx_statistic_counters_reg_map $octetsOK_lo]]"

  	puts $LOGFILE "\t		|# COMPREHENSICE_OCTETS_RECEIVED       	= [format %u [reg_read $10g_mac_rx_statistic_counters_reg_map $etherStatsOctets_lo     	]]"
  	puts $LOGFILE "\t		|# FRAMES_WITH_SIZE_64_BYTES            = [format %u [reg_read $10g_mac_rx_statistic_counters_reg_map $etherStatsPkts64Octets_lo]]"
  	puts $LOGFILE "\t		|# FRAMES_BETWEEN_SIZE_64AND127_BYTES   = [format %u [reg_read $10g_mac_rx_statistic_counters_reg_map $etherStatsPkts65to127Octets_lo  ]]"
  	puts $LOGFILE "\t		|# FRAMES_BETWEEN_SIZE_128AND255_BYTES  = [format %u [reg_read $10g_mac_rx_statistic_counters_reg_map $etherStatsPkts128to255Octets_lo ]]"
  	puts $LOGFILE "\t		|# FRAMES_BETWEEN_SIZE_256AND511_BYTES  = [format %u [reg_read $10g_mac_rx_statistic_counters_reg_map $etherStatsPkts256to511Octets_lo ]]"
  	puts $LOGFILE "\t		|# FRAMES_BETWEEN_SIZE_512AND1K_BYTES   = [format %u [reg_read $10g_mac_rx_statistic_counters_reg_map $etherStatsPkts512to1023Octets_lo]]"
  	puts $LOGFILE "\t		|# FRAMES_BETWEEN_SIZE_1KND1518_BYTES   = [format %u [reg_read $10g_mac_rx_statistic_counters_reg_map $etherStatPkts1024to1518Octets_lo]]"
      } 

  proc CHKMAC_TXSTATS {} {
    	global  10GMAC_BASE_ADDR
    	global	rx_frame_addr0     		
    	global	rx_frame_addr1     		
    	global	rx_frame_maxlength  		
    	 
    	global	rx_frame_spaddr0_0  		
    	global	rx_frame_spaddr0_1  		
    	global	rx_frame_spaddr1_0  		
    	global	rx_frame_spaddr1_1  		
    	global	rx_frame_spaddr2_0  		
    	global	rx_frame_spaddr2_1  		
    	global	rx_frame_spaddr3_0  		
    	global	rx_frame_spaddr3_1  		

    	global	rx_padcrc_control     		
    	global 	RXFIFO_DROP_ON_ERROR                 
    	global 	XGMII_LLPBK                           

    	global 	tx_addrins_control    	
    	global 	tx_addrins_macaddr0    
    	global 	tx_addrins_macaddr1    
    	global 	10g_mac_tx_statistic_counters_reg_map    
    	global 	10g_mac_rx_statistic_counters_reg_map    
    	global 	LOGFILE    
    	 
    	 
    	 # _____________________________________________________________________
    	 # 	Statistics Registers
    	 # _____________________________________________________________________
    	global framesOK_lo             	  
    	global framesErr_lo            	  
    	global framesCRCErr_lo         	  
    	global octetsOK_lo             	  
    	global pauseMACCtrlFrames_lo   	  
    	global ifErrors_lo             	  
    	global unicastFramesOK_lo      	  
    	global unicastFramesErr_lo     	  
    	global multicastFramesOK_lo    	  
    	global multicastFramesErr_lo   	  
    	global broadcastFramesOK_lo    	  
    	global broadcastFramesErr_lo   	  
    	global etherStatsOctets_lo     	  
    	global etherStatsPkts_lo       	  
    	global etherStatsUndersizePkts_lo      
    	global etherStatsOversizePkts_lo       
    	global etherStatsPkts64Octets_lo       
    	global etherStatsPkts65to127Octets_lo  
    	global etherStatsPkts128to255Octets_lo 
    	global etherStatsPkts256to511Octets_lo 
    	global etherStatsPkts512to1023Octets_lo  
    	global etherStatPkts1024to1518Octets_lo  
    	global etherStatsPkts1519toXOctets_lo    
    	global etherStatsFragments_lo            
    	global etherStatsJabbers_lo              
    	global etherStatsCRCErr_lo               
    	global unicastMACCtrlFrames_lo           
    	global multicastMACCtrlFrames_lo         
    	global broadcastMACCtrlFrames_lo         

       	puts "\t		       ==================================================================="
	puts "\t			|  MAC TX STATS REGISTER CHECK					  "
       	puts "\t 		       ==================================================================="
  	puts "\t			|# FRAMES_RECEIVED_WITH_ERROR         	= [format %u [reg_read $10g_mac_tx_statistic_counters_reg_map $framesErr_lo            	]]"
  	puts "\t			|# UNICAST_FRAMES_WITH_ERROR     	= [format %u [reg_read $10g_mac_tx_statistic_counters_reg_map $unicastFramesErr_lo     	]]"
  	puts "\t			|# MULTICAST_FRAMES_RECEIVED_WITH_ERROR = [format %u [reg_read $10g_mac_tx_statistic_counters_reg_map $multicastFramesErr_lo   	]]"
  	puts "\t			|# BRDCAST_FRAMES_WITH_ERROR   		= [format %u [reg_read $10g_mac_tx_statistic_counters_reg_map $broadcastFramesErr_lo   	]]"
  	puts "\t			|# FRAMES_RECEIVED_WITH_ONLY_CRCERROR 	= [format %u [reg_read $10g_mac_tx_statistic_counters_reg_map $framesCRCErr_lo         	]]"
  	puts "\t			|# VALID_LENGTH_FRAMES_WITH_CRC_ERROR   = [format %u [reg_read $10g_mac_tx_statistic_counters_reg_map $etherStatsCRCErr_lo      ]]"
  	puts "\t			|# JABBER_FRAMES                	= [format %u [reg_read $10g_mac_tx_statistic_counters_reg_map $etherStatsJabbers_lo     ]]"
  	puts "\t			|# FRAGMENTED_FRAMES                	= [format %u [reg_read $10g_mac_tx_statistic_counters_reg_map $etherStatsFragments_lo   ]]"
  	puts "\t			|# INVALID_FRAMES_RECEIVED             	= [format %u [reg_read $10g_mac_tx_statistic_counters_reg_map $ifErrors_lo             	]]"

  	puts "\t			|# FRAMES_RECEIVED_GOOD	 		= [format %u [reg_read $10g_mac_tx_statistic_counters_reg_map $framesOK_lo             	]]"
  	puts "\t			|# PAUSE_FRAMES_RECEIVED   		= [format %u [reg_read $10g_mac_tx_statistic_counters_reg_map $pauseMACCtrlFrames_lo   	]]"
  	puts "\t			|# UNICAST_CONTROL_FRAMES              	= [format %u [reg_read $10g_mac_tx_statistic_counters_reg_map $unicastMACCtrlFrames_lo  ]]"
  	puts "\t			|# MULTICAST_CONTROL_FRAMES            	= [format %u [reg_read $10g_mac_tx_statistic_counters_reg_map $multicastMACCtrlFrames_lo]]"
  	puts "\t			|# UNICAST_FRAMES_RECEIVED_GOOD   	= [format %u [reg_read $10g_mac_tx_statistic_counters_reg_map $unicastFramesOK_lo      	]]"
  	puts "\t			|# MULTICAST_FRAMES_RECEIVED_GOOD 	= [format %u [reg_read $10g_mac_tx_statistic_counters_reg_map $multicastFramesOK_lo    	]]"
  	puts "\t			|# BRDCAST_FRAMES_GOOD    		= [format %u [reg_read $10g_mac_tx_statistic_counters_reg_map $broadcastFramesOK_lo    	]]"
  	puts "\t			|# DATA_AND_PADDING_OCTETS_RECEIVED_GOOD= [format %u [reg_read $10g_mac_tx_statistic_counters_reg_map $octetsOK_lo      	]]"

  	puts "\t			|# COMPREHENSICE_OCTETS_RECEIVED       	= [format %u [reg_read $10g_mac_tx_statistic_counters_reg_map $etherStatsOctets_lo     	]]"
  	puts "\t			|# FRAMES_WITH_SIZE_64_BYTES            = [format %u [reg_read $10g_mac_tx_statistic_counters_reg_map $etherStatsPkts64Octets_lo]]"
  	puts "\t			|# FRAMES_BETWEEN_SIZE_64AND127_BYTES   = [format %u [reg_read $10g_mac_tx_statistic_counters_reg_map $etherStatsPkts65to127Octets_lo  ]]"
  	puts "\t			|# FRAMES_BETWEEN_SIZE_128AND255_BYTES  = [format %u [reg_read $10g_mac_tx_statistic_counters_reg_map $etherStatsPkts128to255Octets_lo ]]"
  	puts "\t			|# FRAMES_BETWEEN_SIZE_256AND511_BYTES  = [format %u [reg_read $10g_mac_tx_statistic_counters_reg_map $etherStatsPkts256to511Octets_lo ]]"
  	puts "\t			|# FRAMES_BETWEEN_SIZE_512AND1K_BYTES   = [format %u [reg_read $10g_mac_tx_statistic_counters_reg_map $etherStatsPkts512to1023Octets_lo]]"
  	puts "\t			|# FRAMES_BETWEEN_SIZE_1KND1518_BYTES   = [format %u [reg_read $10g_mac_tx_statistic_counters_reg_map $etherStatPkts1024to1518Octets_lo]]"

       	puts $LOGFILE "\t	       ==================================================================="
	puts $LOGFILE "\t		|  MAC TX STATS REGISTER CHECK					  "
       	puts $LOGFILE "\t 	       ==================================================================="
  	puts $LOGFILE "\t		|# FRAMES_RECEIVED_WITH_ERROR         	= [format %u [reg_read $10g_mac_tx_statistic_counters_reg_map $framesErr_lo            	]]"
  	puts $LOGFILE "\t		|# UNICAST_FRAMES_WITH_ERROR     	= [format %u [reg_read $10g_mac_tx_statistic_counters_reg_map $unicastFramesErr_lo     	]]"
  	puts $LOGFILE "\t		|# MULTICAST_FRAMES_RECEIVED_WITH_ERROR = [format %u [reg_read $10g_mac_tx_statistic_counters_reg_map $multicastFramesErr_lo   	]]"
  	puts $LOGFILE "\t		|# BRDCAST_FRAMES_WITH_ERROR   		= [format %u [reg_read $10g_mac_tx_statistic_counters_reg_map $broadcastFramesErr_lo   	]]"
  	puts $LOGFILE "\t		|# FRAMES_RECEIVED_WITH_ONLY_CRCERROR 	= [format %u [reg_read $10g_mac_tx_statistic_counters_reg_map $framesCRCErr_lo         	]]"
  	puts $LOGFILE "\t		|# VALID_LENGTH_FRAMES_WITH_CRC_ERROR   = [format %u [reg_read $10g_mac_tx_statistic_counters_reg_map $etherStatsCRCErr_lo      ]]"
  	puts $LOGFILE "\t		|# JABBER_FRAMES                	= [format %u [reg_read $10g_mac_tx_statistic_counters_reg_map $etherStatsJabbers_lo     ]]"
  	puts $LOGFILE "\t		|# FRAGMENTED_FRAMES                	= [format %u [reg_read $10g_mac_tx_statistic_counters_reg_map $etherStatsFragments_lo   ]]"
  	puts $LOGFILE "\t		|# INVALID_FRAMES_RECEIVED             	= [format %u [reg_read $10g_mac_tx_statistic_counters_reg_map $ifErrors_lo             	]]"

  	puts $LOGFILE "\t		|# FRAMES_RECEIVED_GOOD	 		= [format %u [reg_read $10g_mac_tx_statistic_counters_reg_map $framesOK_lo             	]]"
  	puts $LOGFILE "\t		|# PAUSE_FRAMES_RECEIVED   		= [format %u [reg_read $10g_mac_tx_statistic_counters_reg_map $pauseMACCtrlFrames_lo   	]]"
  	puts $LOGFILE "\t		|# UNICAST_CONTROL_FRAMES              	= [format %u [reg_read $10g_mac_tx_statistic_counters_reg_map $unicastMACCtrlFrames_lo  ]]"
  	puts $LOGFILE "\t		|# MULTICAST_CONTROL_FRAMES            	= [format %u [reg_read $10g_mac_tx_statistic_counters_reg_map $multicastMACCtrlFrames_lo]]"
  	puts $LOGFILE "\t		|# UNICAST_FRAMES_RECEIVED_GOOD   	= [format %u [reg_read $10g_mac_tx_statistic_counters_reg_map $unicastFramesOK_lo      	]]"
  	puts $LOGFILE "\t		|# MULTICAST_FRAMES_RECEIVED_GOOD 	= [format %u [reg_read $10g_mac_tx_statistic_counters_reg_map $multicastFramesOK_lo    	]]"
  	puts $LOGFILE "\t		|# BRDCAST_FRAMES_GOOD    		= [format %u [reg_read $10g_mac_tx_statistic_counters_reg_map $broadcastFramesOK_lo    	]]"
  	puts $LOGFILE "\t		|# DATA_AND_PADDING_OCTETS_RECEIVED_GOOD= [format %u [reg_read $10g_mac_tx_statistic_counters_reg_map $octetsOK_lo      	]]"

  	puts $LOGFILE "\t		|# COMPREHENSICE_OCTETS_RECEIVED       	= [format %u [reg_read $10g_mac_tx_statistic_counters_reg_map $etherStatsOctets_lo     	]]"
  	puts $LOGFILE "\t		|# FRAMES_WITH_SIZE_64_BYTES            = [format %u [reg_read $10g_mac_tx_statistic_counters_reg_map $etherStatsPkts64Octets_lo]]"
  	puts $LOGFILE "\t		|# FRAMES_BETWEEN_SIZE_64AND127_BYTES   = [format %u [reg_read $10g_mac_tx_statistic_counters_reg_map $etherStatsPkts65to127Octets_lo  ]]"
  	puts $LOGFILE "\t		|# FRAMES_BETWEEN_SIZE_128AND255_BYTES  = [format %u [reg_read $10g_mac_tx_statistic_counters_reg_map $etherStatsPkts128to255Octets_lo ]]"
  	puts $LOGFILE "\t		|# FRAMES_BETWEEN_SIZE_256AND511_BYTES  = [format %u [reg_read $10g_mac_tx_statistic_counters_reg_map $etherStatsPkts256to511Octets_lo ]]"
  	puts $LOGFILE "\t		|# FRAMES_BETWEEN_SIZE_512AND1K_BYTES   = [format %u [reg_read $10g_mac_tx_statistic_counters_reg_map $etherStatsPkts512to1023Octets_lo]]"
  	puts $LOGFILE "\t		|# FRAMES_BETWEEN_SIZE_1KND1518_BYTES   = [format %u [reg_read $10g_mac_tx_statistic_counters_reg_map $etherStatPkts1024to1518Octets_lo]]"
     } 

   proc CHKMAC_CONFIG {} {
    global	10GMAC_BASE_ADDR
    global  10G_RX_FIFO_BASE_ADDR
    global  XGMII_LB_BASE_ADDR
    global  PHY_IP_BASE_ADDR
    global	rx_frame_addr0     		
    global	rx_frame_addr1     		
    global	rx_frame_maxlength  		
    
    global	rx_frame_spaddr0_0  		
    global	rx_frame_spaddr0_1  		
    global	rx_frame_spaddr1_0  		
    global	rx_frame_spaddr1_1  		
    global	rx_frame_spaddr2_0  		
    global	rx_frame_spaddr2_1  		
    global	rx_frame_spaddr3_0  		
    global	rx_frame_spaddr3_1  		

    global	rx_padcrc_control     		
    global 	RXFIFO_DROP_ON_ERROR                 
    global 	XGMII_LLPBK                           
    global 	phy_serial_loopback                           

    global 	tx_addrins_control    	
    global 	tx_addrins_macaddr0    
    global 	tx_addrins_macaddr1    
    global 	10g_mac_tx_statistic_counters_reg_map    
    global 	10g_mac_rx_statistic_counters_reg_map    
    global 	LOGFILE    
    
    ## _____________________________________________________________________
    ## 	Statistics Registers
    ## _____________________________________________________________________
    	global framesOK_lo             	  
    	global framesErr_lo            	  
    	global framesCRCErr_lo         	  
    	global octetsOK_lo             	  
    	global pauseMACCtrlFrames_lo   	  
    	global ifErrors_lo             	  
    	global unicastFramesOK_lo      	  
    	global unicastFramesErr_lo     	  
    	global multicastFramesOK_lo    	  
    	global multicastFramesErr_lo   	  
    	global broadcastFramesOK_lo    	  
    	global broadcastFramesErr_lo   	  
    	global etherStatsOctets_lo     	  
    	global etherStatsPkts_lo       	  
    	global etherStatsUndersizePkts_lo      
    	global etherStatsOversizePkts_lo       
    	global etherStatsPkts64Octets_lo       
    	global etherStatsPkts65to127Octets_lo  
    	global etherStatsPkts128to255Octets_lo 
    	global etherStatsPkts256to511Octets_lo 
    	global etherStatsPkts512to1023Octets_lo  
    	global etherStatPkts1024to1518Octets_lo  
    	global etherStatsPkts1519toXOctets_lo    
    	global etherStatsFragments_lo            
    	global etherStatsJabbers_lo              
    	global etherStatsCRCErr_lo               
    	global unicastMACCtrlFrames_lo           
    	global multicastMACCtrlFrames_lo         
    	global broadcastMACCtrlFrames_lo         

       	puts "\t 		  =========================================================================="
    	puts "\t 			| MAC CONFIGURATION DUMP 					      "
       	puts "\t 		  ==========================================================================="
    	puts "\t 			| RX PAD/CRC SRIPPING		= [reg_read $10GMAC_BASE_ADDR $rx_padcrc_control]"
    	puts "\t 			| RX FIFO DROP ON ERROR 	= [reg_read $10G_RX_FIFO_BASE_ADDR $RXFIFO_DROP_ON_ERROR]"
    	puts "\t 			| LOCAL LOOPBACK @ XGMII	= [reg_read $XGMII_LB_BASE_ADDR $XGMII_LLPBK]"
    	puts "\t 			| LOCAL LOOPBACK @ PMA		= [reg_read $PHY_IP_BASE_ADDR $phy_serial_loopback]"
		
		#puts "pass more register check - Feng\n"
		#return
		
    	puts "\t 			| MAC TX SADDR INSERTION CTRL 	= [reg_read $10GMAC_BASE_ADDR $tx_addrins_control]"
    	puts "\t 			| PRIMARY MAC ADDRESS-1		= [reg_read $10GMAC_BASE_ADDR $rx_frame_addr1] "
    	puts "\t 			| PRIMARY MAC ADDRESS-0		= [reg_read $10GMAC_BASE_ADDR $rx_frame_addr0] "
    	puts "\t 			| MAX FRAME LENGTH 		= [reg_read $10GMAC_BASE_ADDR $rx_frame_maxlength] "
    	puts "\t 			| SUPPLIMENTARY ADDRESS-0 	= [reg_read $10GMAC_BASE_ADDR $rx_frame_spaddr0_1]"
    	puts "\t 			| 		            	  [reg_read $10GMAC_BASE_ADDR $rx_frame_spaddr0_0]"
    	puts "\t 			| SUPPLIMENTARY ADDRESS-1	= [reg_read $10GMAC_BASE_ADDR $rx_frame_spaddr1_1]"
    	puts "\t 			| 			    	  [reg_read $10GMAC_BASE_ADDR $rx_frame_spaddr1_0]"
    	puts "\t 			| SUPPLIMENTARY ADDRESS-2	= [reg_read $10GMAC_BASE_ADDR $rx_frame_spaddr2_1]"
    	puts "\t 			| 			    	  [reg_read $10GMAC_BASE_ADDR $rx_frame_spaddr2_0]"
    	puts "\t 			| SUPPLIMENTARY ADDRESS-3	= [reg_read $10GMAC_BASE_ADDR $rx_frame_spaddr3_1]"
    	puts "\t 			| 			    	  [reg_read $10GMAC_BASE_ADDR $rx_frame_spaddr3_0]"
    	puts "\t 			| TX MAC SOURCE ADDRESS  	= [reg_read $10GMAC_BASE_ADDR $tx_addrins_macaddr1]"
    	puts "\t					  	    	  [reg_read $10GMAC_BASE_ADDR $tx_addrins_macaddr0]"

       	puts $LOGFILE "\t 	  =========================================================================="
    	puts $LOGFILE "\t 		| MAC CONFIGURATION DUMP 					      "
       	puts $LOGFILE "\t 	  ==========================================================================="
    	puts $LOGFILE "\t 		| RX PAD/CRC SRIPPING		= [reg_read $10GMAC_BASE_ADDR $rx_padcrc_control]"
    	puts $LOGFILE "\t 		| RX FIFO DROP ON ERROR 	= [reg_read $10G_RX_FIFO_BASE_ADDR $RXFIFO_DROP_ON_ERROR]"
    	puts $LOGFILE "\t 		| LOCAL LOOPBACK @ XGMII	= [reg_read $XGMII_LB_BASE_ADDR $XGMII_LLPBK]"
    	puts $LOGFILE "\t 		| LOCAL LOOPBACK @ PMA		= [reg_read $PHY_IP_BASE_ADDR $phy_serial_loopback]"
    	puts $LOGFILE "\t 		| MAC TX SADDR INSERTION CTRL 	= [reg_read $10GMAC_BASE_ADDR $tx_addrins_control]"
    	puts $LOGFILE "\t 		| PRIMARY MAC ADDRESS-1		= [reg_read $10GMAC_BASE_ADDR $rx_frame_addr1] "
    	puts $LOGFILE "\t 		| PRIMARY MAC ADDRESS-0		= [reg_read $10GMAC_BASE_ADDR $rx_frame_addr0] "
    	puts $LOGFILE "\t 		| MAX FRAME LENGTH 		= [reg_read $10GMAC_BASE_ADDR $rx_frame_maxlength] "
    	puts $LOGFILE "\t 		| SUPPLIMENTARY ADDRESS-0 	= [reg_read $10GMAC_BASE_ADDR $rx_frame_spaddr0_1]"
    	puts $LOGFILE "\t 		| 		            	  [reg_read $10GMAC_BASE_ADDR $rx_frame_spaddr0_0]"
    	puts $LOGFILE "\t 		| SUPPLIMENTARY ADDRESS-1	= [reg_read $10GMAC_BASE_ADDR $rx_frame_spaddr1_1]"
    	puts $LOGFILE "\t 		| 			    	  [reg_read $10GMAC_BASE_ADDR $rx_frame_spaddr1_0]"
    	puts $LOGFILE "\t 		| SUPPLIMENTARY ADDRESS-2	= [reg_read $10GMAC_BASE_ADDR $rx_frame_spaddr2_1]"
    	puts $LOGFILE "\t 		| 			    	  [reg_read $10GMAC_BASE_ADDR $rx_frame_spaddr2_0]"
    	puts $LOGFILE "\t 		| SUPPLIMENTARY ADDRESS-3	= [reg_read $10GMAC_BASE_ADDR $rx_frame_spaddr3_1]"
    	puts $LOGFILE "\t 		| 			    	  [reg_read $10GMAC_BASE_ADDR $rx_frame_spaddr3_0]"
    	puts $LOGFILE "\t 		| TX MAC SOURCE ADDRESS  	= [reg_read $10GMAC_BASE_ADDR $tx_addrins_macaddr1]"
   }


   proc PROCESS_MAC {} {
     CHKMAC_CONFIG
     CHKMAC_TXSTATS
     CHKMAC_RXSTATS

   }
