/*
Parent-Child Classes:-

Refers to the hierarchical relationship between two classes: a parent (or base) class and a child (or derived) class.

The child class extends from the parent class, inheriting its properties and methods, thus establishing a parent-child relationship.

This relationship specifically describes how two classes are connected, not necessarily involving multiple levels or structures.

The focus is on direct linkage between one parent and one child.

Inheritance: -

Refers to the mechanism or concept in object-oriented programming (OOP) wherea class (child) acquires the properties (variables) and behavior (methods) of another class (parent).

Inheritance allows for code reuse, enabling new classes to build on existing ones without redefining them.

Inheritance is more general, supporting multi-level hierarchies where one class inherits from another, which may, in turn, inherit from yet another class
*/

class Packet;
  bit [31:0] addr;
  bit err=0;
  function int get_addr();
  //virtual function int get_addr();
    get_addr = 'hABCD;
  endfunction

endclass

class ErrPacket extends Packet; 
  bit err=1;
  function int get_addr();
    get_addr = 'hCDEF;
  endfunction
endclass

module test;
  initial begin
    Packet p;
    ErrPacket  ep;  
    ep = new();
    p = ep;
    $display("packet addr=%h err=%b", p.get_addr, p.err);
    $display("ep_packet addr=%h err=%b", ep.get_addr, ep.err);
  end  
endmodule
