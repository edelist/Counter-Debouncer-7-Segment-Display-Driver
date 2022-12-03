`timescale 1ns / 1ps

module top(clk, reset, inc, mode_select, digit_select, seven);

    input clk, reset, inc, mode_select;
    output [3:0]digit_select;
    output [6:0]seven;
    
    wire div1, div1k, button_o;
    wire [15:0]count_o;
    wire [3:0]dec_i;
    reg mux_o;
    
    clock_divider1k A0(.clk_i(clk), .reset(reset), .clk_o(div1k));
    clock_divider1 A1(.clk_i(clk), .reset(reset), .clk_o(div1));
    debouncer A2(.clk(clk), .reset(reset), .button_i(inc), .button_o(button_o));

    //MUX
    always@(*) begin
        case (mode_select)
            0: mux_o <= button_o;
            1: mux_o <=  div1;
        endcase
    end
   
   counter16 A3(.reset(reset), .inc(mux_o), .count(count_o));
   
   display_control A4(.in2(div1k), .count(count_o), .reset(reset), .digit_select(digit_select), .mux1_o(dec_i));
   
   seven_segment_decoder A5(.in(dec_i), .reset(reset), .out(seven));
   

endmodule
