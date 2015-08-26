#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3

#**************************************************************
# Input clock
#**************************************************************
# 10G Base R Reference Clock Input - 644.531Mhz
create_clock -period 1.551 -name {REFCLK} [get_ports REFCLK]

# System Clock - 100Mhz
create_clock -period 10.0 -name {CLK_100MHZ} [get_ports CLK_100MHZ]

derive_pll_clocks -create_base_clocks

#**************************************************************
# Create Generated Clock
#**************************************************************
create_generated_clock -name pll_mac_clk -source [get_pins -compatibility_mode {*altpll_component|auto_generated|pll1|clk[0]}]
create_generated_clock -name pma_tx_clk -source [get_pins -compatibility_mode {*siv_alt_pma|pma_direct|auto_generated|transmit_pcs0|clkout}]

#**************************************************************
# Set Clock Uncertainty
#**************************************************************

derive_clock_uncertainty
set_clock_uncertainty -from [get_clocks {*siv_alt_pma|*pma_direct|auto_generated|receive_pcs*|clkout}] -to REFCLK -setup 0.1
set_clock_uncertainty -from [get_clocks {*siv_alt_pma|*pma_direct|auto_generated|transmit_pcs*|clkout}] -to REFCLK -setup 0.08
set_clock_uncertainty -from [get_clocks {*siv_alt_pma|*pma_direct|auto_generated|receive_pcs*|clkout}] -to REFCLK -hold 0.1
set_clock_uncertainty -from [get_clocks {*siv_alt_pma|*pma_direct|auto_generated|transmit_pcs*|clkout}] -to REFCLK -hold 0.08

#**************************************************************
# Set Clock Groups
#**************************************************************
set_clock_groups -exclusive -group [get_clocks {system_pll_u0|altpll_component|auto_generated|pll1|clk[0]}] \
							-group [get_clocks {*siv_alt_pma|*pma_direct|auto_generated|transmit_pcs*|clkout}] \
							-group [get_clocks {*siv_alt_pma|*pma_direct|auto_generated|receive_pcs*|clkout}] \
							-group [get_clocks {*pll_siv_xgmii_clk|altpll_component|auto_generated|pll1|clk[0]}]

#**************************************************************
# Set False Path
#**************************************************************
set_false_path -from {*siv_10gbaser_xcvr*clk_reset_ctrl|rx_pma_rstn} -to [get_clocks {{*siv_alt_pma|*pma_direct|auto_generated|transmit_pcs*|clkout} {*siv_alt_pma|*pma_direct|auto_generated|receive_pcs*|clkout} {*pll_siv_xgmii_clk|altpll_component|auto_generated|pll1|clk[0]} {system_pll_u0|altpll_component|auto_generated|pll1|clk[0]} }]
set_false_path -from {*siv_10gbaser_xcvr*clk_reset_ctrl|rx_usr_rstn} -to [get_clocks {{*siv_alt_pma|*pma_direct|auto_generated|transmit_pcs*|clkout} {*siv_alt_pma|*pma_direct|auto_generated|transmit_pcs*|clkout}  {*pll_siv_xgmii_clk|altpll_component|auto_generated|pll1|clk[0]} {system_pll_u0|altpll_component|auto_generated|pll1|clk[0]} }]
set_false_path -from {*siv_10gbaser_xcvr*clk_reset_ctrl|tx_pma_rstn} -to [get_clocks {{*siv_alt_pma|*pma_direct|auto_generated|receive_pcs*|clkout} {*siv_alt_pma|*pma_direct|auto_generated|transmit_pcs*|clkout}  {*pll_siv_xgmii_clk|altpll_component|auto_generated|pll1|clk[0]} {system_pll_u0|altpll_component|auto_generated|pll1|clk[0]} }]
set_false_path -from {*siv_10gbaser_xcvr*clk_reset_ctrl|tx_usr_rstn} -to [get_clocks {{*siv_alt_pma|*pma_direct|auto_generated|receive_pcs*|clkout} {*siv_alt_pma|*pma_direct|auto_generated|transmit_pcs*|clkout}  {*pll_siv_xgmii_clk|altpll_component|auto_generated|pll1|clk[0]} {system_pll_u0|altpll_component|auto_generated|pll1|clk[0]} }]
set_false_path -from {*siv_10gbaser_xcvr*rx_analog_rst_lego|rinit} -to [get_clocks {{*siv_alt_pma|*pma_direct|auto_generated|receive_pcs*|clkout} {*siv_alt_pma|*pma_direct|auto_generated|transmit_pcs*|clkout}  {*pll_siv_xgmii_clk|altpll_component|auto_generated|pll1|clk[0]} {system_pll_u0|altpll_component|auto_generated|pll1|clk[0]} }]
set_false_path -from {*siv_10gbaser_xcvr*rx_digital_rst_lego|rinit} -to [get_clocks {{*siv_alt_pma|*pma_direct|auto_generated|receive_pcs*|clkout} {*siv_alt_pma|*pma_direct|auto_generated|transmit_pcs*|clkout}  {*pll_siv_xgmii_clk|altpll_component|auto_generated|pll1|clk[0]} {system_pll_u0|altpll_component|auto_generated|pll1|clk[0]} }]
