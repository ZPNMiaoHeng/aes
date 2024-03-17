#include "icv.rh" 
#define MACRO_CELLS_LIST {"*"} 

library(
    library_name = "< path to gds file>",
    cell = "<your cell name>",
    format = GDSII
);

top_cell = get_top_cell();

milkyway_options(drc_black_box_cells = {"*", "!top_cell"},merged_view_list={{name="FILL", outdated_views=DISCARD}});

fill_to_target_options (
    mode = DENSITY,
    tile_size = 20  // I am using window_size from FEOF runset here, if it is too fine granularity (or it runs  slow)  you can use bigger number (20 for example)
);

layer1 = "layer1";
layer_name = "layerName";

my_density_func : function (void) returning void
{
   area1: double = den_polygon_area(layer1);
   areaW: double = den_window_area();
   ratio: double = 0;
   if ( areaW > 0) {
       ratio = area1/areaW;
   } else {
       ratio = -1;
   }
   den_save_window();
   den_window_statistics(
//      error_names = {layer_name,"area1","areaW","ratio"},
//      values = {0, area1, areaW, ratio}
      error_names = {layer_name},
      values = {ratio}
   );
}

M1              = assign       ( {{101}} );
M1_pre_color1   = assign       ( {{101}} , milkyway = {colors = {MASK_ONE_HARD, MASK_ONE_SOFT}});
M1_pre_color2   = assign       ( {{101}} , milkyway = {colors = {MASK_TWO_HARD, MASK_TWO_SOFT}});
M1_metal_blkg   = assign       ( {{101}}, milkyway = { views = {"FRAM"}, cell_types = {MACRO_CELL} }, select_cells = MACRO_CELLS_LIST );
M1_macro_rg     = assign       ( {{ 4003 }}, { route_guide_layers = {M1_ROUTE_GUIDE}, views = {"FRAM"},  cell_types = {MACRO_CELL} }, select_cells = MACRO_CELLS_LIST );
M1_system_blkg  = assign       ( {{ 4031 }}, milkyway = { views = {"FRAM"} , cell_types = {MACRO_CELL} }, select_cells = MACRO_CELLS_LIST );

M2              = assign       ( {{102}} );
M2_pre_color1   = assign       ( {{102}} , milkyway = {colors = {MASK_ONE_HARD, MASK_ONE_SOFT}});
M2_pre_color2   = assign       ( {{102}} , milkyway = {colors = {MASK_TWO_HARD, MASK_TWO_SOFT}});
M2_metal_blkg   = assign       ( {{102}}, milkyway = { views = {"FRAM"}, cell_types = {MACRO_CELL} }, select_cells = MACRO_CELLS_LIST );
M2_macro_rg     = assign       ( {{ 4003 }}, { route_guide_layers = {M2_ROUTE_GUIDE}, views = {"FRAM"},  cell_types = {MACRO_CELL} }, select_cells = MACRO_CELLS_LIST );
M2_system_blkg  = assign       ( {{ 4032 }}, milkyway = { views = {"FRAM"} , cell_types = {MACRO_CELL} }, select_cells = MACRO_CELLS_LIST );

M3              = assign       ( {{103}} );
M3_pre_color1   = assign       ( {{103}} , milkyway = {colors = {MASK_ONE_HARD, MASK_ONE_SOFT}});
M3_pre_color2   = assign       ( {{103}} , milkyway = {colors = {MASK_TWO_HARD, MASK_TWO_SOFT}});
M3_metal_blkg   = assign       ( {{103}}, milkyway = { views = {"FRAM"}, cell_types = {MACRO_CELL} }, select_cells = MACRO_CELLS_LIST );
M3_macro_rg     = assign       ( {{ 4003 }}, { route_guide_layers = {M3_ROUTE_GUIDE}, views = {"FRAM"},  cell_types = {MACRO_CELL} }, select_cells = MACRO_CELLS_LIST );
M3_system_blkg  = assign       ( {{ 4033 }}, milkyway = { views = {"FRAM"} , cell_types = {MACRO_CELL} }, select_cells = MACRO_CELLS_LIST );

