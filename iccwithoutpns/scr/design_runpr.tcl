########################################################################################
#Specify Unrouting Layers
########################################################################################
set_ignored_layer -max_routing_layer METAL6
report_ignored_layers 
save_mw_cel -as ${DESIGN_NAME}_prepns
########################################################################################
#Add EndCAP TapCell
########################################################################################
add_end_cap -respect_keepout -fill_corner -lib_cell FDCAPHD4

add_tap_cell_array \
			-master_cell_name {FILLTIEHD} \
			-distance 70 \
			-pattern stagger_every_other_row \
			-respect_keepout

########################################################################################
#Create the Power Network
########################################################################################
########################################################################################
#Preforming Power Planning
########################################################################################

#create_power_ring strategy
create_power_plan_regions core -core
set_power_ring_strategy strategy_core -nets {VDD VSS} \
	-core -template ../scr/ring.tpl:ring_around_va
remove_power_plan_strategy -all
#set_power_plan_strategy power_plan \
		-nets {VDD VSS} -core \
		-extension {{{nets:VDD}{stop:outermost_ring}}{{nets:VSS}{stop:outermost_ring}}} \
		-template ../scr/pg_mesh.tpl:pg_mesh_top


compile_power_plan -ring
#compile_power_plan
derive_pg_connection -power_net VDD -power_pin VDD  \
		     -ground_net VSS -ground_pin VSS
derive_pg_connection -power_net {VDD} -ground_net {VSS} -tie

create_power_straps \
		 -direction vertical \
		 -nets  {VDD VSS} \
		 -layer METAL6  \
		 -width 1 \
		 -configure rows \
		 -step 200 \
		 -pitch_within_group 2 \
		 -extend_low_ends to_first_target \
                 -extend_high_ends to_first_target \
		 -keep_floating_wire_pieces
create_power_straps \
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


derive_pg_connection -power_net {VDD} -ground_net {VSS} -tie


save_mw_cel -as  ${DESIGN_NAME}_floorplanafterpn
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
save_mw_cel -as ${DESIGN_NAME}_floorplan_finish
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
set_pnet_options -partial {METAL6 METAL5}
set_pnet_options -complete {METAL6 METAL5}

place_opt -effort high -congestion

report_congestion
report_timing
report_constraint -all_violators
save_mw_cel -as ${DESIGN_NAME}_placement
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
	-layer_list {METAL1 METAL2 METAL3 METAL4 METAL5 METAL6} \
	-use_default_routing_for_sinks 1

set_clock_tree_references -references {CLKBUFHDV1 CLKINHDV1}
clock_opt -only_cts -no_clock_route

update_clock_latency
report_clock_tree
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
source ../../MPW180TECHFILE/STC/clf/antenna_6m_1tm.tcl

route_zrt_group -all_clock_nets
route_zrt_auto

report_timing
report_constraint -all_violators

focal_opt -drc_nets all -effort high
focal_opt -hold_endpoints all -effort high

verify_zrt_route \
		-antenna true \
		-check_from_user_shapes true \
		-check_from_frozen_shapes true \
		-report_all_open_nets true
#route_zrt_detail -incremental true -initial_drc_from_input true

insert_stdcell_filler \
		-cell_without_metal {F_FILLHD1 F_FILLHD2 F_FILLHD4 F_FILLHD8 F_FILLHD16}

#

#source ../scr/create_text.tcl
save_mw_cel -as finish
save_mw_cel -as ${DESIGN_NAME}_allfinish
save_mw_cel
set_write_stream_options -map_layer ../../MPW180TECHFILE/STC/map/gds2OutLayer_twinwell.map \
					     -output_pin {text geometry} \
						 -flatten_via 
write_stream -format gds \
		-lib_name ${DESIGN_NAME}_LIB \
		-cell_file ../../MPW180TECHFILE/STC/gds/scc018ug_hd_rvt.gds \
		-cells "${DESIGN_NAME}_allfinish" \
		../out/${DESIGN_NAME}.gds
write_verilog ../out/${DESIGN_NAME}_pred.v

extract_rc -coupling_cap
write_parasitics -output ../out//${DESIGN_NAME}.spef \
	-format SPEF \
	-no_name_mapping