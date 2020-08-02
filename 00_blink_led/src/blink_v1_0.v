/**
  Module name:  blink
  Author: P Trujillo (pablo@controlpaths.com)
  Date: May 2020
  Description: Blick 8 led module
  Revision: 1.0 Module created.
**/

module blink_v1_0 (
  input clk25mhz,

  output [7:0] o_led
  );

  reg [23:0] counter;

  initial counter = 0;

  always @(posedge clk25mhz)
    counter <= counter+1;

  assign o_led = (counter > 2**23)? 8'haa: 8'h55;

endmodule
