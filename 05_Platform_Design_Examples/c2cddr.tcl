
################################################################
# This is a generated script based on design: c2c
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2022.2
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_gid_msg -ssname BD::TCL -id 2041 -severity "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source c2c_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xcvu19p-fsva3824-2-e
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name c2c

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_gid_msg -ssname BD::TCL -id 2001 -severity "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_gid_msg -ssname BD::TCL -id 2002 -severity "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_gid_msg -ssname BD::TCL -id 2003 -severity "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_gid_msg -ssname BD::TCL -id 2004 -severity "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_gid_msg -ssname BD::TCL -id 2005 -severity "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_gid_msg -ssname BD::TCL -id 2006 -severity "ERROR" $errMsg}
   return $nRet
}

set bCheckIPsPassed 1
##################################################################
# CHECK IPs
##################################################################
set bCheckIPs 1
if { $bCheckIPs == 1 } {
   set list_check_ips "\ 
xilinx.com:ip:aurora_64b66b:12.0\
xilinx.com:ip:axi_traffic_gen:3.0\
xilinx.com:ip:axi_chip2chip:5.0\
xilinx.com:ip:clk_wiz:6.0\
xilinx.com:ip:ddr4:2.2\
xilinx.com:ip:proc_sys_reset:5.0\
xilinx.com:ip:smartconnect:1.0\
xilinx.com:ip:system_ila:1.1\
xilinx.com:ip:util_vector_logic:2.0\
xilinx.com:ip:xlconstant:1.1\
"

   set list_ips_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2011 -severity "INFO" "Checking if the following IPs exist in the project's IP catalog: $list_check_ips ."

   foreach ip_vlnv $list_check_ips {
      set ip_obj [get_ipdefs -all $ip_vlnv]
      if { $ip_obj eq "" } {
         lappend list_ips_missing $ip_vlnv
      }
   }

   if { $list_ips_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2012 -severity "ERROR" "The following IPs are not found in the IP Catalog:\n  $list_ips_missing\n\nResolution: Please add the repository containing the IP(s) to the project." }
      set bCheckIPsPassed 0
   }

}

