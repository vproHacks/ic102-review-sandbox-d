# Slot uio[2]: unclaimed. Whoever claims uio[2] replaces this test with one for their block.

import cocotb
from sandbox import is_output, pin, settle, start


@cocotb.test()
async def test_uio2_unclaimed(dut):
    await start(dut)
    for value in (0x00, 0xFF):
        dut.ui_in.value = value
        await settle(dut)
        assert pin(dut, "uio[2]") == 0, f"unclaimed uio[2] is {pin(dut, 'uio[2]')} with ui_in = {value:#04x}, expected 0"
    assert not is_output(dut, "uio[2]"), "unclaimed uio[2] should be an input"
