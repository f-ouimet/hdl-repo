# VGA Pong Game on FPGA

A functional skeleton of a pong fpga game. .pcf file is for Lattice iCE40-HX8K Breakout Board.

Bitstream can be generated using yosys, nextpnr-ice40 and iceprog.

# Required tools

- icestorm
- nextpnr 
- yosys

# Build

Using makefile, run `make build` and then `make program` to load on board

## Game states

- Idle
    resets positions

- Play
    game logic

- serve
    allows player to move and serve the ball
