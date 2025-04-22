## FPGA Prototyping Hardware

---
## FPGA Prototyping Hardware - Selection Guide
| Board | Device | Capacity | Cortex-A CPU | DDR | Linux OS |
| :-|:-:|-:|:-:|:-|:-:|
| PYNQ-Z2 | XC7Z020 | 13,300 LS | Arm CA9MP2 (650MHz) | 512MB DDR3 (PS) | PYNQ Linux (32bit) |
| PYNQ-ZU | XCZU5EG| 256K SLCs | Arm CA53MP4 (1.5GHz) | 4GB DDR4 (PS) | PYNQ Linux (64bit) |
| KV260/KR260 | XCZU5EV | 256K SLCs | Arm CA53MP4 (1.5GHz) | 4GB DDR4 (PS) | Ubuntu Linux (64bit) |
| ZCU104 | XCZU7EV | 504K SLCs | Arm CA53MP4 (1.5GHz) | 4GB DDR4 (PS)+8GB DDR4 (PL) | PYNQ Linux (64bit) |
| ZCU102 | XCZU9EG | 600K SLCs | Arm CA53MP4 (1.5GHz) | 4GB DDR4 (PS)+8GB DDR4 (PL) | PYNQ Linux (64bit) |
| ZU19EG | XCZU19EG | 1,143K SLCs | Arm CA53MP4 (1.5GHz) | 4GB DDR4 (PS)+8GB DDR4 (PL) | PYNQ Linux (64bit) |
| HAPS-VU13P | XCVU13P | 3,780K SLCs | No CPU (+SMF/CA53) | 16GB/32GB DDR4 (PL) | No OS (+PYNQ Lnx) |
| HAPS-VU19P | XCVU19P | 8,938K SLCs | No CPU (+SMF/CA53) | 16GB/32GB DDR4 (PL) | No OS (+PYNQ Lnx) |
| HAPS-SMF | XCZU4EG | 192K SLCs | Arm CA53MP4 (1.5GHz) | 4GB DDR4 (PS) | PYNQ Linux (64bit) |

<br/>

* AMD Zynq™ 7000 SoCs - Product Table [[AMD]](https://www.amd.com/en/products/adaptive-socs-and-fpgas/soc/zynq-7000.html)
* AMD Zynq™ UltraScale+™ MPSoCs - Product Table [[AMD]](https://www.amd.com/en/products/adaptive-socs-and-fpgas/soc/zynq-ultrascale-plus-mpsoc.html)
* AMD Virtex™ UltraScale+™ FPGAs - Product Table [[AMD]](https://docs.amd.com/v/u/en-US/ultrascale-plus-fpga-product-selection-guide)

---
## Introduction to HAPS Prototyping Hardware

The Synopsys HAPS FPGA prototyping platform is a high-performance prototyping solution designed to enable the development and validation of complex System-on-Chip (SoC) designs. Here are some key features and details about the HAPS platform:

## Key Features of HAPS Prototyping System

1. High Performance:
   * The HAPS platform provides high-speed prototyping capabilities, allowing for faster execution and more accurate representation of the final hardware compared to software simulators.

2. Parallel Execution:
    * Unlike simulators that execute register transfer level (RTL) code sequentially, the HAPS platform executes in parallel, offering better performance and a more accurate view of the system as it would operate in real hardware.

3. Debug Environment:
    * The platform includes a comprehensive debug environment, although it differs from traditional simulation environments. This allows designers to look inside the system without significantly impacting runtime.

4. Verification and Validation:
    * The HAPS platform is used for thorough verification and validation of SoC designs. This includes using test benches to check the behavior of the blocks and simulators to test the hardware description language (HDL).

5. Design Flexibility:
    * The platform supports the integration of various IP blocks, either from a catalog of existing components or custom-designed IPs. This flexibility helps in achieving the desired system behavior while meeting key constraints such as size, cost, and performance.

6. Prototyping for ASICs:
    * The HAPS platform is often used as a prototyping stage before transitioning to an Application-Specific Integrated Circuit (ASIC). This allows designers to prove the functionality and effectiveness of the chip-based implementation.

7. Soft-core and Hard-core CPUs:
    * The platform supports both soft-core and hard-core CPU implementations. Soft-core CPUs offer flexibility in terms of area and performance, while hard-core CPUs provide fixed processor performance embedded in the FPGA logic.

9. Integration with Arm IP:
    * The HAPS platform can integrate with Arm IPs, such as Cortex-A processors, to create custom SoCs. This integration is facilitated by tools provided in Arm Academic Access (AAA) program, which provides access to design resources and proven IPs. 

---

## Applications of HAPS FPGA Prototyping Platform

* Education: Used in universities for teaching digital system design and creating typical SoC designs with processors.
* Commercial Product Development: Enables digital designers to create custom digital systems with FPGAs, especially when off-the-shelf microcontroller products do not meet specific requirements.
* Prototyping for Chip/SoC Designs: Used by ASIC designers for prototyping their designs and providing demonstrations or proof of concepts.

By leveraging the HAPS FPGA prototyping platform, designers can accelerate the development process, ensure thorough verification and validation, and ultimately achieve a more efficient transition from prototype to production.

---
<img src="https://github.com/user-attachments/assets/f6dff28d-4308-4775-9bfd-834ea624c6b3" width="650">

---
## FPGA Device

The Virtex™ UltraScale+™ VU19P FPGA enables prototyping and emulation of the most advanced ASIC and SoC technologies, as well as the development of complex algorithms. The VU19P FPGA provides the highest logic density and I/O count on a single device ever built by AMD, addressing new classes of demands in evolving technologies.

FPGA device used in HAPS system:
  * AMD-Xilinx Virtex UltraScale+ VU19P FPGA
  * 8,930K System Logic Cells (Highest capacity FPGA now in production)

<img src="https://github.com/user-attachments/assets/27807229-e10f-42ff-aebd-440b13f52a41" width="800">

Source: [AMD FPGA Comparison Table](https://docs.amd.com/v/u/en-US/ultrascale-plus-fpga-product-selection-guide)  

---
## HAPS Daughter Cards

#### SMF_HSIO_HT3: Zynq MPSoC (CA53) SoM
<img src="https://github.com/user-attachments/assets/6e22e06d-d7a7-41f1-8e4c-a0486ba0e511" width="400">

---
#### PCIEGEN5_RC_FIREFLY: Gen4/Gen5 PCIe x16 slot, up to 28/32 GT/s
<img src="https://github.com/user-attachments/assets/7c6e8b57-b7d2-44b8-89b8-a251f212ea19" width="300">

---
#### SDIO_EMMC_HT3: 32Gb EMMC memory and 256Mb QSPI memory
<img src="https://github.com/user-attachments/assets/62b86b66-0e73-4599-90aa-2f77abc17bd4" width="150">

---
#### HSIO_MIPI_HT3: MIPI D-PHY, CSI for camera and DSI for display
<img src="https://github.com/user-attachments/assets/0c314e6c-de56-4c8e-8dd1-2f721c16d162" width="250">

---
#### FireFly Cable
<img src="https://github.com/user-attachments/assets/641cec5d-6bf6-480c-a8bc-bf63852ea9f4" width="200">

---
### HAPS-VU19P and SMF connection

<img src="https://github.com/user-attachments/assets/bbecc9fb-74a9-4989-80a5-fc18a369d65a" width="650">

---
### HAPS-VU13P and SMF connection

<img src="https://github.com/user-attachments/assets/de0da14f-9c11-46c9-a1d7-b4e51e83795a" width="650">