M4              = assign       ( {{104}} );
M4_pre_color1   = assign       ( {{104}} , milkyway = {colors = {MASK_ONE_HARD, MASK_ONE_SOFT}});
M4_pre_color2   = assign       ( {{104}} , milkyway = {colors = {MASK_TWO_HARD, MASK_TWO_SOFT}});
M4_metal_blkg   = assign       ( {{104}}, milkyway = { views = {"FRAM"}, cell_types = {MACRO_CELL} }, select_cells = MACRO_CELLS_LIST );
M4_macro_rg     = assign       ( {{ 4003 }}, { route_guide_layers = {M4_ROUTE_GUIDE}, views = {"FRAM"},  cell_types = {MACRO_CELL} }, select_cells = MACRO_CELLS_LIST );
M4_system_blkg  = assign       ( {{ 4029 }}, milkyway = { views = {"FRAM"} , cell_types = {MACRO_CELL} }, select_cells = MACRO_CELLS_LIST );

M5              = assign       ( {{105}} );
M5_pre_color1   = assign       ( {{105}} , milkyway = {colors = {MASK_ONE_HARD, MASK_ONE_SOFT}});
M5_pre_color2   = assign       ( {{105}} , milkyway = {colors = {MASK_TWO_HARD, MASK_TWO_SOFT}});
M5_metal_blkg   = assign       ( {{105}}, milkyway = { views = {"FRAM"}, cell_types = {MACRO_CELL} }, select_cells = MACRO_CELLS_LIST );
M5_macro_rg     = assign       ( {{ 4003 }}, { route_guide_layers = {M5_ROUTE_GUIDE}, views = {"FRAM"},  cell_types = {MACRO_CELL} }, select_cells = MACRO_CELLS_LIST );
M5_system_blkg  = assign       ( {{ 4052 }}, milkyway = { views = {"FRAM"} , cell_types = {MACRO_CELL} }, select_cells = MACRO_CELLS_LIST );

M6              = assign       ( {{106}} );
M6_pre_color1   = assign       ( {{106}} , milkyway = {colors = {MASK_ONE_HARD, MASK_ONE_SOFT}});
M6_pre_color2   = assign       ( {{106}} , milkyway = {colors = {MASK_TWO_HARD, MASK_TWO_SOFT}});
M6_metal_blkg   = assign       ( {{106}}, milkyway = { views = {"FRAM"}, cell_types = {MACRO_CELL} }, select_cells = MACRO_CELLS_LIST );
M6_macro_rg     = assign       ( {{ 4003 }}, { route_guide_layers = {M6_ROUTE_GUIDE}, views = {"FRAM"},  cell_types = {MACRO_CELL} }, select_cells = MACRO_CELLS_LIST );
M6_system_blkg  = assign       ( {{ 4053 }}, milkyway = { views = {"FRAM"} , cell_types = {MACRO_CELL} }, select_cells = MACRO_CELLS_LIST );

T4M2              = assign       ( {{114}} );
T4M2_pre_color1   = assign       ( {{114}} , milkyway = {colors = {MASK_ONE_HARD, MASK_ONE_SOFT}});
T4M2_pre_color2   = assign       ( {{114}} , milkyway = {colors = {MASK_TWO_HARD, MASK_TWO_SOFT}});
T4M2_metal_blkg   = assign       ( {{114}}, milkyway = { views = {"FRAM"}, cell_types = {MACRO_CELL} }, select_cells = MACRO_CELLS_LIST );
T4M2_macro_rg     = assign       ( {{ 4003 }}, { route_guide_layers = {M7_ROUTE_GUIDE}, views = {"FRAM"},  cell_types = {MACRO_CELL} }, select_cells = MACRO_CELLS_LIST );
T4M2_system_blkg  = assign       ( {{ 4021 }}, milkyway = { views = {"FRAM"} , cell_types = {MACRO_CELL} }, select_cells = MACRO_CELLS_LIST );

