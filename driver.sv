`ifndef DRIVER
`define DRIVER

class driver;
  transaction tr;
  mailbox #(transaction) gdmbx;
  
  virtual adder_interface vif;
  
  function new(virtual adder_interface vif, mailbox #(transaction) gdmbx);
    this.vif = vif;
    this.gdmbx = gdmbx;
  endfunction
  

  task run();
    forever begin
      gdmbx.get(tr);  //Get transaction from mailbox
      
      vif.a <= tr.a;  //Drive inputs to DUT
      vif.b <= tr.b;
      vif.c <= tr.c;
      
      tr.display("Driver");
      #1;
    end
  endtask
endclass : driver
`endif