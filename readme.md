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
