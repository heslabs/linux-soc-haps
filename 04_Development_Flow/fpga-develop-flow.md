# FPGA Development Workflow
To develop an FPGA-based System-on-Chip (SoC) with remote access, custom IP, and a compute subsystem illustrated as below configuration. follow these steps:

## 1. Setup FPGA Cloud for Remote Access

* Cloud Infrastructure: Set up a cloud environment that supports FPGA development. This can be done using cloud services that offer FPGA instances, such as AWS 
 and Azure VMs. Or using priviat FPGA cloud service.
* Remote Access Tools: Use remote access tools like SSH, VPN, or cloud-specific remote desktop solutions to access the FPGA development environment.

## 2. Develop Your Custom IP

  * Design Specification: Define the functionality and performance requirements of your custom IP.
  * HDL Coding: Write the hardware description in Verilog or VHDL. Use FPGA vendor tools (e.g., Xilinx Vivado, Intel Quartus) for coding and simulation.
  * Simulation and Verification: Simulate the custom IP to verify its functionality using tools like ModelSim or Vivado Simulator.
  * Synthesis: Synthesize the IP to ensure it meets the timing and area constraints.

## 3. Develop Compute Subsystem
  * Arm Corstone: Utilize Arm Corstone IP for a pre-verified compute subsystem. Corstone IP includes subsystems based on Arm Cortex processors, bus infrastructure components, and baseline peripherals 1 .
 * Simplified Version: If using a simplified version, design a basic compute subsystem with essential components like CPU, memory, and communication interfaces.

## 4. Integrate Custom IP with Pre-built Compute Subsystem
 * System Integration: Integrate your custom IP with the compute subsystem. Ensure compatibility with the system bus (e.g., AMBA AXI) and other interfaces.
 * FPGA Fabric: Map the integrated design onto the FPGA fabric. This involves placing and routing the design using FPGA vendor tools.
 * Verification: Perform system-level verification to ensure the integrated design functions correctly.

## 5. Running Linux and AI/ML Software
 * Bootloader and Kernel: Develop or configure a bootloader (e.g., U-Boot) and Linux kernel for your SoC. Ensure the kernel supports the hardware components in your design.
 * Root Filesystem: Create a root filesystem with necessary libraries and tools for AI/ML development.
 * Deployment: Deploy the Linux image onto the FPGA. This can be done via JTAG, SD card, or network boot.
 * AI/ML Frameworks: Install AI/ML frameworks like TensorFlow, PyTorch, or ONNX Runtime on the Linux system. Ensure the frameworks are optimized for the hardware.

---
# Example Workflow

FPGA system configuration is illustrated as below

![image](https://github.com/user-attachments/assets/94c0b13e-07f6-4e59-87d7-0b8dd2715340)

1. Setup Cloud Environment

```
$ ssd demo@59.124.169.195 -X
$ source ./labs/setenv.sh
```

2. Setup EDA design environemnt
   
```
## setenv.sh
export XILINXD_LICENSE_FILE=~/.Xilinx/Xil_License.lic
export VIVADO_HOME=/home/Vivado/Vitis/2022.2
export VITIS_HOME=/home/eda/Vitis/2022.2
export VITIS_HLS_HOME=/home/eda/Vitis_HLS/2022.2
```

3. Connecting the HAPS

```
## Configure the system and bitstream using HAPS configuration tool (ConfPro)
$ <Confpro-SX_1.1.10_220711>/Confpro-SX_1.1.10/guibin/Confpro-SX-GuiRun.sh
```

4. Restart the CPU SoM module (ZynqMP) and monitor Linux OS booting sequence
```
$ putty -serial -sercfg 115200,8,n,1,N -fn 10x20 /dev/ttyUSB0
```

5. Connect to CPU SoM module (ZynqMP) and run the application software
```
$ ssh xilinx@192.168.50.3 -X (password:xilinx)
```

---
### Utilities

* WinSCP - Free SFTP and FTP client for Windows [[Downland]](https://winscp.net/eng/download.php)
* MobaXterm Xserver with SSH, telnet, RDP, VNC and X11 [[Download]](https://mobaxterm.mobatek.net/download.html)

![image](https://github.com/user-attachments/assets/44544270-b520-464a-8fd4-c9d48ddb02e2)

