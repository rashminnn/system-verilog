module four_bit_signed_multiplier_tb;
    timeunit 1ns;
    timeprecision 1ps;

    logic signed [3:0] a, b;  
    logic signed [7:0] product;

    four_bit_signed_multiplier dut (
        .a(a),
        .b(b),
        .product(product)  
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, dut);
        
        #10 a = 4'sd0; b = 4'sd0;  
        #10 a = 4'sd3; b = 4'sd2;
        #10 a = 4'sd7; b = 4'sd5;     
        #10 a = 4'sd0; b = 4'sd5;  
        #10 a = 4'sd1; b = 4'sd10; 
        #10 a = 4'sd15; b = 4'sd15; 
        
        repeat(10) begin
            #9
            a = $urandom_range(-8, 7); 
            b = $urandom_range(-8, 7);
            #1;
        end
        
        $finish;
    end
endmodule