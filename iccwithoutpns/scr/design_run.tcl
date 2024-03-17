#design_run.tcl
source ../rm_setup/lcrm_setup.tcl
source -echo ../rm_setup/icc_setup.tcl

#open_mw_lib ${DESIGN_NAME}_LIB
copy_mw_cel -from data_setup -to floorplan
open_mw_cel floorplan
########################################################################################
#Create a Rectangular Block
########################################################################################
set_fp_pin_constraints \
			-block_level \
            -use_physical_constraints on \
			-hard_constraints {layer location}
#source ../scr/aestop_pad1021.tcl
source ../scr/pin.tcl

#Create_floorplan
initialize_rectilinear_block \
			-shape L \
			-control_type length \
			-core_side_dim {212 0 0 212} \
			-core_utilization 0.7 \
			-row_core_ratio 1.0 \
			-left_io2core 20 \
			-right_io2core 20 \
			-top_io2core 20 \
			-bottom_io2core 20
#create_floorplan \
		-control_type aspect_ratio \
		-core_utilization 0.7 \
		-core_aspect_ratio 1.3 \
		-bottom_io2core 100 \
		-left_io2core 100 \
		-top_io2core 100 \
		-right_io2core 100
#create_floorplan \
		-control_type width_and_height \
		-core_width  796 \
		-core_height 568 \
		-bottom_io2core 20 \
		-left_io2core 20 \
		-top_io2core 20 \
		-right_io2core 20 

#insert_pad_filler -cell "PFILL50W PFILL22W PFILL10W PFILL5W PFILL2W PFILL1W PFILL01W PFILL001W "

save_mw_cel -as floorplan


########################################################################################
#Specify Unrouting Layers
########################################################################################
set_ignored_layer -min_routing_layer M1 -max_routing_layer M4
report_ignored_layers 
#save_mw_cel -as ${DESIGN_NAME}_prepns

########################################################################################
#Add EndCAP TapCell
########################################################################################
#add_end_cap -respect_keepout -fill_corner -lib_cell FDCAPHD4 SEN_CAPL8 SEN_CAPR8
add_end_cap -fill_corner -mode bottom_left -lib_cell SEN_CAPL8
add_end_cap -fill_corner -mode upper_right -lib_cell SEN_CAPR8

#if {$rail_symmetric_width == "true"} {
#insert_stdcell_filler -cell_without_metal SEN_FILL_S_1
#} else {
#insert_stdcell_filler -cell_without_metal SEN_RAIL2TU1
#insert_stdcell_filler -cell_without_metal SEN_RAIL2TD1
#}

#set_preroute_drc_strategy -min_layer M2
#preroute_standard_cells -route_pins_on_layer M2 -fill_empty_rows
#remove_stdcell_filler -stdcell
#report_preroute_drc_strategy

add_tap_cell_array \
			-master_cell_name {SEN_TAPDS1T5} \
			-distance 40 \
			-pattern stagger_every_other_row \
			-respect_keepout

########################################################################################
#Create the Power Network
########################################################################################
########################################################################################
#Preforming Power Planning
########################################################################################

#create_power_ring strategy
#create_power_plan_regions core -core
#set_power_ring_strategy strategy_core -nets {VDD VSS} \
#	-core -template ../scr/ring.tpl:ring_around_va
#remove_power_plan_strategy -all
#set_power_plan_strategy power_plan \
		-nets {VDD VSS} -core \
		-extension {{{nets:VDD}{stop:outermost_ring}}{{nets:VSS}{stop:outermost_ring}}} \
		-template ../scr/pg_mesh.tpl:pg_mesh_top


#compile_power_plan -ring
#compile_power_plan
create_rectilinear_rings  -nets  {VDD VSS}  -offset {1 1} -width {0.2 0.2} -space {1 1} -layers {M5 M6}
derive_pg_connection -power_net VDD -power_pin VDD  \
		     -ground_net VSS -ground_pin VSS
derive_pg_connection -power_net {VDD} -ground_net {VSS} -tie



