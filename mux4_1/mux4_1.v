`timescale 1ns/1ns

module mux4_1(
input [1:0]d0,d1,d2,d3,
input [1:0]sel,
output[1:0]mux_out
);
//*************code***********//

reg [1:0] mux_out_reg;
always @ (*)        //case语句放alway中，@（*）指对每个敏感变量触发
begin               //begin end中用reg类型
    case(sel)
    2'b00:mux_out_reg = d0;
    2'b01:mux_out_reg = d1;
    2'b10:mux_out_reg = d2;
    2'b11:mux_out_reg = d3;
    default:mux_out_reg = d0;
    endcase
end
assign mux_out = mux_out_reg;

/*
assign mux_out = (sel==2'b00) ? d3 : (sel==2'b01) ? d2 : (sel==2'b10) ? d1 : (sel==2'b11) ? d0 : 2'b00;
*/
//*************code***********//
endmodule