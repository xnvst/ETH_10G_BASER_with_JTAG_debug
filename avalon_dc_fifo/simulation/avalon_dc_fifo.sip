set_global_assignment -entity "avalon_dc_fifo" -library "lib_avalon_dc_fifo" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "avalon_dc_fifo" -library "lib_avalon_dc_fifo" -name IP_TOOL_VERSION "14.0"
set_global_assignment -entity "avalon_dc_fifo" -library "lib_avalon_dc_fifo" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_avalon_dc_fifo" -name SPD_FILE [file join $::quartus(sip_path) "../avalon_dc_fifo.spd"]
set_global_assignment -library "lib_avalon_dc_fifo" -name MISC_FILE [file join $::quartus(sip_path) "../../avalon_dc_fifo.qsys"]

set_global_assignment -library "lib_avalon_dc_fifo" -name MISC_FILE [file join $::quartus(sip_path) "avalon_dc_fifo.v"]
set_global_assignment -library "lib_avalon_dc_fifo" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_reset_controller.v"]
set_global_assignment -library "lib_avalon_dc_fifo" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_reset_synchronizer.v"]
set_global_assignment -library "lib_avalon_dc_fifo" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_reset_controller.sdc"]
set_global_assignment -library "lib_avalon_dc_fifo" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_avalon_dc_fifo.v"]
set_global_assignment -library "lib_avalon_dc_fifo" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altera_dcfifo_synchronizer_bundle.v"]
