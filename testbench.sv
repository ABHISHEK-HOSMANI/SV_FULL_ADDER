`include "interface.sv"
`include "transaction.sv"
`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "environment.sv"

module adder_top;
  adder_interface intf();
  full_adder dut(.intf(intf));
  
  environment env; //   Environment handle

  initial begin
    env = new(intf);   // pass virtual interface
    env.build();
    env.run();         // run all TB components
//     #5; 
    $finish;
  end
  
  initial begin
    $dumpfile("adder.vcd");
    $dumpvars();
  end
endmodule