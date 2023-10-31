module bit_shift_tb();
reg [15:0] data_in;
  reg [2:0] shift_amount;
  reg shift_direction;
  wire [7:0] data_out;
 bit_shift dut (
    .data_in(data_in),
    .shift_amount(shift_amount),
    .shift_direction(shift_direction),
    .data_out(data_out)
  );
  // Clock generation
  reg clock = 0;
  always begin
    #5 clock = ~clock;
  end
   // Test case generation
  initial begin
    $dumpfile("BitShifter16to8_tb.vcd");
    $dumpvars(0, bit_shift_tb);
    
    // Test right shifting
    data_in = 16'h55AA;  // Initial value
    shift_direction = 0;  // Right shift
    for (shift_amount = 0; shift_amount <= 7; shift_amount = shift_amount + 1) begin
      #10;
      $display("Right shift by %d: %h >> %d = %h", shift_amount, data_in, shift_amount, data_out);
    end

    // Test left shifting
    data_in = 16'h55AA;  // Initial value
    shift_direction = 1;  // Left shift
    for (shift_amount = 0; shift_amount <= 7; shift_amount = shift_amount + 1) begin
      #10;
      $display("Left shift by %d: %h << %d = %h", shift_amount, data_in, shift_amount, data_out);
    end
    
    $finish;
  end

  // Clock generation
  always #5 clock = ~clock;

endmodule

