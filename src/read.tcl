#analyze -format verilog ../rtl/idct/even_odd.v
#elaborate even_odd
#analyze -format verilog ../rtl/idct/idct4.v
#elaborate idct4
#analyze -format verilog ../rtl/idct/idct8.v
#elaborate idct8
#analyze -format verilog ../rtl/idct/idct_cal.v
#elaborate idct_cal
#analyze -format verilog ../rtl/idct/mem4x4.v
#elaborate mem4x4
#analyze -format verilog ../rtl/idct/mem8x8.v
#elaborate mem8x8
#analyze -format verilog ../rtl/idct/mem_ctrl_tran.v
#elaborate mem_ctrl_tran
#analyze -format verilog ../rtl/idct/p2s.v
#elaborate p2s
#analyze -format verilog ../rtl/idct/s2p.v
#elaborate s2p
#analyze -format verilog ../rtl/idct/idct.v
#elaborate idct
#analyze -format verilog ../rtl/idct/idct_chip.v
#elaborate idct_chip

analyze -format verilog ../rtl/fft/multi16.v

analyze -format verilog ../rtl/fft/p_s.v
analyze -format verilog ../rtl/fft/s_p.v
analyze -format verilog ../rtl/fft/reg.v
analyze -format verilog ../rtl/fft/butterfly.v
analyze -format verilog ../rtl/fft/ctrl.v

analyze -format verilog ../rtl/fft/fft.v
analyze -format verilog ../rtl/fft/fft_chip.v
elaborate fft_chip

#read_verilog ../rtl/idct/even_odd.v

#read_verilog ../rtl/idct/mem4x4.v
#read_verilog ../rtl/idct/mem8x8.v
#read_verilog ../rtl/idct/mem_ctrl_tran.v
#read_verilog ../rtl/idct/p2s.v
#read_verilog ../rtl/idct/s2p.v
#read_verilog ../rtl/idct/idct4.v

#read_verilog ../rtl/idct/idct8.v

#read_verilog ../rtl/idct/idct_cal.v

#read_verilog ../rtl/idct/idct.v
#read_verilog ../rtl/idct/idct_chip.v
