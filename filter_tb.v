module filter_tb;
    reg clk, enable;
    reg [7:0] in_0, in_1, in_2, in_3, in_4, in_5, in_6, in_7, in_8;
    reg [1:0] state;
    wire [7:0] out_mid;
    wire filter_done;
    
initial begin
    clk = 0;
    enable = 0;
    in_0 = 15;
    in_1 = 30;
    in_2 = 20;
    in_3 = 1;
    in_4 = 0;
    in_5 = 2;
    in_6 = 4;
    in_7 = 3;
    in_8 = 3;
    state = 0;
    #1 enable = 1;
    state = 1;
end

always begin
    #3 clk = ~clk;
end

filter m(    
    .clk, .enable,
    .in_0, .in_1, .in_2, .in_3, .in_4, .in_5, .in_6, .in_7, .in_8,
    .state,
    .out_mid, 
    .filter_done);

endmodule
