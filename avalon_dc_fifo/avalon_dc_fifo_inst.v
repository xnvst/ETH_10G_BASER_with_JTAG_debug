	avalon_dc_fifo u0 (
		.reset_ext_reset_n (<connected-to-reset_ext_reset_n>), //   reset_ext.reset_n
		.clk_int_clk       (<connected-to-clk_int_clk>),       //     clk_int.clk
		.reset_int_reset_n (<connected-to-reset_int_reset_n>), //   reset_int.reset_n
		.clk_ext_clk       (<connected-to-clk_ext_clk>),       //     clk_ext.clk
		.dc_fifo_in_data   (<connected-to-dc_fifo_in_data>),   //  dc_fifo_in.data
		.dc_fifo_in_valid  (<connected-to-dc_fifo_in_valid>),  //            .valid
		.dc_fifo_in_ready  (<connected-to-dc_fifo_in_ready>),  //            .ready
		.dc_fifo_out_data  (<connected-to-dc_fifo_out_data>),  // dc_fifo_out.data
		.dc_fifo_out_valid (<connected-to-dc_fifo_out_valid>), //            .valid
		.dc_fifo_out_ready (<connected-to-dc_fifo_out_ready>)  //            .ready
	);

