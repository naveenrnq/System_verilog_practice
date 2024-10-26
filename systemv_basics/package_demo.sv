/*
Packages are typically used to:

=> Define common typedefs, enums, and constants.

=> Store function and task definitions that multiple modules or classes can use.

=> Organize classes and interfaces used across a testbench in verification.

Create reusable libraries for design components and verification environments.
*/

package common_utils_pkg;
  parameter proj_name = "sv_demo";
  typedef enum {ADD, SUB, MUL} opcodes_t;

  class instruction_c;
    rand opcodes_t opcode;
    rand bit[31:0]  op0; 
    rand bit[31:0]  op1; 
    function display_instr();
      $display("opcode =%s  op0=%0h op1=%0h",opcode.name(), op0, op1);
    endfunction
  endclass

endpackage


module tb;
	import common_utils_pkg::*;

	initial 
	begin
    		instruction_c  instr;
    		instr = new();
    		instr.display_instr();
    		//using scope resolution
    		$display("Project name is %s", common_utils_pkg::proj_name);
  	end  

endmodule
