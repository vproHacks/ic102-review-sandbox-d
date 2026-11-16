# Slot uo[3]: parity, claimed by vproHacks.
# The block: 1 when an odd number of the eight ui_in pins are 1.

import cocotb
from sandbox import pin, settle, start


@cocotb.test()
async def test_uo3_parity(dut):
    await start(dut)
    for value, expected in [(0x00, 0), (0x01, 1), (0x10, 1), (0x80, 1), (0xF0, 0), (0xFF, 0)]:
        dut.ui_in.value = value
        await settle(dut)
        got = pin(dut, "uo[3]")
        assert got == expected, f"parity: ui_in = {value:#04x} gives uo[3] = {got}, expected {expected}"
