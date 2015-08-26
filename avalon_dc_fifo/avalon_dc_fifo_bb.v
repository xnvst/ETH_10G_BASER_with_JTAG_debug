
module avalon_dc_fifo (
	reset_ext_reset_n,
	clk_int_clk,
	reset_int_reset_n,
	clk_ext_clk,
	dc_fifo_in_data,
	dc_fifo_in_valid,
	dc_fifo_in_ready,
	dc_fifo_out_data,
	dc_fifo_out_valid,
	dc_fifo_out_ready);	

	input		reset_ext_reset_n;
	input		clk_int_clk;
	input		reset_int_reset_n;
	input		clk_ext_clk;
	input	[63:0]	dc_fifo_in_data;
	input		dc_fifo_in_valid;
	output		dc_fifo_in_ready;
	output	[63:0]	dc_fifo_out_data;
	output		dc_fifo_out_valid;
	input		dc_fifo_out_ready;
endmodule
