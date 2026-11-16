/*
 * Copyright (c) 2026 UofT ASIC Team
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

// Slot uo[0]: unclaimed. CONTRIBUTING.md says how to claim it.
module slot_uo0 (
    input  wire       clk,
    input  wire       rst_n,
    input  wire [7:0] in,     // ui_in, shared by every slot
    output wire       out     // drives uo[0]
);

  // Unclaimed: drive 0.
  assign out = 1'b0;

  wire _unused = &{clk, rst_n, in, 1'b0};

endmodule
