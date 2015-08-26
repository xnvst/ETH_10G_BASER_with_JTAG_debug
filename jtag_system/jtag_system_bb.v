
module jtag_system (
	clk_clk,
	reset_reset_n,
	resetrequest_reset,
	mm_bridge_s0_m0_waitrequest,
	mm_bridge_s0_m0_readdata,
	mm_bridge_s0_m0_readdatavalid,
	mm_bridge_s0_m0_burstcount,
	mm_bridge_s0_m0_writedata,
	mm_bridge_s0_m0_address,
	mm_bridge_s0_m0_write,
	mm_bridge_s0_m0_read,
	mm_bridge_s0_m0_byteenable,
	mm_bridge_s0_m0_debugaccess,
	mm_bridge_s2_m0_waitrequest,
	mm_bridge_s2_m0_readdata,
	mm_bridge_s2_m0_readdatavalid,
	mm_bridge_s2_m0_burstcount,
	mm_bridge_s2_m0_writedata,
	mm_bridge_s2_m0_address,
	mm_bridge_s2_m0_write,
	mm_bridge_s2_m0_read,
	mm_bridge_s2_m0_byteenable,
	mm_bridge_s2_m0_debugaccess,
	mm_bridge_s3_m0_waitrequest,
	mm_bridge_s3_m0_readdata,
	mm_bridge_s3_m0_readdatavalid,
	mm_bridge_s3_m0_burstcount,
	mm_bridge_s3_m0_writedata,
	mm_bridge_s3_m0_address,
	mm_bridge_s3_m0_write,
	mm_bridge_s3_m0_read,
	mm_bridge_s3_m0_byteenable,
	mm_bridge_s3_m0_debugaccess,
	mm_bridge_s1_m0_waitrequest,
	mm_bridge_s1_m0_readdata,
	mm_bridge_s1_m0_readdatavalid,
	mm_bridge_s1_m0_burstcount,
	mm_bridge_s1_m0_writedata,
	mm_bridge_s1_m0_address,
	mm_bridge_s1_m0_write,
	mm_bridge_s1_m0_read,
	mm_bridge_s1_m0_byteenable,
	mm_bridge_s1_m0_debugaccess,
	mm_bridge_s4_m0_waitrequest,
	mm_bridge_s4_m0_readdata,
	mm_bridge_s4_m0_readdatavalid,
	mm_bridge_s4_m0_burstcount,
	mm_bridge_s4_m0_writedata,
	mm_bridge_s4_m0_address,
	mm_bridge_s4_m0_write,
	mm_bridge_s4_m0_read,
	mm_bridge_s4_m0_byteenable,
	mm_bridge_s4_m0_debugaccess,
	mm_bridge_s5_m0_waitrequest,
	mm_bridge_s5_m0_readdata,
	mm_bridge_s5_m0_readdatavalid,
	mm_bridge_s5_m0_burstcount,
	mm_bridge_s5_m0_writedata,
	mm_bridge_s5_m0_address,
	mm_bridge_s5_m0_write,
	mm_bridge_s5_m0_read,
	mm_bridge_s5_m0_byteenable,
	mm_bridge_s5_m0_debugaccess,
	mm_bridge_s6_m0_waitrequest,
	mm_bridge_s6_m0_readdata,
	mm_bridge_s6_m0_readdatavalid,
	mm_bridge_s6_m0_burstcount,
	mm_bridge_s6_m0_writedata,
	mm_bridge_s6_m0_address,
	mm_bridge_s6_m0_write,
	mm_bridge_s6_m0_read,
	mm_bridge_s6_m0_byteenable,
	mm_bridge_s6_m0_debugaccess);	

	input		clk_clk;
	input		reset_reset_n;
	output		resetrequest_reset;
	input		mm_bridge_s0_m0_waitrequest;
	input	[31:0]	mm_bridge_s0_m0_readdata;
	input		mm_bridge_s0_m0_readdatavalid;
	output	[3:0]	mm_bridge_s0_m0_burstcount;
	output	[31:0]	mm_bridge_s0_m0_writedata;
	output	[23:0]	mm_bridge_s0_m0_address;
	output		mm_bridge_s0_m0_write;
	output		mm_bridge_s0_m0_read;
	output	[3:0]	mm_bridge_s0_m0_byteenable;
	output		mm_bridge_s0_m0_debugaccess;
	input		mm_bridge_s2_m0_waitrequest;
	input	[31:0]	mm_bridge_s2_m0_readdata;
	input		mm_bridge_s2_m0_readdatavalid;
	output	[3:0]	mm_bridge_s2_m0_burstcount;
	output	[31:0]	mm_bridge_s2_m0_writedata;
	output	[17:0]	mm_bridge_s2_m0_address;
	output		mm_bridge_s2_m0_write;
	output		mm_bridge_s2_m0_read;
	output	[3:0]	mm_bridge_s2_m0_byteenable;
	output		mm_bridge_s2_m0_debugaccess;
	input		mm_bridge_s3_m0_waitrequest;
	input	[31:0]	mm_bridge_s3_m0_readdata;
	input		mm_bridge_s3_m0_readdatavalid;
	output	[3:0]	mm_bridge_s3_m0_burstcount;
	output	[31:0]	mm_bridge_s3_m0_writedata;
	output	[23:0]	mm_bridge_s3_m0_address;
	output		mm_bridge_s3_m0_write;
	output		mm_bridge_s3_m0_read;
	output	[3:0]	mm_bridge_s3_m0_byteenable;
	output		mm_bridge_s3_m0_debugaccess;
	input		mm_bridge_s1_m0_waitrequest;
	input	[31:0]	mm_bridge_s1_m0_readdata;
	input		mm_bridge_s1_m0_readdatavalid;
	output	[3:0]	mm_bridge_s1_m0_burstcount;
	output	[31:0]	mm_bridge_s1_m0_writedata;
	output	[17:0]	mm_bridge_s1_m0_address;
	output		mm_bridge_s1_m0_write;
	output		mm_bridge_s1_m0_read;
	output	[3:0]	mm_bridge_s1_m0_byteenable;
	output		mm_bridge_s1_m0_debugaccess;
	input		mm_bridge_s4_m0_waitrequest;
	input	[31:0]	mm_bridge_s4_m0_readdata;
	input		mm_bridge_s4_m0_readdatavalid;
	output	[3:0]	mm_bridge_s4_m0_burstcount;
	output	[31:0]	mm_bridge_s4_m0_writedata;
	output	[17:0]	mm_bridge_s4_m0_address;
	output		mm_bridge_s4_m0_write;
	output		mm_bridge_s4_m0_read;
	output	[3:0]	mm_bridge_s4_m0_byteenable;
	output		mm_bridge_s4_m0_debugaccess;
	input		mm_bridge_s5_m0_waitrequest;
	input	[31:0]	mm_bridge_s5_m0_readdata;
	input		mm_bridge_s5_m0_readdatavalid;
	output	[3:0]	mm_bridge_s5_m0_burstcount;
	output	[31:0]	mm_bridge_s5_m0_writedata;
	output	[17:0]	mm_bridge_s5_m0_address;
	output		mm_bridge_s5_m0_write;
	output		mm_bridge_s5_m0_read;
	output	[3:0]	mm_bridge_s5_m0_byteenable;
	output		mm_bridge_s5_m0_debugaccess;
	input		mm_bridge_s6_m0_waitrequest;
	input	[31:0]	mm_bridge_s6_m0_readdata;
	input		mm_bridge_s6_m0_readdatavalid;
	output	[3:0]	mm_bridge_s6_m0_burstcount;
	output	[31:0]	mm_bridge_s6_m0_writedata;
	output	[17:0]	mm_bridge_s6_m0_address;
	output		mm_bridge_s6_m0_write;
	output		mm_bridge_s6_m0_read;
	output	[3:0]	mm_bridge_s6_m0_byteenable;
	output		mm_bridge_s6_m0_debugaccess;
endmodule
