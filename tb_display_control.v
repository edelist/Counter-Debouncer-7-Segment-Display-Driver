`timescale 1ns / 1ps

module tb_display_control();
    reg in2, reset;
    reg [15:0]count;
    wire [3:0]digit_select;
    wire [3:0]mux1_o;


    display_control A0(.reset(reset), .in2(in2), .count(count), .digit_select(digit_select), .mux1_o(mux1_o));
    
    

    
    initial begin
        reset = 1;
        #10 reset = 0;
        #10 reset = 1;
    end
    
    initial begin
        in2 = 0;
        forever #50 in2 = in2+1;
    end
    
    initial begin
        count = 0;
        forever #100 count = count + 1;
    end
     


endmodule
