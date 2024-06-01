`define ZERO   7'b0000001
`define ONE    7'b1001111
`define TWO    7'b0010010
`define THREE  7'b0000110
`define FOUR   7'b1001100
`define FIVE   7'b0100100
`define SIX    7'b0100000
`define SEVEN  7'b0001111
`define EIGHT  7'b0000000
`define NINE   7'b0000100
`define DEFAULT  7'b1111110

module sevenSegmentdecorderForCounter(count,segment);

input [2:0] count;

output reg [6:0] segment;

always@(count)
	
	begin

	case(count)

	3'd0: segment= `ZERO;
	3'd1: segment= `ONE;
	3'd2: segment= `TWO;
	3'd3: segment= `THREE;
	3'd4: segment= `FOUR;
	3'd5: segment= `FIVE;

	default :  segment= `DEFAULT;

	endcase



	end


endmodule 