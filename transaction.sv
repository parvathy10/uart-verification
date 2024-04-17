`ifndef TRANSACTION
`define TRANSACTION

class transaction;

  randc bit [7:0] data_tx;
  bit [7:0] data_rx;
  bit done;
  function void display(string str);
    $display("[%s] Status=%b, Tx data= %b, Rx Data = %b",str,done,data_tx,data_rx);
    endfunction
endclass

`endif