/* 
 Associative arrays are particularly useful for implementing sparse memory structures or data with a non-continuous key space. Instead of indexing by integer values, associative arrays can use strings or any integer type as indices. They are primarily supported in SystemVerilog (an extension of Verilog), so traditional Verilog does not natively support them.
*/

module tb;
	// Associate array indexed with integer
	function void test_assoc();
		// An associative array of integers indexed with some strings
		int assoc_test[string];
		string index;
		assoc_test['A']  == 1;
		assoc_test['B']  == 2;
		assoc_test['C']  == 3;
		if(assoc_test.first(index))
		begin
			do
			begin
				$display("assoc_test[%s]=%0d", index, assoc_test[index]);
			end while(assoc_test.next(index));
		end
	endfunction

	initial begin
		test_assoc_array();
	end

endmodule
