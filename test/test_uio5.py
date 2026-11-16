# Slot uio[5]: unclaimed. Whoever claims uio[5] replaces this test with one for their block.

import cocotb
from sandbox import is_output, pin, settle, start


@cocotb.test()
async def test_uio5_unclaimed(dut):
    await start(dut)
    for value in (0x00, 0xFF):
        dut.ui_in.value = value
        await settle(dut)
        assert pin(dut, "uio[5]") == 0, f"unclaimed uio[5] is {pin(dut, 'uio[5]')} with ui_in = {value:#04x}, expected 0"
    assert not is_output(dut, "uio[5]"), "unclaimed uio[5] should be an input"
