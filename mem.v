module mem(
    input clk, rw, // write when rw = 1, read when rw = 0
    input [1:0] state, 
    input [7:0] in, 
    input [8:0] w,
    input [9:0] l,
    output reg input_done, ok,
    output [7:0] out_0, out_1, out_2, out_3, out_4, out_5, out_6, out_7, out_8, mem_out, mem1
);
parameter width = 430;
parameter length = 554;

reg [7:0] input_img [width-1:0][length-1:0];
reg [7:0] o_0, o_1, o_2, o_3, o_4, o_5, o_6, o_7, o_8, mem_o;
reg [7:0] temp_img [width * length - 1:0];
reg [8:0] i;
reg [9:0] j;

assign out_0 = o_0;
assign out_1 = o_1;
assign out_2 = o_2;
assign out_3 = o_3;
assign out_4 = o_4;
assign out_5 = o_5;
assign out_6 = o_6;
assign out_7 = o_7;
assign out_8 = o_8;
assign mem_out = mem_o;
assign mem1 = input_img[w+1][l+1];

initial begin
    $readmemh("pic_input.txt", temp_img);
    i = 0;
    j = 0;
    input_done = 0;
    ok = 0;
end

always @(posedge clk) begin
    ok = 0;
    if(state == 0) begin // state = 0 means mem is not ready yet (being filling)
        if(i <= width - 1) begin 
            if(j <= length - 1) begin
                input_img[i][j] = temp_img[j + length*i];
                j = j + 1; 
            end
            else begin 
                j = 0; 
                i = i + 1;
            end
        end
        else begin
            input_done = 1;
        end
    end
    else begin
           if(!rw) begin
                o_0 = input_img[w][l];
                o_1 = input_img[w+1][l];
                o_2 = input_img[w+2][l];
                o_3 = input_img[w][l+1];
                o_4 = input_img[w+1][l+1];
                o_5 = input_img[w+2][l+1];
                o_6 = input_img[w][l+2];
                o_7 = input_img[w+1][l+2];
                o_8 = input_img[w+2][l+2];
            end
            else begin 
                input_img[w+1][l+1] = in;
                ok = 1;
            end
            if(state == 3) begin
                mem_o = input_img[w][l];
            end
    end 
end
  
endmodule


