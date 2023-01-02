module FA(input a, input b, input cin, output sum, output cout);
	assign {cout,sum} = a+b+cin;
endmodule

module HA(input a, input b, output sum, output cout);
	assign {cout,sum} = a+b;
endmodule



