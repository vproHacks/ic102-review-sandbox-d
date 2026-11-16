# Slot uo[4]: majority, claimed by vproHacks.
# The block: 1 when at least two of ui_in[2:0] are 1.

import cocotb
from sandbox import pin, settle, start


@cocotb.test()
async def test_uo4_majority(dut):
    await start(dut)
    for value, expected in [(0x00, 0), (0x03, 1)]:
        dut.ui_in.value = value
        await settle(dut)
        got = pin(dut, "uo[4]")
        assert got == expected, f"majority: ui_in = {value:#04x} gives uo[4] = {got}, expected {expected}"
