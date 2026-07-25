# 16-bit Ripple-Carry Adder (Verilog)

A small learning project implementing a 16-bit adder in Verilog, built in VS code and verified in Xilinx Vivado. Written while working through the basics of RTL design, testbenches, and the synthesis-vs-simulation split in Vivado.

## What's here

- **`rtl/fulladder.v`** — single-bit full adder (A, B, CIN → SUM, COUT)
- **`rtl/add16.v`** — 16-bit adder built from 16 chained full adders (ripple-carry)
- **`sim/add16_tb.v`** — testbench that applies test vectors and checks `SUM`/`COUT` against an expected value computed independently
- **`sim/add16_tb_clocked.v`** — a second version of the testbench driven by a clock (`always @(posedge clk)`), written as practice for clocked/sequential testbench style

## What I learned building this

- The difference between `task`, `initial`, and `always` blocks, and when each one runs
- Why testbenches (with `$dumpfile`, `$monitor`, arbitrary `#delay`s) are simulation-only constructs and can't be synthesized — and how to keep them out of Vivado's Design Sources so synthesis only sees real hardware
- A few classic Verilog footguns: using `=` instead of `==` in a condition, procedural `assign` inside an `always` block, mismatched `begin`/`end` pairs, and a clock generator that needs *no* sensitivity list (`always #5 clk = ~clk;`, not `always @(*) #5 clk = ~clk;`)

## How to run it

**Simulation (behavioral):**
1. Open the project in Vivado.
2. Make sure `sim/add16_tb.v` (or the clocked version) is set as the simulation top module.
3. Flow Navigator → **Simulation** → **Run Simulation** → **Run Behavioral Simulation**.
4. Check the Tcl console output and/or the waveform viewer for `Mismatch` / `All good` messages.

**Synthesis:**
1. Make sure only `rtl/add16.v` and `rtl/fulladder.v` are in Design Sources (no testbench files).
2. Right-click `add16` → **Set as Top**.
3. Flow Navigator → **Synthesis** → **Run Synthesis**.

## Notes

This is a learning project, not a production design — feedback and suggestions are welcome.
