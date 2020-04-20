# Create corners and P/G pads
create_cell {CornerLL CornerLR CornerTR CornerTL} PCORNERW
create_cell {vss1_l vss1_r vss1_t vss1_b} PVSS1W
create_cell {vdd1_l vdd1_r vdd1_t vdd1_b} PVDD1W
create_cell {vss2_l vss2_r vss2_t vss2_b} PVSS2W
create_cell {vdd2_l vdd2_r vdd2_t vdd2_b} PVDD2W

# Define corner pad locations
set_pad_physical_constraints -pad_name "CornerTL" -side 1
set_pad_physical_constraints -pad_name "CornerTR" -side 2
set_pad_physical_constraints -pad_name "CornerLR" -side 3
set_pad_physical_constraints -pad_name "CornerLL" -side 4

# Define signal and PG pad locations

# Left side
set_pad_physical_constraints -pad_name "PIW_start" -side 1 -order 1
set_pad_physical_constraints -pad_name "PIW_mode0" -side 1 -order 2
set_pad_physical_constraints -pad_name "PIW_mode1" -side 1 -order 3
set_pad_physical_constraints -pad_name "PIW_mode2" -side 1 -order 4
set_pad_physical_constraints -pad_name "PIW_din0" -side 1 -order 5
set_pad_physical_constraints -pad_name "PIW_din1" -side 1 -order 6
set_pad_physical_constraints -pad_name "PIW_din2" -side 1 -order 7
set_pad_physical_constraints -pad_name "vdd2_l" -side 1 -order 8
set_pad_physical_constraints -pad_name "vdd1_l" -side 1 -order 9
set_pad_physical_constraints -pad_name "vss1_l" -side 1 -order 10
set_pad_physical_constraints -pad_name "vss2_l" -side 1 -order 11
set_pad_physical_constraints -pad_name "PIW_din3" -side 1 -order 12
set_pad_physical_constraints -pad_name "PIW_din4" -side 1 -order 13
set_pad_physical_constraints -pad_name "PIW_din5" -side 1 -order 14

# Top side
set_pad_physical_constraints -pad_name "PIW_din6" -side 2 -order 1
set_pad_physical_constraints -pad_name "PIW_din7" -side 2 -order 2
set_pad_physical_constraints -pad_name "PIW_din8" -side 2 -order 3
set_pad_physical_constraints -pad_name "PIW_din9" -side 2 -order 4
set_pad_physical_constraints -pad_name "PIW_din10" -side 2 -order 5
set_pad_physical_constraints -pad_name "PIW_din11" -side 2 -order 6
set_pad_physical_constraints -pad_name "vdd2_t" -side 2 -order 7
set_pad_physical_constraints -pad_name "vdd1_t" -side 2 -order 8
set_pad_physical_constraints -pad_name "vss1_t" -side 2 -order 9
set_pad_physical_constraints -pad_name "vss2_t" -side 2 -order 10
set_pad_physical_constraints -pad_name "PIW_din12" -side 2 -order 11
set_pad_physical_constraints -pad_name "PIW_din13" -side 2 -order 12
set_pad_physical_constraints -pad_name "PIW_din14" -side 2 -order 13
set_pad_physical_constraints -pad_name "PIW_din15" -side 2 -order 14

# Right side
set_pad_physical_constraints -pad_name "PO2W_dout0" -side 3 -order 1
set_pad_physical_constraints -pad_name "PO2W_dout1" -side 3 -order 2
set_pad_physical_constraints -pad_name "PO2W_dout2" -side 3 -order 3
set_pad_physical_constraints -pad_name "PO2W_dout3" -side 3 -order 4
set_pad_physical_constraints -pad_name "PO2W_dout4" -side 3 -order 5
set_pad_physical_constraints -pad_name "vdd2_r" -side 3 -order 6
set_pad_physical_constraints -pad_name "vdd1_r" -side 3 -order 7
set_pad_physical_constraints -pad_name "vss1_r" -side 3 -order 8
set_pad_physical_constraints -pad_name "vss2_r" -side 3 -order 9
set_pad_physical_constraints -pad_name "PO2W_dout5" -side 3 -order 10
set_pad_physical_constraints -pad_name "PO2W_dout6" -side 3 -order 11
set_pad_physical_constraints -pad_name "PO2W_dout7" -side 3 -order 12
set_pad_physical_constraints -pad_name "PO2W_dout8" -side 3 -order 13
set_pad_physical_constraints -pad_name "PO2W_dout9" -side 3 -order 14

# Bottom side
set_pad_physical_constraints -pad_name "PO2W_dout10" -side 4 -order 1
set_pad_physical_constraints -pad_name "PO2W_dout11" -side 4 -order 2
set_pad_physical_constraints -pad_name "vdd2_b" -side 4 -order 3
set_pad_physical_constraints -pad_name "vdd1_b" -side 4 -order 4
set_pad_physical_constraints -pad_name "vss1_b" -side 4 -order 5
set_pad_physical_constraints -pad_name "vss2_b" -side 4 -order 6
set_pad_physical_constraints -pad_name "PO2W_dout12" -side 4 -order 7
set_pad_physical_constraints -pad_name "PO2W_dout13" -side 4 -order 8
set_pad_physical_constraints -pad_name "PO2W_dout14" -side 4 -order 9
set_pad_physical_constraints -pad_name "PO2W_dout15" -side 4 -order 10
set_pad_physical_constraints -pad_name "PO2W_douten" -side 4 -order 11
set_pad_physical_constraints -pad_name "PIW_clk" -side 4 -order 12
set_pad_physical_constraints -pad_name "PIW_rst_n" -side 4 -order 13
