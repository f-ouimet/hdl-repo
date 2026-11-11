// Self-checking testbench for the pong game logic and VGA frame snapshot.
// Drives the game tick directly (much faster than the real 240 Hz tick)
// with random player input, and checks that nothing ever leaves the screen,
// wraps around or jumps.
//
// run: make check
`timescale 1ns / 1ps

module pong_check_tb;

    localparam N_TICKS = 200000;

    reg clk = 0;
    always #20 clk = ~clk;

    reg rst = 1;
    reg btn_up = 0;
    reg btn_dwn = 0;
    reg tick = 0;

    wire [9:0] ball_x, ball_y, l_paddle_y, r_paddle_y;
    wire [3:0] score_l, score_r;

    pong dut (
        .clk(clk), .tick(tick), .rst(rst),
        .btn_up(btn_up), .btn_dwn(btn_dwn),
        .ball_x(ball_x), .ball_y(ball_y),
        .l_paddle_y(l_paddle_y), .r_paddle_y(r_paddle_y),
        .score_l(score_l), .score_r(score_r)
    );

    integer errors = 0;
    integer n_ticks = 0;
    integer top_bounces = 0, bottom_bounces = 0;
    integer l_hits = 0, r_hits = 0;
    integer pts_l = 0, pts_r = 0;

    reg [9:0] p_bx, p_by, p_lp, p_rp;
    reg [1:0] p_state;
    reg signed [2:0] p_dy;
    reg signed [1:0] p_dx;
    reg [3:0] p_sl, p_sr;

    task fail(input [8*64-1:0] msg);
        begin
            errors = errors + 1;
            if (errors <= 20)
                $display("ERROR tick %0d: %0s  bx=%0d by=%0d dx=%0d dy=%0d lp=%0d rp=%0d",
                         n_ticks, msg, ball_x, ball_y, dut.ball_dx, dut.ball_dy,
                         l_paddle_y, r_paddle_y);
        end
    endtask

    function integer iabs(input integer v);
        iabs = (v < 0) ? -v : v;
    endfunction

    initial begin
        repeat (5) @(posedge clk);
        rst <= 0;
        repeat (2) @(posedge clk);

        while (n_ticks < N_TICKS) begin
            // random player input, held for a while
            if (n_ticks % 37 == 0) begin
                case ($random & 3)
                    0: begin btn_up <= 1; btn_dwn <= 0; end
                    1: begin btn_up <= 0; btn_dwn <= 1; end
                    2: begin btn_up <= 1; btn_dwn <= 1; end
                    default: begin btn_up <= 0; btn_dwn <= 0; end
                endcase
            end

            p_bx = ball_x; p_by = ball_y; p_lp = l_paddle_y; p_rp = r_paddle_y;
            p_state = dut.state; p_dy = dut.ball_dy; p_dx = dut.ball_dx;
            p_sl = score_l; p_sr = score_r;

            tick <= 1;
            @(posedge clk);
            tick <= 0;
            @(posedge clk); #1;
            n_ticks = n_ticks + 1;

            // ---- bounds (no wrap-around) ----
            if (ball_x > 632)      fail("ball_x off screen");
            if (ball_y > 472)      fail("ball_y off screen");
            if (l_paddle_y > 420)  fail("left paddle off screen");
            if (r_paddle_y > 420)  fail("right paddle off screen");
            if (^{ball_x, ball_y, l_paddle_y, r_paddle_y} === 1'bx) fail("X on outputs");

            if (p_state == 2'b10 && dut.state == 2'b10) begin
                // ---- smooth motion during play ----
                if (iabs(ball_y - p_by) > 2) fail("ball_y jumped");
                if (iabs(ball_x - p_bx) > 1) fail("ball_x jumped");
                // ---- ball never goes through a paddle face ----
                if (p_bx >= 30 && ball_x < 30 &&
                    ball_y + 8 > p_lp && ball_y < p_lp + 60) fail("ball went through left paddle");
                if (p_bx + 8 <= 610 && ball_x + 8 > 610 &&
                    ball_y + 8 > p_rp && ball_y < p_rp + 60) fail("ball went through right paddle");
                if (iabs(l_paddle_y - p_lp) > 4) fail("left paddle jumped");
                if (iabs(r_paddle_y - p_rp) > 3) fail("right paddle jumped");

                // ---- ball moves in the direction it was going ----
                if (p_dy < 0 && ball_y > p_by) fail("ball moved down while dy<0");
                if (p_dy > 0 && ball_y < p_by) fail("ball moved up while dy>0");

                // ---- statistics ----
                if (ball_y == 0   && p_dy < 0) top_bounces = top_bounces + 1;
                if (ball_y == 472 && p_dy > 0) bottom_bounces = bottom_bounces + 1;
                if (p_dx < 0 && dut.ball_dx > 0) l_hits = l_hits + 1;
                if (p_dx > 0 && dut.ball_dx < 0) r_hits = r_hits + 1;

                // ---- after a wall bounce the ball must leave the wall ----
                if (ball_y == 0   && dut.ball_dy < 0) fail("stuck on top wall");
                if (ball_y == 472 && dut.ball_dy > 0) fail("stuck on bottom wall");
            end

            // ---- scoring goes to the right player ----
            if (score_l != p_sl) begin
                pts_l = pts_l + 1;
                if (p_bx < 320) fail("left scored with ball on the left");
            end
            if (score_r != p_sr) begin
                pts_r = pts_r + 1;
                if (p_bx > 320) fail("right scored with ball on the right");
            end
        end

        $display("ticks=%0d top_bounces=%0d bottom_bounces=%0d l_hits=%0d r_hits=%0d points L=%0d R=%0d",
                 n_ticks, top_bounces, bottom_bounces, l_hits, r_hits, pts_l, pts_r);
        if (top_bounces == 0 || bottom_bounces == 0) fail("walls never exercised");
        if (l_hits == 0 || r_hits == 0)              fail("paddles never hit");
        if (pts_r == 0)                              fail("no points scored");

        if (errors == 0) $display("PASS");
        else             $display("FAIL: %0d errors", errors);
        $finish;
    end

endmodule
