###########################################################
## Build Vivado project
###########################################################

set TIME_start [clock clicks -milliseconds]
set systemTime [clock seconds]
set DS [clock format $systemTime -format %y%b%d]

#open_project vivado/hw.xpr
#set_property SEVERITY {Warning} [get_drc_checks NSTD-1]

update_compile_order -fileset sources_1
reset_run synth_1
launch_runs synth_1 -jobs $::env(NJOBS)
wait_on_run synth_1

reset_run impl_1
launch_runs impl_1 -to_step write_bitstream -jobs $::env(NJOBS)
wait_on_run impl_1

write_hw_platform -fixed -include_bit -force -file ./$::env(XSA).xsa

#write_bd_tcl -force ./$::env(XSA).tcl

update_compile_order -fileset sources_1
open_run impl_1

report_timing_summary -file ./hw_timing.rpt
report_utilization -file ./hw_util.rpt
report_power -file ./hw_power.rpt

set TIME_taken [expr [expr [clock clicks -milliseconds] - $TIME_start] / 1000]
puts "### TIME_taken: [clock format $TIME_taken -format %M:%S]"

exit

