`ifndef ENVIRONMENT
`define ENVIRONMENT



`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;

generator gen;

driver drv;

monitor mon;

scoreboard scb;

virtual uart_intf vif;
mailbox gen2drive;
mailbox mon2scb;
function new(virtual uart_intf vif);
    this.vif = vif;
//     this.gen2drive = gen2drive;
  gen2drive=new(1);
    drv = new(vif, gen2drive);
  mon2scb=new(1);
  mon= new(vif, mon2scb);
    gen = new(gen2drive);
  scb=new(mon2scb);
endfunction


task test;
    fork
      	gen.main();
        drv.main();
        mon.main();
        scb.main();
    join_any
   
endtask



task run;

    test();
    
  	 $finish;
endtask

endclass
`endif