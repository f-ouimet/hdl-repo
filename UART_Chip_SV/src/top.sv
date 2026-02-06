module top #(
    parameter int CLKFREQ = 50_000_000,
    parameter int BAUDS   = 9600
) (
    input logic clk,
    input logic rst,
    input logic [7:0] data_in,
    input logic en,
    output logic busy,
    output logic tx
);

  logic baud_tick;


  baud_gen #(
      .CLK_FREQ(CLKFREQ),
      .BAUD(BAUDS)
  ) baud_inst (
      .clk(clk),
      .rst(rst),
      .baud_tick(baud_tick)
  );

  uart_tx uart_tx_inst (
      .clk(clk),
      .rst(rst),
      .en(en),
      .tick(baud_tick),
      .busy(busy),
      .data_in(data_in),
      .tx(tx)
  );

endmodule