RDL              = assign       ( {{144}} );
RDL_pre_color1   = assign       ( {{144}} , milkyway = {colors = {MASK_ONE_HARD, MASK_ONE_SOFT}});
RDL_pre_color2   = assign       ( {{144}} , milkyway = {colors = {MASK_TWO_HARD, MASK_TWO_SOFT}});
RDL_metal_blkg   = assign       ( {{144}}, milkyway = { views = {"FRAM"}, cell_types = {MACRO_CELL} }, select_cells = MACRO_CELLS_LIST );
RDL_macro_rg     = assign       ( {{ 4003 }}, { route_guide_layers = {M8_ROUTE_GUIDE}, views = {"FRAM"},  cell_types = {MACRO_CELL} }, select_cells = MACRO_CELLS_LIST );
RDL_system_blkg  = assign       ( {{ 4023 }}, milkyway = { views = {"FRAM"} , cell_types = {MACRO_CELL} }, select_cells = MACRO_CELLS_LIST );

chip_ext           = assign       ( {{ 4095 }} );

sf = density_statistics_file ("density.txt");
sf_grad = density_statistics_file ("densityGrad.txt");
if(chip_ext == empty_layer()) {
    chip_ext = chip_extent();
}

M1_area_removed = or_list (layers = {M1_metal_blkg, M1_macro_rg, M1_system_blkg});
M1_chip_ext = chip_ext not M1_area_removed;
M1_denLayer = M1 and M1_chip_ext;
M1_pre_color1_denLayer = M1_pre_color1 and M1_chip_ext;
M1_pre_color2_denLayer = M1_pre_color2 and M1_chip_ext;

M2_area_removed = or_list (layers = {M2_metal_blkg, M2_macro_rg, M2_system_blkg});
M2_chip_ext = chip_ext not M2_area_removed;
M2_denLayer = M2 and M2_chip_ext;
M2_pre_color1_denLayer = M2_pre_color1 and M2_chip_ext;
M2_pre_color2_denLayer = M2_pre_color2 and M2_chip_ext;

M3_area_removed = or_list (layers = {M3_metal_blkg, M3_macro_rg, M3_system_blkg});
M3_chip_ext = chip_ext not M3_area_removed;
M3_denLayer = M3 and M3_chip_ext;
M3_pre_color1_denLayer = M3_pre_color1 and M3_chip_ext;
M3_pre_color2_denLayer = M3_pre_color2 and M3_chip_ext;

M4_area_removed = or_list (layers = {M4_metal_blkg, M4_macro_rg, M4_system_blkg});
M4_chip_ext = chip_ext not M4_area_removed;
M4_denLayer = M4 and M4_chip_ext;
M4_pre_color1_denLayer = M4_pre_color1 and M4_chip_ext;
M4_pre_color2_denLayer = M4_pre_color2 and M4_chip_ext;

M5_area_removed = or_list (layers = {M5_metal_blkg, M5_macro_rg, M5_system_blkg});
M5_chip_ext = chip_ext not M5_area_removed;
M5_denLayer = M5 and M5_chip_ext;
M5_pre_color1_denLayer = M5_pre_color1 and M5_chip_ext;
M5_pre_color2_denLayer = M5_pre_color2 and M5_chip_ext;

M6_area_removed = or_list (layers = {M6_metal_blkg, M6_macro_rg, M6_system_blkg});
M6_chip_ext = chip_ext not M6_area_removed;
M6_denLayer = M6 and M6_chip_ext;
M6_pre_color1_denLayer = M6_pre_color1 and M6_chip_ext;
M6_pre_color2_denLayer = M6_pre_color2 and M6_chip_ext;

