`ifndef MONITOR
`define MONITOR
 `include "transaction.sv"
`include "interface.sv"
class monitor;

    mailbox mon2scb;
    virtual uart_intf vif;
    int no_of_tr_dri;
//   	trans t1;


  function new(virtual uart_intf vif, mailbox mon2scb);
        this.vif = vif;
        this.mon2scb = mon2scb;
        
     
    endfunction //new()

  
  

    task main();
      forever
        begin
            transaction t1;
          t1=new();

          wait(vif.en_rx);
            t1.data_tx  = vif.data_tx;
            t1.data_rx = vif.data_rx;
  
          t1.done=(vif.rx_done);
//           @(negedge vif.clk);
          repeat(11) begin
            @(negedge vif.clk);
          end
          
//           	wait(vif.data_tx == vif.data_rx);
          mon2scb.put(t1); 
          t1.display("monitor");
            
        end

    endtask

endclass
`endif 