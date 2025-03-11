module one_bit_adder_tb;
	timeunit 10ns; timeprecision 1ns;
	logic a=0, b=0, ci=0, sum, co;  
	one_bit_adder dut(.*); 
	
	initial begin
		$dumpfile("dump.vcd"); $dumpvars(0,dut);
		#30 a<=0 ; b<=0; ci <=0;
		#10 a<=0 ; b<=0; ci <=1;
		
		#20 a<=1 ; b<=1; ci <=0;
		
		#1 assert ({co, sum} == a + b + ci)
				$display("OK");
			else
				$error("NOT OK!");

		#20 a<=1 ; b<=1; ci <=1;
//		#1 assert (dut.wire1==0)
//			else $error("False. wire1:%d", dut.wire1);
		$finish();
	end
endmodule