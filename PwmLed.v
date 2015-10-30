module PwmLed(
	input clk_50,
	output led
);

parameter DEFAULT_PWM_WIDTH = 8'h00;

reg [31:0] pwm_width_counter;
reg [7:0] pwm_width = DEFAULT_PWM_WIDTH;
reg pwm_width_dir;

reg [31:0] pwm_counter;
reg [7:0] pwm_pos;

reg led_state;

assign led = led_state;

always @ (posedge clk_50) begin
	if (pwm_counter == 32'd2500 - 1) begin
		pwm_pos <= pwm_pos + 1;
		led_state <= pwm_pos >= pwm_width;
		pwm_counter <= 0;
	end else begin
		pwm_counter <= pwm_counter + 1;
	end
	
	if (pwm_width_counter == 32'd100000 - 1) begin
		if (pwm_width_dir == 0) begin
			if (pwm_width == 8'hff) begin
				pwm_width_dir <= ~pwm_width_dir;
			end else begin
				pwm_width <= pwm_width + 1;
			end
		end else begin
			if (pwm_width == 0) begin
				pwm_width_dir <= ~pwm_width_dir;
			end else begin
				pwm_width <= pwm_width - 1;
			end
		end
		pwm_width_counter <= 0;
	end else begin
		pwm_width_counter <= pwm_width_counter + 1;
	end
end

endmodule
