# dc_setup.tcl
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#  Logical Library Settings
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
set search_path "$ADDITIONAL_SEARCH_PATH"
set target_library "$TARGET_LIBRARY_FILES"
set link_library "$TARGET_LIBRARY_FILES"
set symbol_library "$SYMBOL_LIBRARY_FILES"
######################################################################
# Physical Library Settings
######################################################################
set mw_use_layer_enhancement true
extend_mw_layers
set ignore_tf_error true

set mw_reference_library $MW_REFERENCE_LIB_DIRS
set mw_design_library $MW_DESIGN_LIB
# Only create new Milkyway design library if it doesn't already exist
    if {![file isdirectory $mw_design_library ]} {
      create_mw_lib   -technology $TECH_FILE \
                      -mw_reference_library $mw_reference_library \
                      $mw_design_library
    } else {
# If Milkyway design library already exists, continue by opening the existing library
    }


open_mw_lib     $mw_design_library
set_tlu_plus_files -max_tluplus $TLUPLUS_MAX_FILE \
                   -tech2itf_map $MAP_FILE

