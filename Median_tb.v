module Median_tb();
    reg clk, start;
    wire done;
    wire [1:0] s;
    wire [7:0] mem_output, mem1;
    wire [8:0] wid;
    wire [9:0] len;
    
    integer f;
    
initial begin
    f = $fopen("out_pic.txt","a");
    clk = 0;
    start = 0;
    #1.2 start = ~start;
end
    
always begin
    #0.5 clk = ~clk;
end       

always @(posedge clk) begin
    if(s == 3 && !done) begin
        $fwrite(f,"%x\n",mem_output);
    end
    if(done) begin
        $fclose(f);
    end
end
    
Median_Filter m(.clk, .start, .done, .s, .mem_output, .wid, .len, .mem1);
endmodule
