set_global_assignment -entity "avalon_mon" -library "lib_avalon_mon" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "avalon_mon" -library "lib_avalon_mon" -name IP_TOOL_VERSION "14.0"
set_global_assignment -entity "avalon_mon" -library "lib_avalon_mon" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_avalon_mon" -name SPD_FILE [file join $::quartus(sip_path) "../avalon_mon.spd"]
set_global_assignment -library "lib_avalon_mon" -name MISC_FILE [file join $::quartus(sip_path) "../../avalon_mon.qsys"]

set_global_assignment -library "lib_avalon_mon" -name MISC_FILE [file join $::quartus(sip_path) "avalon_mon.v"]
set_global_assignment -library "lib_avalon_mon" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_reset_controller.v"]
set_global_assignment -library "lib_avalon_mon" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_reset_synchronizer.v"]
set_global_assignment -library "lib_avalon_mon" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_reset_controller.sdc"]
set_global_assignment -library "lib_avalon_mon" -name MISC_FILE [file join $::quartus(sip_path) "submodules/avalon_mon_mm_interconnect_0.v"]
set_global_assignment -library "lib_avalon_mon" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_merlin_slave_translator.sv"]
set_global_assignment -library "lib_avalon_mon" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_merlin_master_translator.sv"]
set_global_assignment -library "lib_avalon_mon" -name MISC_FILE [file join $::quartus(sip_path) "submodules/avalon_mon_onchip_memory2_0.hex"]
set_global_assignment -library "lib_avalon_mon" -name MISC_FILE [file join $::quartus(sip_path) "submodules/avalon_mon_onchip_memory2_0.v"]
set_global_assignment -library "lib_avalon_mon" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_avalon_mm_bridge.v"]
