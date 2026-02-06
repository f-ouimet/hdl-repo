module baud_gen #(
    parameter int CLK_FREQ = 50_000_000,  //50 mhz clock
    parameter int BAUD = 9600  //9600 baud
) (
    input  logic clk,
    input  logic rst,
    output logic baud_tick
);
  localparam int BAUDDIV = CLK_FREQ / BAUD;
  localparam int CNTSIZE = $clog2(BAUDDIV);
  logic [CNTSIZE-1:0] cnt;  //takes the size of baud_div

  always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
      cnt <= 0;
      baud_tick <= 0;
    end else if (cnt == BAUDDIV - 1) begin
      cnt <= 0;
      baud_tick <= 1;

    end else begin
      cnt <= cnt + 1;
      baud_tick <= 0;
    end
  end
endmodule

