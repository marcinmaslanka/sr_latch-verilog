## 🧠 SR Latch in Verilog
This project implements a basic SR (Set-Reset) Latch using Verilog and provides a testbench to simulate its behavior, including handling the indeterminate state (when both inputs are low).

## 📂 Files
sr.v – Verilog module for the SR latch (NOR-based).

sr_tb.v – Testbench for simulating the SR latch.

sr_tb.vcd – Waveform output file (generated after simulation, viewable in GTKWave).

## 🔧 Module Description
sr.v
Implements an SR latch using continuous assignments:

###verilog
```
module sr (q, qbar, s, r);
    input s, r;
    output q, qbar;

    assign q    = ~(r & qbar);   // NOR-based feedback
    assign qbar = ~(s & q);
endmodule
```

##❗ This is a combinational latch with feedback – not clocked. It's sensitive to race conditions and should be simulated carefully.

## 🧪 Testbench Overview
sr_tb.v
The testbench:

Applies various input combinations to test Set, Reset, Hold, and Invalid (0,0) states.

Dumps simulation data into sr_tb.vcd for waveform analysis.

Example Stimuli:
### verilog
```
    s = 0; r = 1;   // Reset
    s = 1; r = 0;   // Set
    s = 1; r = 1;   // Hold
    s = 0; r = 0;   // ❌ Invalid/indeterminate state
```

## ▶️ Simulation Instructions
Using Icarus Verilog & GTKWave
```bash
# Compile
iverilog -o sr_tb.vvp sr.v sr_tb.v

# Run simulation
vvp sr_tb.vvp

# View waveform (optional)
gtkwave sr_tb.vcd
```


## 📊 Expected Behavior

```
S	R	Q (Expected)	Q̅ (Expected)	Description
0	1	0	1	Reset
1	0	1	0	Set
1	1	Hold	Hold	No change (Stable)
0	0	❌ Undefined	❌ Undefined	Invalid state
```

## 🧠 Concepts Demonstrated
- Basic latch design with feedback.

- Handling of undefined/invalid states in combinational circuits.

- Verilog continuous assignments (assign) and testbench simulation.

## 🧰 Tools Used
Icarus Verilog – Compilation and simulation

GTKWave – Waveform viewer

---

