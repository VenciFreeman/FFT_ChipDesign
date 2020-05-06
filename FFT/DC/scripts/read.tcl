analyze -format verilog ../rtl/fft/multi16.v

analyze -format verilog ../rtl/fft/p_s.v
analyze -format verilog ../rtl/fft/s_p.v
analyze -format verilog ../rtl/fft/reg1.v
analyze -format verilog ../rtl/fft/butterfly.v
analyze -format verilog ../rtl/fft/mux.v
analyze -format verilog ../rtl/fft/ctrl.v

analyze -format verilog ../rtl/fft/fft.v
analyze -format verilog ../rtl/fft/fft_chip.v
elaborate fft_chip