T4M2_area_removed = or_list (layers = {T4M2_metal_blkg, T4M2_macro_rg, T4M2_system_blkg});
T4M2_chip_ext = chip_ext not T4M2_area_removed;
T4M2_denLayer = T4M2 and T4M2_chip_ext;
T4M2_pre_color1_denLayer = T4M2_pre_color1 and T4M2_chip_ext;
T4M2_pre_color2_denLayer = T4M2_pre_color2 and T4M2_chip_ext;

RDL_area_removed = or_list (layers = {RDL_metal_blkg, RDL_macro_rg, RDL_system_blkg});
RDL_chip_ext = chip_ext not RDL_area_removed;
RDL_denLayer = RDL and RDL_chip_ext;
RDL_pre_color1_denLayer = RDL_pre_color1 and RDL_chip_ext;
RDL_pre_color2_denLayer = RDL_pre_color2 and RDL_chip_ext;

layer_name = "M1";
M1_ERROR @= { @"DEN_ERR_M1";
         density (window_layer = chip_ext, delta_window = {125,125}, window_function = my_density_func, layer_hash = { layer1 => M1_denLayer }, statistics_files = {sf}, statistics_file_modes = ({OVERWRITE}), name = layer_name); 
 }

M1_pre_color1_ERROR @= { @"M1_pre_color1";
         density (window_layer = chip_ext, delta_window = {125,125}, window_function = my_density_func, layer_hash = { layer1 => M1_pre_color1_denLayer }, statistics_files = {sf}, statistics_file_modes = ({OVERWRITE}), name = layer_name); 
 }

M1_pre_color2_ERROR @= { @"M1_pre_color2";
         density (window_layer = chip_ext, delta_window = {125,125}, window_function = my_density_func, layer_hash = { layer1 => M1_pre_color2_denLayer }, statistics_files = {sf}, statistics_file_modes = ({OVERWRITE}), name = layer_name); 
 }

layer_name = "M2";
M2_ERROR @= { @"DEN_ERR_M2";
         density (window_layer = chip_ext, delta_window = {125,125}, window_function = my_density_func, layer_hash = { layer1 => M2_denLayer }, statistics_files = {sf}, statistics_file_modes = ({APPEND}), name = layer_name); 
 }

M2_pre_color1_ERROR @= { @"M2_pre_color1";
         density (window_layer = chip_ext, delta_window = {125,125}, window_function = my_density_func, layer_hash = { layer1 => M2_pre_color1_denLayer }, statistics_files = {sf}, statistics_file_modes = ({APPEND}), name = layer_name); 
 }

M2_pre_color2_ERROR @= { @"M2_pre_color2";
         density (window_layer = chip_ext, delta_window = {125,125}, window_function = my_density_func, layer_hash = { layer1 => M2_pre_color2_denLayer }, statistics_files = {sf}, statistics_file_modes = ({APPEND}), name = layer_name); 
 }

layer_name = "M3";
M3_ERROR @= { @"DEN_ERR_M3";
         density (window_layer = chip_ext, delta_window = {125,125}, window_function = my_density_func, layer_hash = { layer1 => M3_denLayer }, statistics_files = {sf}, statistics_file_modes = ({APPEND}), name = layer_name); 
 }

M3_pre_color1_ERROR @= { @"M3_pre_color1";
         density (window_layer = chip_ext, delta_window = {125,125}, window_function = my_density_func, layer_hash = { layer1 => M3_pre_color1_denLayer }, statistics_files = {sf}, statistics_file_modes = ({APPEND}), name = layer_name); 
 }

M3_pre_color2_ERROR @= { @"M3_pre_color2";
         density (window_layer = chip_ext, delta_window = {125,125}, window_function = my_density_func, layer_hash = { layer1 => M3_pre_color2_denLayer }, statistics_files = {sf}, statistics_file_modes = ({APPEND}), name = layer_name); 
 }

