`ifndef ENVIRONMENT
`define ENVIRONMENT

class environment;
  generator gen;
  driver drv;
  monitor mon;
  scoreboard sco;
  
  virtual adder_interface vif;
  
  function new(virtual adder_interface vif);
    this.vif = vif;
  endfunction
  
  mailbox #(transaction) gdmbx = new();
  mailbox #(transaction) msmbx = new();
  
  task build;
    gen = new(gdmbx);
    drv = new(vif, gdmbx);
    mon = new(vif, msmbx);
    sco = new(msmbx);
  endtask
  
  task run;
    fork
      gen.run();
      drv.run();
      mon.run();
      sco.run();
    join_any
//     join_none
  endtask
endclass : environment
`endif