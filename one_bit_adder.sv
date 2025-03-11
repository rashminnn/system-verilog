// module one_bit_adder(
// input logic a,b,ci,
// output logic sum,co
// );

// logic wire1,wire2;

// assign wire1 = a^b;
// assign wire2 = wire1 & ci;

// wire wire3 = a&b;

// always_comb begin
// 	co = wire2|wire3;
// 	sum = wire1^ci;
// end
// endmodule

module one_bit_adder(
    input logic a, b, ci,
    output logic sum, co
);

    assign sum = a ^ b ^ ci;
    assign co = (a & b) | (a & ci) | (b & ci);

endmodule
