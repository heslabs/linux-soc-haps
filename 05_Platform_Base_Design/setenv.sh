#!/bin/bash -f


export XILINX_HOME=/home/eda
export XILINXD_LICENSE_FILE=~/.Xilinx/Xil_License.lic

export VITIS_HOME=${XILINX_HOME}/Vitis/2022.2
export VIVADO_HOME=${XILINX_HOME}/Vivado/2022.2

export SYNOPSYS_HOME=/home/eda/synopsys
export CONFPRO_GUI=/home/eda/Confpro-SX_1.1.10/guibin
export CONFPRO_CMD=/home/eda/Confpro-SX_1.1.10/command/bin

source $VITIS_HOME/settings64.sh
source $VIVADO_HOME/settings64.sh 

