
monitor 
module uart_monitor (
  input logic clk,
  input logic rst_n,
  input logic tx_data,
  input logic rx_data
);
  // Monitor logic to observe transmitted and received data
  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      // Reset state
    end else begin
      // Monitor logic
      $display("Time %t: TX = %b, RX = %b", $time, tx_data, rx_data);
    end
  end
endmodule
