`ifndef UART_INTF
`define UART_INTF

interface uart_intf(input clk,en_rx,en_tx);
    
    // logic clk;
    logic [7:0]data_rx;
    logic [7:0]data_tx;
    logic u_tx;
    // logic tx_en;
    // logic rx_en;
    logic tx_done;
    logic rx_done;

    

endinterface //uart_intf

`endif