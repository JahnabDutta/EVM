module display_winning_votes(winning_votes,seven_seg);
input winning_votes;
output [6:0] seven_seg;

case (winning_votes)
    0: seven_seg = 7'b0000001;
    1: seven_seg = 7'b1001111;
    2: seven_seg = 7'b0010010;
    3: seven_seg = 7'b0000111;
    4: seven_seg = 7'b1101101;
    5: seven_seg = 7'b0100110;
    6: seven_seg = 7'b0100000;
    7: seven_seg = 7'b0001111;
    8: seven_seg = 7'b0000000;
    9: seven_seg = 7'b0000100;
endcase