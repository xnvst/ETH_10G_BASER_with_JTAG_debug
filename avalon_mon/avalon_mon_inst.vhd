	component avalon_mon is
		port (
			clk_clk                    : in  std_logic                     := 'X';             -- clk
			reset_reset_n              : in  std_logic                     := 'X';             -- reset_n
			mm_bridge_s0_waitrequest   : out std_logic;                                        -- waitrequest
			mm_bridge_s0_readdata      : out std_logic_vector(31 downto 0);                    -- readdata
			mm_bridge_s0_readdatavalid : out std_logic;                                        -- readdatavalid
			mm_bridge_s0_burstcount    : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- burstcount
			mm_bridge_s0_writedata     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			mm_bridge_s0_address       : in  std_logic_vector(23 downto 0) := (others => 'X'); -- address
			mm_bridge_s0_write         : in  std_logic                     := 'X';             -- write
			mm_bridge_s0_read          : in  std_logic                     := 'X';             -- read
			mm_bridge_s0_byteenable    : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- byteenable
			mm_bridge_s0_debugaccess   : in  std_logic                     := 'X'              -- debugaccess
		);
	end component avalon_mon;

	u0 : component avalon_mon
		port map (
			clk_clk                    => CONNECTED_TO_clk_clk,                    --          clk.clk
			reset_reset_n              => CONNECTED_TO_reset_reset_n,              --        reset.reset_n
			mm_bridge_s0_waitrequest   => CONNECTED_TO_mm_bridge_s0_waitrequest,   -- mm_bridge_s0.waitrequest
			mm_bridge_s0_readdata      => CONNECTED_TO_mm_bridge_s0_readdata,      --             .readdata
			mm_bridge_s0_readdatavalid => CONNECTED_TO_mm_bridge_s0_readdatavalid, --             .readdatavalid
			mm_bridge_s0_burstcount    => CONNECTED_TO_mm_bridge_s0_burstcount,    --             .burstcount
			mm_bridge_s0_writedata     => CONNECTED_TO_mm_bridge_s0_writedata,     --             .writedata
			mm_bridge_s0_address       => CONNECTED_TO_mm_bridge_s0_address,       --             .address
			mm_bridge_s0_write         => CONNECTED_TO_mm_bridge_s0_write,         --             .write
			mm_bridge_s0_read          => CONNECTED_TO_mm_bridge_s0_read,          --             .read
			mm_bridge_s0_byteenable    => CONNECTED_TO_mm_bridge_s0_byteenable,    --             .byteenable
			mm_bridge_s0_debugaccess   => CONNECTED_TO_mm_bridge_s0_debugaccess    --             .debugaccess
		);

