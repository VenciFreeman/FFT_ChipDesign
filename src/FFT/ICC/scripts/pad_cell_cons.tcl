# Create corners and P/G pads
create_cell {CornerLL CornerLR CornerTR CornerTL} PCORNERW
create_cell {vss1_l1 vss1_l2 vss1_r1 vss1_r2 vss1_t vss1_b} PVSS1W
create_cell {vdd1_l1 vdd1_l2 vdd1_r1 vdd1_r2 vdd1_t vdd1_b} PVDD1W
create_cell {vss2_l vss2_r vss2_t vss2_b} PVSS2W
create_cell {vdd2_l vdd2_r vdd2_t vdd2_b} PVDD2W

# Define corner pad locations
set_pad_physical_constraints -pad_name "CornerTL" -side 1
set_pad_physical_constraints -pad_name "CornerTR" -side 2
set_pad_physical_constraints -pad_name "CornerLR" -side 3
set_pad_physical_constraints -pad_name "CornerLL" -side 4

# Define signal and PG pad locations

# Left side
set_pad_physical_constraints -pad_name "PIW_din0" -side 1 -order 1
set_pad_physical_constraints -pad_name "PIW_din1" -side 1 -order 2
set_pad_physical_constraints -pad_name "PIW_din2" -side 1 -order 3
set_pad_physical_constraints -pad_name "PIW_din3" -side 1 -order 4
set_pad_physical_constraints -pad_name "PIW_din4" -side 1 -order 5
set_pad_physical_constraints -pad_name "PIW_din5" -side 1 -order 6
set_pad_physical_constraints -pad_name "PIW_din6" -side 1 -order 7
set_pad_physical_constraints -pad_name "vdd1_l1" -side 1 -order 8
set_pad_physical_constraints -pad_name "vss1_l1" -side 1 -order 9
set_pad_physical_constraints -pad_name "PIW_din7" -side 1 -order 10
set_pad_physical_constraints -pad_name "PIW_din8" -side 1 -order 11
set_pad_physical_constraints -pad_name "vdd2_l" -side 1 -order 12
set_pad_physical_constraints -pad_name "vss2_l" -side 1 -order 13
set_pad_physical_constraints -pad_name "PIW_din9" -side 1 -order 14
set_pad_physical_constraints -pad_name "PIW_din10" -side 1 -order 15
set_pad_physical_constraints -pad_name "vdd1_l2" -side 1 -order 16
set_pad_physical_constraints -pad_name "vss1_l2" -side 1 -order 17
set_pad_physical_constraints -pad_name "PIW_din11" -side 1 -order 18
set_pad_physical_constraints -pad_name "PIW_din12" -side 1 -order 19
set_pad_physical_constraints -pad_name "PIW_din13" -side 1 -order 20
set_pad_physical_constraints -pad_name "PIW_din14" -side 1 -order 21
set_pad_physical_constraints -pad_name "PIW_din15" -side 1 -order 22
set_pad_physical_constraints -pad_name "PIW_din16" -side 1 -order 23
set_pad_physical_constraints -pad_name "PIW_din17" -side 1 -order 24

# Top side
set_pad_physical_constraints -pad_name "PIW_din18" -side 2 -order 1
set_pad_physical_constraints -pad_name "PIW_din19" -side 2 -order 2
set_pad_physical_constraints -pad_name "PIW_din20" -side 2 -order 3
set_pad_physical_constraints -pad_name "PIW_din21" -side 2 -order 4
set_pad_physical_constraints -pad_name "PIW_din22" -side 2 -order 5
set_pad_physical_constraints -pad_name "PIW_din23" -side 2 -order 6
set_pad_physical_constraints -pad_name "PIW_din24" -side 2 -order 7
set_pad_physical_constraints -pad_name "PIW_din25" -side 2 -order 8
set_pad_physical_constraints -pad_name "PIW_din26" -side 2 -order 9
set_pad_physical_constraints -pad_name "vdd2_t" -side 2 -order 10
set_pad_physical_constraints -pad_name "vdd1_t" -side 2 -order 11
set_pad_physical_constraints -pad_name "vss1_t" -side 2 -order 12
set_pad_physical_constraints -pad_name "vss2_t" -side 2 -order 13
set_pad_physical_constraints -pad_name "PIW_din27" -side 2 -order 14
set_pad_physical_constraints -pad_name "PIW_din28" -side 2 -order 15
set_pad_physical_constraints -pad_name "PIW_din29" -side 2 -order 16
set_pad_physical_constraints -pad_name "PIW_din30" -side 2 -order 17
set_pad_physical_constraints -pad_name "PIW_din31" -side 2 -order 18
set_pad_physical_constraints -pad_name "PIW_din32" -side 2 -order 19
set_pad_physical_constraints -pad_name "PIW_din33" -side 2 -order 20
set_pad_physical_constraints -pad_name "PIW_clk" -side 2 -order 21
set_pad_physical_constraints -pad_name "PIW_rst_n" -side 2 -order 22

