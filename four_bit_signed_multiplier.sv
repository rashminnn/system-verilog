module four_bit_signed_multiplier(
    input logic signed [3:0] a,
    input logic signed [3:0] b,
    output logic signed [7:0] product
);
    logic signed [7:0] p0, p1, p2, p3;
    logic signed [7:0] sum1, sum2;
    
    assign p0 = b[0] ? {{4{a[3]}}, a} : 8'b0;         
    assign p1 = b[1] ? {{3{a[3]}}, a, 1'b0} : 8'b0;    
    assign p2 = b[2] ? {{2{a[3]}}, a, 2'b00} : 8'b0;    

    assign p3 = b[3] ? -{{1{a[3]}}, a, 3'b000} : 8'b0;    
    
    eight_bit_adder add1(.A(p0), .B(p1), .ci(1'b0), .S(sum1), .co());
    eight_bit_adder add2(.A(sum1), .B(p2), .ci(1'b0), .S(sum2), .co());
    eight_bit_adder add3(.A(sum2), .B(p3), .ci(1'b0), .S(product), .co());
    
endmodule