/*
bit Data Type
Type: 2-state (binary) data type.
States: Only supports 0 and 1 as valid values, which makes it more memory-efficient.
Intended Use: Best suited for signals where unknown (X) or high-impedance (Z) states are not expected, like in purely combinational logic or for flags and counters.
Default Value: 0


logic Data Type
Type: 4-state data type.
States: Supports 0, 1, X (unknown), and Z (high-impedance).
Intended Use: Commonly used for signals in design and verification, as it can represent unknown and high-impedance states, which are often necessary in digital logic and verification scenarios.
Default Value: X (unknown)
*/


module test;
	// bit vs logic difference
	task test_bit_logic;
  		bit req_bit_valid;
  		logic req_logic_valid;
  		byte req_attr;
  		$display("req_bit_valid=%b req_logic_valid=%b req_attr=%h", req_bit_valid, req_logic_valid,req_attr);
  		req_logic_valid = 'bz; 
  		req_bit_valid = 'b1; 
  		$display("req_bit_valid=%b req_logic_valid=%b",req_bit_valid, req_logic_valid);
	endtask

	//demo for user defined types
	task test_user_defined_types;
 		typedef longint unsigned uint64;
 		uint64 abc; 
 		abc = 64'hFFFFFFFFFFFFFFFF;
 		$display("uint64 abc = %h",abc);
	endtask

	// Illustrate equality operator difference
	task test_equality_operator;
  		logic [2:0] abc, def; 
  		logic eq;
  		abc= 3'b01x;
  		def= 3'b01x;
  		if(abc == def) 
		begin
    			$display(" abc and def equal (==) eq=%b ",(abc==def));
  		end 
		else 
		begin
   			$display(" abc and def not equal (==) eq=%b", (abc==def));
  		end  
  		if(abc === def) 
		begin
    			$display(" abc and def equal (===) eq=%b ",(abc===def));
  		end 
		else 
		begin
    			$display(" abc and def not equal (===)");
  		end  
		endtask

	//----------------------------
	//Run the examples to see diff
	//----------------------------
	initial begin
  		test_bit_logic();
  		test_user_defined_types();
  		test_equality_operator();
	end

endmodule

	

