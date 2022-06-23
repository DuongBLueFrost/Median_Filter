module Median_Filter(
    input clk, start,
    output done, 
    output [1:0] s,
    output [7:0] mem_output, mem1,
    output [8:0] wid,
    output [9:0] len
);
parameter width = 430;
parameter length = 554;

wire input_done, filter_done, enable_filter, rw, ok;
wire [1:0] state;
wire [7:0] mid_pixel, kernel_0, kernel_1, kernel_2, kernel_3, kernel_4;
wire [7:0] kernel_5, kernel_6, kernel_7, kernel_8, mem_out;
wire [8:0] w;
wire [9:0] l;

reg [7:0] filtered;

assign out_4 = mid_pixel;
assign s = state;
assign mem_output = mem_out;
assign wid = w;
assign len = l;

pc m0(
   .clk(clk), .start(start), .input_done(input_done), .filter_done(filter_done), .ok(ok), 
   .w(w),
   .l(l),
   .enable_filter(enable_filter), .rw(rw), .finish(done), 
   .state(state)); 

mem m1(
    .clk(clk), .rw(rw), 
    .state(state), 
    .in(mid_pixel), 
    .w(w),
    .l(l),
    .input_done(input_done), .ok(ok),
    .out_0(kernel_0), .out_1(kernel_1), .out_2(kernel_2), .out_3(kernel_3), 
    .out_4(kernel_4), .out_5(kernel_5), .out_6(kernel_6), .out_7(kernel_7), .out_8(kernel_8), 
    .mem_out(mem_out), .mem1(mem1));
  
filter m2(
    .clk(clk), .enable(enable_filter),
    .in_0(kernel_0), .in_1(kernel_1), .in_2(kernel_2), .in_3(kernel_3),
    .in_4(kernel_4), .in_5(kernel_5), .in_6(kernel_6), .in_7(kernel_7), .in_8(kernel_8),
    .out_mid(mid_pixel), 
    .filter_done(filter_done)
);

endmodule
