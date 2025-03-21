module four_bit_unsigned_multiplier(
    input logic [3:0] a,
    input logic [3:0] b,
    output logic [7:0] product
);

    logic [7:0] p0, p1, p2, p3;
    logic [7:0] sum1, sum2;
    logic c1, c2, c3; 
    
    assign p0 = b[0] ? {4'b0, a} : 8'b0;         
    assign p1 = b[1] ? {3'b0, a, 1'b0} : 8'b0;    
    assign p2 = b[2] ? {2'b0, a, 2'b00} : 8'b0;    
    assign p3 = b[3] ? {1'b0, a, 3'b000} : 8'b0;    
    
    eight_bit_unsigned_adder add1(.A(p0), .B(p1), .ci(1'b0), .S(sum1), .co(c1));
    eight_bit_unsigned_adder add2(.A(sum1), .B(p2), .ci(c1), .S(sum2), .co(c2));
    eight_bit_unsigned_adder add3(.A(sum2), .B(p3), .ci(c2), .S(product), .co(c3));
    
endmodule