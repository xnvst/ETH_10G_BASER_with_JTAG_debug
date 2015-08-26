#!/usr/bin/tclsh8.4
##==============================================================================
##		Monitor Registers Map
##==============================================================================  
source monitor_reg_map.tcl

## ___________________________________________________________________________

proc SETMON_STOP {} {
      global MON_BASE_ADDR
      global MON_RXCTRL_STATUS
      puts "\t		 	stoping [user requested] Packet Checker "
      reg_write $MON_BASE_ADDR $MON_RXCTRL_STATUS 0x00000002 
    }

proc SETMON_RXCNT_RESET {} {
      global MON_BASE_ADDR
      global MON_RXCTRL_STATUS
      puts "\t		 	reseting monitor Packet Counters		"
      reg_write $MON_BASE_ADDR $MON_RXCTRL_STATUS 0x00000001 
     }

proc SETMON_RXPKTCNT_EXPT {value} {
      global MON_BASE_ADDR
      global MON_RXPKTCNT_EXPT
      puts "\t		 	number of Packets Expected By Monitor = $value "
      reg_write $MON_BASE_ADDR $MON_RXPKTCNT_EXPT $value
    }

proc CHKMON_STATUS {} {
       global MON_BASE_ADDR
      	global MON_RXBYTECNT_LO32 	
      	global MON_RXBYTECNT_HI32 	
      	global MON_RXCYCLCNT_LO32 	
      	global MON_RXCYCLCNT_HI32 	
       global MON_RXCTRL_STATUS
       global MON_RXPKTCNT_GOOD	
       global MON_RXPKTCNT_BAD	
       global LOBYTES
  	global HIBYTES
       global LOWCYCLES
  	global HICYCLES
	global SUMBYTES
	global SUMCYCLES
       global LOGFILE

 	#set LOBYTES   [format %u [reg_read $MON_BASE_ADDR $MON_RXBYTECNT_LO32]]
 	#set HIBYTES   [format %u [reg_read $MON_BASE_ADDR $MON_RXBYTECNT_HI32]]
 	#set LOCYCLES  [format %u [reg_read $MON_BASE_ADDR $MON_RXCYCLCNT_LO32]]
 	#set HICYCLES  [format %u [reg_read $MON_BASE_ADDR $MON_RXCYCLCNT_HI32]]
	#set SUMBYTES  [format %u [expr ((4294967295*$HIBYTES) + $LOBYTES)]]
	#set SUMBYTES  [format %u [expr ((4294967295 * $HIBYTES) + $LOBYTES)]]

 	set LOBYTES   [format %u [reg_read $MON_BASE_ADDR $MON_RXBYTECNT_LO32]]
 	set HIBYTES   [format %u [reg_read $MON_BASE_ADDR $MON_RXBYTECNT_HI32]]
 	set LOCYCLES  [format %u [reg_read $MON_BASE_ADDR $MON_RXCYCLCNT_LO32]]
 	set HICYCLES  [format %u [reg_read $MON_BASE_ADDR $MON_RXCYCLCNT_HI32]]

	set SUMBYTES  [format %u  [expr { 4294967295*$HIBYTES + $LOBYTES}]]
	set SUMCYCLES [format %u  [expr { 4294967295*$HICYCLES + $LOCYCLES}]]
	#set THRUPUT   [format %2.2f [expr {1.25*$SUMBYTES/$SUMCYCLES}]]

  	puts "\t	_________________________________________________________________________________________________________________________\n"
      	puts "\t 			-- (MONITOR) GOOD PKTS RECEIVED 	= [format %u [reg_read $MON_BASE_ADDR $MON_RXPKTCNT_GOOD]]" 
      	puts "\t 			-- (MONITOR) BAD PKTS RECEIVED 		= [format %u [reg_read $MON_BASE_ADDR $MON_RXPKTCNT_BAD]] " 
      	puts "\t 			-- (MONITOR) BYTES RECEIVED 		= $SUMBYTES " 
      	puts "\t 			-- (MONITOR) CYCLES USED 		= $SUMCYCLES " 
      	#puts "\t 			-- (MONITOR) THROUGHPUT CALCULATED	= $THRUPUT Gbps" 
 	puts "\t 			-- (MONITOR) RXBYTECNT_LO32 		= [format %u [reg_read $MON_BASE_ADDR $MON_RXBYTECNT_LO32]]"
 	puts "\t 			-- (MONITOR) RXBYTECNT_HI32 		= [format %u [reg_read $MON_BASE_ADDR $MON_RXBYTECNT_HI32]]"
 	puts "\t 			-- (MONITOR) RXCYCLCNT_LO32 		= [format %u [reg_read $MON_BASE_ADDR $MON_RXCYCLCNT_LO32]]"
 	puts "\t 			-- (MONITOR) RXCYCLCNT_HI32 		= [format %u [reg_read $MON_BASE_ADDR $MON_RXCYCLCNT_HI32]]"
  	puts "\t	_________________________________________________________________________________________________________________________\n"

  	puts $LOGFILE "\t_________________________________________________________________________________________________________________________\n"
      	puts $LOGFILE "\t		-- (MONITOR) GOOD PKTS RECEIVED 	= [format %u [reg_read $MON_BASE_ADDR $MON_RXPKTCNT_GOOD]]" 
      	puts $LOGFILE "\t 		-- (MONITOR) BAD PKTS RECEIVED 		= [format %u [reg_read $MON_BASE_ADDR $MON_RXPKTCNT_BAD]] " 
      	#puts $LOGFILE "\t 		-- (MONITOR) THROUGHPUT CALCULATED	= $THRUPUT Gbps" 
 	puts $LOGFILE "\t 		-- (MONITOR) RXBYTECNT_LO32 		= [format %u [reg_read $MON_BASE_ADDR $MON_RXBYTECNT_LO32]]"
 	puts $LOGFILE "\t 		-- (MONITOR) RXBYTECNT_HI32 		= [format %u [reg_read $MON_BASE_ADDR $MON_RXBYTECNT_HI32]]"
 	puts $LOGFILE "\t 		-- (MONITOR) RXCYCLCNT_LO32 		= [format %u [reg_read $MON_BASE_ADDR $MON_RXCYCLCNT_LO32]]"
 	puts $LOGFILE "\t 		-- (MONITOR) RXCYCLCNT_HI32 		= [format %u [reg_read $MON_BASE_ADDR $MON_RXCYCLCNT_HI32]]"
  	puts $LOGFILE "\t_________________________________________________________________________________________________________________________\n"
	}

