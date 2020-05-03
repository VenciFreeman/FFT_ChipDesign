# IC Compiler run script for idct_floorplan_complete
report_ignored_layers
report_pnet_options
source ndr.tcl
check_physical_design -stage pre_place_opt
check_physical_constraints
save_mw_cel -as 3_1_place_setup

place_opt
redirect -tee ../reports/placement.timing { report_timing }
report_design -physical
report_qor
report_power
save_mw_cel -as 3_2_place_complete
