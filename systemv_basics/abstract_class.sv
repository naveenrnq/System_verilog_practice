// Abstract/Virtual class
// Abstract class is a generic class which is used by extend classes.
// It is used to define a set of some common methods
module tb;
  // Define the virtual class A
  virtual class A;
    virtual function void my_display();
      $display("PROTOTYPE");
    endfunction
  endclass

  // Define the class B extending class A
  class B extends A;
    // Implement the virtual function
    function void my_display();
      $display("Hello! from B");
    endfunction
  endclass

  // Declare handles for A and B
  A a_h;
  B b_h;

  initial begin
    // Create an instance of class B
    b_h = new();
    // Call my_display method on b_h
    b_h.my_display();
    // Assign b_h to a_h
    a_h = b_h;
    // Call my_display method on a_h
    a_h.my_display();
  end
endmodule // End of tb


