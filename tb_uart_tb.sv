module tb_uart_half_duplex;
  // Inputs
  logic clk = 0;
  logic rst_n = 0;
  
  // Outputs
  logic tx_data;
  logic rx_data;
  
  // Instantiate DUT
  uart_half_duplex dut_inst (
    .clk(clk),
    .rst_n(rst_n),
    .tx_data(tx_data),
    .rx_data(rx_data)
  );
  
  // Test stimulus generation
  initial begin
    // Release reset after a delay
    #10 rst_n = 1;
    
    // Wait for some time
    #100;
    
    // Start transmitting 'A'
    tx_data = 0;
    #10;
    for (int i = 0; i < 8; i++) begin
      #10;
    end
    tx_data = 1;
    
    // Wait for some time before finishing simulation
    #100;
    $finish;
  end
  
  // Clock generation
  always #5 clk = ~clk;
  
endmodule
