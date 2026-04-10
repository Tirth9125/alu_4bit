# 🔷 RTL to GDS-II: 4-bit ALU

## 📌 Project Overview
This project implements a **4-bit Arithmetic Logic Unit (ALU)** using Verilog and performs the complete **RTL to GDS-II flow** using Synopsys tools.

The ALU supports the following operations:
- Addition
- AND
- OR
- XOR

---

## 🎯 Problem Statement
- Implement a **4-bit ALU** using Verilog HDL  
- Perform RTL → GDS-II flow  
- Constraints:
  - ❌ Do NOT use Half Adder cells  
  - ✅ Use **C-shape (Scenario 5)** floorplan  

---

## ⚙️ Supported Operations

| Select Line | Operation |
|------------|----------|
| 00 | Addition |
| 01 | AND |
| 10 | OR |
| 11 | XOR |

---

## 🧾 RTL Code (Verilog)

```verilog
module alu_4bit (
    input clk,
    input  [3:0] A, B,
    input  [1:0] sel,
    output reg [3:0] Y,
    output reg carry
);

always @(posedge clk) begin
    case (sel)
        2'b00: {carry, Y} <= A + B;
        2'b01: begin Y <= A & B; carry <= 0; end
        2'b10: begin Y <= A | B; carry <= 0; end
        2'b11: begin Y <= A ^ B; carry <= 0; end
        default: begin Y <= 0; carry <= 0; end
    endcase
end

endmodule
```
---

## Changes Of Path & Library Done in Project

### Changes in path of (dc_script.tcl): -
```
set DESIGN_NAME "alu_4bit"
set RTL_DIR "../RTL/"
set CONSTRAINTS_FILE "../constraints/pow2_3bit.sdc"

read_verilog [list
$RTL_DIR/alu_4bit.v
]

compile_ultra
```
---

### Gates Used (dc_script.tcl): -
```
#set_dont_use [get_lib_cells /FADD]
set_dont_use [get_lib_cells /HADD]
#set_dont_use [get_lib_cells /AO]
#set_dont_use [get_lib_cells /OA]
#set_dont_use [get_lib_cells /NAND]
#set_dont_use [get_lib_cells /XOR]
#set_dont_use [get_lib_cells /NOR]
#set_dont_use [get_lib_cells /XNOR]
#set_dont_use [get_lib_cells /MUX]
```
---

### Library changes in "common_setup.tcl": -
```
set target_library "../ref/lib/stdcell_rvt/saed32rvt_ss0p7vn40c.db"
set link_library "* ../ref/lib/stdcell_rvt/saed32rvt_ss0p7vn40c.db ../ref/lib/stdcell_rvt/saed32rvt_ff1p16v125c.db"
```
---

### Changes in CONSTRAINTS (pow2_3bit.sdc): -
```
create_clock -period 10 -name clk [get_ports clk]

set_clock_uncertainty 0.2 [get_clocks clk]
set_clock_transition 0.1 [get_clocks clk]

set_input_delay 2.0 -clock clk [all_inputs]
set_output_delay 2.0 -clock clk [all_outputs]
```
---

### Changes in path of (routing.tcl): -
```
write -format verilog -hierarchy
-output ./outputs/alu_4bit_netlist.v

write_sdc ./outputs/alu_4bit.sdc
```
---

### Changes in path of Prime Time (STA): -
```
set link_path "../ref/lib/stdcell_rvt/saed32rvt_ff1p16v125c.db"
read_verilog "../ICCII/outputs/alu_4bit.routed.v"
read_sdc "../ICCII/outputs/pow2_3bit_final.sdc"
read_parasitics "../ICCII/outputs/alu_4bit_func::nom.spef.p1_125.spef"
```

---

## 📊 Results

- **Total Area: -** 103.34 µm²  
- **Cell Area: -** 96.83 µm²  
- **Power Consumption: -** 3.492 µW  
- **Setup Slack: -** 6.55 ns  
- **Hold Slack: -** 0.74 ns  
- **Clock Frequency: -** ~100 MHz  

---

## 📂 Project Structure
```
pow2_3bit/
│── README.md
│
├── RTL/
│   ├── alu_4bit.v
│   └── alu_4bit_tb.v
│
├── Constraints/
│   └── alu_4bit.sdc
│
├── synthesis/
│   └── dc_script.tcl
│
├── physical_design/
│   ├── 01_setup.tcl
│   ├── 02_netlist_read.tcl
│   ├── 03_floorplan.tcl
│   ├── 04_powerplanning.tcl
│   ├── 05_placement.tcl
│   ├── 06_clock.tcl
│   ├── 07_route.tcl
│   └── 08_outputs.tcl
│
├── Outputs/
│   ├── synthesis_result.jpeg
│   ├── floorplan.jpeg
│   ├── Powerplanning_&_placement.jpeg
│   ├── Routing.jpg
│   ├── verdi_block_diagram.jpeg
│   ├── verdi_gate_level_schematic.jpeg
│   └── verdi_timing_waveform.jpeg
│
├── PD_reports/
│   ├── check_design_pre_place.rpt
│   ├── check_legality.rpt
│   ├── check_pin_placement.rpt
│   ├── check_routes.rpt
│   ├── clock.rpt
│   ├── clock_gating.rpt
│   ├── clock_final.rpt
│   ├── clock_settings.rpt
│   ├── congestion.rpt
│   ├── pg_connectivity.rpt
│   ├── power_final.rpt
│   ├── qor_final.rpt
│   ├── qor_post_place.rpt
│   ├── timing_final_setup.rpt
│   ├── timing_final_hold.rpt
│   ├── timing_hold_post_route.rpt
│   ├── timing_post_cts.rpt
│   ├── timing_post_place.rpt
│   └── timing_post_route.rpt
│
└── Report_file/
    └── RTL_to_GDS_Report.pdf

```
---

## 🧠 Key Learnings

- RTL modelling using Verilog HDL  
- Logic synthesis using Design Compiler  
- Floorplanning and placement using ICC2  
- Routing and physical verification  
- Static Timing Analysis using PrimeTime  

---

## 👨‍💻 Author

**Tirth Bavaliya**
