`timescale 1ns / 1ps
module vote_logger(clock,reset,valid_vote,vote_count_c1,vote_count_c2,vote_count_c3,vote_count_c4);
input clock,reset;
input [3:0] valid_vote;
output reg [7:0] vote_count_c1,vote_count_c2,vote_count_c3,vote_count_c4;

always @(posedge clock)
begin
    if(reset)
    begin
        vote_count_c1 <= 0;
        vote_count_c2 <= 0;
        vote_count_c3 <= 0;
        vote_count_c4 <= 0;
    end
    else
    begin
        if(valid_vote[0])
        begin
            vote_count_c1 <= vote_count_c1 + 1;
        end
        if(valid_vote[1])
        begin
            vote_count_c2 <= vote_count_c2 + 1;
        end
        if(valid_vote[2])
        begin
            vote_count_c3 <= vote_count_c3 + 1;
        end
        if(valid_vote[3])
        begin
            vote_count_c4 <= vote_count_c4 + 1;
        end
    end
end
endmodule