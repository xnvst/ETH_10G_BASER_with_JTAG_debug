
module avalon_mon (
	clk_clk,
	reset_reset_n,
	mm_bridge_s0_waitrequest,
	mm_bridge_s0_readdata,
	mm_bridge_s0_readdatavalid,
	mm_bridge_s0_burstcount,
	mm_bridge_s0_writedata,
	mm_bridge_s0_address,
	mm_bridge_s0_write,
	mm_bridge_s0_read,
	mm_bridge_s0_byteenable,
	mm_bridge_s0_debugaccess);	

	input		clk_clk;
	input		reset_reset_n;
	output		mm_bridge_s0_waitrequest;
	output	[31:0]	mm_bridge_s0_readdata;
	output		mm_bridge_s0_readdatavalid;
	input	[0:0]	mm_bridge_s0_burstcount;
	input	[31:0]	mm_bridge_s0_writedata;
	input	[23:0]	mm_bridge_s0_address;
	input		mm_bridge_s0_write;
	input		mm_bridge_s0_read;
	input	[3:0]	mm_bridge_s0_byteenable;
	input		mm_bridge_s0_debugaccess;
endmodule
