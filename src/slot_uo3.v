/*
 * Copyright (c) 2026 UofT ASIC Team
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

// Slot uo[3]: parity, claimed by vproHacks.
// 1 when an odd number of the eight ui_in pins are 1.
module slot_uo3 (
    input  wire       clk,
    input  wire       rst_n,
    input  wire [7:0] in,     // ui_in, shared by every slot
    output wire       out     // drives uo[3]
);

  assign out = ^in;

  wire _unused = &{clk, rst_n, 1'b0};

endmodule
