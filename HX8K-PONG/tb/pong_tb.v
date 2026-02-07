
`timescale 1ns / 1ps

module pong_tb;

  initial begin
      $dumpfile("pong.vcd");
      $dumpvars(0, pong_tb);
  end
    // clock
    reg clk = 0;
    always #20 clk = ~clk; // 25 MHz (40 ns period)

    // reset & inputs
    reg rst;
    reg btn_up;
    reg btn_dwn;

    // outputs
    wire tick;
    wire [9:0] ball_x;
    wire [9:0] ball_y;
    wire [9:0] l_paddle_y;
    wire [9:0] r_paddle_y;
    wire [3:0] score_l;
    wire [3:0] score_r;

    // --------------------------------
    // game tick (example: ~60 Hz)
    // --------------------------------
    game_tick uut_tick (
        .clk_in(clk),
        .rst(rst),
        .tick(tick)
    );

    // --------------------------------
    // pong DUT
    // --------------------------------
    pong uut_pong (
        .clk(clk),
        .tick(tick),
        .rst(rst),
        .btn_up(btn_up),
        .btn_dwn(btn_dwn),
        .ball_x(ball_x),
        .ball_y(ball_y),
        .l_paddle_y(l_paddle_y),
        .r_paddle_y(r_paddle_y),
        .score_l(score_l),
        .score_r(score_r)
    );

    // --------------------------------
    // stimulus
    // --------------------------------
    initial begin
        // init
        rst     = 1;
        btn_up = 0;
        btn_dwn = 0;

        // reset pulse
        #200;
        rst = 0;

        // wait for IDLE → SERVE
        #5_000_000;

        // press serve button
        btn_up = 1;
        #2_000_000;   // long press (safe)
        btn_up = 0;

        // let game run
        #50_000_000;
        #50_000_000;
        #100_000_000;
      #1000000000;
        $finish;
    end

    // --------------------------------
    // monitoring
    // --------------------------------
    always @(posedge clk) begin
        if (tick) begin
            $display(
                "TICK | ball_x=%0d ball_y=%0d score L=%0d R=%0d",
                ball_x, ball_y, score_l, score_r
            );
        end
    end

endmodule

