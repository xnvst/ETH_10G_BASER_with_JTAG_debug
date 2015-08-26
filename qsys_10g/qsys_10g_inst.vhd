	component qsys_10g is
		port (
			clk_clk                         : in  std_logic                     := 'X';             -- clk
			reset_reset_n                   : in  std_logic                     := 'X';             -- reset_n
			tx_clk_clk                      : in  std_logic                     := 'X';             -- clk
			tx_reset_reset_n                : in  std_logic                     := 'X';             -- reset_n
			ref_clk_clk                     : in  std_logic                     := 'X';             -- clk
			ref_reset_reset_n               : in  std_logic                     := 'X';             -- reset_n
			avalon_st_rxstatus_valid        : out std_logic;                                        -- valid
			avalon_st_rxstatus_data         : out std_logic_vector(39 downto 0);                    -- data
			avalon_st_rxstatus_error        : out std_logic_vector(6 downto 0);                     -- error
			link_fault_status_xgmii_rx_data : out std_logic_vector(1 downto 0);                     -- data
			rx_serial_data_export           : in  std_logic                     := 'X';             -- export
			tx_serial_data_export           : out std_logic_vector(0 downto 0);                     -- export
			rx_ready_export                 : out std_logic;                                        -- export
			tx_ready_export                 : out std_logic;                                        -- export
			tx_sc_fifo_in_data              : in  std_logic_vector(63 downto 0) := (others => 'X'); -- data
			tx_sc_fifo_in_valid             : in  std_logic                     := 'X';             -- valid
			tx_sc_fifo_in_ready             : out std_logic;                                        -- ready
			tx_sc_fifo_in_startofpacket     : in  std_logic                     := 'X';             -- startofpacket
			tx_sc_fifo_in_endofpacket       : in  std_logic                     := 'X';             -- endofpacket
			tx_sc_fifo_in_empty             : in  std_logic_vector(2 downto 0)  := (others => 'X'); -- empty
			tx_sc_fifo_in_error             : in  std_logic                     := 'X';             -- error
			rx_sc_fifo_out_data             : out std_logic_vector(63 downto 0);                    -- data
			rx_sc_fifo_out_valid            : out std_logic;                                        -- valid
			rx_sc_fifo_out_ready            : in  std_logic                     := 'X';             -- ready
			rx_sc_fifo_out_startofpacket    : out std_logic;                                        -- startofpacket
			rx_sc_fifo_out_endofpacket      : out std_logic;                                        -- endofpacket
			rx_sc_fifo_out_empty            : out std_logic_vector(2 downto 0);                     -- empty
			rx_sc_fifo_out_error            : out std_logic_vector(5 downto 0);                     -- error
			mdio_mdc                        : out std_logic;                                        -- mdc
			mdio_mdio_in                    : in  std_logic                     := 'X';             -- mdio_in
			mdio_mdio_out                   : out std_logic;                                        -- mdio_out
			mdio_mdio_oen                   : out std_logic;                                        -- mdio_oen
			avalon_st_txstatus_data         : out std_logic_vector(39 downto 0);                    -- data
			avalon_st_txstatus_valid        : out std_logic;                                        -- valid
			avalon_st_txstatus_error        : out std_logic_vector(6 downto 0);                     -- error
			xgmii_rx_clk_clk                : out std_logic;                                        -- clk
			mm_bridge_s0_waitrequest        : out std_logic;                                        -- waitrequest
			mm_bridge_s0_readdata           : out std_logic_vector(31 downto 0);                    -- readdata
			mm_bridge_s0_readdatavalid      : out std_logic;                                        -- readdatavalid
			mm_bridge_s0_burstcount         : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- burstcount
			mm_bridge_s0_writedata          : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			mm_bridge_s0_address            : in  std_logic_vector(23 downto 0) := (others => 'X'); -- address
			mm_bridge_s0_write              : in  std_logic                     := 'X';             -- write
			mm_bridge_s0_read               : in  std_logic                     := 'X';             -- read
			mm_bridge_s0_byteenable         : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- byteenable
			mm_bridge_s0_debugaccess        : in  std_logic                     := 'X'              -- debugaccess
		);
	end component qsys_10g;

	u0 : component qsys_10g
		port map (
			clk_clk                         => CONNECTED_TO_clk_clk,                         --                        clk.clk
			reset_reset_n                   => CONNECTED_TO_reset_reset_n,                   --                      reset.reset_n
			tx_clk_clk                      => CONNECTED_TO_tx_clk_clk,                      --                     tx_clk.clk
			tx_reset_reset_n                => CONNECTED_TO_tx_reset_reset_n,                --                   tx_reset.reset_n
			ref_clk_clk                     => CONNECTED_TO_ref_clk_clk,                     --                    ref_clk.clk
			ref_reset_reset_n               => CONNECTED_TO_ref_reset_reset_n,               --                  ref_reset.reset_n
			avalon_st_rxstatus_valid        => CONNECTED_TO_avalon_st_rxstatus_valid,        --         avalon_st_rxstatus.valid
			avalon_st_rxstatus_data         => CONNECTED_TO_avalon_st_rxstatus_data,         --                           .data
			avalon_st_rxstatus_error        => CONNECTED_TO_avalon_st_rxstatus_error,        --                           .error
			link_fault_status_xgmii_rx_data => CONNECTED_TO_link_fault_status_xgmii_rx_data, -- link_fault_status_xgmii_rx.data
			rx_serial_data_export           => CONNECTED_TO_rx_serial_data_export,           --             rx_serial_data.export
			tx_serial_data_export           => CONNECTED_TO_tx_serial_data_export,           --             tx_serial_data.export
			rx_ready_export                 => CONNECTED_TO_rx_ready_export,                 --                   rx_ready.export
			tx_ready_export                 => CONNECTED_TO_tx_ready_export,                 --                   tx_ready.export
			tx_sc_fifo_in_data              => CONNECTED_TO_tx_sc_fifo_in_data,              --              tx_sc_fifo_in.data
			tx_sc_fifo_in_valid             => CONNECTED_TO_tx_sc_fifo_in_valid,             --                           .valid
			tx_sc_fifo_in_ready             => CONNECTED_TO_tx_sc_fifo_in_ready,             --                           .ready
			tx_sc_fifo_in_startofpacket     => CONNECTED_TO_tx_sc_fifo_in_startofpacket,     --                           .startofpacket
			tx_sc_fifo_in_endofpacket       => CONNECTED_TO_tx_sc_fifo_in_endofpacket,       --                           .endofpacket
			tx_sc_fifo_in_empty             => CONNECTED_TO_tx_sc_fifo_in_empty,             --                           .empty
			tx_sc_fifo_in_error             => CONNECTED_TO_tx_sc_fifo_in_error,             --                           .error
			rx_sc_fifo_out_data             => CONNECTED_TO_rx_sc_fifo_out_data,             --             rx_sc_fifo_out.data
			rx_sc_fifo_out_valid            => CONNECTED_TO_rx_sc_fifo_out_valid,            --                           .valid
			rx_sc_fifo_out_ready            => CONNECTED_TO_rx_sc_fifo_out_ready,            --                           .ready
			rx_sc_fifo_out_startofpacket    => CONNECTED_TO_rx_sc_fifo_out_startofpacket,    --                           .startofpacket
			rx_sc_fifo_out_endofpacket      => CONNECTED_TO_rx_sc_fifo_out_endofpacket,      --                           .endofpacket
			rx_sc_fifo_out_empty            => CONNECTED_TO_rx_sc_fifo_out_empty,            --                           .empty
			rx_sc_fifo_out_error            => CONNECTED_TO_rx_sc_fifo_out_error,            --                           .error
			mdio_mdc                        => CONNECTED_TO_mdio_mdc,                        --                       mdio.mdc
			mdio_mdio_in                    => CONNECTED_TO_mdio_mdio_in,                    --                           .mdio_in
			mdio_mdio_out                   => CONNECTED_TO_mdio_mdio_out,                   --                           .mdio_out
			mdio_mdio_oen                   => CONNECTED_TO_mdio_mdio_oen,                   --                           .mdio_oen
			avalon_st_txstatus_data         => CONNECTED_TO_avalon_st_txstatus_data,         --         avalon_st_txstatus.data
			avalon_st_txstatus_valid        => CONNECTED_TO_avalon_st_txstatus_valid,        --                           .valid
			avalon_st_txstatus_error        => CONNECTED_TO_avalon_st_txstatus_error,        --                           .error
			xgmii_rx_clk_clk                => CONNECTED_TO_xgmii_rx_clk_clk,                --               xgmii_rx_clk.clk
			mm_bridge_s0_waitrequest        => CONNECTED_TO_mm_bridge_s0_waitrequest,        --               mm_bridge_s0.waitrequest
			mm_bridge_s0_readdata           => CONNECTED_TO_mm_bridge_s0_readdata,           --                           .readdata
			mm_bridge_s0_readdatavalid      => CONNECTED_TO_mm_bridge_s0_readdatavalid,      --                           .readdatavalid
			mm_bridge_s0_burstcount         => CONNECTED_TO_mm_bridge_s0_burstcount,         --                           .burstcount
			mm_bridge_s0_writedata          => CONNECTED_TO_mm_bridge_s0_writedata,          --                           .writedata
			mm_bridge_s0_address            => CONNECTED_TO_mm_bridge_s0_address,            --                           .address
			mm_bridge_s0_write              => CONNECTED_TO_mm_bridge_s0_write,              --                           .write
			mm_bridge_s0_read               => CONNECTED_TO_mm_bridge_s0_read,               --                           .read
			mm_bridge_s0_byteenable         => CONNECTED_TO_mm_bridge_s0_byteenable,         --                           .byteenable
			mm_bridge_s0_debugaccess        => CONNECTED_TO_mm_bridge_s0_debugaccess         --                           .debugaccess
		);

