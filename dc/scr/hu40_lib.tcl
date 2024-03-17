#hu40_lib_list.tcl
#----------------------------------------------------------
#hu40 standard cell library list
#----------------------------------------------------------
#######################################
set hu40 "../../../../hu40nmlib/1.02a"
set libName	 "hu40npksdst"

#- - -- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#  hu 40 sdcell db file path
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
set hu40_dbpath "$hu40/liberty/logic_synth"

set hu40_db_ss_0v99_40c "$hu40_dbpath/${libName}_ss0p99vn40c.db"
set hu40_db_ss_0v99_0c "$hu40_dbpath/${libName}_ss0p99v0c.db"
set hu40_db_ss_0v99_125c "$hu40_dbpath/${libName}_ss0p99v125c.db"
set hu40_db_ss_0v9_0c "$hu40_dbpath/${libName}_ss0p9v0c.db"
set hu40_db_ss_0v9_125c "$hu40_dbpath/${libName}_ss0p9v125c.db"
set hu40_db_ss_0v9_n40c "$hu40_dbpath/${libName}_ss0p9vn40c.db"
set hu40_db_tt_1v0_25c "$hu40_dbpath/${libName}_tt1p0v25c.db"
set hu40_db_tt_1v1_25c "$hu40_dbpath/${libName}_tt1p1v25c.db"
set hu40_db_tt_1v2_25c "$hu40_dbpath/${libName}_tt1p2v25c.db"
set hu40_db_ff_1v1_0c "$hu40_dbpath/${libName}_ff1p1v0c.db"
set hu40_db_ff_1v1_40c "$hu40_dbpath/${libName}_ff1p1vn40c.db"
set hu40_db_ff_1v1_125c "$hu40_dbpath/${libName}_ff1p1v125c.db"
set hu40_db_ff_1v21_0c "$hu40_dbpath/${libName}_ff1p21v0c.db"
set hu40_db_ff_1v21_40c "$hu40_dbpath/${libName}_ff1p21vn40c.db"
set hu40_db_ff_1v21_125c "$hu40_dbpath/${libName}_ff1p21v125c.db"
set hu40_db_ff_1v26_0c "$hu40_dbpath/${libName}_ff1p26v0c.db"
set hu40_db_ff_1v26_40c "$hu40_dbpath/${libName}_ff1p26vn40c.db"
set hu40_db_ff_1v26_125c "$hu40_dbpath/${libName}_ff1p26v125c.db"




#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#  hu 40 sdcell mw reference file
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
set mstack		 "m07f0f1f0_RDL"
set tf			 "m07f0f1f0_RDL"
set hu40_mw		 "$hu40/milkyway"

#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#  hu 40 sdcell symbol file path
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
set hu40_sdbpath "$hu40/liberty/symbol"
set hu40_sdb "$hu40_sdbpath/${libName}.sdb"
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#  hu 40 sdcell tf file path
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
set hu40_tfpath "$hu40_mw/tf"
set hu40_tf7m "$hu40_tfpath/${libName}_${tf}.tf"
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#  hu 40 sdcell tluplus file
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
set hu40_tlupluspath "$hu40_mw/tlup"
set hu40_TLU_CMAX "$hu40_tlupluspath/${mstack}/${libName}_${mstack}_w.tlup"
set hu40_TLU_CMIN "$hu40_tlupluspath/${mstack}/${libName}_${mstack}_b.tlup"
set hu40_TLU_TYP "$hu40_tlupluspath/${mstack}/${libName}_${mstack}_t.tlup"
#set hu40_map "$hu40_tlupluspath/HLMC_cl040lp_rf_1p7m_601_cal.map"
set hu40_map "$hu40_tlupluspath/extr_layers.map"
#set hu40_map "$hu40_tlupluspath/layers.map"


