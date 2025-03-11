module four_bit_unsigned_multiplier_tb;
    timeunit 1ns;
    timeprecision 1ps;

    logic [3:0] a, b;  
    logic [7:0] product;

    four_bit_unsigned_multiplier dut (
        .a(a),
        .b(b),
        .product(product)  
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, dut);
        
        #10 a = 4'd0; b = 4'd0;  
        #10 a = 4'd3; b = 4'd2;
        #10 a = 4'd7; b = 4'd5;     
        #10 a = 4'd0; b = 4'd5;  
        #10 a = 4'd1; b = 4'd10; 
        #10 a = 4'd15; b = 4'd15; 
        
        repeat(10) begin
            #9
            a = $urandom_range(0, 15); 
            b = $urandom_range(0, 15);
            #1;
        end
        
        $finish;
    end
endmodule