/*
In object-oriented programming (OOP), overriding means providing a new implementation for a method that is already defined in a base (or parent) class within a derived (or child) class. When a method is overridden in a derived class, the derived class’s version of the method will be called instead of the base class’s version when the method is invoked on an object of the derived class.

Inheritance is a fundamental concept in object-oriented programming (OOP) that allows a new class to take on properties and methods of an existing class. In SystemVerilog and other OOP languages, inheritance enables code reuse and helps create organized, hierarchical relationships among classes. This is particularly useful in SystemVerilog for verification environments, such as in UVM (Universal Verification Methodology), where you need to build complex testbenches with shared behavior acrossdifferent components.
*/

/*
Why Use Virtual Functions?

Virtual functions are useful in verification and object-oriented programming for several reasons:

Polymorphism: They enable polymorphic behavior, allowing different derived classes to implement different behavior for the same function.
Dynamic Behavior: The decision on which function to execute is made at runtime based on the actual object type, making the code more flexible and adaptable.
Extensib
ility: They allow you to define a general behavior in the base class and specific implementations in derived classes, making it easier to extend functionality without modifying the base class.

Why Use Virtual Classes?
Virtual classes are used to:

Enforce a standard structure for derived classes by defining abstract methods (functions or tasks without implementation).
Enable polymorphism: They are often used in verification environments to allow different implementations (such as different test sequences or protocol-specific drivers) to be treated as the same type at runtime.
Promote code reusability: By defining common functionality in a virtual class, derived classes can inherit and extend this functionality without redundant code.
*/


class BasePacket;
  int A = 1;
  int B = 2;

  function void printA;
   $display("BasePacket::A is %d", A);
  endfunction : printA

  virtual function void printB;
    $display("BasePacket::B is %d", B);
  endfunction : printB

endclass : BasePacket


class My_Packet extends BasePacket;
   int A = 3; 
   int B = 4; 

   function void printA;
     $display("My_Packet::A is %d", A);
   endfunction: printA

   virtual function void printB;
     $display("My_Packet::B is %d", B);
   endfunction : printB

 endclass : My_Packet


 module test;

 initial begin
   BasePacket P1;
   My_Packet P2;
   P1 = new;
   P2 = new;
   P1.printA; // displays 'BasePacket::A is 1'
   P1.printB; // displays 'BasePacket::B is 2'
   P1 = P2;   // P1 has a handle to a My_packet object
   P1.printA; // displays 'BasePacket::A is 1'
   P1.printB; // displays 'My_Packet::B is 4' \u2013 latest derived method
   P2.printA; // displays 'My_Packet::A is 3'
   P2.printB; // displays 'My_Packet::B is 4'
 end

endmodule
