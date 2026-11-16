# Slot uio[1]: unclaimed. Whoever claims uio[1] replaces this test with one for their block.

import cocotb
from sandbox import is_output, pin, settle, start


@cocotb.test()
async def test_uio1_unclaimed(dut):
    await start(dut)
    for value in (0x00, 0xFF):
        dut.ui_in.value = value
        await settle(dut)
        assert pin(dut, "uio[1]") == 0, f"unclaimed uio[1] is {pin(dut, 'uio[1]')} with ui_in = {value:#04x}, expected 0"
    assert not is_output(dut, "uio[1]"), "unclaimed uio[1] should be an input"
