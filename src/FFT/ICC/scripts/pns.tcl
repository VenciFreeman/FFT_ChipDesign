### Complete the power grid structure: Ring around individual PLL macro, vertical/horizontal straps, and core ring:

set_fp_rail_constraints -add_layer  -layer METAL5 -direction horizontal -max_strap 24 -min_strap 2 -min_width 2 -max_width 4 -spacing 0.6
set_fp_rail_constraints -add_layer  -layer METAL4 -direction vertical -max_strap 24 -min_strap 2 -min_width 2 -max_width 4 -spacing 0.6
set_fp_rail_constraints -set_ring -horizontal_ring_layer { METAL3 } -vertical_ring_layer { METAL2 } -ring_max_width 12 -ring_min_width 10 -extend_strap core_ring
set_fp_rail_constraints -set_global   -no_routing_over_hard_macros
synthesize_fp_rail -nets {VDD VSS} -voltage_supply 1.98 -synthesize_power_plan -power_budget 50 -pad_masters { PVSS1W PVDD1W }
