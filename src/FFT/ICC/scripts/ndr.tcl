define_routing_rule  CLOCK_DOUBLE_SPACING \
	-spacings {METAL3 0.42 METAL4 0.63 METAL5 0.82}

set_clock_tree_options -routing_rule CLOCK_DOUBLE_SPACING \
	-layer_list {METAL3 METAL5} -use_default_routing_for_sinks 1

