`ifndef SCOREBOARD
`define SCOREBOARD
 `include "transaction.sv"



class scoreboard;

    mailbox mon2scb;

  int no_of_tr_scb;

  function new( mailbox mon2scb);
        
        this.mon2scb = mon2scb;
        
     
    endfunction 

  
  

    task main();
      forever
        begin
            transaction t1;
            mon2scb.get(t1);
   
          
        
         no_of_tr_scb++;
     
          t1.display("Scoreboard");
         #5;
         if (t1.data_tx == t1.data_rx)
            $display("Data Match");
         else
           $display("Data MisMatch");
            
        end

    endtask

endclass 
`endif