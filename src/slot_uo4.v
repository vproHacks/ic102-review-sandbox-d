/*
 * Copyright (c) 2026 UofT ASIC Team
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

// Slot uo[4]: majority, claimed by vproHacks.
// 1 when at least two of ui_in[2:0] are 1.
module slot_uo4 (
    input  wire       clk,
    input  wire       rst_n,
    input  wire [7:0] in,     // ui_in, shared by every slot
    output wire       out     // drives uo[4]
);

  assign out = (in[0] & in[1]) | (in[1] & in[2]) | (in[0] & in[2]);

  wire _unused = &{clk, rst_n, in[7:3], 1'b0};

endmodule
