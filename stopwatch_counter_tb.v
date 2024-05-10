`timescale 1ns / 1ps

module stopwatch_counter_tb #(parameter DATA_WIDTH = 16, MAX = 99);

    reg clk;
    reg reset, start, stop;
    wire [DATA_WIDTH-1:0] count;
    
    stopwatch_counter UUT(clk, reset, start, stop, count);
    
    always #5 clk = ~clk;
    
    initial begin
        clk = 1'b 0;
        reset = 1'b 1;
        stop = 1'b 0;
        #20;
        reset = 1'b 0;
        start = 1'b 1;
        #40;
        start = 1'b 0;
        #1160;
        stop = 1'b 1;
        #200;
        $finish;
        end
         
endmodule
