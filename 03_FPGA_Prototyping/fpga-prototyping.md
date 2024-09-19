# FPGA Prototyping Platform

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

By leveraging the HAPS-SX FPGA prototyping platform, designers can accelerate the development process, ensure thorough verification and validation, and ultimately achieve a more efficient transition from prototype to production.

---
![haps-vu19p-mipi-pcie](https://github.com/user-attachments/assets/f6dff28d-4308-4775-9bfd-834ea624c6b3)

---
## FPGA Device

The Virtex™ UltraScale+™ VU19P FPGA enables prototyping and emulation of the most advanced ASIC and SoC technologies, as well as the development of complex algorithms. The VU19P FPGA provides the highest logic density and I/O count on a single device ever built by AMD, addressing new classes of demands in evolving technologies.

FPGA used in HAPS-SX system:
    * AMD-Xilinx Virtex UltraScale+ VU19P FPGA
    * 8,930K System Logic Cells (Highest capacity FPGA now in production)

![Screenshot from 2024-09-19 18-01-35](https://github.com/user-attachments/assets/27807229-e10f-42ff-aebd-440b13f52a41)

Source: [AMD FPGA Comparison Table](https://docs.amd.com/v/u/en-US/ultrascale-plus-fpga-product-selection-guide)  
