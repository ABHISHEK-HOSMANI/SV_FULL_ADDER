`ifndef SCOREBOARD
`define SCOREBOARD

class scoreboard;
  transaction tr;
  mailbox #(transaction) msmbx;

  function new(mailbox #(transaction) msmbx);
    this.msmbx = msmbx;
  endfunction

  task run();
    bit expected_sum;
    bit expected_carry;
    forever begin
      msmbx.get(tr);      

      // Compute expected outputs
      expected_sum   = tr.a ^ tr.b ^ tr.c;
      expected_carry = (tr.a & tr.b) | (tr.b & tr.c) | (tr.c & tr.a);
      
      // Check against actual outputs
      if (tr.sum != expected_sum && tr.carry != expected_carry) begin
        $display("Mismatch! Got: sum=%b carry=%b | Expected: sum=%b carry=%b", 
                  tr.sum, tr.carry, expected_sum, expected_carry);
      end else begin
        $display("PASS : sum=%b carry=%b | Expected: sum=%b carry=%b", 
                  tr.sum, tr.carry, expected_sum, expected_carry);
        tr.display("Scoreboard");
        $display("----------------------------------------------------------");
      end
    end
  endtask
endclass : scoreboard
`endif


// `ifndef SCOREBOARD
// `define SCOREBOARD
// `include "transcation.sv"

// class scoreboard;
//   mailbox #(transaction) msmbx;

//   function new(mailbox #(transaction) msmbx);
//     this.msmbx = msmbx;
//   endfunction

//   task run();
//     transaction tr;
//     forever begin
//       msmbx.get(tr);
//       bit expected_sum;
//       bit expected_carry;
//       expected_sum   = tr.a ^ tr.b ^ tr.c;
//       expected_carry = (tr.a & tr.b) | (tr.b & tr.c) | (tr.c & tr.a);
//       if (tr.sum !== expected_sum || tr.carry !== expected_carry) begin
//         $display("Mismatch! Got: sum=%b carry=%b | Expected: sum=%b carry=%b", 
//                 tr.sum, tr.carry, expected_sum, expected_carry);
//       end else begin
//         $display("PASS ");
//         tr.display("Score Board");
//       end
//     end
//   endtask
// endclass : scoreboard
// `endif