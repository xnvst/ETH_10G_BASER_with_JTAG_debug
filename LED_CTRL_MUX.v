module LED_CTRL_MUX (
	input wire [1:0]	LED_DISP_CTRL,
	input wire [7:0]	INPUT_0,
	input wire [7:0]	INPUT_1,
	input wire [7:0]	INPUT_2,
	input wire [7:0]	INPUT_3,
	
	output reg	[7:0]	OUTPUT
);

always @(*)
	case (LED_DISP_CTRL)
		2'b00: OUTPUT = INPUT_0;
		2'b01: OUTPUT = INPUT_1;
		2'b10: OUTPUT = INPUT_2;
		2'b11: OUTPUT = INPUT_3;
		default: OUTPUT = INPUT_0; 
	endcase
	
endmodule	   

	
	
