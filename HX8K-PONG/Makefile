
src = src/

build:
	yosys -p "synth_ice40 -top top -json pong.json" $(src)*.v
	nextpnr-ice40 --hx8k --pcf $(src)hx8k.pcf --json pong.json --asc pong.asc --freq 12
	icepack pong.asc pong.bin

program:
	iceprog pong.bin
