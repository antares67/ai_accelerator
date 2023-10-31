module bit_shift (
    input wire [15:0] data_in,      // 16-bit input data
    input wire [2:0] shift_amount,  // Number of positions to shift (0 to 7)
    input wire shift_direction,     // 0 for right shift, 1 for left shift
    output reg [7:0] data_out      // 8-bit shifted output data
);

always @(*) begin
    if (shift_direction == 0)  // Right shift
        data_out = data_in >> shift_amount;
    else  // Left shift
        data_out = data_in << shift_amount;
end

endmodule
