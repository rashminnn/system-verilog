module eight_bit_unsigned_adder #(
	parameter N=8
	)(
	input logic [N-1:0] A,B,
	input logic ci,
	output logic [N-1:0] S,
	output logic co
	);
	
	logic C [N:0];
	assign C[0] = ci;
	assign co = C[N];
	
	genvar i;
	generate
	
	for(i=0 ; i<N ; i+=1) begin:add
	one_bit_adder oba(
	 .a(A[i ]),
	 .b(B[i ]),
	 .ci(C[i ]),
	 .co(C[i+1]),
	 .sum(S[i ])
	 
	);
	end 
	endgenerate

endmodule 