module pong (    
    
    //from game_tick
    input wire tick,

    input wire clk,
    //rst is joystick press
    input wire rst,

    //from controller
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

    localparam S_IDLE  = 2'b00;
    localparam S_SERVE = 2'b01;
    localparam S_PLAY  = 2'b10;

    reg [1:0] state;
 
    reg signed [10:0] ball_x_signed; // extra bit to avoid overflow
    reg signed [2:0] ball_dy; //-2 -1 0 1 2 depending on paddle segment
    reg signed [1:0] ball_dx;

    wire [9:0] ball_left = ball_x;
    wire [9:0] ball_right = ball_x + BALL_SIZE;
    wire [9:0] ball_top = ball_y;
    wire [9:0] ball_bottom = ball_y + BALL_SIZE;

    wire [9:0] l_paddle_top = l_paddle_y;
    wire [9:0] l_paddle_bottom = l_paddle_y + PADDLE_H;
    wire [9:0] r_paddle_top = r_paddle_y;
    wire [9:0] r_paddle_bottom = r_paddle_y + PADDLE_H;
    wire [9:0] l_paddle_x = PADDLE_X;
    wire [9:0] r_paddle_x = SCREEN_W - PADDLE_X - PADDLE_W;
    
    wire l_paddle_collision = (ball_left <= l_paddle_x + PADDLE_W) && 
                          (ball_right >= l_paddle_x) &&
                          (ball_bottom >= l_paddle_top) &&
                          (ball_top <= l_paddle_bottom);

    wire r_paddle_collision = (ball_right >= r_paddle_x) && 
                          (ball_left <= r_paddle_x + PADDLE_W) &&
                          (ball_bottom >= r_paddle_top) &&
                          (ball_top <= r_paddle_bottom);

     
    //game update
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            //full reset of game components
            state <= S_IDLE;
            ball_x <= SCREEN_W / 2;
            ball_y <= SCREEN_H / 2;
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
                    ball_dx <= 2'sd0;                     
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
                    ball_x_signed <= ball_x_signed + ball_dx;
                    ball_x <= ball_x_signed[9:0];
                    ball_y <= ball_y + ball_dy;

                    if (ball_top <= 0 || ball_bottom >= SCREEN_H) begin
                        ball_dy <= -ball_dy;
                    end
                
                    if (l_paddle_collision && ball_dx < 0) begin
                        ball_dx <= 2'sd1;
                        if (ball_y < l_paddle_y + PADDLE_H / 5)
                            ball_dy <= -3'sd2;
                        else if (ball_y < l_paddle_y + 2 * PADDLE_H / 5)
                            ball_dy <= -3'sd1;
                        else if (ball_y < l_paddle_y + 3 * PADDLE_H / 5)
                            ball_dy <= 3'sd0;
                        else if (ball_y < l_paddle_y + 4 * PADDLE_H / 5)
                            ball_dy <= 3'sd1;
                        else
                            ball_dy <= 3'sd2;
                    end
                
                    if (r_paddle_collision && ball_dx > 0) begin
                        ball_dx <= -2'sd1;
                        if (ball_y < r_paddle_y + PADDLE_H / 5)
                            ball_dy <= -3'sd2;
                        else if (ball_y < r_paddle_y + 2 * PADDLE_H / 5)
                            ball_dy <= -3'sd1;
                        else if (ball_y < r_paddle_y + 3 * PADDLE_H / 5)
                            ball_dy <= 3'sd0;
                        else if (ball_y < r_paddle_y + 4 * PADDLE_H / 5)
                            ball_dy <= 3'sd1;
                        else
                            ball_dy <= 3'sd2;
                    end
                
                    if (ball_left <= 0) begin
                        score_r <= score_r + 4'd1;
                        state <= S_IDLE;
                    end
                
                    if (ball_right >= SCREEN_W) begin
                        score_l <= score_l + 4'd1;
                        state <= S_IDLE;
                    end
                
                    if (btn_up && l_paddle_y > 10'd0) begin
                        l_paddle_y <= l_paddle_y - 10'd4;
                    end
                    if (btn_dwn && l_paddle_y < SCREEN_H - PADDLE_H) begin
                        l_paddle_y <= l_paddle_y + 10'd4;
                    end
                
                    if (ball_y < r_paddle_y + PADDLE_H / 2 && r_paddle_y > 10'd0) begin
                        r_paddle_y <= r_paddle_y - 10'd3;
                    end
                    if (ball_y > r_paddle_y + PADDLE_H / 2 && r_paddle_y < SCREEN_H - PADDLE_H) begin
                        r_paddle_y <= r_paddle_y + 10'd3;
                    end
                end

                default:
                    state <= S_IDLE;
            endcase
        end
    end



endmodule
