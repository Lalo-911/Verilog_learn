`timescale 1ns/1ns
`include "./odd_sel.v"

module testbench();
    wire check;
    reg sel = 0;
    reg clk = 0;
    
    reg [31:0] bus = 32'b0;
    odd_sel odd_sel_test(
        .bus(bus),
        .sel(sel),
        .check(check)
    );
    initial
    begin
        #20  sel = ~sel;
        #60  sel = ~sel;
        #60  sel = ~sel;
        #50  sel = ~sel;
        $finish;
        
    end
    always
    begin
    #5 clk = ~clk;
    end
    always
    begin
    #20 bus = bus+1;
    end

    initial begin
        $dumpfile("out.vcd");
        // This will dump all signal, which may not be useful
        //$dumpvars;
        // dumping only this module
        //$dumpvars(1, testbench);
        // dumping only these variable
        // the first number (level) is actually useless
        $dumpvars(0, testbench);
    end
endmodule
