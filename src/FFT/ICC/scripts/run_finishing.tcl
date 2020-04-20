# Check for DRC violations
verify_zrt_route

# Check for LVS violations
verify_lvs 

# Check for constraint violations
report_constraints -all

########################################
#      CRITICAL AREA REDUCTION         #
########################################

report_critical_area -fault_type short
sh mv output_heatmap ../reports/cca.short.before.rpt
spread_zrt_wires
report_critical_area -fault_type short
sh mv output_heatmap ../reports/cca.short.after.rpt

report_critical_area -fault_type open
sh mv output_heatmap ../reports/cca.open.before.rpt
widen_zrt_wires
report_critical_area -fault_type open
sh mv output_heatmap ../reports/cca.open.after.rpt

verify_zrt_route
verify_lvs
rc

save_mw_cel -as 6_1_chip_finish_critical_area

##############################################
# FIXING ANTENNA RULE VIOLATIONS WITH DIODES  #
##############################################

#source -echo scripts/cb13_6m_antenna.tcl

#report_antenna_rules	
#verify_zrt_route

#set_route_zrt_detail_options -insert_diodes_during_routing true
#route_zrt_detail -incremental true

#verify_lvs

#derive_pg_connection -power_net VDD -power_pin VDD -ground_net VSS -ground_pin VSS 
#derive_pg_connection -power_net VDD -ground_net VSS -tie

#verify_zrt_route
#verify_lvs
#rc

#If there were any timing or logical DRC violations use below commands
#route_opt incremental
#derive_pg_connection -power_net VDD -power_pin VDD \
#                     -ground_net VSS -ground_pin VSS
#derive_pg_connection -power_net VDD \
#                     -ground_net VSS -tie
#verify_zrt_route
#verify_lvs
#rc 

#save_mw_cel -as chip_finish_antenna

########################################
# INSERT STANDARD CELL FILLERS         #
########################################
  
insert_stdcell_filler -cell_with_metal "FILL64 FILL32 FILL16 FILL8 FILL4 FILL2 FILL1" -connect_to_power VDD -connect_to_ground VSS -between_std_cells_only

verify_zrt_route
verify_lvs
rc

########################################
# INSERT REDUNDANT VIAS                #
########################################
 
report_design_physical -route
insert_zrt_redundant_vias -list_only
insert_zrt_redundant_vias -effort medium

report_design_physical -route
verify_zrt_route
verify_lvs
rc

source derive_pg.tcl

########################################
#            FINAL DESIGN CHECKS       #
########################################
verify_zrt_route
verify_lvs
rc

########################################
#       SAVE DESIGN AND STREAM OUT     #
########################################
save_mw_cel -as 6_2_chip_finish_final
set_write_stream_options -child_depth 200
write_stream -cells 6_2_chip_finish_final ../outputs/idct_chip.gdsii
write_verilog -no_corner_pad_cells ../outputs/idct_chip.v
close_mw_cel
close_mw_lib

exit