##########in gui op
create_power_straps  -direction horizontal  -start_at 73 -num_placement_strap 3 -increment_x_or_y 53 -nets  {VDD VSS}  -layer M5 -width 0.1
create_power_straps  -direction vertical  -start_at 73 -num_placement_strap 3 -increment_x_or_y 53 -nets  {VDD VSS}  -layer M6 -width 0.1
#create_power_straps \
		 -direction vertical \
		 -nets  {VDD VSS} \
		 -layer M6  \
		 -width 1 \
		 -configure rows \
		 -step 40 \
		 -pitch_within_group 2 \
		 -extend_low_ends to_first_target \
                 -extend_high_ends to_first_target \
		 -keep_floating_wire_pieces
#create_power_straps \
		 -direction horizontal \
		 -nets  {VDD VSS} \
		 -layer METAL5  \
		 -width 1 \
		 -configure rows \
		 -step 187 \
		 -pitch_within_group 2 \
		 -extend_low_ends to_first_target \
                 -extend_high_ends to_first_target \
		 -keep_floating_wire_pieces

derive_pg_connection -power_net VDD -power_pin VDD  \
		     -ground_net VSS -ground_pin VSS
derive_pg_connection -power_net {VDD} -ground_net {VSS} -tie


save_mw_cel -as  afterpns
#create_power_straps -undo
preroute_standard_cells -nets "VDD VSS" \
		-connect horizontal \
		-fill_empty_rows \
		-port_filter_mode off \
		-cell_master_filter_mode off \
		-cell_instance_filter_mode off \
		-voltage_area_filter_mode off

create_fp_placement -congestion -timing -no_hierarchy_gravity
route_zrt_global -congestion_map_only true -exploration true
save_mw_cel -as floorplan_finish
preroute_instances

#Coarse Placement
create_placement -effort high -timing_driven
#legalize Placement
legalize_placement -effort high
report_congestion


########################################################################################
#Placement
########################################################################################
#Placement Optimization
set_pnet_options -partial {M6 M5}
set_pnet_options -complete {M6 M5}

place_opt -effort high -congestion

report_congestion
report_timing > ../rpts/rt_afterp.rep
report_constraint -all_violators > ../rpts/rt_afterc.rep
save_mw_cel -as placement
########################################################################################
#CTS
########################################################################################
check_physical_design -stage pre_clock_opt
check_clock_tree

remove_ideal_network [get_ports clk]
remove_clock_uncertainty [all_clocks]

#set_clock_tree_option -target_early_delay 0.9
#set_clock_tree_options -target_skew 0.2
#report_clock_tree -settings

remove_routing_rules -all

define_routing_rule clk_dsdw \
	-default_reference_rule \
	-multiplier_spacing 2 \
	-multiplier_width 2

set_clock_tree_options -routing_rule clk_dsdw \
	-layer_list {M2 M3 M4} \
	-use_default_routing_for_sinks 1

set_clock_tree_references -references {SEN_BUF_S_1 SEN_BUF_S_2 SEN_BUF_S_3}
clock_opt -only_cts -no_clock_route

update_clock_latency
report_clock_tree > ../rpts/clock_tree.rep
report_clock_tree -summary
report_clock_timing -type skew

########################################################################################
#POST CTS
########################################################################################
#foreach_in_collection clk [get_clocks] {
#	remove_clock_latency $clk
#	remove_ideal_network [all_fanout -flat -clock_tree]
#	set_propagated_clock [get_attr $clk sources]
#	set_clock_uncertainty -setup 1 $clk
#	set_clock_uncertainty -hold 0.1 $clk
#}

set_fix_hold [all_clocks]

clock_opt -no_clock_route -fix_hold_all_clock


########################################################################################
#Route
########################################################################################
derive_pg_connection -power_net VDD -power_net VDD \
						-ground_net VSS -ground_pin VSS
derive_pg_connection -power_net {VDD} -ground_net {VSS} -tie
source $ANTENNAFILE
route_zrt_group -all_clock_nets
route_zrt_auto

report_timing > ../rpts/rt_afterpr.rep
report_constraint -all_violators > ../rpts/rc_afterpr.rep

focal_opt -drc_nets all -effort high
focal_opt -hold_endpoints all -effort high
############################################################################
## signoff verifyd
############################################################################
verify_zrt_route \
		-antenna true \
		-check_from_user_shapes true \
		-check_from_frozen_shapes true \
		-report_all_open_nets true  >  ../rpts/antenna_zrt_report.rpt
