// VGA generator (3-bit RGB per channel)
//vga functionality sourced from https://www.fpga4fun.com/VGA.html
module vga_top (
    input  wire clk,          // 25 MHz pixel clock
    output wire vga_h_sync,
    output wire vga_v_sync,
    output wire [2:0] R,
    output wire [2:0] G,
    output wire [2:0] B
);

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

     // 32x32 pixel squares
    wire [4:0] square_x = h_count[9:5];
    wire [4:0] square_y = v_count[8:4];

    // generate nice checkboard style colored squares
    wire [2:0] r_bit = square_x[0] ^ square_y[0];
    wire [2:0] g_bit = square_x[1] ^ square_y[1];
    wire [2:0] b_bit = square_x[2] ^ square_y[2];

    assign R = visible ? {3{r_bit}} : 3'b000;
    assign G = visible ? {3{g_bit}} : 3'b000;
    assign B = visible ? {3{b_bit}} : 3'b000;
endmodule