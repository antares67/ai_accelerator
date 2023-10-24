// naiive_conv.v

//simple code file for 3x3 8b convolution kernel
//assumes input is preprocessed into a 4b vector 

module naiive_conv ( in, kernel, out );

    input  [8:0][3:0] in, kernel;
    wire [10:0] sum;
    output [8:0] out;
    
    assign sum = in[0]*kernel[0] + in[1]*kernel[1] + in[2]*kernel[2] + in[3]*kernel[3] + in[4]*kernel[4] + in[5]*kernel[5] + in[6]*kernel[6] + in[7]*kernel[7] + in[8]*kernel[8]; 
    
    assign out = sum[10:3];

endmodule