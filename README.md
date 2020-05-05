# DIC-Design
> A 16-point radix-4 FFT chip, including Verilog codes, netlists and layout. Group project.

 <img src="https://img.shields.io/badge/Language-Verilog_HDL-red.svg" alt="Generic badge"  /><img src="https://img.shields.io/badge/Status-Physical_Design-yellow.svg" alt="Generic badge"  /><img src="https://img.shields.io/badge/Deadline-May_10-green.svg" alt="Generic badge"/><img src="https://img.shields.io/badge/Schedule-Design_Script-blue.svg" alt="Generic badge"/>

## Goal

- Design an FFT chip that balances **performance**, **area**, and **power consumption** to achieve **high-efficiency computing**;
- Finish **architectural design**, **Verilog HDL code design**, **logic simulation**, **performance analysis**, **logic synthesis**, **timing analysis and verification**, and **physical design**, finally **compare and analyze results**.

## Target

### 16-Point Radix-4 FFT

- Each input value is a **complex number**, divided into real and imaginary parts;

- Both the real and imaginary parts of inputs are **17 bits**;
  - Bit 16 is the sign bit;
  - Bit 8-15 are decimal bits;
  - Bit 0-7 are integer bits.
- Both the real and imaginary parts of rotation factors are 8 **bits**;
  - Bit 8 is the sign bit;
  - Bit 0-7 are decimal bits;
  - No integer bits, the default is 0.
- Make sure that the FFT function is correct.

### Design Process

- **0.18 μm** process.

### Evaluation index

- **Power consumption** per calculate operation;
- FFT operands per unit area and unit power consumption;
- **Operating frequency** and **area overhead**.
  - Operating frequency: **100 MHz or 125 MHz**
  - Area Overhead: **4.376464 mm<sup>2</sup>**
  - Number of pins：**88**

## Team division

|                        Member                        |                       Division of Work                       |
| :--------------------------------------------------: | :----------------------------------------------------------: |
| [**Venci Freeman**](https://github.com/VenciFreeman) |    Butterfly, multi selector and top module, DC and ICC.     |
|   [**Luo Tian**](https://github.com/luotian12345)    | Conversion between series and parallel, register, DC and ICC. |
|    [**Mike Qi**](https://github.com/mikeq123456)     |  Control module, test bench and some tcl files, DC and ICC.  |

------

## Design Methodology

###  System design

- Instruction set for processor
- Hardware/software partition
- Memory, cache organization
- Data flow and parallelism

### Logic design

- Timing design
- Logic synthesis
- Logic optimization
- Technology mapping

### Physical design

- Floor planning
- Placement
- Routing 

## References

[1] [Garrido M, Huang S J, Chen S G. Feedforward FFT Hardware Architectures Based on Rotator Allocation[J]. IEEE Transactions on Circuits and Systems I: Regular Papers, 2018, 65(2):581-592.](  https://github.com/VenciFreeman/FFT_ChipDesign/blob/master/doc/ref/Feedforward_FFT_Hardware_Architectures.pdf  )

[2] [Zulkifli, Siva. Design of 16-point Radix-4 Fast Fourier Transform in 0.18µm CMOS Technology. American Journal of Applied Sciences. 2007.]( https://github.com/VenciFreeman/FFT_ChipDesign/blob/master/doc/ref/Design_of_16-point_Radix-4_Fast_Fourier_Transform_in_0.18μm_CMOS_Technology.pdf  )

[3] [丁晓磊, 朱恩, 赵梅. 16点基4-FFT芯片设计技术研究[J]. 信息技术, 2007(01): 64-67+71.]( https://github.com/VenciFreeman/FFT_ChipDesign/blob/master/doc/ref/16%E7%82%B9%E5%9F%BA4_FFT%E8%8A%AF%E7%89%87%E8%AE%BE%E8%AE%A1%E6%8A%80%E6%9C%AF%E7%A0%94%E7%A9%B6.pdf )