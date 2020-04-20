source common_optimization_settings_icc.tcl
source common_placement_settings.tcl
source common_post_cts_timing_settings.tcl
source common_route_si_settings_zrt_icc.tcl

report_constraint -all
all_ideal_nets
all_high_fanout -nets -threshold 501
report_preferred_routing_direction
report_tlu_plus_files
check_legality
verify_pg_nets

set_route_zrt_common_options -post_detail_route_redundant_via_insertion medium
set_route_zrt_detail_options -optimize_wire_via_effort_level medium

report_routing_rules; # report routing rules
report_route_opt_strategy; # report route_opt_stretegy
report_route_zrt_common_options; # Reports zrt common route options
report_route_zrt_global_options; # Reports zrt global route options
report_route_zrt_track_options; # Reports zrt route track assignment options
report_route_zrt_detail_options; # Reports zrt detail route options

route_opt -initial_route_only
redirect -tee ../reports/route_initial.timing { report_timing }
report_clock_tree -summary
report_clock_timing -type skew
report_qor
report_constraint -all

route_opt -skip_initial_route  -power
redirect -tee ../reports/route_power.timing { report_timing }
source derive_pg.tcl
verify_zrt_route  #DRC: Check whether there are any physical design rule violations
verify_lvs  #LVS: isolate opens and shorts
route_opt -incremental  #run incremental route_opt to see if that will fix the errors.
route_zrt_eco
report_design_physical -route
save_mw_cel -as 5_route_final

#exit
