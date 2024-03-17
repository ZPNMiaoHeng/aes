#inin_design_icc.tcl
source ../rm_setup/lcrm_setup.tcl
source -echo ../rm_setup/icc_setup.tcl

set mw_use_layer_enhancement true
extend_mw_layers
########################################################################################
# Design Creation 
########################################################################################
	create_mw_lib ${DESIGN_NAME}_LIB -open -tech $TECH_FILE \
			-mw_reference_library $MW_REFERENCE_LIB_DIRS
read_verilog -top $DESIGN_NAME $ICC_IN_VERILOG_NETLIST_FILE
uniquify_fp_mw_cel 
current  _design $DESIGN_NAME 
save_mw_cel -as $DESIGN_NAME
set_tlu_plus_file -max_tluplus $TLUPLUS_MAX_FILE -tech2itf $MAP_FILE
########################################################################################
#connect to supply nets
########################################################################################i 
derive_pg_connection -power_net VDD -power_pin VDD \
		     -ground_net VSS -ground_pin VSS
derive_pg_connection -power_net VDD -ground_net VSS -tie

check_mv_design
########################################################################################
#Apply and Check Timing Constraints
########################################################################################
read_sdc $ICC_IN_SDC_FILE
check_timing
report_timing_requirements
report_disable_timing
report_case_analysis
########################################################################################
#Check the clocks
########################################################################################
report_clock
report_clock -skew
########################################################################################
#Timing and optimization controls
########################################################################################
source ../scr/common_optimization_setting_icc.tcl
set_zero_interconnect_delay_mode true
report_constraint -all
report_timing
set_zero_interconnect_delay_mode false
remove_ideal_network [get_ports "rst"]
########################################################################################
#Save the cel after data setup
########################################################################################
save_mw_cel -as data_setup
