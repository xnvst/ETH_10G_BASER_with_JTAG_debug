onerror {resume}
quietly virtual signal -install /tb/CHIP_DUT/ETH10G_TOP { /tb/CHIP_DUT/ETH10G_TOP/avalon_st_rxstatus_data[15:0]} payload_length
quietly virtual signal -install /tb/CHIP_DUT/ETH10G_TOP { /tb/CHIP_DUT/ETH10G_TOP/avalon_st_rxstatus_data[31:16]} packet_length
quietly virtual signal -install /tb/CHIP_DUT/ETH10G_TOP { /tb/CHIP_DUT/ETH10G_TOP/avalon_st_rxstatus_data[38:32]} frame_type
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /tb/CHIP_DUT/ETH10G_TOP/eth_10g_design_example_0/mm_pipeline_bridge_waitrequest
add wave -noupdate -radix hexadecimal /tb/PBTN
add wave -noupdate -group TRAFFIC_CONTROLLER /tb/CHIP_DUT/TRAFFIC_CTRL/clk
add wave -noupdate -group TRAFFIC_CONTROLLER -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/avl_mm_readdata_gen
add wave -noupdate -group TRAFFIC_CONTROLLER -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/avl_mm_readdata_mon
add wave -noupdate -group TRAFFIC_CONTROLLER -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/blk_sel_gen
add wave -noupdate -group TRAFFIC_CONTROLLER -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/blk_sel_mon
add wave -noupdate -group TRAFFIC_CONTROLLER -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/avl_mm_address
add wave -noupdate -group TRAFFIC_CONTROLLER -group PRTMUX -radix binary /tb/rx_status
add wave -noupdate -group TRAFFIC_CONTROLLER -group PRTMUX -radix unsigned /tb/num_pkts_good
add wave -noupdate -group TRAFFIC_CONTROLLER -group PRTMUX -radix unsigned /tb/num_pkts_bad
add wave -noupdate -group GEN -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/state_idle
add wave -noupdate -group GEN -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/state_dest_src
add wave -noupdate -group GEN -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/state_src_len_seq
add wave -noupdate -group GEN -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/state_data
add wave -noupdate -group GEN -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/state_transition
add wave -noupdate -group GEN -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/reset
add wave -noupdate -group GEN -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/readdata
add wave -noupdate -group GEN -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/write
add wave -noupdate -group GEN -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/address
add wave -noupdate -group GEN -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/writedata
add wave -noupdate -group GEN -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/readdata
add wave -noupdate -group GEN -radix unsigned /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/number_packet
add wave -noupdate -group GEN -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/clk
add wave -noupdate -group GEN -radix unsigned /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/pkt_length
add wave -noupdate -group GEN -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/ps
add wave -noupdate -group GEN -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/ns
add wave -noupdate -group GEN -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/S_IDLE
add wave -noupdate -group GEN -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/S_DEST_SRC
add wave -noupdate -group GEN -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/S_SRC_LEN_SEQ
add wave -noupdate -group GEN -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/S_TRANSITION
add wave -noupdate -group GEN -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/S_DATA
add wave -noupdate -group GEN -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/tx_ready
add wave -noupdate -group GEN -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/tx_valid
add wave -noupdate -group GEN -color {Sea Green} -itemcolor Firebrick -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/tx_sop
add wave -noupdate -group GEN -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/tx_eop
add wave -noupdate -group GEN -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/tx_data
add wave -noupdate -group GEN -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/tx_empty
add wave -noupdate -group GEN -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/tx_error
add wave -noupdate -group GEN -radix unsigned /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/config_setting
add wave -noupdate -group GEN -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/source_addr0
add wave -noupdate -group GEN -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/source_addr1
add wave -noupdate -group GEN -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/destination_addr0
add wave -noupdate -group GEN -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/destination_addr1
add wave -noupdate -group GEN -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/packet_tx_count
add wave -noupdate -group GEN -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/rand_seed0
add wave -noupdate -group GEN -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/rand_seed1
add wave -noupdate -group GEN -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/rand_seed2
add wave -noupdate -group GEN -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/start_d
add wave -noupdate -group GEN -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/stop
add wave -noupdate -group GEN -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/random_seed
add wave -noupdate -group GEN -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/tx_prbs
add wave -noupdate -group GEN -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/byte_count
add wave -noupdate -group GEN -radix unsigned /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/data_pattern
add wave -noupdate -group GEN -radix unsigned /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/length
add wave -noupdate -group GEN -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/seq_num
add wave -noupdate -group GEN -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/empty_extended
add wave -noupdate -group GEN -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/tx_data_reg
add wave -noupdate -group GEN -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/tx_valid_reg
add wave -noupdate -group GEN -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/tx_sop_reg
add wave -noupdate -group GEN -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/tx_eop_reg
add wave -noupdate -group GEN -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/tx_empty_reg
add wave -noupdate -group GEN -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/crc_valid
add wave -noupdate -group GEN -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/crc_l1
add wave -noupdate -group GEN -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/crc_l2
add wave -noupdate -group GEN -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/crc_l3
add wave -noupdate -group GEN -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/crc_l4
add wave -noupdate -group GEN -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/crc_valid_count
add wave -noupdate -group GEN -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/checksum
add wave -noupdate -group GEN -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/tx_data_out
add wave -noupdate -group GEN -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/tx_ctrl_out
add wave -noupdate -group GEN -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/add_extra_qword
add wave -noupdate -group GEN -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/valid_extended
add wave -noupdate -group GEN -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/eop_extended
add wave -noupdate -group GEN -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/GEN/empty_extended
add wave -noupdate -group LED_CONTROL -radix hexadecimal /tb/CHIP_DUT/LED_CONTROL/reset_n
add wave -noupdate -group LED_CONTROL -radix hexadecimal /tb/CHIP_DUT/LED_CONTROL/clk
add wave -noupdate -group LED_CONTROL -radix hexadecimal /tb/CHIP_DUT/LED_CONTROL/sel_display
add wave -noupdate -group LED_CONTROL -radix hexadecimal /tb/CHIP_DUT/LED_CONTROL/in
add wave -noupdate -group LED_CONTROL -radix binary /tb/CHIP_DUT/LED_CONTROL/LEDHSMC_GRN
add wave -noupdate -group LED_CONTROL -radix binary /tb/CHIP_DUT/LED_CONTROL/LEDHSMC_RED
add wave -noupdate -group LED_CONTROL -radix binary /tb/CHIP_DUT/LED_CONTROL/LEDHOST_0815
add wave -noupdate -group LED_CONTROL -radix binary /tb/CHIP_DUT/LED_CONTROL/LEDHOST_0007
add wave -noupdate -group LED_CONTROL -radix binary /tb/CHIP_DUT/LED_CONTROL/LEDHOST_0815i
add wave -noupdate -group LED_CONTROL -radix binary /tb/CHIP_DUT/LED_CONTROL/LEDHSMC_GRNi
add wave -noupdate -group LED_CONTROL -radix binary /tb/CHIP_DUT/LED_CONTROL/LEDHSMC_REDi
add wave -noupdate -group LED_CONTROL -radix binary /tb/CHIP_DUT/LED_CONTROL/LEDHOST_0007i
add wave -noupdate -group LED_CONTROL -radix hexadecimal /tb/CHIP_DUT/LED_CONTROL/tx_pma_ready_data
add wave -noupdate -group LED_CONTROL -radix hexadecimal /tb/CHIP_DUT/LED_CONTROL/rx_pma_ready_data
add wave -noupdate -group LED_CONTROL -radix hexadecimal /tb/CHIP_DUT/LED_CONTROL/tx_pma_ready
add wave -noupdate -group LED_CONTROL -radix hexadecimal /tb/CHIP_DUT/LED_CONTROL/rx_pma_ready
add wave -noupdate -group LED_CONTROL -radix hexadecimal /tb/CHIP_DUT/LED_CONTROL/mon_error
add wave -noupdate -group LED_CONTROL -radix hexadecimal /tb/CHIP_DUT/LED_CONTROL/mon_done
add wave -noupdate -group LED_CONTROL -radix hexadecimal /tb/CHIP_DUT/LED_CONTROL/mon_active
add wave -noupdate -group LED_CONTROL -radix hexadecimal /tb/CHIP_DUT/LED_CONTROL/clkcnt
add wave -noupdate -group LED_CONTROL -radix hexadecimal /tb/CHIP_DUT/LED_CONTROL/clken
add wave -noupdate -group LED_CONTROL -radix hexadecimal /tb/CHIP_DUT/LED_CONTROL/state
add wave -noupdate -group LED_CONTROL -radix hexadecimal /tb/CHIP_DUT/LED_CONTROL/next_state
add wave -noupdate -group LED_CONTROL -radix hexadecimal /tb/CHIP_DUT/LED_CONTROL/progress
add wave -noupdate -group LED_CONTROL -radix hexadecimal /tb/CHIP_DUT/LED_CONTROL/attention
add wave -noupdate -group LED_CONTROL -radix hexadecimal /tb/CHIP_DUT/LED_CONTROL/pass
add wave -noupdate -group LED_CONTROL -radix hexadecimal /tb/CHIP_DUT/LED_CONTROL/fail
add wave -noupdate -group LED_CONTROL -radix hexadecimal /tb/CHIP_DUT/LED_CONTROL/progress_reverse
add wave -noupdate -group MON -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/MON/clk
add wave -noupdate -group MON -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/MON/reset
add wave -noupdate -group MON -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/MON/avalon_mm_address
add wave -noupdate -group MON -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/MON/avalon_mm_write
add wave -noupdate -group MON -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/MON/avalon_mm_read
add wave -noupdate -group MON -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/MON/avalon_mm_waitrequest
add wave -noupdate -group MON -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/MON/avalon_mm_writedata
add wave -noupdate -group MON -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/MON/avalon_mm_readdata
add wave -noupdate -group MON -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/MON/mac_rx_status_valid
add wave -noupdate -group MON -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/MON/mac_rx_status_error
add wave -noupdate -group MON -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/MON/mac_rx_status_data
add wave -noupdate -group MON -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/MON/avalon_st_rx_data
add wave -noupdate -group MON -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/MON/avalon_st_rx_valid
add wave -noupdate -group MON -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/MON/avalon_st_rx_sop
add wave -noupdate -group MON -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/MON/avalon_st_rx_eop
add wave -noupdate -group MON -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/MON/avalon_st_rx_empty
add wave -noupdate -group MON -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/MON/avalon_st_rx_error
add wave -noupdate -group MON -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/MON/avalon_st_rx_ready
add wave -noupdate -group MON -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/MON/stop_mon
add wave -noupdate -group MON -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/MON/mon_active
add wave -noupdate -group MON -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/MON/mon_done
add wave -noupdate -group MON -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/MON/mon_error
add wave -noupdate -group MON -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/MON/gen_lpbk
add wave -noupdate -group MON -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/MON/crcbad
add wave -noupdate -group MON -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/MON/crcvalid
add wave -noupdate -group MON -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/MON/rddly
add wave -noupdate -group MON -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/MON/wrdly
add wave -noupdate -group MON -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/MON/wredge
add wave -noupdate -group MON -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/MON/rdedge
add wave -noupdate -group MON -radix unsigned /tb/CHIP_DUT/TRAFFIC_CTRL/MON/number_packet
add wave -noupdate -group MON -radix unsigned /tb/CHIP_DUT/TRAFFIC_CTRL/MON/good_pkts
add wave -noupdate -group MON -radix unsigned /tb/CHIP_DUT/TRAFFIC_CTRL/MON/bad_pkts
add wave -noupdate -group MON -radix unsigned /tb/CHIP_DUT/TRAFFIC_CTRL/MON/byte_count
add wave -noupdate -group MON -radix unsigned /tb/CHIP_DUT/TRAFFIC_CTRL/MON/cycle_rx_count
add wave -noupdate -group MON -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/MON/mon_csr
add wave -noupdate -group MON -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/MON/inspection_start_frame
add wave -noupdate -group MON -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/MON/inspection_start_cycle
add wave -noupdate -group MON -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/MON/inspection_number_cycles
add wave -noupdate -group MON -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/MON/rx_frame_words_01
add wave -noupdate -group MON -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/MON/rx_frame_words_23
add wave -noupdate -group MON -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/MON/rx_frame_words_45
add wave -noupdate -group MON -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/MON/rx_frame_words_67
add wave -noupdate -group MON -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/MON/rx_frame_words_89
add wave -noupdate -group MON -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/MON/rx_frame_words_ab
add wave -noupdate -group MON -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/MON/rx_frame_words_cd
add wave -noupdate -group MON -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/MON/rx_frame_words_ef
add wave -noupdate -group MON -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/MON/init_dly
add wave -noupdate -group MON -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/MON/init_reg
add wave -noupdate -group MON -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/MON/stop_sync
add wave -noupdate -group MON -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/MON/monstate
add wave -noupdate -group MON -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/MON/next_monstate
add wave -noupdate -group MON -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/MON/state
add wave -noupdate -group MON -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/MON/next_state
add wave -noupdate -group MON -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/MON/inspection_frame_match
add wave -noupdate -group MON -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/MON/inspection_cycle_match
add wave -noupdate -group MON -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/MON/inspection_begin
add wave -noupdate -group MON -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/MON/inspection_cycle_count
add wave -noupdate -group MON -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/MON/avalon_st_rxd_dly
add wave -noupdate -group TB /tb/rx_status
add wave -noupdate -group TB /tb/num_pkts_good
add wave -noupdate -group TB /tb/num_pkts_bad
add wave -noupdate -group TB -radix unsigned {/tb/rx_status[2]}
add wave -noupdate -group TB -radix unsigned /tb/rx_status
add wave -noupdate -group TB -radix unsigned /tb/num_pkts_good
add wave -noupdate -group TB -radix unsigned /tb/num_pkts_bad
add wave -noupdate -group TB /tb/REFCLK
add wave -noupdate -group TB /tb/CLK_100M
add wave -noupdate -group CHIP_DUT -radix hexadecimal /tb/CHIP_DUT/ETH10G_TOP/eth_10g_design_example_0/altera_avalon_mm_bridge/clk
add wave -noupdate -group CHIP_DUT -radix hexadecimal /tb/CHIP_DUT/ETH10G_TOP/eth_10g_design_example_0/altera_avalon_mm_bridge/reset
add wave -noupdate -group CHIP_DUT -radix hexadecimal /tb/CHIP_DUT/REFCLK
add wave -noupdate -group CHIP_DUT -radix hexadecimal /tb/CHIP_DUT/CLK_100MHZ
add wave -noupdate -group CHIP_DUT -radix hexadecimal /tb/CHIP_DUT/RXP_10G_BASE_R
add wave -noupdate -group CHIP_DUT -radix hexadecimal /tb/CHIP_DUT/TXP_10G_BASE_R
add wave -noupdate -group CHIP_DUT -radix hexadecimal /tb/CHIP_DUT/avalon_st_rx_data
add wave -noupdate -group CHIP_DUT -radix hexadecimal /tb/CHIP_DUT/avalon_st_rx_empty
add wave -noupdate -group CHIP_DUT -radix hexadecimal /tb/CHIP_DUT/avalon_st_rx_eop
add wave -noupdate -group CHIP_DUT -radix hexadecimal /tb/CHIP_DUT/avalon_st_rx_error
add wave -noupdate -group CHIP_DUT -radix hexadecimal /tb/CHIP_DUT/avalon_st_rx_ready
add wave -noupdate -group CHIP_DUT -radix hexadecimal /tb/CHIP_DUT/avalon_st_rx_sop
add wave -noupdate -group CHIP_DUT -radix hexadecimal /tb/CHIP_DUT/avalon_st_rx_valid
add wave -noupdate -group CHIP_DUT -radix hexadecimal /tb/CHIP_DUT/avalon_st_tx_data
add wave -noupdate -group CHIP_DUT -radix hexadecimal /tb/CHIP_DUT/avalon_st_tx_empty
add wave -noupdate -group CHIP_DUT -radix hexadecimal /tb/CHIP_DUT/avalon_st_tx_eop
add wave -noupdate -group CHIP_DUT -radix hexadecimal /tb/CHIP_DUT/avalon_st_tx_error
add wave -noupdate -group CHIP_DUT -radix hexadecimal /tb/CHIP_DUT/avalon_st_tx_ready
add wave -noupdate -group CHIP_DUT -radix hexadecimal /tb/CHIP_DUT/avalon_st_tx_sop
add wave -noupdate -group CHIP_DUT -radix hexadecimal /tb/CHIP_DUT/avalon_st_tx_valid
add wave -noupdate -group CHIP_DUT -radix hexadecimal /tb/CHIP_DUT/rx_status_valid
add wave -noupdate -group CHIP_DUT -radix hexadecimal /tb/CHIP_DUT/rx_status_error
add wave -noupdate -group CHIP_DUT -radix hexadecimal /tb/CHIP_DUT/rx_status_data
add wave -noupdate -group CHIP_DUT -radix hexadecimal -expand -subitemconfig {{/tb/CHIP_DUT/slave_if_write[1]} {-height 16 -radix hexadecimal} {/tb/CHIP_DUT/slave_if_write[0]} {-height 16 -radix hexadecimal}} /tb/CHIP_DUT/slave_if_write
add wave -noupdate -group CHIP_DUT -radix hexadecimal -expand -subitemconfig {{/tb/CHIP_DUT/slave_if_read[1]} {-height 16 -radix hexadecimal} {/tb/CHIP_DUT/slave_if_read[0]} {-height 16 -radix hexadecimal}} /tb/CHIP_DUT/slave_if_read
add wave -noupdate -group CHIP_DUT -radix hexadecimal /tb/CHIP_DUT/slave_if_address
add wave -noupdate -group CHIP_DUT -radix hexadecimal /tb/CHIP_DUT/slave_if_writedata
add wave -noupdate -group CHIP_DUT -radix hexadecimal /tb/CHIP_DUT/slave_if_readdata
add wave -noupdate -group CHIP_DUT -radix hexadecimal /tb/CHIP_DUT/slave_if_waitrequest
add wave -noupdate -group CHIP_DUT -radix hexadecimal /tb/CHIP_DUT/PBTN
add wave -noupdate -group CHIP_DUT -radix hexadecimal /tb/CHIP_DUT/DPSW
add wave -noupdate -group CHIP_DUT -radix hexadecimal /tb/CHIP_DUT/LEDHOST_0007
add wave -noupdate -group CHIP_DUT -radix hexadecimal /tb/CHIP_DUT/LEDHOST_0815
add wave -noupdate -group {RX SC FIFO} -radix hexadecimal /tb/CHIP_DUT/ETH10G_TOP/eth_10g_design_example_0/rx_sc_fifo/clk
add wave -noupdate -group {RX SC FIFO} -radix hexadecimal /tb/CHIP_DUT/ETH10G_TOP/eth_10g_design_example_0/rx_sc_fifo/reset
add wave -noupdate -group ETH10G -expand -group TOP_SIGNALS -radix hexadecimal /tb/CHIP_DUT/ETH10G_TOP/eth_10g_design_example_0/rx_sc_fifo_out_data
add wave -noupdate -group ETH10G -expand -group TOP_SIGNALS -radix hexadecimal /tb/CHIP_DUT/ETH10G_TOP/eth_10g_design_example_0/rx_sc_fifo_out_empty
add wave -noupdate -group ETH10G -expand -group TOP_SIGNALS -radix hexadecimal /tb/CHIP_DUT/ETH10G_TOP/eth_10g_design_example_0/rx_sc_fifo_out_endofpacket
add wave -noupdate -group ETH10G -expand -group TOP_SIGNALS -radix hexadecimal /tb/CHIP_DUT/ETH10G_TOP/eth_10g_design_example_0/rx_sc_fifo_out_error
add wave -noupdate -group ETH10G -expand -group TOP_SIGNALS -radix hexadecimal /tb/CHIP_DUT/ETH10G_TOP/eth_10g_design_example_0/rx_sc_fifo_out_startofpacket
add wave -noupdate -group ETH10G -expand -group TOP_SIGNALS -radix hexadecimal /tb/CHIP_DUT/ETH10G_TOP/eth_10g_design_example_0/rx_sc_fifo_out_valid
add wave -noupdate -group ETH10G -expand -group TOP_SIGNALS -radix hexadecimal /tb/CHIP_DUT/ETH10G_TOP/eth_10g_design_example_0/avalon_st_rxstatus_valid
add wave -noupdate -group ETH10G -expand -group TOP_SIGNALS -radix hexadecimal /tb/CHIP_DUT/ETH10G_TOP/eth_10g_design_example_0/tx_reset_reset_n
add wave -noupdate -group ETH10G -expand -group TOP_SIGNALS -radix hexadecimal /tb/CHIP_DUT/ETH10G_TOP/tx_sc_fifo_in_ready
add wave -noupdate -group ETH10G -expand -group TOP_SIGNALS -radix hexadecimal /tb/CHIP_DUT/ETH10G_TOP/tx_sc_fifo_in_valid
add wave -noupdate -group ETH10G -expand -group TOP_SIGNALS -radix hexadecimal /tb/CHIP_DUT/ETH10G_TOP/tx_sc_fifo_in_startofpacket
add wave -noupdate -group ETH10G -expand -group TOP_SIGNALS -radix hexadecimal /tb/CHIP_DUT/ETH10G_TOP/tx_sc_fifo_in_endofpacket
add wave -noupdate -group ETH10G -expand -group TOP_SIGNALS -radix hexadecimal /tb/CHIP_DUT/ETH10G_TOP/tx_sc_fifo_in_data
add wave -noupdate -group ETH10G -expand -group TOP_SIGNALS -radix hexadecimal /tb/CHIP_DUT/ETH10G_TOP/tx_sc_fifo_in_empty
add wave -noupdate -group ETH10G -expand -group TOP_SIGNALS -radix hexadecimal /tb/CHIP_DUT/ETH10G_TOP/tx_sc_fifo_in_error
add wave -noupdate -group ETH10G -expand -group TOP_SIGNALS -radix hexadecimal /tb/CHIP_DUT/ETH10G_TOP/rx_sc_fifo_out_ready
add wave -noupdate -group ETH10G -expand -group TOP_SIGNALS -radix hexadecimal /tb/CHIP_DUT/ETH10G_TOP/rx_sc_fifo_out_valid
add wave -noupdate -group ETH10G -expand -group TOP_SIGNALS -radix hexadecimal /tb/CHIP_DUT/ETH10G_TOP/rx_sc_fifo_out_startofpacket
add wave -noupdate -group ETH10G -expand -group TOP_SIGNALS -radix hexadecimal /tb/CHIP_DUT/ETH10G_TOP/rx_sc_fifo_out_data
add wave -noupdate -group ETH10G -expand -group TOP_SIGNALS -radix hexadecimal /tb/CHIP_DUT/ETH10G_TOP/rx_sc_fifo_out_endofpacket
add wave -noupdate -group ETH10G -expand -group TOP_SIGNALS -radix hexadecimal /tb/CHIP_DUT/ETH10G_TOP/rx_sc_fifo_out_empty
add wave -noupdate -group ETH10G -expand -group TOP_SIGNALS -radix hexadecimal /tb/CHIP_DUT/ETH10G_TOP/rx_sc_fifo_out_error
add wave -noupdate -group ETH10G -expand -group TOP_SIGNALS -radix hexadecimal /tb/CHIP_DUT/ETH10G_TOP/avalon_st_rxstatus_data
add wave -noupdate -group ETH10G -expand -group TOP_SIGNALS -radix hexadecimal /tb/CHIP_DUT/ETH10G_TOP/avalon_st_rxstatus_error
add wave -noupdate -group ETH10G -expand -group TOP_SIGNALS -radix hexadecimal /tb/CHIP_DUT/ETH10G_TOP/avalon_st_rxstatus_valid
add wave -noupdate -group ETH10G -expand -group TOP_SIGNALS -radix hexadecimal {/tb/CHIP_DUT/ETH10G_TOP/avalon_st_rxstatus_error[0]}
add wave -noupdate -group ETH10G -expand -group TOP_SIGNALS -radix hexadecimal /tb/CHIP_DUT/ETH10G_TOP/mdio_mdc
add wave -noupdate -group ETH10G -expand -group TOP_SIGNALS -radix hexadecimal /tb/CHIP_DUT/ETH10G_TOP/mdio_mdio_oen
add wave -noupdate -group ETH10G -expand -group TOP_SIGNALS -radix hexadecimal /tb/CHIP_DUT/ETH10G_TOP/mdio_mdio_out
add wave -noupdate -group ETH10G -expand -group TOP_SIGNALS -radix hexadecimal /tb/CHIP_DUT/ETH10G_TOP/mdio_mdio_in
add wave -noupdate -group ETH10G -expand -group TOP_SIGNALS -radix hexadecimal /tb/CHIP_DUT/ETH10G_TOP/eth_10g_design_example_0/ref_reset_reset_n
add wave -noupdate -group JTAG_MASTER -radix hexadecimal /tb/REFCLK
add wave -noupdate -group JTAG_MASTER -radix hexadecimal /tb/CLK_100M
add wave -noupdate -group JTAG_MASTER -radix hexadecimal /tb/CHIP_DUT/SYS_CONTROL/JTAG_MASTER/USE_PLI
add wave -noupdate -group JTAG_MASTER -radix hexadecimal /tb/CHIP_DUT/SYS_CONTROL/JTAG_MASTER/PLI_PORT
add wave -noupdate -group JTAG_MASTER -radix hexadecimal /tb/CHIP_DUT/SYS_CONTROL/JTAG_MASTER/IDLE
add wave -noupdate -group JTAG_MASTER -radix hexadecimal /tb/CHIP_DUT/SYS_CONTROL/JTAG_MASTER/WRITE
add wave -noupdate -group JTAG_MASTER -radix hexadecimal /tb/CHIP_DUT/SYS_CONTROL/JTAG_MASTER/READ
add wave -noupdate -group JTAG_MASTER -radix hexadecimal /tb/CHIP_DUT/SYS_CONTROL/JTAG_MASTER/clk
add wave -noupdate -group JTAG_MASTER -radix hexadecimal /tb/CHIP_DUT/SYS_CONTROL/JTAG_MASTER/reset_n
add wave -noupdate -group JTAG_MASTER -radix hexadecimal /tb/CHIP_DUT/SYS_CONTROL/JTAG_MASTER/readdata_to_the_altera_jtag_avalon_master_packets_to_transactions_converter
add wave -noupdate -group JTAG_MASTER -radix hexadecimal /tb/CHIP_DUT/SYS_CONTROL/JTAG_MASTER/readdatavalid_to_the_altera_jtag_avalon_master_packets_to_transactions_converter
add wave -noupdate -group JTAG_MASTER -radix hexadecimal /tb/CHIP_DUT/SYS_CONTROL/JTAG_MASTER/waitrequest_to_the_altera_jtag_avalon_master_packets_to_transactions_converter
add wave -noupdate -group JTAG_MASTER -radix hexadecimal /tb/CHIP_DUT/SYS_CONTROL/JTAG_MASTER/resetrequest_from_the_altera_jtag_avalon_master_jtag_interface
add wave -noupdate -group JTAG_MASTER -radix hexadecimal /tb/CHIP_DUT/SYS_CONTROL/JTAG_MASTER/write_from_the_altera_jtag_avalon_master_packets_to_transactions_converter
add wave -noupdate -group JTAG_MASTER -radix hexadecimal /tb/CHIP_DUT/SYS_CONTROL/JTAG_MASTER/address_from_the_altera_jtag_avalon_master_packets_to_transactions_converter
add wave -noupdate -group JTAG_MASTER -radix hexadecimal /tb/CHIP_DUT/SYS_CONTROL/JTAG_MASTER/writedata_from_the_altera_jtag_avalon_master_packets_to_transactions_converter
add wave -noupdate -group JTAG_MASTER -radix hexadecimal /tb/CHIP_DUT/SYS_CONTROL/JTAG_MASTER/byteenable_from_the_altera_jtag_avalon_master_packets_to_transactions_converter
add wave -noupdate -group JTAG_MASTER -radix hexadecimal /tb/CHIP_DUT/SYS_CONTROL/JTAG_MASTER/read_from_the_altera_jtag_avalon_master_packets_to_transactions_converter
add wave -noupdate -group JTAG_MASTER -radix hexadecimal /tb/CHIP_DUT/SYS_CONTROL/JTAG_MASTER/avalon_write
add wave -noupdate -group JTAG_MASTER -radix hexadecimal /tb/CHIP_DUT/SYS_CONTROL/JTAG_MASTER/avalon_read
add wave -noupdate -group JTAG_MASTER -radix hexadecimal /tb/CHIP_DUT/SYS_CONTROL/JTAG_MASTER/avalon_address
add wave -noupdate -group JTAG_MASTER -radix hexadecimal /tb/CHIP_DUT/SYS_CONTROL/JTAG_MASTER/avalon_writedata
add wave -noupdate -group JTAG_MASTER -radix hexadecimal /tb/CHIP_DUT/SYS_CONTROL/JTAG_MASTER/avalon_byteenable
add wave -noupdate -group JTAG_MASTER -radix hexadecimal /tb/CHIP_DUT/SYS_CONTROL/JTAG_MASTER/avalon_resetrequest
add wave -noupdate -group JTAG_MASTER -radix hexadecimal /tb/CHIP_DUT/SYS_CONTROL/JTAG_MASTER/avalon_waitrequest
add wave -noupdate -group JTAG_MASTER -radix hexadecimal /tb/CHIP_DUT/SYS_CONTROL/JTAG_MASTER/avalon_readdatavalid
add wave -noupdate -group JTAG_MASTER -format Literal -radix hexadecimal /tb/CHIP_DUT/SYS_CONTROL/JTAG_MASTER/avalon_readdatavalid
add wave -noupdate -group JTAG_MASTER -radix hexadecimal /tb/CHIP_DUT/SYS_CONTROL/JTAG_MASTER/state
add wave -noupdate -group JTAG_MASTER -radix hexadecimal /tb/CHIP_DUT/SYS_CONTROL/JTAG_MASTER/next_state
add wave -noupdate -group JTAG_MASTER -radix hexadecimal /tb/CHIP_DUT/SYS_CONTROL/JTAG_MASTER/print_match_message
add wave -noupdate -group JTAG_MASTER -radix hexadecimal /tb/CHIP_DUT/SYS_CONTROL/JTAG_MASTER/print_mismatch_message
add wave -noupdate -group JTAG_MASTER -radix hexadecimal /tb/CHIP_DUT/SYS_CONTROL/JTAG_MASTER/wren
add wave -noupdate -group JTAG_MASTER -radix hexadecimal /tb/CHIP_DUT/SYS_CONTROL/JTAG_MASTER/rden
add wave -noupdate -group JTAG_MASTER -radix hexadecimal /tb/CHIP_DUT/SYS_CONTROL/JTAG_MASTER/exp_readdata
add wave -noupdate -group JTAG_MASTER -radix hexadecimal /tb/CHIP_DUT/SYS_CONTROL/JTAG_MASTER/debug
add wave -noupdate -group MSDECODER -radix hexadecimal /tb/CHIP_DUT/SYS_CONTROL/MSDECODER/NUMSLAVES
add wave -noupdate -group MSDECODER -radix hexadecimal /tb/CHIP_DUT/SYS_CONTROL/MSDECODER/clk
add wave -noupdate -group MSDECODER -radix hexadecimal /tb/CHIP_DUT/SYS_CONTROL/MSDECODER/reset_n
add wave -noupdate -group MSDECODER -radix hexadecimal /tb/CHIP_DUT/SYS_CONTROL/MSDECODER/avalon_master_write
add wave -noupdate -group MSDECODER -radix hexadecimal /tb/CHIP_DUT/SYS_CONTROL/MSDECODER/avalon_master_read
add wave -noupdate -group MSDECODER -radix hexadecimal /tb/CHIP_DUT/SYS_CONTROL/MSDECODER/avalon_master_address
add wave -noupdate -group MSDECODER -radix hexadecimal /tb/CHIP_DUT/SYS_CONTROL/MSDECODER/avalon_master_writedata
add wave -noupdate -group MSDECODER -radix hexadecimal /tb/CHIP_DUT/SYS_CONTROL/MSDECODER/avalon_master_waitrequest
add wave -noupdate -group MSDECODER -radix hexadecimal /tb/CHIP_DUT/SYS_CONTROL/MSDECODER/avalon_master_readdata_valid
add wave -noupdate -group MSDECODER -format Literal -radix hexadecimal /tb/CHIP_DUT/SYS_CONTROL/MSDECODER/avalon_master_readdata_valid
add wave -noupdate -group MSDECODER -radix hexadecimal /tb/CHIP_DUT/SYS_CONTROL/MSDECODER/msbridge_if_write
add wave -noupdate -group MSDECODER -radix hexadecimal /tb/CHIP_DUT/SYS_CONTROL/MSDECODER/msbridge_if_read
add wave -noupdate -group MSDECODER -radix hexadecimal /tb/CHIP_DUT/SYS_CONTROL/MSDECODER/msbridge_if_address
add wave -noupdate -group MSDECODER -radix hexadecimal /tb/CHIP_DUT/SYS_CONTROL/MSDECODER/msbridge_if_writedata
add wave -noupdate -group MSDECODER -radix hexadecimal /tb/CHIP_DUT/SYS_CONTROL/MSDECODER/msbridge_if_blksel
add wave -noupdate -group MSDECODER -radix hexadecimal /tb/CHIP_DUT/SYS_CONTROL/MSDECODER/msbridge_if_waitrequest
add wave -noupdate -group MSDECODER -radix hexadecimal /tb/CHIP_DUT/SYS_CONTROL/MSDECODER/msbridge_if_readdata_valid
add wave -noupdate -group MSDECODER -radix hexadecimal /tb/CHIP_DUT/SYS_CONTROL/MSDECODER/msbridge_if_readdata_valid
add wave -noupdate -group MSDECODER -radix hexadecimal /tb/CHIP_DUT/SYS_CONTROL/MSDECODER/blk_address
add wave -noupdate -group MSDECODER -radix hexadecimal /tb/CHIP_DUT/SYS_CONTROL/MSDECODER/readdata
add wave -noupdate -group MSDECODER -radix hexadecimal /tb/CHIP_DUT/SYS_CONTROL/MSDECODER/readdata_valid
add wave -noupdate -group MSDECODER -radix hexadecimal /tb/CHIP_DUT/SYS_CONTROL/MSDECODER/waitrequest
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_if_writedata}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_if_readdata}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_if_readdata_valid}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_if_waitrequest}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_if_clk}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_if_write}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_if_readdata}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_if_address}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_if_writedata}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_if_readdata}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_if_waitrequest}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_reset_n}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_reset_n}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/ppln_master_read}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/ppln_master_write}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/async_operation_done}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/ppln_operation_done}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_write_edge}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_read_edge}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_operation_done}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/mstate}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/next_mstate}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/async_if_write}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/async_if_read}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/ppln_async_write}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/ppln_async_read}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/ppln_writedata}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/ppln_address}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/async_write_edge}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/async_read_edge}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/sstate}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/next_sstate}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_done}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_if_writedata}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_if_readdata}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_if_readdata_valid}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_if_waitrequest}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_if_clk}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_if_write}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_if_readdata}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_if_address}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_if_writedata}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_if_readdata}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_if_waitrequest}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_reset_n}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_reset_n}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/ppln_master_read}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/ppln_master_write}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/async_operation_done}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/ppln_operation_done}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_write_edge}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_read_edge}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_operation_done}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/mstate}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/next_mstate}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/async_if_write}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/async_if_read}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/ppln_async_write}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/ppln_async_read}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/ppln_writedata}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/ppln_address}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/async_write_edge}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/async_read_edge}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/sstate}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/next_sstate}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_done}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_if_writedata}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_if_readdata}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_if_readdata_valid}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_if_waitrequest}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_if_clk}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_if_write}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_if_readdata}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_if_address}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_if_writedata}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_if_readdata}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_if_waitrequest}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_reset_n}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_reset_n}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/ppln_master_read}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/ppln_master_write}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/async_operation_done}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/ppln_operation_done}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_write_edge}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_read_edge}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_operation_done}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/mstate}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/next_mstate}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/async_if_write}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/async_if_read}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/ppln_async_write}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/ppln_async_read}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/ppln_writedata}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/ppln_address}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/async_write_edge}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/async_read_edge}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/sstate}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/next_sstate}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_done}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_if_writedata}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_if_readdata}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_if_readdata_valid}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_if_waitrequest}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_if_clk}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_if_write}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_if_readdata}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_if_address}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_if_writedata}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_if_readdata}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_if_waitrequest}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_reset_n}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_reset_n}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/ppln_master_read}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/ppln_master_write}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/async_operation_done}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/ppln_operation_done}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_write_edge}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_read_edge}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_operation_done}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/mstate}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/next_mstate}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/async_if_write}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/async_if_read}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/ppln_async_write}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/ppln_async_read}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/ppln_writedata}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/ppln_address}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/async_write_edge}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/async_read_edge}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/sstate}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/next_sstate}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_done}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_if_writedata}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_if_readdata}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_if_readdata_valid}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_if_waitrequest}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_if_clk}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_if_write}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_if_readdata}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_if_address}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_if_writedata}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_if_readdata}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_if_waitrequest}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_reset_n}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_reset_n}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/ppln_master_read}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/ppln_master_write}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/async_operation_done}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/ppln_operation_done}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_write_edge}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_read_edge}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_operation_done}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/mstate}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/next_mstate}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/async_if_write}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/async_if_read}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/ppln_async_write}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/ppln_async_read}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/ppln_writedata}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/ppln_address}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/async_write_edge}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/async_read_edge}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/sstate}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/next_sstate}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_done}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_if_writedata}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_if_readdata}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_if_readdata_valid}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_if_waitrequest}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_if_clk}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_if_write}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_if_readdata}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_if_address}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_if_writedata}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_if_readdata}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_if_waitrequest}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_reset_n}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_reset_n}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/ppln_master_read}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/ppln_master_write}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/async_operation_done}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/ppln_operation_done}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_write_edge}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_read_edge}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_operation_done}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/mstate}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/next_mstate}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/async_if_write}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/async_if_read}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/ppln_async_write}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/ppln_async_read}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/ppln_writedata}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/ppln_address}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/async_write_edge}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/async_read_edge}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/sstate}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/next_sstate}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_done}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_if_writedata}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_if_readdata}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_if_readdata_valid}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_if_waitrequest}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_if_clk}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_if_write}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_if_readdata}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_if_address}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_if_writedata}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_if_readdata}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_if_waitrequest}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_reset_n}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_reset_n}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/ppln_master_read}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/ppln_master_write}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/async_operation_done}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/ppln_operation_done}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_write_edge}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_read_edge}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_operation_done}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/mstate}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/next_mstate}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/async_if_write}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/async_if_read}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/ppln_async_write}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/ppln_async_read}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/ppln_writedata}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/ppln_address}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/async_write_edge}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/async_read_edge}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/sstate}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/next_sstate}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_done}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_if_writedata}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_if_readdata}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_if_readdata_valid}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_if_waitrequest}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_if_clk}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_if_write}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_if_readdata}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_if_address}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_if_writedata}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_if_readdata}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_if_waitrequest}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_reset_n}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_reset_n}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/ppln_master_read}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/ppln_master_write}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/async_operation_done}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/ppln_operation_done}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_write_edge}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_read_edge}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/master_operation_done}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/mstate}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/next_mstate}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/async_if_write}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/async_if_read}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/ppln_async_write}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/ppln_async_read}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/ppln_writedata}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/ppln_address}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/async_write_edge}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/async_read_edge}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/sstate}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/next_sstate}
add wave -noupdate -group MSBRIDGE0 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[0]/MSBRIDGE/slave_done}
add wave -noupdate -group MSBRIDGE1 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[1]/MSBRIDGE/BASE}
add wave -noupdate -group MSBRIDGE1 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[1]/MSBRIDGE/IDLE}
add wave -noupdate -group MSBRIDGE1 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[1]/MSBRIDGE/WRITE}
add wave -noupdate -group MSBRIDGE1 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[1]/MSBRIDGE/READ}
add wave -noupdate -group MSBRIDGE1 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[1]/MSBRIDGE/reset_n}
add wave -noupdate -group MSBRIDGE1 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[1]/MSBRIDGE/master_if_clk}
add wave -noupdate -group MSBRIDGE1 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[1]/MSBRIDGE/master_if_blksel}
add wave -noupdate -group MSBRIDGE1 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[1]/MSBRIDGE/master_if_write}
add wave -noupdate -group MSBRIDGE1 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[1]/MSBRIDGE/master_if_readdata}
add wave -noupdate -group MSBRIDGE1 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[1]/MSBRIDGE/master_if_address}
add wave -noupdate -group MSBRIDGE1 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[1]/MSBRIDGE/master_if_writedata}
add wave -noupdate -group MSBRIDGE1 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[1]/MSBRIDGE/master_if_readdata}
add wave -noupdate -group MSBRIDGE1 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[1]/MSBRIDGE/master_if_readdata_valid}
add wave -noupdate -group MSBRIDGE1 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[1]/MSBRIDGE/master_if_waitrequest}
add wave -noupdate -group MSBRIDGE1 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[1]/MSBRIDGE/slave_if_clk}
add wave -noupdate -group MSBRIDGE1 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[1]/MSBRIDGE/slave_if_write}
add wave -noupdate -group MSBRIDGE1 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[1]/MSBRIDGE/slave_if_readdata}
add wave -noupdate -group MSBRIDGE1 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[1]/MSBRIDGE/slave_if_waitrequest}
add wave -noupdate -group MSBRIDGE1 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[1]/MSBRIDGE/slave_if_address}
add wave -noupdate -group MSBRIDGE1 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[1]/MSBRIDGE/slave_if_writedata}
add wave -noupdate -group MSBRIDGE1 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[1]/MSBRIDGE/slave_if_readdata}
add wave -noupdate -group MSBRIDGE1 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[1]/MSBRIDGE/master_reset_n}
add wave -noupdate -group MSBRIDGE1 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[1]/MSBRIDGE/slave_reset_n}
add wave -noupdate -group MSBRIDGE1 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[1]/MSBRIDGE/ppln_master_read}
add wave -noupdate -group MSBRIDGE1 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[1]/MSBRIDGE/ppln_master_write}
add wave -noupdate -group MSBRIDGE1 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[1]/MSBRIDGE/async_operation_done}
add wave -noupdate -group MSBRIDGE1 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[1]/MSBRIDGE/ppln_operation_done}
add wave -noupdate -group MSBRIDGE1 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[1]/MSBRIDGE/master_write_edge}
add wave -noupdate -group MSBRIDGE1 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[1]/MSBRIDGE/master_read_edge}
add wave -noupdate -group MSBRIDGE1 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[1]/MSBRIDGE/master_operation_done}
add wave -noupdate -group MSBRIDGE1 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[1]/MSBRIDGE/mstate}
add wave -noupdate -group MSBRIDGE1 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[1]/MSBRIDGE/next_mstate}
add wave -noupdate -group MSBRIDGE1 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[1]/MSBRIDGE/async_if_write}
add wave -noupdate -group MSBRIDGE1 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[1]/MSBRIDGE/async_if_read}
add wave -noupdate -group MSBRIDGE1 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[1]/MSBRIDGE/ppln_async_write}
add wave -noupdate -group MSBRIDGE1 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[1]/MSBRIDGE/ppln_async_read}
add wave -noupdate -group MSBRIDGE1 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[1]/MSBRIDGE/ppln_writedata}
add wave -noupdate -group MSBRIDGE1 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[1]/MSBRIDGE/ppln_address}
add wave -noupdate -group MSBRIDGE1 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[1]/MSBRIDGE/async_write_edge}
add wave -noupdate -group MSBRIDGE1 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[1]/MSBRIDGE/async_read_edge}
add wave -noupdate -group MSBRIDGE1 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[1]/MSBRIDGE/sstate}
add wave -noupdate -group MSBRIDGE1 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[1]/MSBRIDGE/next_sstate}
add wave -noupdate -group MSBRIDGE1 -radix hexadecimal {/tb/CHIP_DUT/SYS_CONTROL/MSBRIDGES[1]/MSBRIDGE/slave_done}
add wave -noupdate -radix hexadecimal /tb/PBTN
add wave -noupdate -divider {Simulation packet}
add wave -noupdate -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/MON/good_pkts
add wave -noupdate -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/MON/bad_pkts
add wave -noupdate -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/MON/mon_active
add wave -noupdate -radix hexadecimal /tb/CHIP_DUT/TRAFFIC_CTRL/MON/crcvalid
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {17242099 ps} 0} {{Cursor 2} {139311517 ps} 0}
configure wave -namecolwidth 221
configure wave -valuecolwidth 117
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {19654814 ps} {20354991 ps}
bookmark add wave bookmark0 {{18214217 ps} {18339955 ps}} 19
bookmark add wave bookmark1 {{18214217 ps} 18220000} 19
