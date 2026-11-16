/*
 * Copyright (c) 2026 UofT ASIC Team
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

// Slot uio[7]: heartbeat, a slow square wave that shows the chip is running.
// The output toggles every 256 clock cycles while the design is out of reset.
module slot_uio7 (
    input  wire       clk,
    input  wire       rst_n,
    input  wire [7:0] in,     // ui_in, shared by every slot
    output wire       out,    // drives uio_out[7]
    output wire       oe      // uio_oe[7]: 1 makes the pin an output, 0 an input
);

  reg [7:0] count;
  reg       beat;

  always @(posedge clk) begin
    if (!rst_n) begin
      count <= 8'd0;
      beat  <= 1'b0;
    end else begin
      count <= count + 8'd1;
      if (count == 8'd255)
        beat <= ~beat;
    end
  end

  assign out = beat;
  assign oe  = 1'b0;

  wire _unused = &{in, 1'b0};

endmodule
