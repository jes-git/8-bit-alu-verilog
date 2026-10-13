# 8-bit ALU in SystemVerilog

A combinational 8-bit arithmetic and logic unit (ALU) with a self-checking
SystemVerilog testbench.

## Supported operations

| Opcode | Operation | Result |
| --- | --- | --- |
| `000` | Addition | `A + B` (8-bit result; overflow wraps) |
| `001` | Subtraction | `A - B` (8-bit result; underflow wraps) |
| `010` | Bitwise AND | `A & B` |
| `011` | Bitwise OR | `A \| B` |
| `100` | Bitwise XOR | `A ^ B` |
| `101`-`111` | Reserved | `8'b00000000` |

## Simulate

Install [Icarus Verilog](https://github.com/steveicarus/iverilog), then run
these commands from the project root:

```sh
iverilog -g2012 -s tb_alu8 -o alu8_sim rtl/alu8.sv testbench/tb_alu8.sv
vvp alu8_sim
```

The testbench prints a `PASS` or `FAIL` for each vector and exits with an error
if any check fails.

## Testbench coverage

The testbench contains 8 checks covering each supported operation, 8-bit
addition overflow, subtraction underflow, and a reserved opcode. Simulation
was not run; no test results are claimed.
