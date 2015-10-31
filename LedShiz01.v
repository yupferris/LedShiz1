module LedShiz01(
	input clk_50,
	output [3:0] leds
);

`define led(default_pwm_width, index) \
PwmLed #( \
	.DEFAULT_PWM_WIDTH(default_pwm_width) \
) ( \
	.clk_50(clk_50), \
	.led(leds[index]) \
);

`led(8'h00, 0)
`led(8'h40, 1)
`led(8'h80, 2)
`led(8'hc0, 3)

endmodule
