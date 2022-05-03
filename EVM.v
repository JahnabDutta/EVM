module evm(buttons,clock,reset,mode,winning_votes,seven_seg)
    input [3:0] buttons;
    input clock,reset,mode;
    output [7:0] winning_votes;
    output [3:0] winning_led;
    output [7:0] seven_seg;

    wire [3:0] valid_vote;
    wire [7:0] vote_count_c1;
    wire [7:0] vote_count_c2;
    wire [7:0] vote_count_c3;
    wire [7:0] vote_count_c4;
    wire winner;
    wire winning_votes;

    button_control b1(
        .button(buttons[0]),
        .clock(clock),
        .reset(reset),
        .mode(mode),
        .vote(valid_vote[0])
    );
    
    button_control b2(
        .button(buttons[1]),
        .clock(clock),
        .reset(reset),
        .mode(mode),
        .vote(valid_vote[1])
    );
    
    button_control b3(
        .button(buttons[2]),
        .clock(clock),
        .reset(reset),
        .mode(mode),
        .vote(valid_vote[2])
    );
    
    button_control b4(
        .button(buttons[3]),
        .clock(clock),
        .reset(reset),
        .mode(mode),
        .vote(valid_vote[3])
    );

    votelogger vl(
        .clock(clock),
        .reset(reset),
        .valid_vote(valid_vote),
        .vote_count_c1(vote_count_c1);
        .vote_count_c2(vote_count_c2);
        .vote_count_c3(vote_count_c3);
        .vote_count_c4(vote_count_c4);
    );
    find_winning_vote fwv(
        .clock(clock),
        .reset(reset),
        .vote_count_c1(vote_count_c1),
        .vote_count_c2(vote_count_c2),
        .vote_count_c3(vote_count_c3),
        .vote_count_c4(vote_count_c4),
        .winning_votes(winning_votes),
        .winner(winner)
    );
    if(mode)
    begin
    assign winning_led[winner-1]=1;
    end

    display_winning_votes dwv(
        .winning_votes(winning_votes),
        .seven_seg(seven_seg)
    )







endmodule