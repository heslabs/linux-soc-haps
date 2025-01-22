## What is the difference between ARM Cortex-A55 and A76?
https://s-o-c.org/what-is-the-difference-between-arm-cortex-a55-and-a76/
 
The ARM Cortex-A55 and Cortex-A76 are two of ARM’s most popular CPU cores used in mobile devices. The Cortex-A55 is ARM’s first 64-bit “little” CPU core, while the Cortex-A76 is a high-performance “big” CPU core. There are some key differences between these two cores:

The Cortex-A55 is designed for power efficiency and is aimed at low-performance tasks like background processes. The Cortex-A76 provides higher performance for demanding applications and is suited for primary processing tasks.


---
### Conclusion
In summary, the Cortex-A55 offers an energy-efficient “little” core for basic workloads, while the Cortex-A76 provides a cutting-edge high-performance “big” core for premium devices. With their 64-bit ARMv8-A architecture, both cores power modern mobile experiences but aim for different market segments based on their intended use cases.

### CPU Architecture
* Both cores use ARM’s ARMv8-A 64-bit instruction set architecture. However, the Cortex-A55 is an in-order execution CPU while the Cortex-A76 uses out-of-order execution for greater performance. The Cortex-A76 also has a larger instruction pipeline and reorder buffer.
    
### Manufacturing Process
* The Cortex-A55 is manufactured on a 10nm or 7nm process. The Cortex-A76 uses a 7nm process for optimal energy efficiency and performance.

### CPU Cores
* The Cortex-A55 utilizes 4-wide decode with a simple single-issue pipeline. The Cortex-A76 has a complex 11-wide decode and dual-issue pipeline for executing more instructions per cycle.

### CPU Caches
* The Cortex-A55 has 32KB L1 instruction and data caches. It has a 128KB to 256KB L2 cache. The Cortex-A76 increases this to 64KB L1 caches and 256KB to 1MB L2 cache for reduced latency.

### CPU Clock Speeds
* The Cortex-A55 clocks from 1.4GHz to 2.0GHz. The Cortex-A76 can reach up to 3.0GHz for dramatically better performance.

### Instructions Per Cycle
* At peak performance, the Cortex-A55 can do 2 instructions per cycle (IPC). The Cortex-A76 achieves up to 4 IPC, doubling throughput.

### Performance
* In benchmarks, the Cortex-A55 achieves around 100 Dhrystone MIPS per MHz. The Cortex-A76 delivers an impressive 225 DMIPS per MHz for over **2x** higher performance

### Power Efficiency
* The Cortex-A55 requires only about **0.5 mW** per MHz for excellent power efficiency. The Cortex-A76 uses more power for performance but is still efficient at **1 mW** per MHz.

### Features
* The Cortex-A55 supports basic features like Floating Point and NEON SIMD processing. The Cortex-A76 adds optimizations like improved branch prediction and memory prefetching.

### Processors
* The Cortex-A55 is used in processors like the Snapdragon 660 and MediaTek Helio P60. Flagship chips like the Snapdragon 855 use the Cortex-A76 for the highest performance.

### Core Configurations
* The Cortex-A55 is typically used in 8-core configurations in mobile SoCs. The Cortex-A76 uses up to 4 cores with Cortex-A55s for optimal heterogeneity.

### Software Support
* As 64-bit ARMv8-A compatible cores, both the Cortex-A55 and Cortex-A76 work with modern mobile operating systems like Android, iOS, Windows 10 ARM, and Linux.

### Licensing Cost
* The Cortex-A55 costs around **$0.10 to $0.15** per core to license from ARM. The Cortex-A76 has a higher licensing cost around **$0.20 to $0.30** per core.

### Release Timeframe
* The Cortex-A55 was announced in 2016. The Cortex-A76 debuted in **2018** as a major upgrade over previous ARM mobile cores like the Cortex-A75 and A73.

### Successors
* The Cortex-A55’s successor is the Cortex-A510 announced in 2022. The Cortex-A76 was succeeded by the Cortex-A77 in 2019, offering further improvements.

### Market Segments
* Due to its lower cost and power draw, the Cortex-A55 is targeted at mid-range and entry-level devices. The Cortex-A76 competes in the premium smartphone segment for flagship performance.

### Fabrication Partners
* Major foundries like TSMC, Samsung, and GlobalFoundries manufacture chips with both the Cortex-A55 and Cortex-A76 CPU cores for ARM licensees.

### Core Types
* The Cortex-A55 is classified as a “little” core in ARM’s big.LITTLE heterogeneous computing, paired with “big” cores like the Cortex-A76.

### CPU Microarchitecture
* The Cortex-A55 uses ARM’s Austin microarchitecture, designed for power efficiency. The Cortex-A76 uses ARM’s newer Deimos microarchitecture focused on higher performance.

### Physical Design
* At **7.5mm2** the Cortex-A55 has a very small die area optimized for low cost mobile chips. At **13mm2** the Cortex-A76 is much larger to accommodate advanced performance features.

### Maximum CPUs Per Cluster
* ARM limits the Cortex-A55 to 4 cores per CPU cluster. Up to **16 Cortex-A76 cores** are allowed per cluster, enabling more cores in high-end chips.

### Floating Point
* The Cortex-A55 implements the ARMv8 FP and Advanced SIMD instructions for basic floating point math. The Cortex-A76 increases FP/SIMD to boost compute capabilities.

### Cryptography Extensions
* For improved security, the Cortex-A76 adds support for **ARMv8.2-A cryptography extensions** like SIMD AES and SHA-1/SHA-256 acceleration.

### Memory Support
* Both cores support 64-bit addressing, though Cortex-A76 compatible SoCs can be configured with up to **4TB of memory** compared to **1TB** with Cortex-A55.

### Virtualization
* The Cortex-A55 provides **ARMv8 Virtualization** to run an hypervisor and guest OS. The Cortex-A76 also supports ARM’s **Virtualization Host Extensions** for robust virtualization.

### Performance Monitoring
* The Cortex-A76 introduces an advanced PMU with 12 configurable counters to monitor and analyze different performance metrics for workloads.

