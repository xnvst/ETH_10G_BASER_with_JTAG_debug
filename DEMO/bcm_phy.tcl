#!/usr/bin/tclsh8.4
##==============================================================================
##		BroadCome BCM 8727 PHY Registers Map
##==============================================================================  
source bcm_phy_reg_map.tcl

## =======================================================================================
## =======================================================================================
	proc BCMWRITE {phy_reg wdata} {
	     global    MDIO_BASE_ADDR    
	     reg_write $MDIO_BASE_ADDR 0x00000084 $phy_reg
	     reg_write $MDIO_BASE_ADDR 0x00000080 $wdata
	     puts "\t  value written at external phy reg $phy_reg=[reg_read $MDIO_BASE_ADDR 0x00000080]"
	    }
	
	proc BCMREAD {phy_reg} {
	     global    MDIO_BASE_ADDR    
	     reg_write $MDIO_BASE_ADDR 0x00000084 $phy_reg
	     reg_read  $MDIO_BASE_ADDR 0x00000080 
	    }
## =======================================================================================
## =======================================================================================
	proc SETBCM_XAUI_LANE_SWAP { } {
	     global XGXS_RXLANE_SWAP  
	     global XGXS_TXLANE_SWAP  
	     BCMWRITE  $XGXS_RXLANE_SWAP 0xC8E4
	     BCMWRITE  $XGXS_TXLANE_SWAP 0x80E4
	     }
	
	proc CHKBCM_XAUI_LANE_STATUS { } {
	     global XGXS_STATUS  
	     puts "\t			XAUI LANE STATUS REGISTER = [BCMREAD  $XGXS_STATUS ]"
	     }
	
## =======================================================================================
## =======================================================================================
	proc SETBCM_XGXS_SYSTEM_LPBK { } {
	     global XGXS_MODE_CONTROL  
	     SETBCM_XAUI_LANE_SWAP 
	     # per system loopback operation description
	     # provided on page 34 of the BCM device doc
	     BCMWRITE  $XGXS_MODE_CONTROL 0x206E
	     }
	
	proc RESETBCM_XGXS_SYSTEM_LPBK { } {
	     global XGXS_MODE_CONTROL  
	     # the POR value written back
	     BCMWRITE  $XGXS_MODE_CONTROL 0x212e
	     }
## =======================================================================================
## =======================================================================================

	proc SETBCM_PMA_SYSTEM_LPBK { } {
	     global SFI_PMAPMD_CONTROL  
  	     # disable previosu stage loopbacks to be sure
	     SETBCM_XAUI_LANE_SWAP 
	     RESETBCM_PCS_SYSTEM_LPBK 
	     BCMWRITE  $SFI_PMAPMD_CONTROL 0x2041
	     BCMWRITE  0xCA7B0101 0x4000
	     }
	
	proc RESETBCM_PMA_SYSTEM_LPBK { } {
	     global SFI_PMAPMD_CONTROL  
	     # write the POR value
	     BCMWRITE  $SFI_PMAPMD_CONTROL 0x2040
	     #set default for 1.CA7B
	     BCMWRITE  0xCA7B0101 0x2000
	     }
	
## =======================================================================================
## =======================================================================================
	proc SETBCM_PCS_SYSTEM_LPBK { } {
	     global SFI_PCS_CONTROL  
	     SETBCM_XAUI_LANE_SWAP 
  	     # disable previosu stage loopbacks to be sure
	     RESETBCM_XGXS_SYSTEM_LPBK 
	     BCMWRITE  $SFI_PCS_CONTROL 0x6040
	     BCMWRITE  0xCA7B0101 0x4000
	     }
	
	proc RESETBCM_PCS_SYSTEM_LPBK { } {
	     global SFI_PCS_CONTROL  
	     # write the POR value
	     BCMWRITE  $SFI_PCS_CONTROL 0x2040
	     #set default for 1.CA7B
	     BCMWRITE  0xCA7B0101 0x2000
	     }
	
	proc SETBCM_FUNCTIONAL_MODE { } {
	     global SFI_PCS_CONTROL  
	     SETBCM_XAUI_LANE_SWAP 
	     RESETBCM_PMA_SYSTEM_LPBK 
	     RESETBCM_PCS_SYSTEM_LPBK 
	     RESETBCM_XGXS_SYSTEM_LPBK 
	     }
## ================================================================================================
## ================================================================================================
 proc CHKBCM_CONFIG {} {
        global LOGFILE
	 global CHIP_ID	
	 global XGXS_CONTROL  
	 global XGXS_STATUS  
	 global XGXS_RXLANE_SWAP  
	 global XGXS_TXLANE_SWAP  
	 global XGXS_MODE_CONTROL  
	 global SFI_PMAPMD_CONTROL 
	 global SFI_PCS_CONTROL 

      	 puts "\t 		        ========================================================"
	 puts "\t			|  BCM CONFIG/STATUS REGISTER CHECK				     "
      	 puts "\t 		        ========================================================"
 	 puts "\t			|# CHIP_ID 		= [BCMREAD $CHIP_ID]"
	 puts "\t			|# XGXS_CONTROL  	= [BCMREAD $XGXS_CONTROL] "  
	 puts "\t			|# XGXS_STATUS          = [BCMREAD $XGXS_STATUS  ] "
	 puts "\t			|# XGXS_RXLANE_SWAP    	= [BCMREAD $XGXS_RXLANE_SWAP] "
	 puts "\t			|# XGXS_TXLANE_SWAP    	= [BCMREAD $XGXS_TXLANE_SWAP] "
	 puts "\t			|# XGXS_MODE_CONTROL    = [BCMREAD $XGXS_MODE_CONTROL] "
	 puts "\t			|# SFI_PMAPMD_CONTROL   = [BCMREAD $SFI_PMAPMD_CONTROL] "
	 puts "\t			|# SFI_PCS_CONTROL      = [BCMREAD $SFI_PCS_CONTROL] "

      	 puts $LOGFILE "\t 		========================================================"
	 puts $LOGFILE "\t		|  BCM CONFIG/STATUS REGISTER CHECK	    "
      	 puts $LOGFILE "\t 	        ========================================================"
 	 puts $LOGFILE "\t		|# CHIP_ID 		= [BCMREAD $CHIP_ID]"
	 puts $LOGFILE "\t		|# XGXS_CONTROL  	= [BCMREAD $XGXS_CONTROL] "  
	 puts $LOGFILE "\t		|# XGXS_STATUS          = [BCMREAD $XGXS_STATUS  ] "
	 puts $LOGFILE "\t		|# XGXS_RXLANE_SWAP    	= [BCMREAD $XGXS_RXLANE_SWAP] "
	 puts $LOGFILE "\t		|# XGXS_TXLANE_SWAP    	= [BCMREAD $XGXS_TXLANE_SWAP] "
	 puts $LOGFILE "\t		|# XGXS_MODE_CONTROL    = [BCMREAD $XGXS_MODE_CONTROL] "
	 puts $LOGFILE "\t		|# SFI_PMAPMD_CONTROL   = [BCMREAD $SFI_PMAPMD_CONTROL] "
	 puts $LOGFILE "\t		|# SFI_PCS_CONTROL      = [BCMREAD $SFI_PCS_CONTROL] "
	 }


 proc 	PROCESS_BCM {} {
      	CHKBCM_CONFIG
	}