if { $bCheckIPsPassed != 1 } {
  common::send_gid_msg -ssname BD::TCL -id 2023 -severity "WARNING" "Will not continue with creation of design due to the error(s) above."
  return 3
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set aur_master_rx [ create_bd_intf_port -mode Slave -vlnv xilinx.com:display_aurora:GT_Serial_Transceiver_Pins_RX_rtl:1.0 aur_master_rx ]

  set aur_master_tx [ create_bd_intf_port -mode Master -vlnv xilinx.com:display_aurora:GT_Serial_Transceiver_Pins_TX_rtl:1.0 aur_master_tx ]

  set aur_slave_rx [ create_bd_intf_port -mode Slave -vlnv xilinx.com:display_aurora:GT_Serial_Transceiver_Pins_RX_rtl:1.0 aur_slave_rx ]

  set aur_slave_tx [ create_bd_intf_port -mode Master -vlnv xilinx.com:display_aurora:GT_Serial_Transceiver_Pins_TX_rtl:1.0 aur_slave_tx ]

  set aurora_refclk [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 aurora_refclk ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {156250000} \
   ] $aurora_refclk

  set c0_ddr4 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddr4_rtl:1.0 c0_ddr4 ]

  set c0_sys_clk [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 c0_sys_clk ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {300000000} \
   ] $c0_sys_clk

  set gclk [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 gclk ]


  # Create ports
  set rst_btn [ create_bd_port -dir I -type rst rst_btn ]

  # Create instance: aurora_master, and set properties
  set aurora_master [ create_bd_cell -type ip -vlnv xilinx.com:ip:aurora_64b66b:12.0 aurora_master ]
  set_property -dict [list \
    CONFIG.C_AURORA_LANES {2} \
    CONFIG.C_LINE_RATE {5} \
    CONFIG.C_REFCLK_SOURCE {MGTREFCLK1_of_Quad_X0Y1} \
    CONFIG.C_START_LANE {X0Y6} \
    CONFIG.C_USE_BYTESWAP {true} \
    CONFIG.drp_mode {Disabled} \
    CONFIG.interface_mode {Streaming} \
  ] $aurora_master


  # Create instance: aurora_slave, and set properties
  set aurora_slave [ create_bd_cell -type ip -vlnv xilinx.com:ip:aurora_64b66b:12.0 aurora_slave ]
  set_property -dict [list \
    CONFIG.C_AURORA_LANES {2} \
    CONFIG.C_LINE_RATE {5} \
    CONFIG.C_REFCLK_FREQUENCY {156.25} \
    CONFIG.C_REFCLK_SOURCE {MGTREFCLK1_of_Quad_X0Y1} \
    CONFIG.C_USE_BYTESWAP {true} \
    CONFIG.SupportLevel {1} \
    CONFIG.drp_mode {Disabled} \
    CONFIG.interface_mode {Streaming} \
  ] $aurora_slave


  # Create instance: axi_interconnect_0, and set properties
  set axi_interconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_0 ]
  set_property -dict [list \
    CONFIG.NUM_MI {1} \
    CONFIG.NUM_SI {1} \
  ] $axi_interconnect_0


  # Create instance: axi_traffic_gen_0, and set properties
  set axi_traffic_gen_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_traffic_gen:3.0 axi_traffic_gen_0 ]
  set_property -dict [list \
    CONFIG.ATG_OPTIONS {Custom} \
    CONFIG.C_ATG_MODE {AXI4} \
    CONFIG.C_ATG_MODE_L2 {Basic} \
    CONFIG.C_EXTENDED_ADDRESS_WIDTH {49} \
    CONFIG.C_M_AXI_DATA_WIDTH {64} \
    CONFIG.C_S_AXI_DATA_WIDTH {64} \
  ] $axi_traffic_gen_0


  # Create instance: c2c_master, and set properties
  set c2c_master [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_chip2chip:5.0 c2c_master ]
  set_property -dict [list \
    CONFIG.C_AXI_ADDR_WIDTH {49} \
    CONFIG.C_AXI_DATA_WIDTH {64} \
    CONFIG.C_INTERFACE_MODE {0} \
    CONFIG.C_INTERFACE_TYPE {2} \
    CONFIG.C_SUPPORT_NARROWBURST {true} \
  ] $c2c_master


  # Create instance: c2c_slave, and set properties
  set c2c_slave [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_chip2chip:5.0 c2c_slave ]
  set_property -dict [list \
    CONFIG.C_AXI_ADDR_WIDTH {40} \
    CONFIG.C_AXI_DATA_WIDTH {64} \
    CONFIG.C_INCLUDE_AXILITE {2} \
    CONFIG.C_INTERFACE_MODE {0} \
    CONFIG.C_INTERFACE_TYPE {2} \
    CONFIG.C_MASTER_FPGA {0} \
    CONFIG.C_M_AXI_ID_WIDTH {0} \
    CONFIG.C_M_AXI_WUSER_WIDTH {0} \
    CONFIG.C_SUPPORT_NARROWBURST {true} \
  ] $c2c_slave


  # Create instance: clk_wiz_0, and set properties
  set clk_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 clk_wiz_0 ]
  set_property -dict [list \
    CONFIG.CLKOUT1_JITTER {132.683} \
    CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {50} \
    CONFIG.CLKOUT2_JITTER {115.831} \
    CONFIG.CLKOUT2_PHASE_ERROR {87.180} \
    CONFIG.CLKOUT2_USED {true} \
    CONFIG.CLK_OUT1_PORT {clk_50M} \
    CONFIG.CLK_OUT2_PORT {clk_100M} \
    CONFIG.MMCM_CLKOUT0_DIVIDE_F {24.000} \
    CONFIG.MMCM_CLKOUT1_DIVIDE {12} \
    CONFIG.NUM_OUT_CLKS {2} \
    CONFIG.OPTIMIZE_CLOCKING_STRUCTURE_EN {true} \
    CONFIG.PRIM_SOURCE {Differential_clock_capable_pin} \
    CONFIG.USE_LOCKED {false} \
    CONFIG.USE_RESET {false} \
  ] $clk_wiz_0


  # Create instance: ddr4_0, and set properties
  set ddr4_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:ddr4:2.2 ddr4_0 ]
  set_property -dict [list \
    CONFIG.C0.DDR4_CasWriteLatency {11} \
    CONFIG.C0.DDR4_InputClockPeriod {3335} \
    CONFIG.C0.DDR4_MemoryPart {MTA16ATF2G64HZ-2G3} \
    CONFIG.C0.DDR4_MemoryType {SODIMMs} \
    CONFIG.C0.DDR4_TimePeriod {938} \
  ] $ddr4_0


  # Create instance: proc_sys_reset_0, and set properties
  set proc_sys_reset_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_0 ]

  # Create instance: proc_sys_reset_1, and set properties
  set proc_sys_reset_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_1 ]

  # Create instance: smartconnect_0, and set properties
  set smartconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_0 ]
  set_property CONFIG.NUM_SI {1} $smartconnect_0


  # Create instance: system_ila_0, and set properties
  set system_ila_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:system_ila:1.1 system_ila_0 ]
  set_property -dict [list \
    CONFIG.C_DATA_DEPTH {16384} \
    CONFIG.C_MON_TYPE {NATIVE} \
    CONFIG.C_NUM_OF_PROBES {6} \
  ] $system_ila_0


  # Create instance: system_ila_2, and set properties
  set system_ila_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:system_ila:1.1 system_ila_2 ]
  set_property CONFIG.C_DATA_DEPTH {16384} $system_ila_2


  # Create instance: util_vector_logic_0, and set properties
  set util_vector_logic_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_0 ]
  set_property CONFIG.C_OPERATION {not} $util_vector_logic_0


  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]
  set_property CONFIG.CONST_VAL {0} $xlconstant_0


  # Create interface connections
  connect_bd_intf_net -intf_net C0_SYS_CLK_0_1 [get_bd_intf_ports c0_sys_clk] [get_bd_intf_pins ddr4_0/C0_SYS_CLK]
  connect_bd_intf_net -intf_net CLK_IN1_D_0_1 [get_bd_intf_ports gclk] [get_bd_intf_pins clk_wiz_0/CLK_IN1_D]
  connect_bd_intf_net -intf_net GT_DIFF_REFCLK1_0_1 [get_bd_intf_ports aurora_refclk] [get_bd_intf_pins aurora_slave/GT_DIFF_REFCLK1]
  connect_bd_intf_net -intf_net GT_SERIAL_RX_0_1 [get_bd_intf_ports aur_slave_rx] [get_bd_intf_pins aurora_slave/GT_SERIAL_RX]
  connect_bd_intf_net -intf_net GT_SERIAL_RX_1_1 [get_bd_intf_ports aur_master_rx] [get_bd_intf_pins aurora_master/GT_SERIAL_RX]
  connect_bd_intf_net -intf_net aurora_master_GT_SERIAL_TX [get_bd_intf_ports aur_master_tx] [get_bd_intf_pins aurora_master/GT_SERIAL_TX]
  connect_bd_intf_net -intf_net aurora_master_USER_DATA_M_AXIS_RX [get_bd_intf_pins aurora_master/USER_DATA_M_AXIS_RX] [get_bd_intf_pins c2c_master/AXIS_RX]
  connect_bd_intf_net -intf_net aurora_slave_GT_SERIAL_TX [get_bd_intf_ports aur_slave_tx] [get_bd_intf_pins aurora_slave/GT_SERIAL_TX]
  connect_bd_intf_net -intf_net aurora_slave_USER_DATA_M_AXIS_RX [get_bd_intf_pins aurora_slave/USER_DATA_M_AXIS_RX] [get_bd_intf_pins c2c_slave/AXIS_RX]
  connect_bd_intf_net -intf_net axi_interconnect_0_M00_AXI [get_bd_intf_pins axi_interconnect_0/M00_AXI] [get_bd_intf_pins ddr4_0/C0_DDR4_S_AXI]
  connect_bd_intf_net -intf_net axi_traffic_gen_0_M_AXI [get_bd_intf_pins axi_traffic_gen_0/M_AXI] [get_bd_intf_pins c2c_master/s_axi]
  connect_bd_intf_net -intf_net c2c_master_AXIS_TX [get_bd_intf_pins aurora_master/USER_DATA_S_AXIS_TX] [get_bd_intf_pins c2c_master/AXIS_TX]
  connect_bd_intf_net -intf_net c2c_slave_AXIS_TX [get_bd_intf_pins aurora_slave/USER_DATA_S_AXIS_TX] [get_bd_intf_pins c2c_slave/AXIS_TX]
  connect_bd_intf_net -intf_net c2c_slave_m_axi [get_bd_intf_pins axi_interconnect_0/S00_AXI] [get_bd_intf_pins c2c_slave/m_axi]
