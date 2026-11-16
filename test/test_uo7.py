# Slot uo[7]: unclaimed. Whoever claims uo[7] replaces this test with one for their block.

import cocotb
from sandbox import pin, settle, start


@cocotb.test()
async def test_uo7_unclaimed(dut):
    await start(dut)
    for value in (0x00, 0xFF):
        dut.ui_in.value = value
        await settle(dut)
        assert pin(dut, "uo[7]") == 0, f"unclaimed uo[7] is {pin(dut, 'uo[7]')} with ui_in = {value:#04x}, expected 0"
