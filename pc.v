module pc(
  input clk, start, input_done, filter_done, ok,
  output  [8:0] w,
  output  [9:0] l,
  output reg enable_filter, rw, finish,
  output  [1:0] state 
  );

parameter width = 430;
parameter length = 554;

reg [1:0] step;
reg [8:0] wid;
reg [9:0] len;

assign state = step;
assign w = wid;
assign l = len;

initial begin
    step = 0;
    wid = 0;
    len = 0;
    enable_filter = 0;
    rw = 0;
    finish = 0;
end

always @(posedge clk) begin
    if(start) 
        case(step)
        2'd0: if(input_done) begin // input_img is ready, start filtering
              step = step + 1;
              rw = 0;
           end
        2'd1: begin
           enable_filter = 1;
           rw = 1;
           if(filter_done) 
              step = step + 1;
           end
        2'd2: begin  // increase w, l after done filtering, begin changing mem
              enable_filter = 0;
              rw = 0;
              if(ok) begin
                  if(len <= length - 3) begin
                      if(wid < width - 3) 
                          wid = wid + 1;
                      else begin
                          wid = 0;
                          len = len + 1;
                      end
                      step = step - 1;
                  end
                  else begin //jumps to state 3 if done filtering all pixel
                      len = 0;
                      wid = 0;
                      step = 3;
                  end
              end
          end
        2'd3:begin  //done filtering => begin reading all pixel into text file
              enable_filter = 0;
              rw = 0;
              if(wid <= width - 1) begin
                  if(len < length - 1) 
                      len = len + 1;
                  else begin
                      len = 0;
                      wid = wid + 1;
                  end
              end
              else 
                  finish = 1;
        end
        endcase
end
endmodule
