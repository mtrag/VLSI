// Testbench for 8x8 Multiplier
`timescale 1ns / 1ns
`include "multLP.v"
module MultLP_tb;

    reg [7:0] multiplicand;
    reg [7:0] multiplier;
    wire [15:0] product;

    // Instantiate the multiplier module
    MultLP uut (
        .multiplicand(multiplicand),
        .multiplier(multiplier),
        .product(product)
    );

    initial begin
		
		$dumpfile("multLP_tb.vcd");
		$dumpvars(0, MultLP_tb);
		
        // Display header
        $display("M\tQ\tP");
        $display("--------------------");

        // Test vector 1
        multiplicand = 8'd15;
        multiplier = 8'd10;
        #10;
        $display("%d\t%d\t%d", multiplicand, multiplier, product);

        // Test vector 2
        multiplicand = 8'd255;
        multiplier = 8'd255;
        #10;
        $display("%d\t%d\t%d", multiplicand, multiplier, product);

        // Test vector 3
        multiplicand = 8'd0;
        multiplier = 8'd100;
        #10;
        $display("%d\t%d\t%d", multiplicand, multiplier, product);

        // Test vector 4
        multiplicand = 8'd123;
        multiplier = 8'd45;
        #10;
        $display("%d\t%d\t%d", multiplicand, multiplier, product);

        // Test vector 5
        multiplicand = 8'd50;
        multiplier = 8'd50;
        #10;
        $display("%d\t%d\t%d", multiplicand, multiplier, product);

        // Finish simulation
        $finish;
    end

endmodule
