module LedShiz01(
	input clk_50,
	output [3:0] leds
);

PwmLed #(
	.DEFAULT_PWM_WIDTH(8'h00)
) led0 (
	.clk_50(clk_50),
	.led(leds[0])
);

PwmLed #(
	.DEFAULT_PWM_WIDTH(8'h40)
) led1 (
	.clk_50(clk_50),
	.led(leds[1])
);

PwmLed #(
	.DEFAULT_PWM_WIDTH(8'h80)
) led2 (
	.clk_50(clk_50),
	.led(leds[2])
);

PwmLed #(
	.DEFAULT_PWM_WIDTH(8'hc0)
) led3 (
	.clk_50(clk_50),
	.led(leds[3])
);

endmodule