connect_bd_intf_net -intf_net [get_bd_intf_nets c2c_slave_m_axi] [get_bd_intf_pins axi_interconnect_0/S00_AXI] [get_bd_intf_pins system_ila_2/SLOT_0_AXI]
  connect_bd_intf_net -intf_net c2c_slave_m_axi_lite [get_bd_intf_pins c2c_slave/m_axi_lite] [get_bd_intf_pins smartconnect_0/S00_AXI]
  connect_bd_intf_net -intf_net ddr4_0_C0_DDR4 [get_bd_intf_ports c0_ddr4] [get_bd_intf_pins ddr4_0/C0_DDR4]
  connect_bd_intf_net -intf_net smartconnect_0_M00_AXI [get_bd_intf_pins axi_traffic_gen_0/S_AXI] [get_bd_intf_pins smartconnect_0/M00_AXI]

  # Create port connections
  connect_bd_net -net M00_ARESETN_1 [get_bd_pins axi_interconnect_0/M00_ARESETN] [get_bd_pins ddr4_0/c0_ddr4_aresetn] [get_bd_pins proc_sys_reset_1/peripheral_aresetn]
  connect_bd_net -net aurora_master_channel_up [get_bd_pins aurora_master/channel_up] [get_bd_pins c2c_master/axi_c2c_aurora_channel_up] [get_bd_pins system_ila_0/probe3]
  set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets aurora_master_channel_up]
  connect_bd_net -net aurora_master_lane_up [get_bd_pins aurora_master/lane_up] [get_bd_pins system_ila_0/probe4]
  set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets aurora_master_lane_up]
  connect_bd_net -net aurora_slave_channel_up [get_bd_pins aurora_slave/channel_up] [get_bd_pins c2c_slave/axi_c2c_aurora_channel_up] [get_bd_pins system_ila_0/probe0]
  connect_bd_net -net aurora_slave_gt_refclk1_out [get_bd_pins aurora_master/refclk1_in] [get_bd_pins aurora_slave/gt_refclk1_out]
  connect_bd_net -net aurora_slave_lane_up [get_bd_pins aurora_slave/lane_up] [get_bd_pins system_ila_0/probe1]
  set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets aurora_slave_lane_up]
  connect_bd_net -net aurora_slave_mmcm_not_locked_out [get_bd_pins aurora_slave/mmcm_not_locked_out] [get_bd_pins c2c_master/aurora_mmcm_not_locked] [get_bd_pins c2c_slave/aurora_mmcm_not_locked]
  connect_bd_net -net aurora_slave_sync_clk_out [get_bd_pins aurora_master/sync_clk] [get_bd_pins aurora_slave/sync_clk_out]
  connect_bd_net -net aurora_slave_user_clk_out [get_bd_pins aurora_master/user_clk] [get_bd_pins aurora_slave/user_clk_out] [get_bd_pins c2c_master/axi_c2c_phy_clk] [get_bd_pins c2c_slave/axi_c2c_phy_clk]
  connect_bd_net -net c2c_master_aurora_pma_init_out [get_bd_pins aurora_master/pma_init] [get_bd_pins c2c_master/aurora_pma_init_out]
  connect_bd_net -net c2c_master_aurora_reset_pb [get_bd_pins aurora_master/reset_pb] [get_bd_pins c2c_master/aurora_reset_pb]
  connect_bd_net -net c2c_master_axi_c2c_link_status_out [get_bd_pins c2c_master/axi_c2c_link_status_out] [get_bd_pins system_ila_0/probe5]
  set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets c2c_master_axi_c2c_link_status_out]
  connect_bd_net -net c2c_slave_aurora_pma_init_out [get_bd_pins aurora_slave/pma_init] [get_bd_pins c2c_slave/aurora_pma_init_out]
  connect_bd_net -net c2c_slave_aurora_reset_pb [get_bd_pins aurora_slave/reset_pb] [get_bd_pins c2c_slave/aurora_reset_pb]
  connect_bd_net -net c2c_slave_axi_c2c_link_status_out [get_bd_pins c2c_slave/axi_c2c_link_status_out] [get_bd_pins system_ila_0/probe2]
  set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_nets c2c_slave_axi_c2c_link_status_out]
  connect_bd_net -net clk_wiz_0_clk_100M [get_bd_pins axi_interconnect_0/ACLK] [get_bd_pins axi_interconnect_0/S00_ACLK] [get_bd_pins axi_traffic_gen_0/s_axi_aclk] [get_bd_pins c2c_master/s_aclk] [get_bd_pins c2c_slave/m_aclk] [get_bd_pins c2c_slave/m_axi_lite_aclk] [get_bd_pins clk_wiz_0/clk_100M] [get_bd_pins proc_sys_reset_0/slowest_sync_clk] [get_bd_pins smartconnect_0/aclk] [get_bd_pins system_ila_0/clk] [get_bd_pins system_ila_2/clk]
  connect_bd_net -net clk_wiz_0_clk_50M [get_bd_pins aurora_master/init_clk] [get_bd_pins aurora_slave/init_clk] [get_bd_pins c2c_master/aurora_init_clk] [get_bd_pins c2c_slave/aurora_init_clk] [get_bd_pins clk_wiz_0/clk_50M]
  connect_bd_net -net ddr4_0_c0_ddr4_ui_clk [get_bd_pins axi_interconnect_0/M00_ACLK] [get_bd_pins ddr4_0/c0_ddr4_ui_clk] [get_bd_pins proc_sys_reset_1/slowest_sync_clk]
  connect_bd_net -net ddr4_0_c0_ddr4_ui_clk_sync_rst [get_bd_pins ddr4_0/c0_ddr4_ui_clk_sync_rst] [get_bd_pins proc_sys_reset_1/ext_reset_in]
  connect_bd_net -net ext_reset_in_0_1 [get_bd_ports rst_btn] [get_bd_pins proc_sys_reset_0/ext_reset_in] [get_bd_pins util_vector_logic_0/Op1]
  connect_bd_net -net proc_sys_reset_0_peripheral_aresetn [get_bd_pins axi_interconnect_0/ARESETN] [get_bd_pins axi_interconnect_0/S00_ARESETN] [get_bd_pins axi_traffic_gen_0/s_axi_aresetn] [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins smartconnect_0/aresetn]
  connect_bd_net -net util_vector_logic_0_Res [get_bd_pins ddr4_0/sys_rst] [get_bd_pins util_vector_logic_0/Res]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins c2c_master/aurora_pma_init_in] [get_bd_pins c2c_slave/aurora_pma_init_in] [get_bd_pins xlconstant_0/dout]

  # Create address segments
  assign_bd_address -offset 0x76000000 -range 0x00010000 -target_address_space [get_bd_addr_spaces axi_traffic_gen_0/Data] [get_bd_addr_segs c2c_master/s_axi/Mem0] -force
  assign_bd_address -offset 0x44A00000 -range 0x00010000 -target_address_space [get_bd_addr_spaces c2c_slave/MAXI-Lite] [get_bd_addr_segs axi_traffic_gen_0/S_AXI/Reg0] -force
  assign_bd_address -offset 0x001000000000 -range 0x000400000000 -target_address_space [get_bd_addr_spaces c2c_slave/MAXI] [get_bd_addr_segs ddr4_0/C0_DDR4_MEMORY_MAP/C0_DDR4_ADDRESS_BLOCK] -force


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


