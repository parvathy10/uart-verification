module uart_scoreboard (
  input logic clk,
  input logic rst_n,
  input logic tx_data,
  input logic rx_data
);

  // Define expected data sequences
  logic [7:0] expected_data[0:2] = '{8'h41, 8'h42, 8'h43};
  int sequence_index = 0;

  // Detect data sequence match
  always_ff @(posedge clk or negedge rst_n)
  begin
    if (!rst_n)
      sequence_index <= 0;
    else if (rx_data == expected_data[sequence_index] && sequence_index < 2)
      sequence_index <= sequence_index + 1;
    else if (rx_data != expected_data[sequence_index] && sequence_index > 0)
      sequence_index <= 0;
  end

endmodule
