module uart_tx(
	input wire clk,
	input wire tick,
	input wire rst,
	input wire en, //enable to start transmitting when data is ready
	input wire [7:0] data_in,
	output reg tx
);

	//bit count
	reg [2:0] cnt;
	//state logic
	reg [1:0] state, next_state;
	localparam IDLE = 2'b00;
	localparam START = 2'b01;
	localparam DATA = 2'b10;
	localparam STOP = 2'b11;

	//state register
	always @(posedge clk or posedge rst) begin
		if (rst)
			state = IDLE;
		else
			state <= next_state;
	end

	//next state logic
	always @(*) begin
		next_state = state;
		case(state)
			IDLE: if(en) next_state = START;
			START: if(tick) next_state = DATA;
			DATA: if(tick && cnt == 7) next_state <= STOP;
			STOP: if(tick) next_state = IDLE;
		endcase
	end

	//output and counters 
	always @(posedge clk or posedge rst) begin
		if(rst) begin
			tx <= 1;
			cnt <= 0;
		end else begin
			case (state)
				IDLE: tx <= 1;
				START: if(tick) tx <= 0;
				DATA: if(tick) begin
					tx <= data_in[cnt];
					cnt <= cnt + 1;
				end
				STOP: if(tick) tx <= 1;
			endcase
		end
	end
endmodule
