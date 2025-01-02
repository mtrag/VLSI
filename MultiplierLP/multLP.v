/*
Malik Tragna - 8x8 Low Power Multiplier
Last Updated - November 15th, 2024

- The purpose of this program is to simulate the behavior of an 8x8 binary multiplier using the Wallace Tree architecture
- This archictecture will be repicated on a transistor-level in Cadence, as well as be converted into an optimized layout
*/

module MultLP (

	input [7:0] multiplicand, //Multiplicand, 8 bits
	input [7:0] multiplier, //Multiplier, 8 bits
	output [15:0] product //Product, 16 bits

);
	
	//8-cell wire array, stores 8 partial products that are each 16 bits large
	wire [15:0] partialProducts [7:0];
	
	genvar i; //incremental variable to be used in for loop
	generate  //used to generate the hardware required to implement the loop
		for(i = 0; i < 8; i = i + 1) begin : partial_product  //shifts through bits in multiplier, shifts PP proportionately 
			assign partialProducts[i] = (multiplicand&{8{multiplier[i]}}) << i;
		end
	endgenerate
	
	//adds each partial product to the final product
	assign product = partialProducts[0] + partialProducts[1] + partialProducts[2] + partialProducts[3] + partialProducts[4] + partialProducts[5] + partialProducts[6] + partialProducts[7];
	

endmodule
	
