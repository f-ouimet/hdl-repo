//top module
//for Lattice ice40-hx8k board
module top (
    input  wire clk_12mhz,    // onboard 12 MHz clock
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


    // VGA module
    vga_top vga_inst (
        .clk(clk_25mhz),
        .vga_h_sync(vga_h_sync),
        .vga_v_sync(vga_v_sync),
        .R(R),
        .G(G),
        .B(B)
    );

endmodule