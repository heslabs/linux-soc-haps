# Platform Base Example

The platform base design includes the following features
    * AXI to C2C interface connected to PS
    * AXI bus fabric
    * DDR4 controller connected to on-board 16GB DDR SDRAM
    * Internal SRAM 

## Refeence build scripts
1. Launch tthe follwoing scripts in Lniux terminal to build the Vivado reference design
```
$ soruce ./setenv.sh
$ make hw-create

## Launch vivado_create.tcl
create_project $HW ./ -part xcvu19p-fsva3824-2-e
add_files -fileset constrs_1 ./DUT.xdc
source ./DUT.tcl
make_wrapper -files [get_files ./proj.srcs/sources_1/bd/DUT/DUT.bd] -top -testbench -force
add_files -norecurse ./proj.gen/sources_1/bd/DUT/hdl/DUT_wrapper.v
validate_bd_design -force
```

2. Review the generated Vivado reference design
```
$ make hw-proj
## vivado -mode gui -project ./proj.xpr &
```

3. Run the Synthesis and implemenation, and generate FPGA bitstream
```
$ make hw-build

## Launch vivado_build.tcl
update_compile_order -fileset sources_1
## Run synthesis
reset_run synth_1
launch_runs synth_1 -jobs $::env(NJOBS)
wait_on_run synth_1
## Run implementation
reset_run impl_1
launch_runs impl_1 -to_step write_bitstream -jobs $::env(NJOBS)
wait_on_run impl_1
## Generate FPGA bitstream
write_hw_platform -fixed -include_bit -force -file ./DUT.xsa
```

---
## System Block Diagram

![image](https://github.com/user-attachments/assets/6558d14e-fc95-4b69-826d-68147bb5ea84)

---
## Vivado Reference Design 
![image](https://github.com/user-attachments/assets/a22310ff-087e-4167-95f4-2c2c197a47c5)
