`include "./counter.v"
module tb_counter;

reg clk;
reg rst;
wire [31:0] counter;
counter counter_inst(
    .clk(clk),
    .rst(rst),
    .counter(counter)
);

initial begin
    $dumpfile("tb_counter.vcd");
    $dumpvars(0,tb_counter);
end

initial begin
    rst = 0;
    clk = 0;
    #10
    rst = 1;
    #10000;
    $finish;
end

always #1 clk  = !clk;

endmodule