# SoC Research Platform
To build a System-on-Chip (SoC) research platform for teaching and research, you can follow these steps and leverage various resources and methodologies provided by community
 
### 1. Define the SoC Design Specification
  * Operation Modes: Determine the operation modes of the system and the performance requirements.
  * Hardware and Software Requirements: Identify the necessary hardware IPs and software modules, w 

### 2. Integrate Hardware and Software
  * Hardware Integration: Integrate the sourced hardware IPs to form the SoC.
  * Software Integration: Combine the necessary drivers and software modules 1 .
  * Functional Simulation: Perform functional simulation to verify that the IPs and their integration produce the expected outcomes 1 .

### 3. Prototyping on FPGA
  * FPGA Implementation: Implement a hardware prototype of the system on a Field Programmable Gate Array (FPGA) board. This stage can be divided into three phases:
    * Functional Design Phase: Create a behavioral model of the hardware and a working prototype of the software 1 .
    * Circuit Design Phase: Transfer the behavioral descriptions of the functional blocks into circuits. This process is automated for digital blocks and manual for analog blocks.
    * Physical Design Phase: Perform tasks such as floorplanning, pad ring design, placement, clock tree design, power and IR drop analysis, routing, and design rule checks.

### 4. HW/SW Co-Verification
  * Co-Simulation: Run co-simulation of hardware and software to refine the components. This iterative process may require additional software development and hardware optimizations.

### 5. Physical Optimization and Fabrication
  * Physical Design: Optimize the physical design for timing and power analysis. Perform detailed functional simulation and software verification after each step 1 2
  * Fabrication: Once all aspects of the system’s specifications have been verified, send the prototype to the chip fabrication foundry for mass production 2 .

### 6. Application Development and Testing
  * Application Development: Develop and test applications on the SoC platform to ensure it meets the desired performance and functionality.
  * Volume Manufacture and Ship: After successful testing, proceed with volume manufacturing and shipping of the final product.

### 7. Leverage Arm Corstone Compute Subsystem
  * Reference Designs: Utilize pre-verified hardware and software reference designs from Arm Corstone to accelerate the development process and ensure compatibility and performance .

By following these steps and leveraging the resources and methodologies provided by Arm Education, you can effectively build and verify a custom SoC for teaching and research purposes.

## SoC Research Platform
Building the SoC research platform for teaching and research to  use case
* Design and verify your custom SoC on hyper-scale FPGA cloud
* Create Linux-capable SoC with custom hardware accelerators
* Agile design and verification platform for SoC architecture exploration
* Leverage the HW&SW reference design from Arm Corstone compute subsystem 
* Enable innovation from concept to silicon based on pre-verified SoC platform

---
## Arm Corstone Subsystem
The Arm Corstone family is designed to help reduce design complexity and speed time –to market. Corstone balances trade-offs between performance and energy efficiency by providing a large amount of software, IP blocks, and a configurable, modifiable, heterogeneous subsystem.

* SoC designers use Arm Corstone as a framework to build an SoC using the modifiable, configurable, heterogenous subsystem.
* Software developers use Corstone software components and tools to get started with the software development before the hardware is ready.

![arm-corestone-subsystem](https://github.com/user-attachments/assets/3659cf42-498b-4485-93ec-cce0dc48ddbc)
Source: [Arm IoT Reference Design Platform](https://https://www.arm.com/products/silicon-ip-subsystems)

---
## FPGA Prototyping System
* Industry’s highest performance and most scalable pre-silicon prototyping system,  equipped with largest logic capacity FPGA device 
* Design and verify your custom IP and SoC with real-world speed interfaces, software, and hardware all working together

![haps-vu19p-mipi-pcie](https://github.com/user-attachments/assets/f6dff28d-4308-4775-9bfd-834ea624c6b3)

---
### FPGA Device

The Virtex™ UltraScale+™ VU19P FPGA enables prototyping and emulation of the most advanced ASIC and SoC technologies, as well as the development of complex algorithms. The VU19P FPGA provides the highest logic density and I/O count on a single device ever built by AMD, addressing new classes of demands in evolving technologies.

FPGA used in HAPS-SX system:
* AMD-Xilinx Virtex UltraScale+ VU19P FPGA
* 8,930K System Logic Cells (Highest capacity FPGA now in production)

![Screenshot from 2024-09-19 18-01-35](https://github.com/user-attachments/assets/27807229-e10f-42ff-aebd-440b13f52a41)

Source: [AMD FPGA Comparison Table](https://docs.amd.com/v/u/en-US/ultrascale-plus-fpga-product-selection-guide)  
