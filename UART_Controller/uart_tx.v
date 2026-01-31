module uart_tx (
    input wire clk,
    input wire tick,
    input wire rst,
    input wire en,  //enable to start transmitting when data is ready
    input wire [7:0] data_in,
    output reg tx,
    output reg busy
);

  
  //state logic
  reg [1:0] state, next_state;
  localparam IDLE = 2'b00;
  localparam START = 2'b01;
  localparam DATA = 2'b10;
  localparam STOP = 2'b11;

  reg parity_bit;
  reg en_d; //latch for en high
  reg [7:0] data_reg;  //captured data
  //tx bit count
  reg [2:0] cnt;

  
  always @(posedge clk or posedge rst) begin
    if(rst) begin
      state <= IDLE;
      cnt <= 3'd0;
      data_reg <= 8'd0;
      tx <= 1'b1;
      busy <= 1'b0;
    end else begin 
      case (state)
        IDLE: begin
          tx <= 1'b1;
          busy <= 1'b0;
          cnt <= 3'd0;
          if (en) begin
            data_reg <= data_in;
            state <= START;
            busy <= 1'b1;
          end
        end
        
        START: begin
          tx <= 1'b0;
          if (tick) state <= DATA;
        end

        DATA : begin
          tx <= data_reg[cnt]; //lsb to msb 
          busy <= 1'b1;
          if (tick) begin
            if (cnt == 3'd7)
              state <= STOP;
            else
              cnt <= cnt + 1'b1;
          end
        end
        
        STOP: begin
          tx <= 1'b1; //stop bit
          busy <= 1'b1;
          if (tick) state <= IDLE;
        end
      endcase
    end
  end
endmodule
