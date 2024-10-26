/*
In SystemVerilog, an automatic function is a function in which each call has its own unique memory allocation for variables. This means that variables declared within an automatic function are created dynamically each time the function is called and are deallocated when the function call ends. This feature is similar to stack-based function calls in software programming, where each invocation has its own local memory.
*/

module tb;
	// Module functios are by default static, use automatic
	function automatic int factorial(int num);
	 if(num > 1)
		 factorial = factorial(num - 1) * num;
         else 
	         factorial = 1;
	endfunction

	int result;

	initial
	begin
		$display("\n\n\tFactorial from 1 to 5...\n");

		for(int i = 0; i < 6; i = i + 1)
		begin
			// Function calls itself recursively with different 
         		// variable scope for 'int num' each time
			result = factorial(i);

			$display("\t%0d factorial = %0d", i, result);
		end

		$display("\n\t End of simulation..\n\n");

	end // initial
endmodule


		
