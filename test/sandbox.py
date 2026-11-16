# SPDX-FileCopyrightText: 2026 UofT ASIC Team
# SPDX-License-Identifier: Apache-2.0
"""Helpers every slot test uses. They read and drive only the top-level pins, because the
gl_test job runs the same tests on the gate-level netlist, where the slots' own names are gone."""

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles, FallingEdge


async def start(dut):
    """Start a 10 MHz clock (clock_hz in info.yaml), reset the design, and return on a falling
    edge with ui_in = 0. Change inputs and read outputs on falling edges, half a clock period
    away from the rising edges where the flip-flops change."""
    cocotb.start_soon(Clock(dut.clk, 100, unit="ns").start())
    dut.ena.value = 1
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 5)
    dut.rst_n.value = 1
    await FallingEdge(dut.clk)


async def settle(dut, cycles=1):
    """Let `cycles` rising edges go by and return on the falling edge after the last one."""
    for _ in range(cycles):
        await FallingEdge(dut.clk)


def pin(dut, name):
    """The value, 0 or 1, of one output pin: pin(dut, "uo[3]") or pin(dut, "uio[5]")."""
    bus, n = name.rstrip("]").split("[")
    signal = {"uo": dut.uo_out, "uio": dut.uio_out}[bus]
    return (int(signal.value) >> int(n)) & 1


def is_output(dut, name):
    """Whether a uio pin is set as an output (its uio_oe bit is 1)."""
    n = int(name.rstrip("]").split("[")[1])
    return (int(dut.uio_oe.value) >> n) & 1
