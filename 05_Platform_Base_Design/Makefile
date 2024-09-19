

SHELL := /bin/bash
export PRJ=c2cddr
export HW=hw
export DUT=c2c
export XSA=${DUT}_wrapper
export NJOBS=16

help:
	@echo ""
	@echo "+-----------------------------------------------------"
	@echo "| HAPS-ZYNQMP Base Platform"
	@echo "+-----------------------------------------------------"
	@echo "| 1. \$$ make hw-new : Create new Vivado project"
	@echo "| 2. \$$ make hw-prj : Open prebuilt Vivado project"
	@echo "| 3. \$$ make hw-com : Compile Vivado project"
	@echo "+-----------------------------------------------------"
	@echo ""


hw: hw-new hw-com

hw-prj:
	@cd ./vivado/$(PRJ) && vivado -mode gui -project ./$(HW).xpr &

hw-new:
	@cd ./vivado && \rm -rf $(PRJ) && mkdir -p $(PRJ)
	@cd ./vivado/$(PRJ) && cp -f ../../$(PRJ).tcl .
	@cd ./vivado/$(PRJ) && cp -f ../../$(PRJ).xdc .
	@cd ./vivado/$(PRJ) && vivado -mode tcl -source ../../vivado_create.tcl


hw-com:
	@cd ./vivado/$(PRJ) && \rm -rf vivado.* .Xil *.os *.jou *.og  $(HW).cache $(HW).runs
	@cd ./vivado/$(PRJ) && vivado -mode tcl -project ./$(HW).xpr -source ../../vivado_build.tcl


