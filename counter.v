`timescale 1ns / 1ps


module counter16(reset, inc, count);

    input reset, inc;
    output reg [15:0]count;
    
    
    always @ (posedge inc or negedge reset) begin
        if (!reset)
            count <= 0;
         else if (inc)
            count <= count + 1;
    end //always

endmodule
