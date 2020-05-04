#Library Setup
set search_path "$search_path ../rtl/fft ../scripts ../../../SMIC18/db ../../../SMIC18/sdb ../work"
set target_library   "slow.db"
set symbol_library   "smic18.sdb SP018W_V1p5.sdb"
set link_library     "* $target_library $symbol_library SP018W_V1p5_max.db"

#Saving svf
#set_svf ../outputs/idct_chip.svf

#Reading Design Files and Specify the current design
source read.tcl
#current_design idct_chip
#link
###YBR ADD uniquify###
uniquify
###YBR ADD uniquify###
source fft.con

#Saving sdc
write_sdc ../outputs/fft_chip.sdc

#Compile
#set_flatten true
compile
# -map high

#Clean-up
###YBR ADD -blast_buses###
remove_unconnected_ports [find -hierarchy cell "*"]
remove_unconnected_ports -blast_buses [find -hierarchy cell "*"]
###YBR ADD -blast_buses###
#Report
report_constraint -all_violators > ../reports/violators_clk_with_driving.rpt
report_area > ../reports/area_report_clk_with_driving.rpt
report_timing > ../reports/timing_report_clk_with_driving.rpt

#Saving Designs after Compile
change_names -rule verilog -hier

###YBR
write -format verilog -hier -out ../outputs/fft_chip.v
write -format ddc -hier -out ../outputs/fft_chip.ddc
