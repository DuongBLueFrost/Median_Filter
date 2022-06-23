module filter(
    input clk, enable,
    input [7:0] in_0, in_1, in_2, in_3, in_4, in_5, in_6, in_7, in_8,
    output reg [7:0] out_mid, 
    output reg filter_done
  );
  reg [7:0] temp [8:0];
  reg [7:0] min, swap;
  reg [3:0] index;

initial begin
    index = 0;
end

always @(posedge clk) begin
  if(enable) begin
    filter_done = 0; // the array will be sort first
    temp[0] = in_0;
    temp[1] = in_1;
    temp[2] = in_2;
    temp[3] = in_3;
    temp[4] = in_4;
    temp[5] = in_5;
    temp[6] = in_6;
    temp[7] = in_7;
    temp[8] = in_8;
    min = temp[0];
    index = 0;
    if(min > temp[1]) begin
        min = temp[1];
        index = 1;
    end
    if(min > temp[2]) begin
        min = temp[2];
        index = 2;
    end
    if(min > temp[3]) begin
        min = temp[3];
        index = 3;
    end
    if(min > temp[4]) begin
        min = temp[4];
        index = 4;
    end
    if(min > temp[5]) begin
        min = temp[5];
        index = 5;
    end
    if(min > temp[6]) begin
        min = temp[6];
        index = 6;
    end
    if(min > temp[7]) begin
        min = temp[7];
        index = 7;
    end
    if(min > temp[8]) begin
        min = temp[8];
        index = 8;
    end
    
    if(index != 0) begin
        swap = temp[0];
        temp[0] = temp[index];
        temp[index] = swap; 
    end 
    
    min = temp[1];
    index = 1;
    if(min > temp[2]) begin
        min = temp[2];
        index = 2;
    end
    if(min > temp[3]) begin
        min = temp[3];
        index = 3;
    end
    if(min > temp[4]) begin
        min = temp[4];
        index = 4;
    end
    if(min > temp[5]) begin
        min = temp[5];
        index = 5;
    end
    if(min > temp[6]) begin
        min = temp[6];
        index = 6;
    end
    if(min > temp[7]) begin
        min = temp[7];
        index = 7;
    end
    if(min > temp[8]) begin
        min = temp[8];
        index = 8;
    end
    
    if(index != 1) begin
        swap = temp[1];
        temp[1] = temp[index];
        temp[index] = swap; 
    end 
    
    min = temp[2];
    index = 2;
    if(min > temp[3]) begin
        min = temp[3];
        index = 3;
    end
    if(min > temp[4]) begin
        min = temp[4];
        index = 4;
    end
    if(min > temp[5]) begin
        min = temp[5];
        index = 5;
    end
    if(min > temp[6]) begin
        min = temp[6];
        index = 6;
    end
    if(min > temp[7]) begin
        min = temp[7];
        index = 7;
    end
    if(min > temp[8]) begin
        min = temp[8];
        index = 8;
    end
    
    if(index != 2) begin
        swap = temp[2];
        temp[2] = temp[index];
        temp[index] = swap; 
    end 
    
    min = temp[3];
    index = 3;
    if(min > temp[4]) begin
        min = temp[4];
        index = 4;
    end
    if(min > temp[5]) begin
        min = temp[5];
        index = 5;
    end
    if(min > temp[6]) begin
        min = temp[6];
        index = 6;
    end
    if(min > temp[7]) begin
        min = temp[7];
        index = 7;
    end
    if(min > temp[8]) begin
        min = temp[8];
        index = 8;
    end
    
    if(index != 3) begin
        swap = temp[3];
        temp[3] = temp[index];
        temp[index] = swap; 
    end 
    
    min = temp[4];
    index = 4;
    if(min > temp[5]) begin
        min = temp[5];
        index = 5;
    end
    if(min > temp[6]) begin
        min = temp[6];
        index = 6;
    end
    if(min > temp[7]) begin
        min = temp[7];
        index = 7;
    end
    if(min > temp[8]) begin
        min = temp[8];
        index = 8;
    end
    
    if(index != 4) begin
        swap = temp[4];
        temp[4] = temp[index];
        temp[index] = swap; 
    end 
    
    min = temp[5];
    index = 5;
    if(min > temp[6]) begin
        min = temp[6];
        index = 6;
    end
    if(min > temp[7]) begin
        min = temp[7];
        index = 7;
    end
    if(min > temp[8]) begin
        min = temp[8];
        index = 8;
    end
    
    if(index != 5) begin
        swap = temp[5];
        temp[5] = temp[index];
        temp[index] = swap; 
    end 
    
    min = temp[6];
    index = 6;
    
    if(min > temp[7]) begin
        min = temp[7];
        index = 7;
    end
    if(min > temp[8]) begin
        min = temp[8];
        index = 8;
    end
    
    if(index != 6) begin
        swap = temp[6];
        temp[6] = temp[index];
        temp[index] = swap; 
    end 
    
    if(temp[7] > temp[8]) begin
        swap = temp[7];
        temp[7] = temp[8];
        temp[8] = swap; 
    end
    out_mid = temp[4]; 
    filter_done = 1;
  end
end

endmodule
