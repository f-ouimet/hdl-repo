module uart_tx (
    input logic clk,
    input logic tick,
    input logic rst,
    input logic en,  //enable to start transmitting when data is ready
    input logic [7:0] data_in,
    output logic tx,
    output logic busy
);


  //state logic
  logic [1:0] state;
  localparam logic [1:0] IDLE = 2'b00;
  localparam logic [1:0] START = 2'b01;
  localparam logic [1:0] DATA = 2'b10;
  localparam logic [1:0] STOP = 2'b11;

  reg parity_bit;
  reg [7:0] data_reg;  //captured data
  //tx bit count
  reg [2:0] cnt;


  always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
      state <= IDLE;
      cnt <= 3'd0;
      data_reg <= 8'd0;
      tx <= 1'b1;
      busy <= 1'b0;
    end else begin
      case (state)
        IDLE: begin
          tx   <= 1'b1;
          busy <= 1'b0;
          cnt  <= 3'd0;
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

        DATA: begin
          tx   <= data_reg[cnt];  //lsb to msb
          busy <= 1'b1;
          if (tick) begin
            if (cnt == 3'd7) state <= STOP;
            else cnt <= cnt + 1'b1;
          end
        end

        STOP: begin
          tx   <= 1'b1;  //stop bit
          busy <= 1'b1;
          if (tick) state <= IDLE;
        end

        default: state <= IDLE;
      endcase
    end
  end
endmodule