proc PROCESS_MON {} {
     CHKMON_STATUS
     }


proc CHKMON_DONE {} {
       global MON_BASE_ADDR
      	global MON_RXBYTECNT_LO32 	
      	global MON_RXBYTECNT_HI32 	
      	global MON_RXCYCLCNT_LO32 	
      	global MON_RXCYCLCNT_HI32 	
       global MON_RXCTRL_STATUS
       global MON_RXPKTCNT_GOOD	
       global MON_RXPKTCNT_BAD	
       global LOBYTES
  	global HIBYTES
       global LOWCYCLES
  	global HICYCLES
	global SUMBYTES
	global SUMCYCLES
	set rx_status 0
	set test_done 0
	set total_pkts_rcv 0

  	puts "\t 			-- MONITOR processing frames received .....\n\n"
       while {$test_done == 0} {
	      after 8000
	      set rx_status [reg_read $MON_BASE_ADDR $MON_RXCTRL_STATUS]
	      set test_done [expr $rx_status & 0x4]    
	      set previous_total_pkts_rcv $total_pkts_rcv
	      
 	      set good_pkts [format %u [reg_read $MON_BASE_ADDR $MON_RXPKTCNT_GOOD]]
 	      set bad_pkts [format %u [reg_read $MON_BASE_ADDR $MON_RXPKTCNT_BAD]]
 	      set total_pkts_rcv [expr $good_pkts + $bad_pkts]] 
 	      puts "\t 			-- MONITOR Received  Packet# /t $total_pkts_rcv \n"
 	      
 	      if {$previous_total_pkts_rcv == $total_pkts_rcv} {
		      set test_done -1
		      puts "\t 				-- Break : No furtuer packet is being generated or received "
	      }
       }
  	puts "\t			-- DONE! - monitor received all expected sum of packets ..... \n"
    	CHKMON_STATUS
	}
## __________________________________________________________________________________________
## 
