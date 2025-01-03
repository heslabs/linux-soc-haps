# Prototyping Linux SoC

This is the collaboration project for the academia SoC development community. To build a System-on-Chip (SoC) research platform for teaching and research, you can follow these steps and leverage various resources and methodologies provided by community support.

---
## Prototyping Linux SoC - Training Agenda

| # | Training module | Labs |
|:-:|:-|:-:|
| 01 | Introduction to Arm Linux SoC and AMBA | N/A |
| 02 | Introduction to Arm Cortex-A CPU and Corstone Subsystem | N/A |
| 03 | HAPS Prototyping Hardware Overview | N/A |
| 04 | Build and Deploy the FPGA Prototyping System | labs |
| 05 | SoC Hardware Development Flow | labs |
| 06 | SoC Software Development Flow | labs |
| 07 | CPU + DDR Example | labs |
| 08 | SoC HW&SW Co-design Methodology | N/A |
| 09 | Prototyping AI SoC for LLM Chatbot | labs |

---
## SoC Design and Verification Flow

---
### 1. Define the SoC Design Specification
  * Operation Modes: Determine the operation modes of the system and the performance requirements.
  * Hardware and Software Requirements: Identify the necessary hardware IPs and software modules.

### 2. Leverage Arm Corstone Compute Subsystem
  * Reference Designs: Utilize pre-verified hardware and software reference designs from Arm Corstone to accelerate the development process and ensure compatibility and performance.
    
### 3. Prototyping on FPGA
  * FPGA Implementation: Implement a hardware prototype of the system on a Field Programmable Gate Array (FPGA) board. This stage can be divided into three phases:
    * Functional Design Phase: Create a behavioral model of the hardware and a working prototype of the software 1 .
    * Circuit Design Phase: Transfer the behavioral descriptions of the functional blocks into circuits. This process is automated for digital blocks and manual for analog blocks.
    * Physical Design Phase: Perform tasks such as floorplanning, pad ring design, placement, clock tree design, power and IR drop analysis, routing, and design rule checks.

### 4. Integrate Hardware and Software
  * Hardware Integration: Integrate the sourced hardware IPs to form the SoC.
  * Software Integration: Combine the necessary drivers and software modules.
  * Functional Simulation: Perform functional simulation to verify that the IPs and their integration produce the expected outcomes.
    
### 5. HW/SW Co-Verification
  * Co-Simulation: Run co-simulation of hardware and software to refine the components. This iterative process may require additional software development and hardware optimizations.

### 6. Application Development and Testing
  * Application Development: Develop and test applications on the SoC platform to ensure it meets the desired performance and functionality.
  * Volume Manufacture and Ship: After successful testing, proceed with volume manufacturing and shipping of the final product.

### 7. Physical Optimization and Fabrication
  * Physical Design: Optimize the physical design for timing and power analysis. Perform detailed functional simulation and software verification after each step.
  * Fabrication: Once all aspects of the system’s specifications have been verified, send the prototype to the chip fabrication foundry for mass production.

---
By following these steps and leveraging the resources and methodologies provided by developer community, you can effectively build and verify a custom SoC for teaching and research purposes.



