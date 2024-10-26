/*
casez in SystemVerilog

Purpose: Treats Z (high-impedance) values as "don't care" bits while allowing X values in the case expression and case items to be treated normally.

Behavior: Only the Z bits are treated as "don't care," so they match any corresponding value in the case items.
*/

/*
casex in SystemVerilog

Purpose: Treats both X and Z as "don't care" bits in both the case expression and the case items.

Behavior: Any bit in either the case expression or case items that has an X or Z will match any corresponding bit, regardless of its value.
*/

module tb;
	function void test_casez(logic [2:0] irq);
		logic int0, int1, int2;
		int0 = 0;
		int1 = 0;
		int2 = 0;
		casez (irq)
			3'b1?? : int2 = 1'b1;
			3'b?1? : int1 = 1'b1;
		        3'b??1 : int0 = 1'b1;
		endcase
		$display("int0 = %b int1 = %b, int2 = %b",int0,int1,int2);
	endfunction

	function void test_casex(logic [2:0] irq);
		logic int0, int1, int2;
		int0 = 0;
		int1 = 0;
		int2 = 0;
		casex (irq) 
   		 3'b1?? : int2 = 1'b1;
    		 3'b?1? : int1 = 1'b1;
   		 3'b??1 : int0 = 1'b1;
  		endcase 
  		$display("int0=%b int1=%b int2=%b",int0,int1,int2);
		endfunction
endmodule

