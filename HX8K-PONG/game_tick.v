
//since updating the game at 25Mhz is too much, we generate a game clock in the form of a tick
//aiming for about 240Hz
module game_tick (
    input wire clk_in,
    input wire rst,
    output reg tick
);
    reg [16:0] clk_cnt;

    always @(posedge clk_in) begin
        if (rst) begin
            clk_cnt <= 17'd0;
            tick    <= 1'b0;
        end else if(clk_cnt == 17'd104686) begin //about 240Hz using this value (240.001)
            clk_cnt <= 17'd0;
            tick <= 1'b1;
        end else begin
            clk_cnt <= clk_cnt + 1'b1;
            tick <= 1'b0;
        end
    end

endmodule