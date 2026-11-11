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

    // ------------------------------------------------------------------
    // Synchronize the push buttons / joystick into the 25 MHz domain.
    // Raw pins are asynchronous: feeding them straight into the game logic
    // (and using rst as an async reset) can corrupt state through
    // metastability, which showed up as random paddle/ball jumps.
    // ------------------------------------------------------------------
    reg [1:0] up_sync  = 2'b00;
    reg [1:0] dwn_sync = 2'b00;
    reg [1:0] rst_sync = 2'b11;

    always @(posedge clk_25mhz) begin
        up_sync  <= {up_sync[0],  btn_up};
        dwn_sync <= {dwn_sync[0], btn_dwn};
        rst_sync <= {rst_sync[0], rst | ~pll_locked};
    end

    wire btn_up_s  = up_sync[1];
    wire btn_dwn_s = dwn_sync[1];
    wire rst_s     = rst_sync[1];

    wire game_tick;

    game_tick game_tick_inst (
        .clk_in(clk_25mhz),
        .rst (rst_s),
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
        .rst        (rst_s),
        .btn_up     (btn_up_s),
        .btn_dwn    (btn_dwn_s),
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