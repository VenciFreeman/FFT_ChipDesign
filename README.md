# DIC-Design
> The project of DICD. Maybe an Adder or FFT chip layout, including Verilog codes and netlists. 

 ![Generic badge](https://img.shields.io/badge/Language-Verilog HDL-red.svg)

[TOC]

## 基本要求

### 课程目标

- 面向高能效计算需求，设计兼顾性能、面积和功耗开销于一身的FFT电路
- 完成电路的架构设计、Verilog HDL代码设计、逻辑仿真、性能分析、逻辑综合、时序分析与验证和物理设计，进行结果分析比较

### 项目指标

- 16 点FFT
  - 每个输入数值均为复数，分为实部和虚部
- 实部和虚部的长度均为17bit
  - 最高位（第16 位）为符号位
  - 第0位至第7 位为小数位
  - 第8 位至第15 位为整数位
- 可采用任意FFT 算法，但保证FFT 功能正确
-  芯片设计工艺
  - 0.18um 工艺；
-  FFT 电路评价指标：
  - 完成一次16 点FFT 的能耗
  - 单位面积单位功耗时的FFT操作数
  - 芯片的工作频率和面积开销
    - 工作频率
      - 工艺
      - 电路结构：优化
    - 面积开销
      - I/O个数：流水/并行
      - 中间逻辑开销：优化

### 技术问题

- 大量输入输出
- 提高面积利用率
- 需采用部分展开

## 前端设计

### 规格制定

- 芯片规格

### 详细设计

- 设计解决方案和具体实现架构，划分模块功能 

### HDL编码

- Verilog HDL模块功能实现，形成RTL代码

### 仿真验证

- 验证编码设计正确性
- 反复迭代至完全符合标准

### 逻辑综合

-  把设计实现的HDL代码翻译成门级网表netlist 

### 静态时序分析

-  检查是否存在建立时间（setup time）和保持时间（hold time）的违例

### 形式验证

-  对综合后的网表进行验证 ，是否具有功能等价性

## 后端设计

### 可测性设计

在设计中插入扫描链，将非扫描单元（如寄存器）变为扫描单元

### 布局规划

放置芯片的宏单元模块，在总体上确定各种功能电路的摆放位置

### 时钟树综合

时钟布线。对称式的连到各个寄存器单元，从而使时钟从同一个时钟源到达各个寄存器时，时钟延迟差异最小

### 布线

普通信号布线，包括各种标准单元（基本逻辑门电路）之间的走线

### 寄生参数提取

提取寄生参数进行再次的分析验证，分析信号完整性

### 版图物理验证

对完成布线的物理版图进行功能和时序验证

- LVS验证：版图与逻辑综合后的门级电路图的对比验证
- DRC：设计规则检查，检查连线间距，连线宽度等是否满足工艺要求
- ERC：电气规则检查，检查短路和开路等电气 规则违例

## 流程简介

### 确定芯片硬件结构

- Instruction set for processor
- Hardware/software partition
- Memory, cache organization
- Data flow and parallelism

### 逻辑设计

- Timing design
- Logic synthesis
- Logic optimization
- Technology mapping

### 物理设计

- Floor planning
- Placement
- Routing

### 基础设计流程（EDA工具）

- 确定描述，再Verilog HDL设计
- VCS，Verdi(看波形)进行功能仿真
- 逻辑综合生成门级网表
- 分析验证门级网表
- 用ICC物理设计生成Layout

## 参考资料

[1] Garrido M, Huang S J, Chen S G. Feedforward FFT Hardware Architectures Based on Rotator Allocation[J]. IEEE Transactions on Circuits and Systems I: Regular Papers, 2018, 65(2):581-592.