`timescale 1ns / 1ps

module uart_tx_tb;

  logic clk;
  logic [7:0] data_in;
  logic rst;
  logic tick;
  logic en;
  logic tx;
  logic busy;

  localparam int CLKFREQ = 50_000_000;
  localparam int BAUD = 9600;

  initial clk = 0;
  always #10 clk = ~clk;

  top #(
      .CLKFREQ(CLKFREQ),
      .BAUDS  (BAUD)
  ) dut (
      .clk(clk),
      .rst(rst),
      .en(en),
      .tx(tx),
      .busy(busy),
      .data_in(data_in)
  );

  initial begin
    //gtkwave block
    $dumpfile("uart_tx_tb.vcd");
    $dumpvars(0, uart_tx_tb);

    rst = 1;
    en = 0;
    data_in = 8'h00;

    #50;
    rst = 0;

    data_in = 8'hA5;
    en = 1;
    #20;
    en = 0;

    #2_000_000;

    data_in = 8'h3C;
    en = 1;
    #20;
    en = 0;

    #2_000_000;

    $finish;
  end

endmodule

