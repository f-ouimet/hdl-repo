`timescale 1ns/1ps

module uart_tx_tb;
	reg [7:0] data;
	reg rst;
	reg en;
	wire tx;
  wire busy;
  // parameters (can override DUT defaults)
    localparam CLK_FREQ = 50_000_000;
    localparam BAUD     = 9600;

    reg clk;
    wire tick;
    reg en_d;
	uart_tx uut(
		.clk(clk),
		.rst(rst),
		.en(en),
		.data_in(data),
		.tx(tx),
		.tick(tick),
    .busy(busy)
	);

  baud_gen #(
    .CLK_FREQ(CLK_FREQ),
    .BAUD(BAUD)
  )baud_inst(
    .clk(clk),
    .rst(rst),
    .baud_tick(tick)
  );

	initial clk=0;
	always #10 clk = ~clk; //invert every 10ns for 50MHz/20ns period

  //test stimulus
  initial begin
    rst = 1;
    en = 0;
    data = 8'h00;

    //hold reset 
    #50;
    rst = 0;

    //transmit first byte
    data = 8'hA5;
    en = 1;
    #20; 
    en = 0;

    #2_000_000;

    //second byte 
    data = 8'h3C;
    en = 1;
    #20;
    en = 0;

    #2_000_000;

    $finish;
  end

  initial begin
    $monitor("Time=%0t | rst=%b | en=%b | data=%h | tx=%b | tick=%b",
              $time, rst, en, data, tx, tick);
  end
  initial begin
    $monitor("Time=%0t | tick=%b", $time, tick);
  end
  initial begin
    $dumpfile("uart_tx_tb.vcd");
    $dumpvars(0, uart_tx_tb);
  end
endmodule
