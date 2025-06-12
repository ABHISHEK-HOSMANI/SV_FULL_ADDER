interface adder_interface();
  logic a,b,c,sum,carry;
  
  modport adder(input a,b,c, output sum,carry);  
endinterface

//   clocking cb_drv (@posedge clk);
//     input a,b,c;
//     output sum,carry;
//   endclocking
  
//   clocking cb_mon (@posedge clk);
//     input a,b,c,sum,carry;
//   endclocking
  
//   modport adder(cb_drv);