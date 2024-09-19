

########## FOR HAPS-SX ##########

set PRJ $::env(PRJ)
set HW $::env(HW)
set DUT $::env(DUT)

# Create the project and directory structure
#create_project sx_c2c_haps ./vivado/sx_c2c_haps -part xcvu19p-fsva3824-2-e
create_project $HW ./ -part xcvu19p-fsva3824-2-e

# Add various sources to the project
# create_fileset -constrset xdc
# constrs_1 is the default folder
add_files -fileset constrs_1 ./${PRJ}.xdc
#add_files ../../source/rtl

# Now import/copy the files into the project
import_files -force

# Create block diagram
source ./${PRJ}.tcl

# Generate wrapper file for block diagram
#make_wrapper -files [get_files ./hw/hw.srcs/sources_1/bd/sx_c2c_haps/sx_c2c_haps.bd] -top
make_wrapper -files [get_files ./${HW}.srcs/sources_1/bd/$DUT/${DUT}.bd] -top -testbench -force

# Set wrapper as top
#add_files -norecurse ./vivado/sx_c2c_haps/sx_c2c_haps.gen/sources_1/bd/sx_c2c_haps/hdl/sx_c2c_haps_wrapper.v
#set_property top sx_c2c_haps_wrapper [current_fileset]

add_files -norecurse ./${HW}.gen/sources_1/bd/$DUT/hdl/${DUT}_wrapper.v
#add_files -norecurse ./${HW}.gen/sources_1/bd/$DUT/hdl/${DUT}_wrapper.v
set_property top ${DUT}_wrapper [current_fileset]

validate_bd_design -force

exit
~       
