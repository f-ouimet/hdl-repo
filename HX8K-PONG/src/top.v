//top module
//for Lattice ice40-hx8k board
module top (
    input  wire clk_12mhz,    // onboard 12 MHz clock
    input wire btn_up,
    input wire btn_dwn,
    input wire rst,
    output wire vga_h_sync,
    output wire vga_v_sync,
    output wire [2:0] R,
    output wire [2:0] G,
    output wire [2:0] B
);

    wire clk_25mhz;
    wire pll_locked;

    // PLL: 12 MHz -> 25.125 MHz VGA clock
    pll pll_inst (
        .clock_in(clk_12mhz),
        .clock_out(clk_25mhz),
        .locked(pll_locked)
    );

    wire game_tick;

    game_tick game_tick_inst (
        .clk_in(clk_25mhz),
        .rst (~pll_locked),
        .tick (game_tick)
    );

    wire [9:0] ball_x;
    wire [9:0] ball_y;
    wire [9:0] l_paddle_y;
    wire [9:0] r_paddle_y;
    wire [3:0] score_l;
    wire [3:0] score_r;

    //game logic
    pong pong_inst (
        .clk        (clk_25mhz),
        .tick       (game_tick),
        .rst        (rst | ~pll_locked),
        .btn_up     (btn_up),
        .btn_dwn    (btn_dwn),
        .ball_x     (ball_x),
        .ball_y     (ball_y),
        .l_paddle_y (l_paddle_y),
        .r_paddle_y (r_paddle_y),
        .score_l    (score_l),
        .score_r    (score_r)  
    );
    
    // VGA module
    vga_top vga_inst (
        .clk(clk_25mhz),
        .vga_h_sync(vga_h_sync),
        .vga_v_sync(vga_v_sync),
        .ball_x     (ball_x),
        .ball_y     (ball_y),
        .l_paddle_y (l_paddle_y),
        .r_paddle_y (r_paddle_y),
        .score_l    (score_l),
        .score_r    (score_r),
        .R(R),
        .G(G),
        .B(B)
    );

endmodule