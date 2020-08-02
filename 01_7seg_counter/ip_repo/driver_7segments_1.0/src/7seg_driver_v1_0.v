/**
  Module name:  7seg_driver
  Author: P Trujillo (pablo@controlpaths.com)
  Date: May 2020
  Description: 7 segments driver
  Revision: 1.0 Module created.
**/

module seg_driver_v1_0 (
  input clk,
  input rstn,

  input [3:0] i4_dig1,
  input i_dp1,
  input [3:0] i4_dig2,
  input i_dp2,
  input [3:0] i4_dig3,
  input i_dp3,
  input [3:0] i4_dig4,
  input i_dp4,
  input i_twopoint,

  output [7:0] o8_segc,
  output reg [4:0] or5_sega
  );

  localparam seg_0 = 7'h7e;
  localparam seg_1 = 7'h30;
  localparam seg_2 = 7'h6d;
  localparam seg_3 = 7'h79;
  localparam seg_4 = 7'h33;
  localparam seg_5 = 7'h5b;
  localparam seg_6 = 7'h5f;
  localparam seg_7 = 7'h70;
  localparam seg_8 = 7'h7F;
  localparam seg_9 = 7'h7b;
  localparam seg_a = 7'h77;
  localparam seg_b = 7'h1f;
  localparam seg_c = 7'h4e;
  localparam seg_d = 7'h3d;
  localparam seg_e = 7'h4f;
  localparam seg_f = 7'h47;

  reg [7:0] r8_delay;

  reg [1:0] r2_digit_counter;
  reg [7:0] r7_segc_temp;
  reg r_dp_temp;

  always @(posedge clk)
    if (!rstn) begin
      r8_delay <= 8'd0;
      r7_segc_temp <= 7'd0;
      r2_digit_counter <= 2'd0;
      r_dp_temp <= 1'b0;
    end
    else begin

      if (&r8_delay) begin
        r2_digit_counter <= r2_digit_counter+1;

        if ((i4_dig1 == 4'h0 && r2_digit_counter == 0) ||
            (i4_dig2 == 4'h0 && r2_digit_counter == 1) ||
            (i4_dig3 == 4'h0 && r2_digit_counter == 2) ||
            (i4_dig4 == 4'h0 && r2_digit_counter == 3))
          r7_segc_temp <= seg_0;
        else if ((i4_dig1 == 4'h1 && r2_digit_counter == 0) ||
            (i4_dig2 == 4'h1 && r2_digit_counter == 1) ||
            (i4_dig3 == 4'h1 && r2_digit_counter == 2) ||
            (i4_dig4 == 4'h1 && r2_digit_counter == 3))
          r7_segc_temp <= seg_1;
        else if ((i4_dig1 == 4'h2 && r2_digit_counter == 0) ||
            (i4_dig2 == 4'h2 && r2_digit_counter == 1) ||
            (i4_dig3 == 4'h2 && r2_digit_counter == 2) ||
            (i4_dig4 == 4'h2 && r2_digit_counter == 3))
          r7_segc_temp <= seg_2;
        else if ((i4_dig1 == 4'h3 && r2_digit_counter == 0) ||
            (i4_dig2 == 4'h3 && r2_digit_counter == 1) ||
            (i4_dig3 == 4'h3 && r2_digit_counter == 2) ||
            (i4_dig4 == 4'h3 && r2_digit_counter == 3))
          r7_segc_temp <= seg_3;
        else if ((i4_dig1 == 4'h4 && r2_digit_counter == 0) ||
            (i4_dig2 == 4'h4 && r2_digit_counter == 1) ||
            (i4_dig3 == 4'h4 && r2_digit_counter == 2) ||
            (i4_dig4 == 4'h4 && r2_digit_counter == 3))
          r7_segc_temp <= seg_4;
        else if ((i4_dig1 == 4'h5 && r2_digit_counter == 0) ||
            (i4_dig2 == 4'h5 && r2_digit_counter == 1) ||
            (i4_dig3 == 4'h5 && r2_digit_counter == 2) ||
            (i4_dig4 == 4'h5 && r2_digit_counter == 3))
          r7_segc_temp <= seg_5;
        else if ((i4_dig1 == 4'h6 && r2_digit_counter == 0) ||
            (i4_dig2 == 4'h6 && r2_digit_counter == 1) ||
            (i4_dig3 == 4'h6 && r2_digit_counter == 2) ||
            (i4_dig4 == 4'h6 && r2_digit_counter == 3))
          r7_segc_temp <= seg_6;
        else if ((i4_dig1 == 4'h7 && r2_digit_counter == 0) ||
            (i4_dig2 == 4'h7 && r2_digit_counter == 1) ||
            (i4_dig3 == 4'h7 && r2_digit_counter == 2) ||
            (i4_dig4 == 4'h7 && r2_digit_counter == 3))
          r7_segc_temp <= seg_7;
        else if ((i4_dig1 == 4'h8 && r2_digit_counter == 0) ||
            (i4_dig2 == 4'h8 && r2_digit_counter == 1) ||
            (i4_dig3 == 4'h8 && r2_digit_counter == 2) ||
            (i4_dig4 == 4'h8 && r2_digit_counter == 3))
          r7_segc_temp <= seg_8;
        else if ((i4_dig1 == 4'h9 && r2_digit_counter == 0) ||
            (i4_dig2 == 4'h9 && r2_digit_counter == 1) ||
            (i4_dig3 == 4'h9 && r2_digit_counter == 2) ||
            (i4_dig4 == 4'h9 && r2_digit_counter == 3))
          r7_segc_temp <= seg_9;
        else if ((i4_dig1 == 4'ha && r2_digit_counter == 0) ||
            (i4_dig2 == 4'ha && r2_digit_counter == 1) ||
            (i4_dig3 == 4'ha && r2_digit_counter == 2) ||
            (i4_dig4 == 4'ha && r2_digit_counter == 3))
          r7_segc_temp <= seg_a;
        else if ((i4_dig1 == 4'hb && r2_digit_counter == 0) ||
            (i4_dig2 == 4'hb && r2_digit_counter == 1) ||
            (i4_dig3 == 4'hb && r2_digit_counter == 2) ||
            (i4_dig4 == 4'hb && r2_digit_counter == 3))
          r7_segc_temp <= seg_b;
        else if ((i4_dig1 == 4'hc && r2_digit_counter == 0) ||
            (i4_dig2 == 4'hc && r2_digit_counter == 1) ||
            (i4_dig3 == 4'hc && r2_digit_counter == 2) ||
            (i4_dig4 == 4'hc && r2_digit_counter == 3))
          r7_segc_temp <= seg_c;
        else if ((i4_dig1 == 4'hd && r2_digit_counter == 0) ||
            (i4_dig2 == 4'hd && r2_digit_counter == 1) ||
            (i4_dig3 == 4'hd && r2_digit_counter == 2) ||
            (i4_dig4 == 4'hd && r2_digit_counter == 3))
          r7_segc_temp <= seg_d;
        else if ((i4_dig1 == 4'he && r2_digit_counter == 0) ||
            (i4_dig2 == 4'he && r2_digit_counter == 1) ||
            (i4_dig3 == 4'he && r2_digit_counter == 2) ||
            (i4_dig4 == 4'he && r2_digit_counter == 3))
          r7_segc_temp <= seg_e;
        else if ((i4_dig1 == 4'hf && r2_digit_counter == 0) ||
            (i4_dig2 == 4'hf && r2_digit_counter == 1) ||
            (i4_dig3 == 4'hf && r2_digit_counter == 2) ||
            (i4_dig4 == 4'hf && r2_digit_counter == 3))
          r7_segc_temp <= seg_f;

        if ((i_dp1 && r2_digit_counter == 0) ||
            (i_dp2 && r2_digit_counter == 1) ||
            (i_dp3 && r2_digit_counter == 2) ||
            (i_dp4 && r2_digit_counter == 3))
          r_dp_temp <= 1'b1;
        else
          r_dp_temp <= 1'b0;

        case (r2_digit_counter)
          2'b00: or5_sega <= 5'b11101;
          2'b01: or5_sega <= 5'b11011;
          2'b10: or5_sega <= 5'b10111;
          2'b11: or5_sega <= 5'b01111;
        endcase
      end

      r8_delay <= r8_delay+1;
    end

  assign o8_segc = {r7_segc_temp, r_dp_temp};

endmodule
