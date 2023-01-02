module FA(input a, input b, input cin, output sum, output cout);
	assign {cout,sum} = a+b+cin;
endmodule

module HA(input a, input b, output sum, output cout);
	assign {cout,sum} = a+b;
endmodule

module Carry_generate(input a, input b, output g);
	assign g = a&b;
endmodule 

module Carry_propagate(input a, input b, output g);
	assign p = a^b; 
endmodule 


