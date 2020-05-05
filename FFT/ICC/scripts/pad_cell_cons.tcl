# Create corners and P/G pads
create_cell {CornerLL CornerLR CornerTR CornerTL} PCORNERW
create_cell {vss1_l vss1_r vss1_t vss1_b vss3_l vss3_r} PVSS1W
create_cell {vdd1_l vdd1_r vdd1_t vdd1_b vdd3_l vdd3_r} PVDD1W
create_cell {vss2_l vss2_r vss2_t vss2_b} PVSS2W
create_cell {vdd2_l vdd2_r vdd2_t vdd2_b} PVDD2W

# Define corner pad locations
set_pad_physical_constraints -pad_name "CornerTL" -side 1
set_pad_physical_constraints -pad_name "CornerTR" -side 2
set_pad_physical_constraints -pad_name "CornerLR" -side 3
set_pad_physical_constraints -pad_name "CornerLL" -side 4

# Define signal and PG pad locations

# Left side
set_pad_physical_constraints -pad_name "PIW_data_in0" -side 1 -order 1
set_pad_physical_constraints -pad_name "PIW_data_in1" -side 1 -order 2
set_pad_physical_constraints -pad_name "PIW_data_in2" -side 1 -order 3
set_pad_physical_constraints -pad_name "PIW_data_in3" -side 1 -order 4
set_pad_physical_constraints -pad_name "PIW_data_in4" -side 1 -order 5
set_pad_physical_constraints -pad_name "PIW_data_in5" -side 1 -order 6
set_pad_physical_constraints -pad_name "PIW_data_in6" -side 1 -order 7
set_pad_physical_constraints -pad_name "vdd1_l" -side 1 -order 8
set_pad_physical_constraints -pad_name "vss1_l" -side 1 -order 9
set_pad_physical_constraints -pad_name "PIW_data_in7" -side 1 -order 10
set_pad_physical_constraints -pad_name "PIW_data_in8" -side 1 -order 11
set_pad_physical_constraints -pad_name "vdd2_l" -side 1 -order 12
set_pad_physical_constraints -pad_name "vss2_l" -side 1 -order 13
set_pad_physical_constraints -pad_name "PIW_data_in9" -side 1 -order 14
set_pad_physical_constraints -pad_name "PIW_data_in10" -side 1 -order 15
set_pad_physical_constraints -pad_name "vdd3_l" -side 1 -order 16
set_pad_physical_constraints -pad_name "vss3_l" -side 1 -order 17
set_pad_physical_constraints -pad_name "PIW_data_in11" -side 1 -order 18
set_pad_physical_constraints -pad_name "PIW_data_in12" -side 1 -order 19
set_pad_physical_constraints -pad_name "PIW_data_in13" -side 1 -order 20
set_pad_physical_constraints -pad_name "PIW_data_in14" -side 1 -order 21
set_pad_physical_constraints -pad_name "PIW_data_in15" -side 1 -order 22
set_pad_physical_constraints -pad_name "PIW_data_in16" -side 1 -order 23


# Top side
set_pad_physical_constraints -pad_name "PIW_data_in17" -side 2 -order 1
set_pad_physical_constraints -pad_name "PIW_data_in18" -side 2 -order 2
set_pad_physical_constraints -pad_name "PIW_data_in19" -side 2 -order 3
set_pad_physical_constraints -pad_name "PIW_data_in20" -side 2 -order 4
set_pad_physical_constraints -pad_name "PIW_data_in21" -side 2 -order 5
set_pad_physical_constraints -pad_name "PIW_data_in22" -side 2 -order 6
set_pad_physical_constraints -pad_name "PIW_data_in23" -side 2 -order 7
set_pad_physical_constraints -pad_name "PIW_data_in24" -side 2 -order 8
set_pad_physical_constraints -pad_name "PIW_data_in25" -side 2 -order 9
set_pad_physical_constraints -pad_name "vdd2_t" -side 2 -order 10
set_pad_physical_constraints -pad_name "vdd1_t" -side 2 -order 11
set_pad_physical_constraints -pad_name "vss1_t" -side 2 -order 12
set_pad_physical_constraints -pad_name "vss2_t" -side 2 -order 13
set_pad_physical_constraints -pad_name "PIW_data_in26" -side 2 -order 14
set_pad_physical_constraints -pad_name "PIW_data_in27" -side 2 -order 15
set_pad_physical_constraints -pad_name "PIW_data_in28" -side 2 -order 16
set_pad_physical_constraints -pad_name "PIW_data_in29" -side 2 -order 17
set_pad_physical_constraints -pad_name "PIW_data_in30" -side 2 -order 18
set_pad_physical_constraints -pad_name "PIW_data_in31" -side 2 -order 19
set_pad_physical_constraints -pad_name "PIW_data_in32" -side 2 -order 20
set_pad_physical_constraints -pad_name "PIW_data_in33" -side 2 -order 21
set_pad_physical_constraints -pad_name "PIW_clk" -side 2 -order 22

