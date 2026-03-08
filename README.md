# 14-bit Pin Wiggler

A 16-bit free-running counter for the **Arty S7-25** FPGA that drives all pins on Pmod headers JA and JB. Useful for testing that Pmod pins are electrically alive.

## How it works

- Counter increments on every rising clock edge
- Bits [7:0] drive Pmod JA, bits [15:8] drive Pmod JB
- Asserting `reset` clears the counter and lights the onboard LED

## File structure

```
src/          bit_counter.v      — top-level module
sim/          testbench.v        — basic simulation
constraints/  Arty-S7-25-Master.xdc
```

## Usage

1. Open Vivado, create a new RTL project targeting the Arty S7-25 (xc7s25csga324-1)
2. Add `src/bit_counter.v` as a design source
3. Add `constraints/Arty-S7-25-Master.xdc` and uncomment the pins you need
4. Add `sim/testbench.v` as a simulation source
5. Generate bitstream and program the board

## Author

Xhovani Mali — 2022
