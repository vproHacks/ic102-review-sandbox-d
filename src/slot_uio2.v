/*
 * Copyright (c) 2026 UofT ASIC Team
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

// Slot uio[2]: unclaimed. CONTRIBUTING.md says how to claim it.
module slot_uio2 (
    input  wire       clk,
    input  wire       rst_n,
    input  wire [7:0] in,     // ui_in, shared by every slot
    output wire       out,     // drives uio_out[2]
    output wire       oe       // uio_oe[2]: 1 makes the pin an output, 0 an input
);

  // Unclaimed: drive 0 and leave the pin an input.
  assign out = 1'b0;
  assign oe  = 1'b0;

  wire _unused = &{clk, rst_n, in, 1'b0};

endmodule
