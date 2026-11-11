module pong (

    //from game_tick
    input wire tick,

    input wire clk,
    //rst is joystick press (must already be synchronized to clk)
    input wire rst,

    //from controller (must already be synchronized to clk)
    input wire btn_up,
    input wire btn_dwn,

    // will output to vga renderer
    //positions are used with (0,0) = top left
    output reg [9:0] ball_x,
    output reg [9:0] ball_y,
    output reg [9:0] l_paddle_y,
    output reg [9:0] r_paddle_y,
    output reg [3:0] score_l,
    output reg [3:0] score_r
);

    localparam SCREEN_W = 640;
    localparam SCREEN_H = 480;

    localparam PADDLE_W = 10;
    localparam PADDLE_H = 60;
    localparam BALL_SIZE = 8; //width and height are 8

    localparam PADDLE_X = 20;

    localparam PLAYER_SPEED = 4;
    localparam AI_SPEED     = 3;

    // furthest positions an object's top-left corner may reach
    localparam BALL_X_MAX   = SCREEN_W - BALL_SIZE;   // 632
    localparam BALL_Y_MAX   = SCREEN_H - BALL_SIZE;   // 472
    localparam PADDLE_Y_MAX = SCREEN_H - PADDLE_H;    // 420

    // paddle x positions
    localparam L_PADDLE_X    = PADDLE_X;                       // 20
    localparam L_PADDLE_FACE = PADDLE_X + PADDLE_W;            // 30, side the ball hits
    localparam R_PADDLE_X    = SCREEN_W - PADDLE_X - PADDLE_W; // 610, side the ball hits

    localparam S_IDLE  = 2'b00;
    localparam S_SERVE = 2'b01;
    localparam S_PLAY  = 2'b10;

    reg [1:0] state;

    reg signed [1:0] ball_dx; // -1 or +1
    reg signed [2:0] ball_dy; // -2 -1 0 1 2 depending on paddle segment

    // ------------------------------------------------------------------
    // Next ball position, computed in signed 11-bit arithmetic.
    // Both operands are signed so ball_dx/ball_dy are sign-extended.
    // (Adding a signed reg to an unsigned one makes Verilog treat the whole
    // expression as unsigned: -1 then becomes +7, which made the ball
    // fly the wrong way and wrap at the walls.)
    // ------------------------------------------------------------------
    wire signed [10:0] cur_x  = $signed({1'b0, ball_x});
    wire signed [10:0] cur_y  = $signed({1'b0, ball_y});
    wire signed [10:0] next_x = cur_x + ball_dx;
    wire signed [10:0] next_y = cur_y + ball_dy;

    // ------------------------------------------------------------------
    // Paddle collisions (tested against the next ball position)
    // Only a hit when the ball crosses the paddle face this tick, coming
    // from the play-field side. Once the ball is behind the face it is a
    // miss: catching it with the paddle's top/bottom edge used to bounce
    // it back *through* the paddle.
    // ------------------------------------------------------------------
    wire signed [10:0] l_top = $signed({1'b0, l_paddle_y});
    wire signed [10:0] r_top = $signed({1'b0, r_paddle_y});

    wire l_y_overlap = (next_y + BALL_SIZE > l_top) && (next_y < l_top + PADDLE_H);
    wire r_y_overlap = (next_y + BALL_SIZE > r_top) && (next_y < r_top + PADDLE_H);

    wire l_hit = (ball_dx < 0) && l_y_overlap &&
                 (cur_x >= L_PADDLE_FACE) && (next_x <= L_PADDLE_FACE);
    wire r_hit = (ball_dx > 0) && r_y_overlap &&
                 (cur_x + BALL_SIZE <= R_PADDLE_X) && (next_x + BALL_SIZE >= R_PADDLE_X);

    // Where on the paddle the ball centre hit, relative to the paddle top
    wire signed [10:0] ball_cy = next_y + BALL_SIZE / 2;
    wire signed [10:0] l_rel   = ball_cy - l_top;
    wire signed [10:0] r_rel   = ball_cy - r_top;

    function signed [2:0] segment_dy(input signed [10:0] rel);
        begin
            if (rel < PADDLE_H / 5)          segment_dy = -3'sd2;
            else if (rel < 2 * PADDLE_H / 5) segment_dy = -3'sd1;
            else if (rel < 3 * PADDLE_H / 5) segment_dy =  3'sd0;
            else if (rel < 4 * PADDLE_H / 5) segment_dy =  3'sd1;
            else                             segment_dy =  3'sd2;
        end
    endfunction

    // dy after a possible paddle hit
    wire signed [2:0] paddle_dy = l_hit ? segment_dy(l_rel) :
                                  r_hit ? segment_dy(r_rel) : ball_dy;
    wire signed [2:0] abs_dy    = paddle_dy[2] ? -paddle_dy : paddle_dy;

    // Wall bounces: clamp to the wall and force the direction away from it
    // (setting the direction, rather than negating it, can never get stuck)
    wire hit_top    = (next_y <= 0);
    wire hit_bottom = (next_y >= BALL_Y_MAX);

    // ------------------------------------------------------------------
    // Right paddle AI: follow the ball centre, with a dead zone so the
    // paddle does not jitter up and down when it is already lined up.
    // ------------------------------------------------------------------
    wire [9:0] ball_center_y  = ball_y + BALL_SIZE / 2;
    wire [9:0] r_paddle_cy    = r_paddle_y + PADDLE_H / 2;
    wire       ai_up   = (ball_center_y + AI_SPEED < r_paddle_cy);
    wire       ai_down = (ball_center_y > r_paddle_cy + AI_SPEED);

    //game update
    always @(posedge clk) begin
        if (rst) begin
            //full reset of game components
            state <= S_IDLE;
            ball_x <= SCREEN_W / 2;
            ball_y <= SCREEN_H / 2;
            ball_dx <= 2'sd1;
            ball_dy <= 3'sd0;
            l_paddle_y <= SCREEN_H / 2 - PADDLE_H / 2;
            r_paddle_y <= SCREEN_H / 2 - PADDLE_H / 2;
            score_l <= 4'd0;
            score_r <= 4'd0;

        end else if (tick) begin
            case (state)
                S_IDLE: begin
                    ball_x <= SCREEN_W / 2;
                    ball_y <= SCREEN_H / 2;
                    l_paddle_y <= SCREEN_H / 2 - PADDLE_H / 2;
                    r_paddle_y <= SCREEN_H / 2 - PADDLE_H / 2;
                    ball_dx <= 2'sd1;
                    ball_dy <= 3'sd0;
                    state <= S_SERVE;
                end

                S_SERVE: begin
                    ball_x <= SCREEN_W / 2;
                    ball_y <= SCREEN_H / 2;
                    ball_dx <= 2'sd1; //moves right
                    ball_dy <= 3'sd0;
                    state <= S_PLAY;
                end

                S_PLAY: begin
                    // ---------------- ball X ----------------
                    if (l_hit) begin
                        ball_x  <= L_PADDLE_FACE;  // snap to the paddle face
                        ball_dx <= 2'sd1;
                    end else if (r_hit) begin
                        ball_x  <= R_PADDLE_X - BALL_SIZE;
                        ball_dx <= -2'sd1;
                    end else if (next_x <= 0) begin
                        ball_x  <= 10'd0;
                        score_r <= score_r + 4'd1;
                        state   <= S_IDLE;
                    end else if (next_x >= BALL_X_MAX) begin
                        ball_x  <= BALL_X_MAX;
                        score_l <= score_l + 4'd1;
                        state   <= S_IDLE;
                    end else begin
                        ball_x  <= next_x[9:0];
                    end

                    // ---------------- ball Y ----------------
                    if (hit_top) begin
                        ball_y  <= 10'd0;
                        ball_dy <= abs_dy;
                    end else if (hit_bottom) begin
                        ball_y  <= BALL_Y_MAX;
                        ball_dy <= -abs_dy;
                    end else begin
                        ball_y  <= next_y[9:0];
                        ball_dy <= paddle_dy;
                    end

                    // ---------------- player paddle ----------------
                    // clamp instead of overshooting: 2 - 4 used to wrap to 1022
                    if (btn_up && !btn_dwn) begin
                        if (l_paddle_y > PLAYER_SPEED)
                            l_paddle_y <= l_paddle_y - PLAYER_SPEED;
                        else
                            l_paddle_y <= 10'd0;
                    end else if (btn_dwn && !btn_up) begin
                        if (l_paddle_y < PADDLE_Y_MAX - PLAYER_SPEED)
                            l_paddle_y <= l_paddle_y + PLAYER_SPEED;
                        else
                            l_paddle_y <= PADDLE_Y_MAX;
                    end

                    // ---------------- AI paddle ----------------
                    if (ai_up) begin
                        if (r_paddle_y > AI_SPEED)
                            r_paddle_y <= r_paddle_y - AI_SPEED;
                        else
                            r_paddle_y <= 10'd0;
                    end else if (ai_down) begin
                        if (r_paddle_y < PADDLE_Y_MAX - AI_SPEED)
                            r_paddle_y <= r_paddle_y + AI_SPEED;
                        else
                            r_paddle_y <= PADDLE_Y_MAX;
                    end
                end

                default:
                    state <= S_IDLE;
            endcase
        end
    end

endmodule
