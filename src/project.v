/*
 * Copyright (c) 2026 UofT ASIC Team
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

// The IC102-D review sandbox. Each output pin, uo[0] to uo[7] and uio[0] to uio[7],
// is driven by its own slot module in src/slot_<pin>.v, and every slot can read all
// eight ui_in pins. The slots are claimed one pull request at a time; see CONTRIBUTING.md.
module tt_um_uoftasic_ic102_sandbox (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  slot_uo0  s_uo0  (.clk(clk), .rst_n(rst_n), .in(ui_in), .out(uo_out[0]));
  slot_uo1  s_uo1  (.clk(clk), .rst_n(rst_n), .in(ui_in), .out(uo_out[1]));
  slot_uo2  s_uo2  (.clk(clk), .rst_n(rst_n), .in(ui_in), .out(uo_out[2]));
  slot_uo3  s_uo3  (.clk(clk), .rst_n(rst_n), .in(ui_in), .out(uo_out[3]));
  slot_uo4  s_uo4  (.clk(clk), .rst_n(rst_n), .in(ui_in), .out(uo_out[4]));
  slot_uo5  s_uo5  (.clk(clk), .rst_n(rst_n), .in(ui_in), .out(uo_out[5]));
  slot_uo6  s_uo6  (.clk(clk), .rst_n(rst_n), .in(ui_in), .out(uo_out[6]));
  slot_uo7  s_uo7  (.clk(clk), .rst_n(rst_n), .in(ui_in), .out(uo_out[7]));

  slot_uio0 s_uio0 (.clk(clk), .rst_n(rst_n), .in(ui_in), .out(uio_out[0]), .oe(uio_oe[0]));
  slot_uio1 s_uio1 (.clk(clk), .rst_n(rst_n), .in(ui_in), .out(uio_out[1]), .oe(uio_oe[1]));
  slot_uio2 s_uio2 (.clk(clk), .rst_n(rst_n), .in(ui_in), .out(uio_out[2]), .oe(uio_oe[2]));
  slot_uio3 s_uio3 (.clk(clk), .rst_n(rst_n), .in(ui_in), .out(uio_out[3]), .oe(uio_oe[3]));
  slot_uio4 s_uio4 (.clk(clk), .rst_n(rst_n), .in(ui_in), .out(uio_out[4]), .oe(uio_oe[4]));
  slot_uio5 s_uio5 (.clk(clk), .rst_n(rst_n), .in(ui_in), .out(uio_out[5]), .oe(uio_oe[5]));
  slot_uio6 s_uio6 (.clk(clk), .rst_n(rst_n), .in(ui_in), .out(uio_out[6]), .oe(uio_oe[6]));
  slot_uio7 s_uio7 (.clk(clk), .rst_n(rst_n), .in(ui_in), .out(uio_out[7]), .oe(uio_oe[7]));

  // The slots read only ui_in.
  wire _unused = &{ena, uio_in, 1'b0};

endmodule
