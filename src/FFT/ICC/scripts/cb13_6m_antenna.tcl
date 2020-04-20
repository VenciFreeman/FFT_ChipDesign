#####################################################################################
# Define Antenna Rules

# For lab use only!  Obtain correct value from your library vendor.
set ratio 60
set metal_ratio 60
set_parameter -module droute -name defaultDiodeProtect -value 0.5
set dmode 2

set_parameter -module droute -name doAntennaConx -value 4
# report_parameter -module droute

#dbClearLibAntennaRules _libId
remove_antenna_rules

#dbDefineAntennaRule _libId 1 2 125 20
define_antenna_rule -mode 1 -diode_mode $dmode -metal_ratio $metal_ratio -cut_ratio 20

#dbAddAntennaLayerRule _libId 1 "METAL" 125 '( 0.203 0 400 3700)
define_antenna_layer_rule -mode 1 -layer "METAL"  -ratio $ratio  -diode_ratio {0.203 0 400 3700}
define_antenna_layer_rule -mode 1 -layer "METAL2" -ratio $ratio  -diode_ratio {0.203 0 400 3700}
define_antenna_layer_rule -mode 1 -layer "METAL3" -ratio $ratio  -diode_ratio {0.203 0 400 3700}
define_antenna_layer_rule -mode 1 -layer "METAL4" -ratio $ratio  -diode_ratio {0.203 0 400 3700}
define_antenna_layer_rule -mode 1 -layer "METAL5" -ratio $ratio  -diode_ratio {0.203 0 400 3700}
define_antenna_layer_rule -mode 1 -layer "METAL6" -ratio $ratio  -diode_ratio {0.203 0 8000 50000}

define_antenna_layer_rule -mode 1 -layer "VIA"  -ratio 20 -diode_ratio {0.203 0 83.33 75}
define_antenna_layer_rule -mode 1 -layer "VIA2" -ratio 20 -diode_ratio {0.203 0 83.33 75}
define_antenna_layer_rule -mode 1 -layer "VIA3" -ratio 20 -diode_ratio {0.203 0 83.33 75}
define_antenna_layer_rule -mode 1 -layer "VIA4" -ratio 20 -diode_ratio {0.203 0 83.33 75}
define_antenna_layer_rule -mode 1 -layer "VIA5" -ratio 20 -diode_ratio {0.203 0 83.33 75}

#report_antenna_rules
#report_antenna_ratio




