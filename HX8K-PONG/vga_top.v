// VGA generator (3-bit RGB per channel)
// vga functionality sourced from https://www.fpga4fun.com/VGA.html
module vga_top (
    input  wire clk,          // 25 MHz pixel clock
    output wire vga_h_sync,
    output wire vga_v_sync,
    input  wire [9:0] ball_x,
    input  wire [9:0] ball_y,
    input  wire [9:0] l_paddle_y,
    input  wire [9:0] r_paddle_y,
    input  wire [3:0] score_l,
    input  wire [3:0] score_r,
    output wire [2:0] R,
    output wire [2:0] G,
    output wire [2:0] B
);

    localparam SCREEN_W = 640;
    localparam SCREEN_H = 480;
    localparam PADDLE_W = 10;
    localparam PADDLE_H = 60;
    localparam BALL_SIZE = 8;
    localparam PADDLE_X = 20;

    reg [9:0] h_count = 0;  // 0..799
    reg [9:0] v_count = 0;  // 0..524

    always @(posedge clk) begin
        if (h_count == 799)
            h_count <= 0;
        else
            h_count <= h_count + 1;
    end

    always @(posedge clk) begin
        if (h_count == 799) begin
            if (v_count == 524)
                v_count <= 0;
            else
                v_count <= v_count + 1;
        end
    end

    // active-low syncs
    assign vga_h_sync = ~((h_count >= 656) && (h_count < 752)); // 96 px
    assign vga_v_sync = ~((v_count >= 490) && (v_count < 492)); // 2 lines

    wire visible = (h_count < 640) && (v_count < 480);

    wire [9:0] pixel_x = h_count;
    wire [9:0] pixel_y = v_count;

    wire [9:0] l_paddle_x = PADDLE_X;
    wire [9:0] r_paddle_x = SCREEN_W - PADDLE_X - PADDLE_W;

    wire ball_visible = (pixel_x >= ball_x) && (pixel_x < ball_x + BALL_SIZE) &&
                    (pixel_y >= ball_y) && (pixel_y < ball_y + BALL_SIZE);

    wire l_paddle_visible = (pixel_x >= l_paddle_x) && (pixel_x < l_paddle_x + PADDLE_W) &&
                        (pixel_y >= l_paddle_y) && (pixel_y < l_paddle_y + PADDLE_H);

    wire r_paddle_visible = (pixel_x >= r_paddle_x) && (pixel_x < r_paddle_x + PADDLE_W) &&
                        (pixel_y >= r_paddle_y) && (pixel_y < r_paddle_y + PADDLE_H);

    wire center_line = (pixel_x >= SCREEN_W/2 - 1) && (pixel_x <= SCREEN_W/2 + 1) && (pixel_y[3:0] < 8);

    wire draw_object = ball_visible | l_paddle_visible | r_paddle_visible | center_line;

    assign R = visible ? (draw_object ? 3'b111 : 3'b000) : 3'b000;
    assign G = visible ? (draw_object ? 3'b111 : 3'b000) : 3'b000;
    assign B = visible ? (draw_object ? 3'b111 : 3'b000) : 3'b000;

endmodule