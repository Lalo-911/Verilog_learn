`timescale 1ns/1ns
module odd_sel(
input [31:0] bus,
input sel,
output check
);
//*************code***********//
//sel为1时奇校验，为0时偶校验
//连续异或结果为奇校验，连续同或结果为偶校验  采用按位异或同或
reg odd = 0;
always @(*) begin
    if(sel) begin
        odd = ^bus;
    end
    else begin
        odd = ~^bus;
    end
    
end
assign check = odd;
/* 其他答案
`timescale 1ns/1ns
module odd_sel(
input [31:0] bus,
input sel,
output check
);

wire odd;
assign odd = ^bus;
assign check = sel?odd:~odd;

endmodule 
*/
//*************code***********//
endmodule