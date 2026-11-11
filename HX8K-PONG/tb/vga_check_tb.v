// Checks that the VGA renderer only picks up new game positions during
// vertical blanking, so a moving paddle is never torn across a frame.
`timescale 1ns / 1ps

module vga_check_tb;
    reg clk = 0;
    always #20 clk = ~clk;

    reg [9:0] l_paddle_y = 10'd100;
    wire hs, vs;
    wire [2:0] R, G, B;

    vga_top dut (
        .clk(clk), .vga_h_sync(hs), .vga_v_sync(vs),
        .ball_x(10'd320), .ball_y(10'd240),
        .l_paddle_y(l_paddle_y), .r_paddle_y(10'd210),
        .score_l(4'd0), .score_r(4'd0),
        .R(R), .G(G), .B(B)
    );

    // move the paddle constantly, independent of the frame (like the 240 Hz tick)
    integer cyc = 0;
    always @(posedge clk) begin
        cyc <= cyc + 1;
        if (cyc % 104687 == 50000) l_paddle_y <= l_paddle_y + 4;
    end

    // measure the drawn paddle height on screen each frame (column 25)
    integer rows = 0, errors = 0, frames = 0;
    reg in_paddle_row;
    always @(posedge clk) begin
        // outputs are registered: pixel (h,v) appears one clock after h_count==h
        if (dut.h_count == 26 && dut.v_count < 480) begin
            if (R == 3'b111) rows = rows + 1;
        end
        if (dut.h_count == 0 && dut.v_count == 481) begin
            frames = frames + 1;
            if (frames > 1 && rows != 60) begin
                errors = errors + 1;
                $display("ERROR frame %0d: paddle drawn %0d rows tall (expected 60)", frames, rows);
            end
            rows = 0;
        end
    end

    initial begin
        #(40 * 800 * 525 * 12);
        if (errors == 0) $display("PASS (%0d frames)", frames);
        else             $display("FAIL: %0d errors", errors);
        $finish;
    end
endmodule
