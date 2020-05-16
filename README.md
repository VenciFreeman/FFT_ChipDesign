# FFT_ChipDesign
> A 16-point radix-4 FFT chip, including Verilog codes, netlists and layout. Group project.

 <img src="https://img.shields.io/badge/Language-Verilog_HDL-red.svg" alt="Generic badge"  /><img src="https://img.shields.io/badge/Status-Achieved-yellow.svg" alt="Generic badge"  /><img src="https://img.shields.io/badge/Deadline-May_10_2020-green.svg" alt="Generic badge"/><img src="https://img.shields.io/badge/Schedule-Finished!-blue.svg" alt="Generic badge"/>

## Features

### Function

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

### Evaluation index

|                   Evaluation Index                   |                 Value                 |
| :--------------------------------------------------: | :-----------------------------------: |
|                       Process                        |             SMIC 0.18 μm              |
|                    Number of Pins                    |                  90                   |
|                 Operation frequency                  |              135.135 MHz              |
|                  Operation voltage                   |                1.62 V                 |
|                      Total area                      |        4.695300 mm<sup>2</sup>        |
|      Power consumption per calculate operation       |     5.25118208×10<sup>-6</sup> mJ     |
| FFT operands per unit area and unit power consumption | 41987.688 times/(mm<sup>2</sup>·mW·s) |
|                      Bandwidth                       |              510.51 MB/s              |
|                 Parallel throughput                  |       4.5946×10<sup>9</sup> bps       |

| File Name |     Type      |                    Functional description                    |
| :-------: | :-----------: | :----------------------------------------------------------: |
|   ctrl    |  Sequential   |           Control the data flow of the entire chip           |
|    s_p    |  Sequential   | Integrate serial input data into parallel and change the order |
|    mux    |  Sequential   |        Select the data entering the arithmetic module        |
|   reg1    |  Sequential   |   Store and forward operation data between two FFT stages    |
| butterfly | Combinational |             Perform 4-input butterfly operation              |
|  multi16  | Combinational | Calculate the multiplication between the data and the rotation factor |
|    p_s    |  Sequential   | Integrate parallel output data into serial and change the order |

### Chip overview

![chip overview](  https://github.com/VenciFreeman/FFT_ChipDesign/blob/master/fig/Physical_realization_and_verification/chip_overview_without_logic.png )

## Details

### Principle and design

#### 16-point radix-4 FFT schematic diagram

![16-point radix-4 FFT schematic diagram]( https://github.com/VenciFreeman/FFT_ChipDesign/blob/master/fig/Principle_and_design/16-point_radix-4_FFT_schematic_diagram.png )

#### Hardware structure diagram

![hardware structure diagram]( https://github.com/VenciFreeman/FFT_ChipDesign/blob/master/fig/Principle_and_design/hardware_structure_diagram.png )

### RTL model simulation verification

#### Modelsim single waveform

![modelsim single waveform]( https://github.com/VenciFreeman/FFT_ChipDesign/blob/master/fig/RTL_model_simulation_verification/modelsim_single_waveform.jpg )

#### Modelsim multi-waveform

![hardware structure diagram]( https://github.com/VenciFreeman/FFT_ChipDesign/blob/master/fig/RTL_model_simulation_verification/modelsim_multi_waveform.png )

### Logic Synthesis

#### DC reports

![dc reports]( https://github.com/VenciFreeman/FFT_ChipDesign/blob/master/fig/Logic_synthesis/dc_reports.png )

### Physical realization and verification

#### Chip overview

![chip overview](  https://github.com/VenciFreeman/FFT_ChipDesign/blob/master/fig/Physical_realization_and_verification/chip_overview_with_logic.png )

#### PNA voltage drop

![PNA voltage drop](  https://github.com/VenciFreeman/FFT_ChipDesign/blob/master/fig/Physical_realization_and_verification/PNA_votlage_drop.png )

#### Congestion

![total congestion](  https://github.com/VenciFreeman/FFT_ChipDesign/blob/master/fig/Physical_realization_and_verification/total_congestion.png )

#### Cell density

![cell density](  https://github.com/VenciFreeman/FFT_ChipDesign/blob/master/fig/Physical_realization_and_verification/cell_density.png )

#### Finish screenshot

![finish screenshot](  https://github.com/VenciFreeman/FFT_ChipDesign/blob/master/fig/Physical_realization_and_verification/icc_finish_screenshot.png )

## Team division

|                        Member                        |                       Division of Work                       |
| :--------------------------------------------------: | :----------------------------------------------------------: |
| [**Venci Freeman**](https://github.com/VenciFreeman) |    Butterfly, multi selector and top module, DC and ICC.     |
|   [**Luo Tian**](https://github.com/luotian12345)    | Conversion between series and parallel, register, DC and ICC. |
|    [**Mike Qi**](https://github.com/mikeq123456)     |  Control module, test bench and some tcl files, DC and ICC.  |

------

## Acknowledgement

- Frist of all, we want to thank ***Prof. He Weifeng***,  his course providing us with the opportunity to learn the complete chip design process, and he also answered the questions we encountered in detail in class. The twice-weekly discussion held by the him during the design workflow greatly helped us optimize our design of the chip and also taught us a lot.
- Then we want to thank ***the assistant Zhang Chao***. The materials provided by him greatly helped us optimize the design of the chip, and he patiently answered all the unknown error messages we encountered throughout the workflow, which helped us a lot.
- And I would like to personally thank ***Zhang Jialing*** of Group 1 and ***Zhang Yunfang*** of Group 4 who also design FFT chips. Although the algorithms we adopt are different, their ideas also have reference value for our optimization. Especially when our design work frequency is too low in the early stage, their two sets of multiplier implementation solutions inspired us to optimize the multiplier.
- Finally, I would also like to thank other assistants and classmates who helped us complete the design and help the course go smoothly.
- In addition, when we didn't know the direction in the early stage, the work of others on **GitHub** and **CSDN** blog also gave us a lot of inspiration. I would like to thank you here.
- Our version management work is also implemented through GitHub. After the project achieved, we adopted the Mozilla 2.0 public license for open source, as a small contribution to the open source community.

## References

[1] [Garrido M, Huang S J, Chen S G. Feedforward FFT Hardware Architectures Based on Rotator Allocation[J]. IEEE Transactions on Circuits and Systems I: Regular Papers, 2018, 65(2):581-592.](  https://github.com/VenciFreeman/FFT_ChipDesign/blob/master/doc/ref/Feedforward_FFT_Hardware_Architectures.pdf  )

[2] [Zulkifli, Siva. Design of 16-point Radix-4 Fast Fourier Transform in 0.18µm CMOS Technology. American Journal of Applied Sciences. 2007.]( https://github.com/VenciFreeman/FFT_ChipDesign/blob/master/doc/ref/Design_of_16-point_Radix-4_Fast_Fourier_Transform_in_0.18μm_CMOS_Technology.pdf  )

[3] [丁晓磊, 朱恩, 赵梅. 16点基4-FFT芯片设计技术研究[J]. 信息技术, 2007(01): 64-67+71.]( https://github.com/VenciFreeman/FFT_ChipDesign/blob/master/doc/ref/16%E7%82%B9%E5%9F%BA4_FFT%E8%8A%AF%E7%89%87%E8%AE%BE%E8%AE%A1%E6%8A%80%E6%9C%AF%E7%A0%94%E7%A9%B6.pdf )