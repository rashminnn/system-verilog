module seven_segment_decoder_tb;
    timeunit 1ns;
    timeprecision 1ps;
    
    logic [3:0] num;
    logic [6:0] seg;
    
    seven_segment_decoder dut(.*);
    
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, dut);
        
        // Test each digit from 0 to 9
        num <= 4'd0;
        #10 assert (seg == 7'b0111111) else $error("Fail: Digit 0");
        
        #10 num <= 4'd1;
        #10 assert (seg == 7'b0000110) else $error("Fail: Digit 1");
        
        #10 num <= 4'd2;
        #10 assert (seg == 7'b1011011) else $error("Fail: Digit 2");
        
        #10 num <= 4'd3;
        #10 assert (seg == 7'b1001111) else $error("Fail: Digit 3");
        
        #10 num <= 4'd4;
        #10 assert (seg == 7'b1100110) else $error("Fail: Digit 4");
        
        #10 num <= 4'd5;
        #10 assert (seg == 7'b1101101) else $error("Fail: Digit 5");
        
        #10 num <= 4'd6;
        #10 assert (seg == 7'b1111101) else $error("Fail: Digit 6");
        
        #10 num <= 4'd7;
        #10 assert (seg == 7'b0000111) else $error("Fail: Digit 7");
        
        #10 num <= 4'd8;
        #10 assert (seg == 7'b1111111) else $error("Fail: Digit 8");
        
        #10 num <= 4'd9;
        #10 assert (seg == 7'b1101111) else $error("Fail: Digit 9");
        
        // Test invalid input
        #10 num <= 4'd10;
        #10 assert (seg == 7'b1000000) else $error("Fail: Invalid input");
        
        #10 $finish;
    end
endmodule