# Right side
set_pad_physical_constraints -pad_name "PO8W_data_out0" -side 3 -order 1
set_pad_physical_constraints -pad_name "PO8W_data_out1" -side 3 -order 2
set_pad_physical_constraints -pad_name "PO8W_data_out2" -side 3 -order 3
set_pad_physical_constraints -pad_name "PO8W_data_out3" -side 3 -order 4
set_pad_physical_constraints -pad_name "PO8W_data_out4" -side 3 -order 5
set_pad_physical_constraints -pad_name "PO8W_data_out5" -side 3 -order 6
set_pad_physical_constraints -pad_name "PO8W_data_out6" -side 3 -order 7
set_pad_physical_constraints -pad_name "vdd1_r" -side 3 -order 8
set_pad_physical_constraints -pad_name "vss1_r" -side 3 -order 9
set_pad_physical_constraints -pad_name "PO8W_data_out7" -side 3 -order 10
set_pad_physical_constraints -pad_name "PO8W_data_out8" -side 3 -order 11
set_pad_physical_constraints -pad_name "vdd2_r" -side 3 -order 12
set_pad_physical_constraints -pad_name "vss2_r" -side 3 -order 13
set_pad_physical_constraints -pad_name "PO8W_data_out9" -side 3 -order 14
set_pad_physical_constraints -pad_name "PO8W_data_out10" -side 3 -order 15
set_pad_physical_constraints -pad_name "PO8W_data_out11" -side 3 -order 16
set_pad_physical_constraints -pad_name "vdd3_r" -side 3 -order 17
set_pad_physical_constraints -pad_name "vss3_r" -side 3 -order 18
set_pad_physical_constraints -pad_name "PO8W_data_out12" -side 3 -order 19
set_pad_physical_constraints -pad_name "PO8W_data_out13" -side 3 -order 20
set_pad_physical_constraints -pad_name "PO8W_data_out14" -side 3 -order 21
set_pad_physical_constraints -pad_name "PO8W_data_out15" -side 3 -order 22
set_pad_physical_constraints -pad_name "PO8W_data_out16" -side 3 -order 23

# Bottom side
set_pad_physical_constraints -pad_name "PO8W_data_out17" -side 4 -order 1
set_pad_physical_constraints -pad_name "PO8W_data_out18" -side 4 -order 2
set_pad_physical_constraints -pad_name "PO8W_data_out19" -side 4 -order 3
set_pad_physical_constraints -pad_name "PO8W_data_out20" -side 4 -order 4
set_pad_physical_constraints -pad_name "PO8W_data_out21" -side 4 -order 5
set_pad_physical_constraints -pad_name "PO8W_data_out22" -side 4 -order 6
set_pad_physical_constraints -pad_name "PO8W_data_out23" -side 4 -order 7
set_pad_physical_constraints -pad_name "PO8W_data_out24" -side 4 -order 8
set_pad_physical_constraints -pad_name "PO8W_data_out25" -side 4 -order 9
set_pad_physical_constraints -pad_name "vdd2_b" -side 4 -order 10
set_pad_physical_constraints -pad_name "vdd1_b" -side 4 -order 11
set_pad_physical_constraints -pad_name "vss1_b" -side 4 -order 12
set_pad_physical_constraints -pad_name "vss2_b" -side 4 -order 13
set_pad_physical_constraints -pad_name "PO8W_data_out26" -side 4 -order 14
set_pad_physical_constraints -pad_name "PO8W_data_out27" -side 4 -order 15
set_pad_physical_constraints -pad_name "PO8W_data_out28" -side 4 -order 16
set_pad_physical_constraints -pad_name "PO8W_data_out29" -side 4 -order 17
set_pad_physical_constraints -pad_name "PO8W_data_out30" -side 4 -order 18
set_pad_physical_constraints -pad_name "PO8W_data_out31" -side 4 -order 19
set_pad_physical_constraints -pad_name "PO8W_data_out32" -side 4 -order 20
set_pad_physical_constraints -pad_name "PO8W_data_out33" -side 4 -order 21
set_pad_physical_constraints -pad_name "PIW_rst_n" -side 3 -order 22

