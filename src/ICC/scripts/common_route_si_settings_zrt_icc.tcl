##########################################################################################
# Version: C-2009.06 (Jun 29th, 2009)
# Copyright (C) 2007-2009 Synopsys, Inc. All rights reserved.
##########################################################################################

echo "\tLoading :\t\t [info script]"

#########################################
#           TIMING OPTIONS              #
#########################################

## By default, Xtalk Delta Delay is enabled for all flows
set_si_options -delta_delay true  \
               -route_xtalk_prevention true \
               -route_xtalk_prevention_threshold 0.25

## For the QoR flow, we also enable min_delta_delay
set_si_options -min_delta_delay true 

#########################################
#    MAX_TRAN FIXING                    #
#########################################
## From 2006.06-SP4 onwards, route_opt will NOT fix nor report Delta Max 
## Tran violations.  Hence all max_tran violations exclude the portion 
## that is introduced by Xtalk.
## If you want to change this behavior, and fix max_transition violations 
## including these caused by Xtalk, please use the switch -max_transition_mode
## in set_si_options. Keep in mind that you can expect a runtime hit of up 
## to 2x in DRC fixing during route_opt.

# set_si_options -delta_delay true \
#                -route_xtalk_prevention true \
#                -route_xtalk_prevention_threshold 0.25 \
#                -max_transition_mode total_slew
 
#########################################
#      ADVANCED TIMING FEATURES         #
#########################################

## if static noise (aka glitches) needs to be reduced, please use the extra options below :
# set_si_options -delta_delay true \
#                -static_noise true \
#                -static_noise_threshold_above_low 0.35 \
#                -static_noise_threshold_below_high 0.35 \
#                -route_xtalk_prevention true \
#                -route_xtalk_prevention_threshold 0.25


set_delay_calculation -arnoldi
set ICC_FULL_ARNOLDI FALSE 
if {$ICC_FULL_ARNOLDI} { 
    echo "SCRIPT-Info : Enabling Arnoldi for all nets of the design"
    set rc_rd_more_than_rnet_arnoldi_threshold 100000000
} 

## if you want to enable Timing Windows during XDD calculation, please use :
#  set_si_options -timing_window true

########################################
#          ZROUTE OPTIONS              #
########################################

#### MultiThreading - extraction, MCMM timing, ZRoute
set ICC_NUM_CORES 1
set_host_options -max_cores $ICC_NUM_CORES

## Zroute Global route options
# set_route_zrt_global_options 

## Zroute Track assign options
# set_route_zrt_track_options 

## Zroute Detail route options
# set_route_zrt_detail_options

## Set Area Critical Range
## Typical value: 3-4 percent of critical clock period
#set_app_var physopt_area_critical_range 0.32 

## Set Power Critical Range
## Typical value: 3-4 percent of critical clock period
#set_app_var physopt_power_critical_range 0.32

########################################
#       ROUTE_OPT ONLY OPTIONS         #
########################################

## Disable fanout opto during route_opt. Max fanout has to be taken care of earlier in the flow.
set_app_var psyn_onroute_disable_fanout_drc true

##default is false - set to skip second report_qor in route_opt
set_app_var routeopt_skip_report_qor true  

# set_app_var routeopt_xtalk_reduction_setup_threshold 0.10

set ICC_DBL_VIA TRUE
set ICC_DBL_VIA_FLOW_EFFORT "LOW"
if {$ICC_DBL_VIA } {
  define_zrt_redundant_vias -from_via { VIA12A VIA12B VIA23 VIA34 VIA45 VIA56 } \
        -to_via { VIA12A VIA12B VIA23 VIA34 VIA45 VIA56 } \
        -to_via_x_size { 1 1 1 1 1 1 }\
        -to_via_y_size { 2 2 2 2 2 2 }

  if {$ICC_DBL_VIA_FLOW_EFFORT != "LOW"} {
    set_route_zrt_detail_options -optimize_wire_via_effort_level high    ;#low is default
    set_route_zrt_common_options -concurrent_redundant_via_mode reserve_space
  }
  if {$ICC_DBL_VIA_FLOW_EFFORT == "HIGH"} {
    #low is default: low|medium|high
    set_route_zrt_common_options -concurrent_redundant_via_effort_level medium   
    #set_route_zrt_common_options -eco_route_concurrent_redundant_via_mode reserve_space
    #low is default: low|medium|high
    #set_route_zrt_common_options -eco_route_concurrent_redundant_via_effort_level low  
  }
}

set ICC_FIX_ANTENNA 0
set ANTENNA_RULES_FILE ""

if {$ICC_FIX_ANTENNA } {

  ########################################
  #        ANTENNA JOGGING FIXING        #
  ########################################
 
  if {[file exists [which $ANTENNA_RULES_FILE]]} {
       set_route_zrt_detail_options -antenna true
       source -echo $ANTENNA_RULES_FILE
   } else {
       echo "SCRIPT-Info : Antenna rules file does not exist"
       echo "SCRIPT-Info : Turning off antenna fixing"
       set_route_zrt_detail_options -antenna false
   }

} else {
       echo "SCRIPT-Info : Turning off antenna fixing"
       set_route_zrt_detail_options -antenna false
  }
  
