#######################
# Examine Clock Tree  #
#######################
report_clock -skew -attributes
report_clock_tree -summary
report_constraint -all

#######################################
# Preparing for Clock Tree Synthesis  #
#######################################
set_clock_tree_options -target_skew 0.3
set_clock_uncertainty 0.2 [all_clocks]
#source ndr.tcl
report_clock_tree -settings
check_physical_design -stage pre_clock_opt -display
set_delay_calculation -clock_arnoldi
check_clock_tree

#################################
# Perform Clock Tree Synthesis  #
#################################
clock_opt -only_cts -no_clock_route -update_clock_latency
report_clock_tree -summary
report_clock_timing -type skew -significant_digits 3
report_constraint -all
redirect -tee ../reports/cts_only_cts.timing { report_timing }
save_mw_cel -as 4_1_clock_cts

###################################
# Perform Hold Time Optimization  #
###################################
set_fix_hold [all_clocks]
extract_rc 
clock_opt -only_psyn -no_clock_route 
redirect -tee ../reports/cts_only_psyn.timing { report_timing }
report_qor
report_constraint -all
save_mw_cel -as 4_2_clock_psyn

#####################
# Route the Clocks  #
#####################
route_zrt_group -all_clock_nets
report_constraint -all
save_mw_cel -as 4_3_clock_route
report_design -physical
