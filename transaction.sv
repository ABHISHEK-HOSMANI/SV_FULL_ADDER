`ifndef TRANSACTION
`define TRANSACTION

class transaction;
  rand bit a;
  rand bit b;
  rand bit c;
  bit sum;
  bit carry;
  
  function void display(string name = "");
    $display("Time = [%0t] [%s] A=%0b B=%0b C=%0b | SUM=%0b CARRY=%0b",$time,name, a, b, c, sum, carry);
  endfunction
endclass : transaction
`endif