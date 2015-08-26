	qsys_10g u0 (
		.clk_clk                         (<connected-to-clk_clk>),                         //                        clk.clk
		.reset_reset_n                   (<connected-to-reset_reset_n>),                   //                      reset.reset_n
		.tx_clk_clk                      (<connected-to-tx_clk_clk>),                      //                     tx_clk.clk
		.tx_reset_reset_n                (<connected-to-tx_reset_reset_n>),                //                   tx_reset.reset_n
		.ref_clk_clk                     (<connected-to-ref_clk_clk>),                     //                    ref_clk.clk
		.ref_reset_reset_n               (<connected-to-ref_reset_reset_n>),               //                  ref_reset.reset_n
		.avalon_st_rxstatus_valid        (<connected-to-avalon_st_rxstatus_valid>),        //         avalon_st_rxstatus.valid
		.avalon_st_rxstatus_data         (<connected-to-avalon_st_rxstatus_data>),         //                           .data
		.avalon_st_rxstatus_error        (<connected-to-avalon_st_rxstatus_error>),        //                           .error
		.link_fault_status_xgmii_rx_data (<connected-to-link_fault_status_xgmii_rx_data>), // link_fault_status_xgmii_rx.data
		.rx_serial_data_export           (<connected-to-rx_serial_data_export>),           //             rx_serial_data.export
		.tx_serial_data_export           (<connected-to-tx_serial_data_export>),           //             tx_serial_data.export
		.rx_ready_export                 (<connected-to-rx_ready_export>),                 //                   rx_ready.export
		.tx_ready_export                 (<connected-to-tx_ready_export>),                 //                   tx_ready.export
		.tx_sc_fifo_in_data              (<connected-to-tx_sc_fifo_in_data>),              //              tx_sc_fifo_in.data
		.tx_sc_fifo_in_valid             (<connected-to-tx_sc_fifo_in_valid>),             //                           .valid
		.tx_sc_fifo_in_ready             (<connected-to-tx_sc_fifo_in_ready>),             //                           .ready
		.tx_sc_fifo_in_startofpacket     (<connected-to-tx_sc_fifo_in_startofpacket>),     //                           .startofpacket
		.tx_sc_fifo_in_endofpacket       (<connected-to-tx_sc_fifo_in_endofpacket>),       //                           .endofpacket
		.tx_sc_fifo_in_empty             (<connected-to-tx_sc_fifo_in_empty>),             //                           .empty
		.tx_sc_fifo_in_error             (<connected-to-tx_sc_fifo_in_error>),             //                           .error
		.rx_sc_fifo_out_data             (<connected-to-rx_sc_fifo_out_data>),             //             rx_sc_fifo_out.data
		.rx_sc_fifo_out_valid            (<connected-to-rx_sc_fifo_out_valid>),            //                           .valid
		.rx_sc_fifo_out_ready            (<connected-to-rx_sc_fifo_out_ready>),            //                           .ready
		.rx_sc_fifo_out_startofpacket    (<connected-to-rx_sc_fifo_out_startofpacket>),    //                           .startofpacket
		.rx_sc_fifo_out_endofpacket      (<connected-to-rx_sc_fifo_out_endofpacket>),      //                           .endofpacket
		.rx_sc_fifo_out_empty            (<connected-to-rx_sc_fifo_out_empty>),            //                           .empty
		.rx_sc_fifo_out_error            (<connected-to-rx_sc_fifo_out_error>),            //                           .error
		.mdio_mdc                        (<connected-to-mdio_mdc>),                        //                       mdio.mdc
		.mdio_mdio_in                    (<connected-to-mdio_mdio_in>),                    //                           .mdio_in
		.mdio_mdio_out                   (<connected-to-mdio_mdio_out>),                   //                           .mdio_out
		.mdio_mdio_oen                   (<connected-to-mdio_mdio_oen>),                   //                           .mdio_oen
		.avalon_st_txstatus_data         (<connected-to-avalon_st_txstatus_data>),         //         avalon_st_txstatus.data
		.avalon_st_txstatus_valid        (<connected-to-avalon_st_txstatus_valid>),        //                           .valid
		.avalon_st_txstatus_error        (<connected-to-avalon_st_txstatus_error>),        //                           .error
		.xgmii_rx_clk_clk                (<connected-to-xgmii_rx_clk_clk>),                //               xgmii_rx_clk.clk
		.mm_bridge_s0_waitrequest        (<connected-to-mm_bridge_s0_waitrequest>),        //               mm_bridge_s0.waitrequest
		.mm_bridge_s0_readdata           (<connected-to-mm_bridge_s0_readdata>),           //                           .readdata
		.mm_bridge_s0_readdatavalid      (<connected-to-mm_bridge_s0_readdatavalid>),      //                           .readdatavalid
		.mm_bridge_s0_burstcount         (<connected-to-mm_bridge_s0_burstcount>),         //                           .burstcount
		.mm_bridge_s0_writedata          (<connected-to-mm_bridge_s0_writedata>),          //                           .writedata
		.mm_bridge_s0_address            (<connected-to-mm_bridge_s0_address>),            //                           .address
		.mm_bridge_s0_write              (<connected-to-mm_bridge_s0_write>),              //                           .write
		.mm_bridge_s0_read               (<connected-to-mm_bridge_s0_read>),               //                           .read
		.mm_bridge_s0_byteenable         (<connected-to-mm_bridge_s0_byteenable>),         //                           .byteenable
		.mm_bridge_s0_debugaccess        (<connected-to-mm_bridge_s0_debugaccess>)         //                           .debugaccess
	);

