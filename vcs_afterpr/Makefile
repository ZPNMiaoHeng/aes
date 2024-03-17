PHONY: con cov clean debug

#define con is no an variable,is just a number
OUTPUT = aestop
#ALL_DEFINE = +define+DFF_STYLE1

#code coverage commond
CM = -cm line+cond+fsm+branch+tgl
CM_NAME = -cm_name ${OUTPUT}
CM_DIR = -cm_dir ./${OUTPUT}.vdb

#vpd file name 

VPD_NAME = +vpdfile+${OUTPUT}.vpd

#compile command
VCS = vcs -sverilog +v2k -timescale=1ns/1ns -debug_all \
	+vcs+flush+all \
	-full64 \
	-fsdb \
	-R \
	-kdb \
	+vcd+vcdpluson \
	${CM} \
	${CM_NAME} \
	${CM_DIR} \
	${ALL_DEFINE} \
	${VPD_NAME} \
	-o ${OUTPUT} \
	-l compile.log

#simulation commond
SIM = ./${OUTPUT} \
	${CM} ${CM_NAME} ${CM_DIR} \
	${VPD_NAME}  \
	-l ${OUTPUT}.log

#start compile
con:
	${VCS} -f file_list.f
#start simulation
sim:
	${SIM}
#show the coverage
cov:
	dve -full64 -covdir *vdb &
debug:
	dve -full64 -vpd ${OUTPUT}.vpd &

run:
	./${OUTPUT} -l simv.log -gui

simulate:
	./${OUTPUT} -l sim.log +nospecify 
#start clean
clean:
	rm -rf ./csrc *.daidir *.log *.vpd *.vdb simv* *.key *.race.out*
