# FPGA 4-Button NAND/NOR Logic Circuit

Simpler variant of the 5-button logic circuit with 4 pushbutton inputs producing NAND and NOR outputs. Built with Quartus Prime 19.1.

## Overview

A compact combinational logic circuit using 4 input switches and pushbuttons mapped to NAND and NOR gate outputs driving LEDs. Demonstrates direct mapping of Boolean expressions to FPGA logic elements.

## Project Structure

| File | Description |
|------|-------------|
| `practical.vhd` | Top-level entity with 4 inputs, 2 outputs |

## Hardware

- **Device:** Intel MAX 10 10M02SCU169C8G
- **Board:** DE10-Lite
- **Tool:** Quartus Prime 19.1
- **Language:** VHDL-2008

## Building

1. Open `practical.qpf` in Quartus Prime
2. Run Analysis & Synthesis
3. Program the board
