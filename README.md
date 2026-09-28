# practical — 4-Button Switch Circuit

A combinational logic circuit implemented in VHDL for Intel MAX 10 FPGA that reads four pushbutton switch inputs and drives two output signals (Flip_IN and TRI_IN) through NAND/NOR logic. Built for Intel Quartus Prime using the 10M02SCU169C8G MAX 10 device.

## Overview

This project implements a **combinational logic circuit** that reads four pushbutton inputs and drives two outputs through a shared intermediate condition. The design is a simplified variant of a similar 5-button circuit, demonstrating basic **digital logic synthesis** using VHDL.

The circuit uses a temporary signal (`temp`) to compute a shared NOR condition from two of the inputs, then combines that with two other inputs through NAND gates to produce the outputs.

## Design

### Entity

```
entity uPLab4
    port(
        PH0    : in  std_logic;   -- Pushbutton H0
        PH1    : in  std_logic;   -- Pushbutton H1
        PH7    : in  std_logic;   -- Pushbutton H7
        PH6    : in  std_logic;   -- Pushbutton H6
        TRI_IN    : out std_logic;  -- Output: Tri-state control
        Flip_IN : out std_logic   -- Output: Flip control
    );
```

### Logic Equations

```
temp    = NOT(PH6) AND NOT(PH7)   -- Equivalent to NOR(PH6, PH7)
Flip_IN = NOT(PH0) NAND temp
TRI_IN  = NOT(PH1) NAND temp
```

### Behavior

| PH6 | PH7 | temp | Condition for active output |
|-----|-----|------|----------------------------|
| 0 | 0 | 1 | Both outputs pass through their first NAND operand |
| 1 | X | 0 | temp = 0, both outputs = 1 (inactive) |
| X | 1 | 0 | temp = 0, both outputs = 1 (inactive) |

- **Flip_IN**: Active low when PH6=0, PH7=0, and PH0=0 (all three not pressed)
- **TRI_IN**: Active low when PH6=0, PH7=0, and PH1=0

### Comparison to 5-Button Variant

This project differs from a related 5-button design in two ways:
- Uses **PH7** instead of PK7/PK6 (different physical button bank)
- Only 4 inputs instead of 5 (simpler logic)
- temp is a 2-input AND vs 3-input AND in the larger variant

## Project Structure

```
practical/
├── practical.vhd       # Main VHDL design (combinational logic)
├── practical.qpf       # Quartus project file
├── practical.qsf       # Quartus settings (device: 10M02SCU169C8G)
├── practical.qws       # Quartus workspace
└── .gitignore          # Excludes Quartus build artifacts
```

## Building

### Prerequisites

- **Intel Quartus Prime Lite Edition 19.1** (or later)
- **VHDL-2008** language standard
- Intel MAX 10 FPGA development board with **10M02SCU169C8G** device

### Compilation Steps

1. Open Quartus Prime → **File → Open Project**
2. Open `practical.qpf` from this directory
3. Select **Project → Start Compilation** (F7)
4. Verify pin assignments in `practical.qsf`

### Device Configuration

| Parameter | Value |
|-----------|-------|
| Family | MAX 10 |
| Device | 10M02SCU169C8G |
| Quartus Version | 19.1.0 Lite Edition |
| Top-level Entity | practical |
| Junction Temp Range | 0°C to 85°C |

## VHDL Conventions

- **`ieee.std_logic_1164`** — Standard logic types (std_logic, std_logic_vector)
- **`ieee.numeric_std`** — Included but not used in this combinational design
- **Concurrent signal assignments** — All logic computed in a single architecture block
- **Signal naming** — `temp` for intermediate computation

## References

- Intel MAX 10 Device Datasheet
- IEEE 1076 VHDL Standard
- Quartus Prime Getting Started Tutorial
