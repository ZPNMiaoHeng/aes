#create corner 
create_cell {cornerll cornerlr cornerul cornerur} PCORNERW

## corner pad loaction
#
set_pad_physical_constraints -pad_name "cornerll" -side 1
set_pad_physical_constraints -pad_name "cornerur" -side 2
set_pad_physical_constraints -pad_name "cornerlr" -side 3
set_pad_physical_constraints -pad_name "cornerul" -side 4

## define signal and PG pad loaction
#side 1
set_pad_physical_constraints -pad_name "PIW_din0" -side 1 -order 1
set_pad_physical_constraints -pad_name "PIW_din1" -side 1 -order 2
set_pad_physical_constraints -pad_name "PIW_din2" -side 1 -order 3
set_pad_physical_constraints -pad_name "VDD1" -side 1 -order 4
set_pad_physical_constraints -pad_name "VSS1" -side 1 -order 5
set_pad_physical_constraints -pad_name "PIW_din3" -side 1 -order 6
set_pad_physical_constraints -pad_name "PIW_din4" -side 1 -order 7
set_pad_physical_constraints -pad_name "PIW_din5" -side 1 -order 8




#side4 -min_left_iospace 38
#set_pad_physical_constraints -pad_name "PIW_din6" -side 4 -order 1  -min_right_iospace 152
#set_pad_physical_constraints -pad_name "PIW_din7" -side 4 -order 2
set_pad_physical_constraints -pad_name "PIW_staenc" -side 4 -order 1 -min_right_iospace 152
set_pad_physical_constraints -pad_name "PIW_stadec" -side 4 -order 2
set_pad_physical_constraints -pad_name "VDD4" -side 4 -order 3
set_pad_physical_constraints -pad_name "VSS4" -side 4 -order 4
set_pad_physical_constraints -pad_name "PIW_loadkey" -side 4 -order 5
set_pad_physical_constraints -pad_name "PO8W_dout0" -side 4 -order 6
set_pad_physical_constraints -pad_name "PO8W_dout1" -side 4 -order 7 -min_left_iospace 152


#side3
set_pad_physical_constraints -pad_name "PO8W_dout2" -side 3 -order 1 
set_pad_physical_constraints -pad_name "PO8W_dout3" -side 3 -order 2
set_pad_physical_constraints -pad_name "PO8W_dout4" -side 3 -order 3
set_pad_physical_constraints -pad_name "VDD3" -side 3 -order 4
set_pad_physical_constraints -pad_name "VSS3" -side 3 -order 5
set_pad_physical_constraints -pad_name "PO8W_dout5" -side 3 -order 6
set_pad_physical_constraints -pad_name "PO8W_dout6" -side 3 -order 7
set_pad_physical_constraints -pad_name "PO8W_dout7" -side 3 -order 8  

#side2
set_pad_physical_constraints -pad_name "PIW_din6" -side 2 -order 1  -min_right_iospace 76
set_pad_physical_constraints -pad_name "PIW_din7" -side 2 -order 2
set_pad_physical_constraints -pad_name "PIW_clk" -side 2 -order 3
set_pad_physical_constraints -pad_name "VDD2" -side 2 -order 4
set_pad_physical_constraints -pad_name "VSS2" -side 2 -order 5
set_pad_physical_constraints -pad_name "PIW_rst" -side 2 -order 6
set_pad_physical_constraints -pad_name "PIW_load_shift" -side 2 -order 7 -min_left_iospace 152




