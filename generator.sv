`ifndef GENERATOR
`define GENERATOR

 `include "transaction.sv"
class generator;

    rand transaction tr;
  mailbox gen2drive;
    int no_of_tr;
  


    function new(mailbox gen2drive);
        this.gen2drive = gen2drive;
    endfunction

    task main();
        repeat(no_of_tr) begin
            tr = new();
            tr.randomize();
//           tr.put(8'b00110011);
            gen2drive.put(tr);
          tr.display("generator");
        
        end
       
    endtask
endclass
`endif