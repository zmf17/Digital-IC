module FA(input a, input b, input cin, output sum, output cout);
	assign {cout,sum} = a+b+cin;
endmodule

module HA(input a, input b, output sum, output cout);
	assign {cout,sum} = a+b;
endmodule

module Carry_generate(input a, input b, output g);
	assign g = a&b;
endmodule 

module Carry_propagate(input a, input b, output p);
	assign p = a^b; 
endmodule 

module Carry_lookahead_adder_4bit(input [3:0] a, input [3:0] b, input cin, output [4:0] sum);
	wire [3:0] p;
	wire [3:0] g;
	wire [4:1] c;
	Carry_generate C_g[3:0] (.a(a), .b(b), .g(g));
	Carry_propagate C_p[3:0] (.a(a), .b(b), .p(p));
	assign c[1] = (g[0]) | (p[0]&cin);
	assign c[2] = (g[1]) | (g[0]&p[1]) | (p[1]&p[0]&cin);
	assign c[3] = (g[2]) | (g[1]&p[2]) | (g[0]&p[2]&p[1]) | (p[2]&p[1]&p[0]&cin);
	assign c[4] = (g[3]) | (g[2]&p[3]) | (g[1]&p[3]&p[2]) | (g[0]&p[3]&p[2]&p[1]) | (p[3]&p[2]&p[1]&p[0]&cin);
	assign sum[4] = c[4];
	assign sum[3:0] = p^{c[3:1],cin}; 
endmodule