layer_name = "M4";
M4_ERROR @= { @"DEN_ERR_M4";
         density (window_layer = chip_ext, delta_window = {125,125}, window_function = my_density_func, layer_hash = { layer1 => M4_denLayer }, statistics_files = {sf}, statistics_file_modes = ({APPEND}), name = layer_name); 
 }

M4_pre_color1_ERROR @= { @"M4_pre_color1";
         density (window_layer = chip_ext, delta_window = {125,125}, window_function = my_density_func, layer_hash = { layer1 => M4_pre_color1_denLayer }, statistics_files = {sf}, statistics_file_modes = ({APPEND}), name = layer_name); 
 }

M4_pre_color2_ERROR @= { @"M4_pre_color2";
         density (window_layer = chip_ext, delta_window = {125,125}, window_function = my_density_func, layer_hash = { layer1 => M4_pre_color2_denLayer }, statistics_files = {sf}, statistics_file_modes = ({APPEND}), name = layer_name); 
 }

layer_name = "M5";
M5_ERROR @= { @"DEN_ERR_M5";
         density (window_layer = chip_ext, delta_window = {125,125}, window_function = my_density_func, layer_hash = { layer1 => M5_denLayer }, statistics_files = {sf}, statistics_file_modes = ({APPEND}), name = layer_name); 
 }

M5_pre_color1_ERROR @= { @"M5_pre_color1";
         density (window_layer = chip_ext, delta_window = {125,125}, window_function = my_density_func, layer_hash = { layer1 => M5_pre_color1_denLayer }, statistics_files = {sf}, statistics_file_modes = ({APPEND}), name = layer_name); 
 }

M5_pre_color2_ERROR @= { @"M5_pre_color2";
         density (window_layer = chip_ext, delta_window = {125,125}, window_function = my_density_func, layer_hash = { layer1 => M5_pre_color2_denLayer }, statistics_files = {sf}, statistics_file_modes = ({APPEND}), name = layer_name); 
 }

layer_name = "M6";
M6_ERROR @= { @"DEN_ERR_M6";
         density (window_layer = chip_ext, delta_window = {125,125}, window_function = my_density_func, layer_hash = { layer1 => M6_denLayer }, statistics_files = {sf}, statistics_file_modes = ({APPEND}), name = layer_name); 
 }

M6_pre_color1_ERROR @= { @"M6_pre_color1";
         density (window_layer = chip_ext, delta_window = {125,125}, window_function = my_density_func, layer_hash = { layer1 => M6_pre_color1_denLayer }, statistics_files = {sf}, statistics_file_modes = ({APPEND}), name = layer_name); 
 }

M6_pre_color2_ERROR @= { @"M6_pre_color2";
         density (window_layer = chip_ext, delta_window = {125,125}, window_function = my_density_func, layer_hash = { layer1 => M6_pre_color2_denLayer }, statistics_files = {sf}, statistics_file_modes = ({APPEND}), name = layer_name); 
 }

layer_name = "T4M2";
T4M2_ERROR @= { @"DEN_ERR_T4M2";
         density (window_layer = chip_ext, delta_window = {125,125}, window_function = my_density_func, layer_hash = { layer1 => T4M2_denLayer }, statistics_files = {sf}, statistics_file_modes = ({APPEND}), name = layer_name); 
 }

T4M2_pre_color1_ERROR @= { @"T4M2_pre_color1";
         density (window_layer = chip_ext, delta_window = {125,125}, window_function = my_density_func, layer_hash = { layer1 => T4M2_pre_color1_denLayer }, statistics_files = {sf}, statistics_file_modes = ({APPEND}), name = layer_name); 
 }

T4M2_pre_color2_ERROR @= { @"T4M2_pre_color2";
         density (window_layer = chip_ext, delta_window = {125,125}, window_function = my_density_func, layer_hash = { layer1 => T4M2_pre_color2_denLayer }, statistics_files = {sf}, statistics_file_modes = ({APPEND}), name = layer_name); 
 }

layer_name = "RDL";
