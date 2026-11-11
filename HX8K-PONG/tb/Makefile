test:
	iverilog -g2012 -Wall -s pong_tb pong_tb.v ../src/pong.v ../src/game_tick.v ../src/vga_top.v
	vvp a.out
	gtkwave pong.vcd

# self-checking tests (no waveform viewer needed)
check:
	iverilog -g2012 -Wall -s pong_check_tb -o pong_check.out pong_check_tb.v ../src/pong.v
	vvp pong_check.out
	iverilog -g2012 -Wall -s vga_check_tb -o vga_check.out vga_check_tb.v ../src/vga_top.v
	vvp vga_check.out

clean:
	rm -f a.out pong_check.out vga_check.out
	rm -f pong.vcd
