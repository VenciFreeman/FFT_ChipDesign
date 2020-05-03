##########################################################################################
# Version: C-2009.06 (Jun 29th, 2009)
# Copyright (C) 2007-2009 Synopsys, Inc. All rights reserved.
##########################################################################################


echo "\tLoading :\t [info script]"

# Placement Common Session Options - set in all sessions

## Set Min/Max Routing Layers
#if { $MAX_ROUTING_LAYER != ""} {set_ignored_layers -max_routing_layer $MAX_ROUTING_LAYER}
#if { $MIN_ROUTING_LAYER != ""} {set_ignored_layers -min_routing_layer $MIN_ROUTING_LAYER}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Placement keepout variable settings
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
set_app_var physopt_hard_keepout_distance 5
set_app_var placer_soft_keepout_channel_width 15

## Set PNET Options to control cel placement around P/G straps 
remove_pnet_options
set_pnet_options -partial {METAL2 METAL3 METAL4}
report_pnet_options

## Improved congestion analysis by using Global Route info 
# echo "SCRIPT-Info : Enabling Global Gouter during placement"
# set_app_var placer_enable_enhanced_router true 

## it is recommended to use the default of the tool
## in case it needs to change ( e.g. for low utlization designs), use the command below :
 # set_congestion_options -max_util 0.85
