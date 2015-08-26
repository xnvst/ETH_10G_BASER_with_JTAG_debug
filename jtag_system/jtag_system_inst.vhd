	component jtag_system is
		port (
			clk_clk                       : in  std_logic                     := 'X';             -- clk
			reset_reset_n                 : in  std_logic                     := 'X';             -- reset_n
			resetrequest_reset            : out std_logic;                                        -- reset
			mm_bridge_s0_m0_waitrequest   : in  std_logic                     := 'X';             -- waitrequest
			mm_bridge_s0_m0_readdata      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- readdata
			mm_bridge_s0_m0_readdatavalid : in  std_logic                     := 'X';             -- readdatavalid
			mm_bridge_s0_m0_burstcount    : out std_logic_vector(3 downto 0);                     -- burstcount
			mm_bridge_s0_m0_writedata     : out std_logic_vector(31 downto 0);                    -- writedata
			mm_bridge_s0_m0_address       : out std_logic_vector(23 downto 0);                    -- address
			mm_bridge_s0_m0_write         : out std_logic;                                        -- write
			mm_bridge_s0_m0_read          : out std_logic;                                        -- read
			mm_bridge_s0_m0_byteenable    : out std_logic_vector(3 downto 0);                     -- byteenable
			mm_bridge_s0_m0_debugaccess   : out std_logic;                                        -- debugaccess
			mm_bridge_s2_m0_waitrequest   : in  std_logic                     := 'X';             -- waitrequest
			mm_bridge_s2_m0_readdata      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- readdata
			mm_bridge_s2_m0_readdatavalid : in  std_logic                     := 'X';             -- readdatavalid
			mm_bridge_s2_m0_burstcount    : out std_logic_vector(3 downto 0);                     -- burstcount
			mm_bridge_s2_m0_writedata     : out std_logic_vector(31 downto 0);                    -- writedata
			mm_bridge_s2_m0_address       : out std_logic_vector(17 downto 0);                    -- address
			mm_bridge_s2_m0_write         : out std_logic;                                        -- write
			mm_bridge_s2_m0_read          : out std_logic;                                        -- read
			mm_bridge_s2_m0_byteenable    : out std_logic_vector(3 downto 0);                     -- byteenable
			mm_bridge_s2_m0_debugaccess   : out std_logic;                                        -- debugaccess
			mm_bridge_s3_m0_waitrequest   : in  std_logic                     := 'X';             -- waitrequest
			mm_bridge_s3_m0_readdata      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- readdata
			mm_bridge_s3_m0_readdatavalid : in  std_logic                     := 'X';             -- readdatavalid
			mm_bridge_s3_m0_burstcount    : out std_logic_vector(3 downto 0);                     -- burstcount
			mm_bridge_s3_m0_writedata     : out std_logic_vector(31 downto 0);                    -- writedata
			mm_bridge_s3_m0_address       : out std_logic_vector(23 downto 0);                    -- address
			mm_bridge_s3_m0_write         : out std_logic;                                        -- write
			mm_bridge_s3_m0_read          : out std_logic;                                        -- read
			mm_bridge_s3_m0_byteenable    : out std_logic_vector(3 downto 0);                     -- byteenable
			mm_bridge_s3_m0_debugaccess   : out std_logic;                                        -- debugaccess
			mm_bridge_s1_m0_waitrequest   : in  std_logic                     := 'X';             -- waitrequest
			mm_bridge_s1_m0_readdata      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- readdata
			mm_bridge_s1_m0_readdatavalid : in  std_logic                     := 'X';             -- readdatavalid
			mm_bridge_s1_m0_burstcount    : out std_logic_vector(3 downto 0);                     -- burstcount
			mm_bridge_s1_m0_writedata     : out std_logic_vector(31 downto 0);                    -- writedata
			mm_bridge_s1_m0_address       : out std_logic_vector(17 downto 0);                    -- address
			mm_bridge_s1_m0_write         : out std_logic;                                        -- write
			mm_bridge_s1_m0_read          : out std_logic;                                        -- read
			mm_bridge_s1_m0_byteenable    : out std_logic_vector(3 downto 0);                     -- byteenable
			mm_bridge_s1_m0_debugaccess   : out std_logic;                                        -- debugaccess
			mm_bridge_s4_m0_waitrequest   : in  std_logic                     := 'X';             -- waitrequest
			mm_bridge_s4_m0_readdata      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- readdata
			mm_bridge_s4_m0_readdatavalid : in  std_logic                     := 'X';             -- readdatavalid
			mm_bridge_s4_m0_burstcount    : out std_logic_vector(3 downto 0);                     -- burstcount
			mm_bridge_s4_m0_writedata     : out std_logic_vector(31 downto 0);                    -- writedata
			mm_bridge_s4_m0_address       : out std_logic_vector(17 downto 0);                    -- address
			mm_bridge_s4_m0_write         : out std_logic;                                        -- write
			mm_bridge_s4_m0_read          : out std_logic;                                        -- read
			mm_bridge_s4_m0_byteenable    : out std_logic_vector(3 downto 0);                     -- byteenable
			mm_bridge_s4_m0_debugaccess   : out std_logic;                                        -- debugaccess
			mm_bridge_s5_m0_waitrequest   : in  std_logic                     := 'X';             -- waitrequest
			mm_bridge_s5_m0_readdata      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- readdata
			mm_bridge_s5_m0_readdatavalid : in  std_logic                     := 'X';             -- readdatavalid
			mm_bridge_s5_m0_burstcount    : out std_logic_vector(3 downto 0);                     -- burstcount
			mm_bridge_s5_m0_writedata     : out std_logic_vector(31 downto 0);                    -- writedata
			mm_bridge_s5_m0_address       : out std_logic_vector(17 downto 0);                    -- address
			mm_bridge_s5_m0_write         : out std_logic;                                        -- write
			mm_bridge_s5_m0_read          : out std_logic;                                        -- read
			mm_bridge_s5_m0_byteenable    : out std_logic_vector(3 downto 0);                     -- byteenable
			mm_bridge_s5_m0_debugaccess   : out std_logic;                                        -- debugaccess
			mm_bridge_s6_m0_waitrequest   : in  std_logic                     := 'X';             -- waitrequest
			mm_bridge_s6_m0_readdata      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- readdata
			mm_bridge_s6_m0_readdatavalid : in  std_logic                     := 'X';             -- readdatavalid
			mm_bridge_s6_m0_burstcount    : out std_logic_vector(3 downto 0);                     -- burstcount
			mm_bridge_s6_m0_writedata     : out std_logic_vector(31 downto 0);                    -- writedata
			mm_bridge_s6_m0_address       : out std_logic_vector(17 downto 0);                    -- address
			mm_bridge_s6_m0_write         : out std_logic;                                        -- write
			mm_bridge_s6_m0_read          : out std_logic;                                        -- read
			mm_bridge_s6_m0_byteenable    : out std_logic_vector(3 downto 0);                     -- byteenable
			mm_bridge_s6_m0_debugaccess   : out std_logic                                         -- debugaccess
		);
	end component jtag_system;

	u0 : component jtag_system
		port map (
			clk_clk                       => CONNECTED_TO_clk_clk,                       --             clk.clk
			reset_reset_n                 => CONNECTED_TO_reset_reset_n,                 --           reset.reset_n
			resetrequest_reset            => CONNECTED_TO_resetrequest_reset,            --    resetrequest.reset
			mm_bridge_s0_m0_waitrequest   => CONNECTED_TO_mm_bridge_s0_m0_waitrequest,   -- mm_bridge_s0_m0.waitrequest
			mm_bridge_s0_m0_readdata      => CONNECTED_TO_mm_bridge_s0_m0_readdata,      --                .readdata
			mm_bridge_s0_m0_readdatavalid => CONNECTED_TO_mm_bridge_s0_m0_readdatavalid, --                .readdatavalid
			mm_bridge_s0_m0_burstcount    => CONNECTED_TO_mm_bridge_s0_m0_burstcount,    --                .burstcount
			mm_bridge_s0_m0_writedata     => CONNECTED_TO_mm_bridge_s0_m0_writedata,     --                .writedata
			mm_bridge_s0_m0_address       => CONNECTED_TO_mm_bridge_s0_m0_address,       --                .address
			mm_bridge_s0_m0_write         => CONNECTED_TO_mm_bridge_s0_m0_write,         --                .write
			mm_bridge_s0_m0_read          => CONNECTED_TO_mm_bridge_s0_m0_read,          --                .read
			mm_bridge_s0_m0_byteenable    => CONNECTED_TO_mm_bridge_s0_m0_byteenable,    --                .byteenable
			mm_bridge_s0_m0_debugaccess   => CONNECTED_TO_mm_bridge_s0_m0_debugaccess,   --                .debugaccess
			mm_bridge_s2_m0_waitrequest   => CONNECTED_TO_mm_bridge_s2_m0_waitrequest,   -- mm_bridge_s2_m0.waitrequest
			mm_bridge_s2_m0_readdata      => CONNECTED_TO_mm_bridge_s2_m0_readdata,      --                .readdata
			mm_bridge_s2_m0_readdatavalid => CONNECTED_TO_mm_bridge_s2_m0_readdatavalid, --                .readdatavalid
			mm_bridge_s2_m0_burstcount    => CONNECTED_TO_mm_bridge_s2_m0_burstcount,    --                .burstcount
			mm_bridge_s2_m0_writedata     => CONNECTED_TO_mm_bridge_s2_m0_writedata,     --                .writedata
			mm_bridge_s2_m0_address       => CONNECTED_TO_mm_bridge_s2_m0_address,       --                .address
			mm_bridge_s2_m0_write         => CONNECTED_TO_mm_bridge_s2_m0_write,         --                .write
			mm_bridge_s2_m0_read          => CONNECTED_TO_mm_bridge_s2_m0_read,          --                .read
			mm_bridge_s2_m0_byteenable    => CONNECTED_TO_mm_bridge_s2_m0_byteenable,    --                .byteenable
			mm_bridge_s2_m0_debugaccess   => CONNECTED_TO_mm_bridge_s2_m0_debugaccess,   --                .debugaccess
			mm_bridge_s3_m0_waitrequest   => CONNECTED_TO_mm_bridge_s3_m0_waitrequest,   -- mm_bridge_s3_m0.waitrequest
			mm_bridge_s3_m0_readdata      => CONNECTED_TO_mm_bridge_s3_m0_readdata,      --                .readdata
			mm_bridge_s3_m0_readdatavalid => CONNECTED_TO_mm_bridge_s3_m0_readdatavalid, --                .readdatavalid
			mm_bridge_s3_m0_burstcount    => CONNECTED_TO_mm_bridge_s3_m0_burstcount,    --                .burstcount
			mm_bridge_s3_m0_writedata     => CONNECTED_TO_mm_bridge_s3_m0_writedata,     --                .writedata
			mm_bridge_s3_m0_address       => CONNECTED_TO_mm_bridge_s3_m0_address,       --                .address
			mm_bridge_s3_m0_write         => CONNECTED_TO_mm_bridge_s3_m0_write,         --                .write
			mm_bridge_s3_m0_read          => CONNECTED_TO_mm_bridge_s3_m0_read,          --                .read
			mm_bridge_s3_m0_byteenable    => CONNECTED_TO_mm_bridge_s3_m0_byteenable,    --                .byteenable
			mm_bridge_s3_m0_debugaccess   => CONNECTED_TO_mm_bridge_s3_m0_debugaccess,   --                .debugaccess
			mm_bridge_s1_m0_waitrequest   => CONNECTED_TO_mm_bridge_s1_m0_waitrequest,   -- mm_bridge_s1_m0.waitrequest
			mm_bridge_s1_m0_readdata      => CONNECTED_TO_mm_bridge_s1_m0_readdata,      --                .readdata
			mm_bridge_s1_m0_readdatavalid => CONNECTED_TO_mm_bridge_s1_m0_readdatavalid, --                .readdatavalid
			mm_bridge_s1_m0_burstcount    => CONNECTED_TO_mm_bridge_s1_m0_burstcount,    --                .burstcount
			mm_bridge_s1_m0_writedata     => CONNECTED_TO_mm_bridge_s1_m0_writedata,     --                .writedata
			mm_bridge_s1_m0_address       => CONNECTED_TO_mm_bridge_s1_m0_address,       --                .address
			mm_bridge_s1_m0_write         => CONNECTED_TO_mm_bridge_s1_m0_write,         --                .write
			mm_bridge_s1_m0_read          => CONNECTED_TO_mm_bridge_s1_m0_read,          --                .read
			mm_bridge_s1_m0_byteenable    => CONNECTED_TO_mm_bridge_s1_m0_byteenable,    --                .byteenable
			mm_bridge_s1_m0_debugaccess   => CONNECTED_TO_mm_bridge_s1_m0_debugaccess,   --                .debugaccess
			mm_bridge_s4_m0_waitrequest   => CONNECTED_TO_mm_bridge_s4_m0_waitrequest,   -- mm_bridge_s4_m0.waitrequest
			mm_bridge_s4_m0_readdata      => CONNECTED_TO_mm_bridge_s4_m0_readdata,      --                .readdata
			mm_bridge_s4_m0_readdatavalid => CONNECTED_TO_mm_bridge_s4_m0_readdatavalid, --                .readdatavalid
			mm_bridge_s4_m0_burstcount    => CONNECTED_TO_mm_bridge_s4_m0_burstcount,    --                .burstcount
			mm_bridge_s4_m0_writedata     => CONNECTED_TO_mm_bridge_s4_m0_writedata,     --                .writedata
			mm_bridge_s4_m0_address       => CONNECTED_TO_mm_bridge_s4_m0_address,       --                .address
			mm_bridge_s4_m0_write         => CONNECTED_TO_mm_bridge_s4_m0_write,         --                .write
			mm_bridge_s4_m0_read          => CONNECTED_TO_mm_bridge_s4_m0_read,          --                .read
			mm_bridge_s4_m0_byteenable    => CONNECTED_TO_mm_bridge_s4_m0_byteenable,    --                .byteenable
			mm_bridge_s4_m0_debugaccess   => CONNECTED_TO_mm_bridge_s4_m0_debugaccess,   --                .debugaccess
			mm_bridge_s5_m0_waitrequest   => CONNECTED_TO_mm_bridge_s5_m0_waitrequest,   -- mm_bridge_s5_m0.waitrequest
			mm_bridge_s5_m0_readdata      => CONNECTED_TO_mm_bridge_s5_m0_readdata,      --                .readdata
			mm_bridge_s5_m0_readdatavalid => CONNECTED_TO_mm_bridge_s5_m0_readdatavalid, --                .readdatavalid
			mm_bridge_s5_m0_burstcount    => CONNECTED_TO_mm_bridge_s5_m0_burstcount,    --                .burstcount
			mm_bridge_s5_m0_writedata     => CONNECTED_TO_mm_bridge_s5_m0_writedata,     --                .writedata
			mm_bridge_s5_m0_address       => CONNECTED_TO_mm_bridge_s5_m0_address,       --                .address
			mm_bridge_s5_m0_write         => CONNECTED_TO_mm_bridge_s5_m0_write,         --                .write
			mm_bridge_s5_m0_read          => CONNECTED_TO_mm_bridge_s5_m0_read,          --                .read
			mm_bridge_s5_m0_byteenable    => CONNECTED_TO_mm_bridge_s5_m0_byteenable,    --                .byteenable
			mm_bridge_s5_m0_debugaccess   => CONNECTED_TO_mm_bridge_s5_m0_debugaccess,   --                .debugaccess
			mm_bridge_s6_m0_waitrequest   => CONNECTED_TO_mm_bridge_s6_m0_waitrequest,   -- mm_bridge_s6_m0.waitrequest
			mm_bridge_s6_m0_readdata      => CONNECTED_TO_mm_bridge_s6_m0_readdata,      --                .readdata
			mm_bridge_s6_m0_readdatavalid => CONNECTED_TO_mm_bridge_s6_m0_readdatavalid, --                .readdatavalid
			mm_bridge_s6_m0_burstcount    => CONNECTED_TO_mm_bridge_s6_m0_burstcount,    --                .burstcount
			mm_bridge_s6_m0_writedata     => CONNECTED_TO_mm_bridge_s6_m0_writedata,     --                .writedata
			mm_bridge_s6_m0_address       => CONNECTED_TO_mm_bridge_s6_m0_address,       --                .address
			mm_bridge_s6_m0_write         => CONNECTED_TO_mm_bridge_s6_m0_write,         --                .write
			mm_bridge_s6_m0_read          => CONNECTED_TO_mm_bridge_s6_m0_read,          --                .read
			mm_bridge_s6_m0_byteenable    => CONNECTED_TO_mm_bridge_s6_m0_byteenable,    --                .byteenable
			mm_bridge_s6_m0_debugaccess   => CONNECTED_TO_mm_bridge_s6_m0_debugaccess    --                .debugaccess
		);

