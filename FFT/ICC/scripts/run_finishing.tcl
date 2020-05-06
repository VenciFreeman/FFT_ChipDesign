# Check for DRC violations
verify_zrt_route

# Check for LVS violations
#verify_lvs 

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

report_design -physical
redirect -tee ../reports/finally_design.rpt { report_design -physical }

report_qor
redirect -tee ../reports/finally_qor.rpt { report_qor }

report_power
redirect -tee ../reports/finally_power.rpt { report_power }


verify_zrt_route
#verify_lvs
#rc

save_mw_cel -as 6_1_chip_finish_critical_area

########################################
# INSERT STANDARD CELL FILLERS         #
########################################
  
insert_stdcell_filler -cell_with_metal "FILL64 FILL32 FILL16 FILL8 FILL4 FILL2 FILL1" -connect_to_power VDD -connect_to_ground VSS -between_std_cells_only

verify_zrt_route
#verify_lvs
#rc

########################################
# INSERT REDUNDANT VIAS                #
########################################
 
report_design_physical -route
insert_zrt_redundant_vias -list_only
insert_zrt_redundant_vias -effort medium

report_design_physical -route
verify_zrt_route
#verify_lvs
#rc

source derive_pg.tcl

########################################
#            FINAL DESIGN CHECKS       #
########################################
verify_zrt_route
#verify_lvs
#rc

########################################
#       SAVE DESIGN AND STREAM OUT     #
########################################
save_mw_cel -as 6_2_chip_finish_final
set_write_stream_options -child_depth 200
write_stream -cells 6_2_chip_finish_final ../outputs/fft_chip.gdsii
write_verilog -no_corner_pad_cells ../outputs/fft_chip.v
#close_mw_cel
#close_mw_lib

#exit
