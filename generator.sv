`ifndef GENERATOR
`define GENERATOR

class generator;
  transaction tr;
  mailbox #(transaction) gdmbx;

  function new(mailbox #(transaction) gdmbx);
    this.gdmbx = gdmbx;
  endfunction

  task run();
    repeat(5) begin
      tr = new();
      if(tr.randomize()) begin
        gdmbx.put(tr);
        tr.display("Generator");
        #1;
      end
      else begin
        $display("Randomization failed");
      end
    end
  endtask
endclass : generator
`endif