#route_zrt_detail -incremental true -initial_drc_from_input true
insert_stdcell_filler -cell_with_metal {SEN_DCAP64 SEN_DCAP32 SEN_DCAP16 SEN_DCAP8 SEN_DCAP4} -connect_to_power VDD -connect_to_ground VSS -metal_filler_coverage_area 1000

#check em rule
set_si_options -delta_delay true -min_delta_delay true
set_mw_technology_file -alf  $ALF_FILE_NAME $MW_REFERENCE_LIB_DIRS 
set_check_library_options -signal_em
check_library
fix_signal_em  > .../rpts/signal_em.rpt

### critical area reduction and reporting
#route_spreadwires -timing_driven -num_cpus $num_cpu
spread_zrt_wires 
report_critical_area > ../rpts/rcarea.rep
### Redundant via insertion
##insert_redundant_vias -via_array_no_swap -num_cpus $num_cpu -auto_mode insert
###insert_redundant_vias -num_cpus $num_cpu -from_via {via12 v1a23 via34 via45 via56} -to_via {via12 v1a23 via34 via45 via56} -to_via_y_size 2

#add std filler
#
insert_stdcell_filler -cell_with_metal {SEN_DCAP64 SEN_DCAP32 SEN_DCAP16 SEN_DCAP8 SEN_DCAP4} -connect_to_power VDD -connect_to_ground VSS -metal_filler_coverage_area 1000
insert_stdcell_filler \
		-cell_without_metal {SEN_FILL64 SEN_FILL32 SEN_FILL16 SEN_FILL12 SEN_FILL8 SEN_FILL6 SEN_FILL5 SEN_FILL4 SEN_FILL3 SEN_FILL2 SEN_FILL1}

##
derive_pg_connection -power_net VDD -power_pin VDD 
derive_pg_connection -ground_net VSS -ground_pin VSS 
derive_pg_connection -power_net VDD -power_pin VBP 
derive_pg_connection -ground_net VSS-ground_pin VBN 

verify_pg_nets
check_mv_design -verbose

##
#
### Incremental timing optimization
#verify_zrt_route
route_zrt_eco
verify_zrt_route > ../rpts/${DESIGN_NAME}.zroute_DRC.rpt

### Notch and Gap filling
insert_ng_filler

##ICC LVS run
verify_lvs -max_error 2000 > ../rpts/lvs.rpt
report_design -physical > ../rpts/pr_summary.rpt

##ICC DRC check
verify_drc > ../rpts/${DESIGN_NAME}.drc.rpt

### Design physical report
report_design -physical > ../rpts/${DESIGN_NAME}_PR_summary.rpt

#######################################################################################
#output gds ...
#source ../scr/create_text.tcl
#######################################################################################
save_mw_cel -as finish
save_mw_cel -as ${DESIGN_NAME}_allfinish
save_mw_cel
set_write_stream_options -map_layer ${hu40}/lef/streamout.map \
					     -output_pin {text geometry} \
						 -flatten_via 
write_stream -format gds \
		-lib_name ${DESIGN_NAME}_LIB \
		-cell_file  ${hu40}/gds/hu40npksdst.gds \
		-cells "${DESIGN_NAME}_allfinish" \
		../out/${DESIGN_NAME}.gds
write_verilog ../out/${DESIGN_NAME}_pred.v
#output withouit fillcells
write_verilog \
-pg \
-unconnected_ports \
-no_cover_cells \
-no_io_pad_cells \
-no_unconnected_cells \
-no_flip_chip_bump_cells \
-no_physical_only_cells \
-supply_statement none \
-force_output_references  {SEN_DCAP64 SEN_DCAP32 SEN_DCAP16 SEN_DCAP8 SEN_DCAP4} \
../out/${DESIGN_NAME}_pg.v

set write_sdc_output_lumped_net_capacitance false
set write_sdc_output_net_resistance false
write_sdc ../out/${DESIGN_NAME}.out.sdc

extract_rc -coupling_cap
write_parasitics -output ../out//${DESIGN_NAME}.spef \
	-format SPEF \
	-no_name_mapping

report_timing > ../rpts/icc_timing.rep
report_constraints > ../rpts/icc_constraints.rep
report_power > ../rpts/icc_power.rep

