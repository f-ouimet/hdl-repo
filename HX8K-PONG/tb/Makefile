test: 
	iverilog -g2012 -Wall -s pong_tb pong_tb.v ../src/pong.v ../src/game_tick.v ../src/vga_top.v
	vvp a.out
	gtkwave pong.vcd

clean:
	rm a.out
	rm pong.vcd
