	component avalon_dc_fifo is
		port (
			reset_ext_reset_n : in  std_logic                     := 'X';             -- reset_n
			clk_int_clk       : in  std_logic                     := 'X';             -- clk
			reset_int_reset_n : in  std_logic                     := 'X';             -- reset_n
			clk_ext_clk       : in  std_logic                     := 'X';             -- clk
			dc_fifo_in_data   : in  std_logic_vector(63 downto 0) := (others => 'X'); -- data
			dc_fifo_in_valid  : in  std_logic                     := 'X';             -- valid
			dc_fifo_in_ready  : out std_logic;                                        -- ready
			dc_fifo_out_data  : out std_logic_vector(63 downto 0);                    -- data
			dc_fifo_out_valid : out std_logic;                                        -- valid
			dc_fifo_out_ready : in  std_logic                     := 'X'              -- ready
		);
	end component avalon_dc_fifo;

	u0 : component avalon_dc_fifo
		port map (
			reset_ext_reset_n => CONNECTED_TO_reset_ext_reset_n, --   reset_ext.reset_n
			clk_int_clk       => CONNECTED_TO_clk_int_clk,       --     clk_int.clk
			reset_int_reset_n => CONNECTED_TO_reset_int_reset_n, --   reset_int.reset_n
			clk_ext_clk       => CONNECTED_TO_clk_ext_clk,       --     clk_ext.clk
			dc_fifo_in_data   => CONNECTED_TO_dc_fifo_in_data,   --  dc_fifo_in.data
			dc_fifo_in_valid  => CONNECTED_TO_dc_fifo_in_valid,  --            .valid
			dc_fifo_in_ready  => CONNECTED_TO_dc_fifo_in_ready,  --            .ready
			dc_fifo_out_data  => CONNECTED_TO_dc_fifo_out_data,  -- dc_fifo_out.data
			dc_fifo_out_valid => CONNECTED_TO_dc_fifo_out_valid, --            .valid
			dc_fifo_out_ready => CONNECTED_TO_dc_fifo_out_ready  --            .ready
		);

