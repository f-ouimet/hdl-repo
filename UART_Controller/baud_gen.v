module baud_gen #(
	parameter CLK_FREQ = 50_000_000, //50 mhz clock
	parameter BAUD = 9600		//9600 baud
)(
	input wire clk,
	input wire rst,
	output reg baud_tick
);
	localparam integer BAUD_DIV = CLK_FREQ / BAUD;
	reg [$clog2(BAUD_DIV)-1:0] cnt; //takes the size of baud_div

	always @(posedge clk or posedge rst) begin
		if (rst) begin
			cnt <= 0;
			baud_tick <= 0;
		end else if (cnt == BAUD_DIV-1) begin
			cnt <= 0;
			baud_tick <= 1;

		end else begin
			cnt <= cnt + 1;
			baud_tick <= 0;
		end
	end
endmodule

