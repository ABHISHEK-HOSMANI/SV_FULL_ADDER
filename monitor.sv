`ifndef MONITOR
`define MONITOR

class monitor;
  transaction tr;
  virtual adder_interface vif;
  mailbox #(transaction) msmbx;

  function new(virtual adder_interface vif, mailbox #(transaction) msmbx);
    this.vif = vif;
    this.msmbx = msmbx;
  endfunction

  task run();
    tr = new();
    forever begin
      tr.a = vif.a;
      tr.b = vif.b;
      tr.c = vif.c;
      tr.sum = vif.sum; 
      tr.carry = vif.carry;
      msmbx.put(tr);
      tr.display("Monitor");
      #1;
    end
  endtask
endclass : monitor
`endif