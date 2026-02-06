test:
	iverilog -g2012 -o uart_tx_tb.vvp uart_tx_tb.sv ../src/top.sv ../src/uart_tx.sv ../src/baud_gen.sv
	vvp uart_tx_tb.vvp
	gtkwave uart_tx_tb.vcd