# Man Pages:
#####################################################################################
# 
# define_antenna_rule   2.  Synopsys Commands       Command Reference
# 
# NAME
#           define_antenna_rule
#                          Defines an advanced antenna rule for the
#                          specified mode and stores it in the
#                          library.
# 
# SYNTAX
#           status_value define_antenna_rule
#                  [mw_lib]
#                  -mode mode
#                  -diode_mode diode_mode
#                  -metal_ratio metal_ratio
#                  -cut_ratio cut_ratio
#                  [-protected_metal_scale metal_scale]
#                  [-protected_cut_scale cut_scale]
# 
#   Data Types
#           mw_lib          list
#           mode            int
#           diode_mode      int
#           metal_ratio     float
#           cut_ratio       float
#           metal_scale     float
#           cut_scale       float
# 
# ARGUMENTS
#           mw_lib         Specifies the Milkyway library to be
#                          updated. The value of mw_lib can be a
#                          library name or a one-element collection
#                          of a library. The mw_lib option is
#                          optional. The default is to use the
#                          current Milkyway library.
# 
#           -mode mode     Defines the way antenna areas are
#                          computed.  Valid values: 1-Uses polygon
#                          area, ignoring all lower-layer segments.
#                          2-Uses polygon area, including all
#                          lower-layer segments to the input pins.
#                          3-Uses polygon area, including all
#                          lower-layer segments. 4-Uses side-wall
#                          area, ignoring all lower-layer segments.
#                          5-Uses side-wall area, including all
#                          lower-layer segments to the input pins.
#                          6-Uses side-wall area, including all
#                          lower-layer segments.
# 
#                          Note that only one rule can be defined
#                          for every mode. If two commands contain
#                          the same mode number, the second command
#                          will overwrite the first one.
# 
#           -diode_mode diode_mode
#                          Defines the protection capability of the
#                          diode. By default, all output pins are
#                          considered as a diode.  Valid values:
#                          0-Output pin cannot protect antenna.
#                          1-Any diode can provide unlimited
#                          protection.  2-Diode protection is
#                          limited; if more than one diode is
#                          connected, the largest value of max-
#                          antenna-ratio of all diodes will be
#                          used.  3-Diode protection is limited; if
#                          more than one diode is connected, the
#                          sum of max-antenna-ratio of all diodes
#                          will be used.  4-Diode protection is
#                          limited; if more than one diode is
#                          connected, the sum of all diode-
#                          protection value of all diodes will be
#                          used to compute max-antenna-ratio.  5-
#                          Diode protection is limited; the maximum
#                          diode-protection value of all diodes
#                          will be used to calculate the equivalent
#                          gate area.  6-Diode protection is
#                          limited; the sum of all diode-protection
#                          value of all diodes will be used to
#                          calculate the equivalent gate area.  7-
#                          Diode protection is limited; the maximum
#                          diode-protection value of all diodes
#                          will be used to calculate the equivalent
#                          metal area.  8-Diode protection is
#                          limited; the sum of all diode-protection
#                          value of all diodes will be used to
#                          calculate the equivalent metal area.
# 
#           -metal_ratio metal_ratio
#                          Maximum allowable ratio for metal area
#                          to gate size if the metal layer is not
#                          defined with define_antenna_layer_rule.
# 
#                          If this value is zero, the ratio will be
#                          ignored.
# 
#                          Valid value: any non-negative number.
# 
#           -cut_ratio cut_ratio
#                          Maximum allowable ratio for cut area to
#                          gate size if the cut layer is not
#                          defined with define_antenna_layer_rule.
# 
#                          If this value is zero, the ratio will be
#                          ignored.
# 
#                          Valid value: any non-negative number.
# 
#           -protected_metal_scale metal_scale
#                          The option is used when mode is 2 or 5
#                          only.  The area of the metal layer that
#                          is protected by diode will be scaled by
#                          this value. By default, the value is set
#                          to 1.0.
# 
#                          If this value is zero, the scale will be
#                          ignored.
# 
#                          Valid value: any non-negative number.
# 
#           -protected_cut_scale cut_scale
#                          The option is used when mode is 2 or 5
#                          only.  The area of the cut layer that is
#                          protected by diode will be scaled by
#                          this value. By default, the value is set
#                          to 1.0.
# 
#                          If this value is zero, the scale will be
#                          ignored.
# 
#                          Valid value: any non-negative number.
# 
# DESCRIPTION
#           This command defines an advanced antenna rule for the
#           specified mode and stores it in the library.  The
#           command returns a status indicating success or failure.
# 
# EXAMPLES
#             prompt> define_antenna_rule -mode 1 -diode_mode 2       -metal_ratio 1000 -cut_ratio 0
# 
# SEE ALSO
#           define_antenna_layer_ratio_scale(2)
#           define_antenna_layer_rule(2)
#           report_antenna_rules(2)
#           remove_antenna_rules(2)
# 
#####################################################################################
# 
# NAME
#           define_antenna_layer_rule
#                          Defines an advanced antenna rule for the
#                          specified layer and stores it in the
#                          library.
# 
# SYNTAX
#           status_value define_antenna_layer_rule
#                  [mw_lib]
#                  -mode mode
#                  -layer layer_name
#                  -ratio ratio
#                  -diode_ratio diode_ratio
# 
#   Data Types
#           mw_lib          list
#           mode            int
#           layer_name      string
#           ratio           float
#           diode_ratio     list
# 
# ARGUMENTS
#           mw_lib         Specifies the Milkyway library to be
#                          updated. The value of mw_lib can be a
#                          library name or a one-element collection
#                          of a library. The mw_lib option is
#                          optional. The default is to use the
#                          current Milkyway library.
# 
#           -mode mode     Defines the way antenna areas are
#                          computed.  Valid values: 1-Uses polygon
#                          area, ignoring all lower-layer segments.
#                          2-Uses polygon area, including all
#                          lower-layer segments to the input pins.
#                          3-Uses polygon area, including all
#                          lower-layer segments. 4-Uses side-wall
#                          area, ignoring all lower-layer segments.
#                          5-Uses side-wall area, including all
#                          lower-layer segments to the input pins.
#                          6-Uses side-wall area, including all
#                          lower-layer segments.
# 
#                          Note that only one rule can be defined
#                          for every mode. If two commands contain
#                          the same mode number, the second command
#                          will overwrite the first one.
# 
#           -layer layer_name
#                          Name of the valid metal layer or cut
#                          layer in the library.
# 
#           -ratio ratio   The maximum allowable ratio of the
#                          antenna area to the gate area if the
#                          antenna is not protected by any diode.
# 
#                          Valid values: Any number.
# 
#           -diode_ratio diode_ratio
#                          Specify the allowable ratio in the
#                          antenna area to the gate area if the
#                          antenna is protected by a diode.  Valid
#                          values:  {v0 v1 v2 v3 [v4]}
# 
#                          If the output pin protection value is
#                          dp, the allowable ratio will be: ((dp +
#                          v1) * v2 + v3), if (dp) > (v0)
#                          layer_max_ratio, if (dp) <= (v0)
# 
#                          The dp is specified in the CLF file.
# 
#                          The default value of diode_ratio is {0 1
#                          0 0}.
# 
# DESCRIPTION
#           This command defines an advanced antenna rule for the
#           specified layer and stores it in the library.  The
#           command returns a status indicating success or failure.
# 
# EXAMPLES
#             prompt> define_antenna_layer_rule 4 metal1 400 {0.336 -0.5 400 2400
# 
# SEE ALSO
#           define_antenna_rule(2)
#           report_antenna_rules(2)
#           remove_antenna_rules(2)
# 
# 
#####################################################################################
