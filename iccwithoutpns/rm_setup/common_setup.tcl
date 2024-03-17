puts "RM-Info: Running script [info script]\n"

##########################################################################################
# Variables common to all reference methodology scripts
# Script: common_setup.tcl
# Version: J-2014.09-SP2 (January 12, 2015)
# Copyright (C) 2010-2015 Synopsys, Inc. All rights reserved.
##########################################################################################

set DESIGN_NAME                   "aestop"  ;#  The name of the top-level design

set WORKSHOP_REF_PATH             "../../../../hu40"
set ICC_INPUTS_PATH               "../../dc/out"
###########################################################################
# Hierarchical Flow Design Variables
##########################################################################################

set HIERARCHICAL_DESIGNS           "" ;# List of hierarchical block design names "DesignA DesignB" ...
set HIERARCHICAL_CELLS             "" ;# List of hierarchical block cell instance names "u_DesignA u_DesignB" ...

##########################################################################################
# Library Setup Variables
##########################################################################################

# For the following variables, use a blank space to separate multiple entries.
# Example: set TARGET_LIBRARY_FILES "lib1.db lib2.db lib3.db"

set ADDITIONAL_SEARCH_PATH        [join "
	$hu40 
	$hu40_dbpath 
	${ICC_INPUTS_PATH} 
	../out 
	../scr 
	"]

#       setup
#               hold
#                       leakage (and hold_hot)
#       setup_hot
#
set TARGET_LIBRARY_FILES     [join "
	$hu40_db_ss_0v99_40c 
 	$hu40_db_ss_0v99_0c  
 	$hu40_db_ss_0v99_125c 
	$hu40_db_ss_0v9_n40c
	$hu40_db_ss_0v9_0c
	$hu40_db_ss_0v9_125c
	"]

set ADDITIONAL_LINK_LIB_FILES     [join "
	$hu40_db_ss_0v99_40c 
 	$hu40_db_ss_0v99_0c  
 	$hu40_db_ss_0v99_125c 
	$hu40_db_ss_0v9_n40c
	$hu40_db_ss_0v9_0c
	$hu40_db_ss_0v9_125c
"]

set MIN_LIBRARY_FILES             "$hu40_db_ss_0v99_40c"  ;#  List of max min library pairs "max1 min1 max2 min2 max3 min3"...

set MW_REFERENCE_LIB_DIRS         [join "
    $hu40_mw/hu40npksdst_m07f1f0f0_RDL
	"]

set MW_REFERENCE_CONTROL_FILE     ""  ;#  Reference Control file to define the Milkyway reference libs

#set TECH_FILE                     "mytech.tf"  ;#  Milkyway technology file
set TECH_FILE                     "$hu40_tf7m"  ;#  Milkyway technology file
set MAP_FILE                      "$hu40_map"  ;#  Mapping file for TLUplus
set TLUPLUS_MAX_FILE              "$hu40_TLU_CMAX"  ;#  Max TLUplus file
set TLUPLUS_MIN_FILE              "$hu40_TLU_CMIN"  ;#  Min TLUplus file
set GDFMAPFILE			  "${hu40_mw}/tf/gds2.map"
set ANTENNAFILE			  "${hu40_mw}/antenna/antenna_rule_db_update_${mstack}.tcl"
set ALF_FILE_NAME		  "${hu40_mw}/alf/${libname}__m07f1f0f0_RDL.alf"


set MW_POWER_NET                "VDD" ;#
set MW_POWER_PORT               "VDD" ;#
set MW_GROUND_NET               "VSS" ;#
set MW_GROUND_PORT              "VSS" ;#

set MIN_ROUTING_LAYER            "M1"   ;# Min routing layer
set MAX_ROUTING_LAYER            "M4"   ;# Max routing layer

set LIBRARY_DONT_USE_FILE        ""   ;# Tcl file with library modifications for dont_use

##########################################################################################
# Multivoltage Common Variables
#
# Define the following multivoltage common variables for the reference methodology scripts 
# for multivoltage flows. 
# Use as few or as many of the following definitions as needed by your design.
##########################################################################################

set PD1                          ""           ;# Name of power domain/voltage area  1
set VA1_COORDINATES              {}           ;# Coordinates for voltage area 1
set MW_POWER_NET1                "VDD1"       ;# Power net for voltage area 1

set PD2                          ""           ;# Name of power domain/voltage area  2
set VA2_COORDINATES              {}           ;# Coordinates for voltage area 2
set MW_POWER_NET2                "VDD2"       ;# Power net for voltage area 2

set PD3                          ""           ;# Name of power domain/voltage area  3
set VA3_COORDINATES              {}           ;# Coordinates for voltage area 3
set MW_POWER_NET3                "VDD3"       ;# Power net for voltage area 3

set PD4                          ""           ;# Name of power domain/voltage area  4
set VA4_COORDINATES              {}           ;# Coordinates for voltage area 4
set MW_POWER_NET4                "VDD4"       ;# Power net for voltage area 4

puts "RM-Info: Completed script [info script]\n"
