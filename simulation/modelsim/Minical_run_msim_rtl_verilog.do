transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/Rashmin/Desktop/Assignment\ 1 {C:/Users/Rashmin/Desktop/Assignment 1/seven_segment_decoder.sv}
vlog -sv -work work +incdir+C:/Users/Rashmin/Desktop/Assignment\ 1 {C:/Users/Rashmin/Desktop/Assignment 1/seven_segment_decoder_tb.sv}

