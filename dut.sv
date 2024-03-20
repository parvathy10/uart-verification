module uart_half_duplex (
  input logic clk,
  input logic rst_n,
  input logic tx_data,
  output logic rx_data
);

  // Initialize internal state
  logic [7:0] rx_buffer = 8'h00;
  int rx_index = 0;
  logic receiving = 0;

  // UART receive logic
  always_ff @(posedge clk or negedge rst_n)
  begin
    if (!rst_n)
    begin
      rx_index <= 0;
      receiving <= 0;
    end
    else if (receiving)
    begin
      // Receive data
      if (rx_index == 0 && tx_data == 0) begin
        // Start bit detected
        rx_index <= 1;
        rx_buffer <= 8'h00;
      end
      else if (rx_index > 0 && rx_index < 9)
      begin
        // Shift in data bits
        rx_buffer <= {rx_buffer[6:0], tx_data};
        rx_index <= rx_index + 1;
      end
      else if (rx_index == 9)
      begin
        // Stop bit detected
        rx_index <= 0;
        receiving <= 0; // Stop receiving
      end
    end
    else if (tx_data == 0)
    begin
      // Start receiving
      receiving <= 1;
    end
  end

  always_comb
  begin
    rx_data = rx_buffer[7]; // Output received data bit
  end

endmodule
