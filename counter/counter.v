module counter(
    input clk,
    input rst,
    output reg [31:0] counter
);
always @(posedge clk or negedge rst) begin
    if (!rst) begin
        counter <= 1'b0;
    end else if(counter < 32'd100) begin           //100进制
        counter <= counter + 1'b1;
    end else begin
        counter <= 1'b0;
    end
end

endmodule