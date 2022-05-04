`timescale 1ns / 1ps
module find_winning_vote(clock,reset,vote_count_c1,vote_count_c2,vote_count_c3,vote_count_c4,winner,winning_votes);
input clock,reset;
input [7:0] vote_count_c1,vote_count_c2,vote_count_c3,vote_count_c4;
output reg [7:0] winning_votes;
output reg [3:0] winner;

always@(posedge clock)
begin
    if(reset)
    begin
        winner <= 0;
        winning_votes <= 0;
    end
    else
    begin
        if(vote_count_c1>=vote_count_c2 && vote_count_c1>=vote_count_c3 && vote_count_c1>=vote_count_c4)
        begin
            winner <= 4'b0001;
            winning_votes <= vote_count_c1;
        end
        else if(vote_count_c2>=vote_count_c1 && vote_count_c2>=vote_count_c3 && vote_count_c2>=vote_count_c4)
        begin
            winner <= 4'b0010;
            winning_votes <= vote_count_c2;
        end
        else if(vote_count_c3>=vote_count_c1 && vote_count_c3>=vote_count_c2 && vote_count_c3>=vote_count_c4)
        begin
            winner <= 4'b0100;
            winning_votes <= vote_count_c3;
        end
        else if(vote_count_c4>=vote_count_c1 && vote_count_c4>=vote_count_c2 && vote_count_c4>=vote_count_c3)
        begin
            winner <= 4'b1000;
            winning_votes <= vote_count_c4;
        end
        else
        begin
            winner <= 0;
            winning_votes <= 0;
        end
    end
end

endmodule