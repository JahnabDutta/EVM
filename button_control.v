`timescale 1ns / 1ps
module button_control(clock,reset,button,mode,vote);
input clock;
input reset;
input button;
input mode; //to check if it is in voting mode or display moode
output reg vote; //generates a vote pulse if user presses the button for 1 second

reg [31:0] counter;

always @(posedge clock)
begin
    if(reset)
    begin
        counter <= 0;
    end
    else
    begin
        if(button && counter <101)
        begin
            counter <= counter + 1;
        end
        else if(!button)
        begin
            counter = 0;
        end
    end
end

always @(posedge clock)
begin
    if(reset)
    begin
        vote <= 0;
    end
    else
    begin
        if(counter == 100 && !mode)
        begin
            vote <= 1;
        end
        else
        begin
            vote <= 0;
        end
    end
end
endmodule