# Right side
set_pad_physical_constraints -pad_name "PO8W_dout0" -side 3 -order 1
set_pad_physical_constraints -pad_name "PO8W_dout1" -side 3 -order 2
set_pad_physical_constraints -pad_name "PO8W_dout2" -side 3 -order 3
set_pad_physical_constraints -pad_name "PO8W_dout3" -side 3 -order 4
set_pad_physical_constraints -pad_name "PO8W_dout4" -side 3 -order 5
set_pad_physical_constraints -pad_name "PO8W_dout5" -side 3 -order 6
set_pad_physical_constraints -pad_name "vdd1_r1" -side 3 -order 7
set_pad_physical_constraints -pad_name "vss1_r1" -side 3 -order 8
set_pad_physical_constraints -pad_name "PO8W_dout6" -side 3 -order 9
set_pad_physical_constraints -pad_name "PO8W_dout7" -side 3 -order 10
set_pad_physical_constraints -pad_name "PO8W_dout8" -side 3 -order 11
set_pad_physical_constraints -pad_name "vdd2_r" -side 3 -order 12
set_pad_physical_constraints -pad_name "vss2_r" -side 3 -order 13
set_pad_physical_constraints -pad_name "PO8W_dout9" -side 3 -order 14
set_pad_physical_constraints -pad_name "PO8W_dout10" -side 3 -order 15
set_pad_physical_constraints -pad_name "PO8W_dout11" -side 3 -order 16
set_pad_physical_constraints -pad_name "vdd1_r2" -side 3 -order 17
set_pad_physical_constraints -pad_name "vss1_r2" -side 3 -order 18
set_pad_physical_constraints -pad_name "PO8W_dout12" -side 3 -order 19
set_pad_physical_constraints -pad_name "PO8W_dout13" -side 3 -order 20
set_pad_physical_constraints -pad_name "PO8W_dout14" -side 3 -order 21
set_pad_physical_constraints -pad_name "PO8W_dout15" -side 3 -order 22
set_pad_physical_constraints -pad_name "PO8W_dout16" -side 3 -order 23

# Bottom side
set_pad_physical_constraints -pad_name "PO8W_dout17" -side 4 -order 1
set_pad_physical_constraints -pad_name "PO8W_dout18" -side 4 -order 2
set_pad_physical_constraints -pad_name "PO8W_dout19" -side 4 -order 3
set_pad_physical_constraints -pad_name "PO8W_dout20" -side 4 -order 4
set_pad_physical_constraints -pad_name "PO8W_dout21" -side 4 -order 5
set_pad_physical_constraints -pad_name "PO8W_dout22" -side 4 -order 6
set_pad_physical_constraints -pad_name "PO8W_dout23" -side 4 -order 7
set_pad_physical_constraints -pad_name "PO8W_dout24" -side 4 -order 8
set_pad_physical_constraints -pad_name "PO8W_dout25" -side 4 -order 9
set_pad_physical_constraints -pad_name "vdd2_b" -side 4 -order 10
set_pad_physical_constraints -pad_name "vdd1_b" -side 4 -order 11
set_pad_physical_constraints -pad_name "vss1_b" -side 4 -order 12
set_pad_physical_constraints -pad_name "vss2_b" -side 4 -order 13
set_pad_physical_constraints -pad_name "PO8W_dout26" -side 4 -order 14
set_pad_physical_constraints -pad_name "PO8W_dout27" -side 4 -order 15
set_pad_physical_constraints -pad_name "PO8W_dout28" -side 4 -order 16
set_pad_physical_constraints -pad_name "PO8W_dout29" -side 4 -order 17
set_pad_physical_constraints -pad_name "PO8W_dout30" -side 4 -order 18
set_pad_physical_constraints -pad_name "PO8W_dout31" -side 4 -order 19
set_pad_physical_constraints -pad_name "PO8W_dout32" -side 4 -order 20
set_pad_physical_constraints -pad_name "PO8W_dout33" -side 4 -order 21

