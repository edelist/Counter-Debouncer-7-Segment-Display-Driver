`timescale 1ns / 1ps

module display_control(in2, count, reset, digit_select, mux1_o);
    input in2, reset;
    input [15:0]count;
    output reg [3:0]digit_select;
    output reg [3:0]mux1_o;
    
    wire [1:0]sel;
    
    counter2 A0(.reset(reset), .inc(in2), .count(sel));
    
    //code for multiplexer 1
    always @(sel) begin
            case (sel)
                2'b00: digit_select <= 4'b0111;
                2'b01: digit_select <= 4'b1011;
                2'b10: digit_select <= 4'b1101;
                2'b11: digit_select <= 4'b1110;        
            endcase
    end //always
    
    //code for multiplexer 2
    always @(sel) begin
            case (sel)
                2'b00: mux1_o <= count[15:12];
                2'b01: mux1_o <= count[11:8];
                2'b10: mux1_o <= count[7:4];
                2'b11: mux1_o <= count[3:0];
            endcase
    end //always
    
endmodule
