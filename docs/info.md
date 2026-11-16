<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

The sandbox has sixteen slots, one for each output pin: `uo[0]` to `uo[7]` and `uio[0]` to
`uio[7]`. Each slot is a small block in its own file, `src/slot_<pin>.v`, and every block can read
all eight `ui_in` pins. A `uio` pin is an input until the block that claims it makes it an output.

| Pin | Block | Claimed by |
|---|---|---|
| `uo[0]` | unclaimed | |
| `uo[1]` | unclaimed | |
| `uo[2]` | unclaimed | |
| `uo[3]` | parity: 1 when an odd number of ui_in pins are 1 | vproHacks |
| `uo[4]` | majority: 1 when at least two of ui_in[2:0] are 1 | vproHacks |
| `uo[5]` | unclaimed | |
| `uo[6]` | unclaimed | |
| `uo[7]` | unclaimed | |
| `uio[0]` | unclaimed | |
| `uio[1]` | unclaimed | |
| `uio[2]` | unclaimed | |
| `uio[3]` | unclaimed | |
| `uio[4]` | unclaimed | |
| `uio[5]` | unclaimed | |
| `uio[6]` | unclaimed | |
| `uio[7]` | heartbeat: toggles every 256 clock cycles | course (AI-written) |

## How to test

Set `ui_in` and read the pin of the block you want; the table says what each block does. Each
block's own test is `test/test_<pin>.py`.

## External hardware

None.
