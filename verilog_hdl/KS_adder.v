
//Asynchronous 8-bit Kogge Stone Adder

//INPUTS:
//  A(8), B(8) - Inputs
//  Cin - 1b Carry In

//OUTPUTS:
//  S(8) - Sum 
//  Cout - Carry Out

//Function: S = A + B


module KS_adder( A, B, Cin, Cout, S );
    
    input Cin;
    input [7:0] A, B;
    wire [3:0][7:0] P, G; 
    output Cout;
    output [7:0] S;
    
    //Preprocessing
    
    // P = A ^ B
    
    assign P[0][0] = A[7]^B[7];
    assign P[0][1] = A[6]^B[6];
    assign P[0][2] = A[5]^B[5];
    assign P[0][3] = A[4]^B[4];
    assign P[0][4] = A[3]^B[3];
    assign P[0][5] = A[2]^B[2];
    assign P[0][6] = A[1]^B[1];
    assign P[0][7] = A[0]^B[0];
    
    // G = A & B (except for Cin exception)
    
    assign G[0][0] = A[7]&B[7];
    assign G[0][1] = A[6]&B[6];
    assign G[0][2] = A[5]&B[5];
    assign G[0][3] = A[4]&B[4];
    assign G[0][4] = A[3]&B[3];
    assign G[0][5] = A[2]&B[2];
    assign G[0][6] = A[1]&B[1];
    assign G[0][7] = A[0]&B[0]|A[0]&Cin|B[0]&Cin;
    
    //Carry Generate (final row of G's is carry)
    //LAYER 1

    assign P[1][0] = P[0][0]&P[0][1];
    assign P[1][1] = P[0][1]&P[0][2];
    assign P[1][2] = P[0][2]&P[0][3];
    assign P[1][3] = P[0][3]&P[0][4];
    assign P[1][4] = P[0][4]&P[0][5];
    assign P[1][5] = P[0][5]&P[0][6];
    assign P[1][6] = P[0][6]&P[0][7];
    assign P[1][7] = P[0][7];
    
    assign G[1][0] = P[0][0]&G[0][1]|G[0][0];
    assign G[1][1] = P[0][1]&G[0][2]|G[0][1];
    assign G[1][2] = P[0][2]&G[0][3]|G[0][2];
    assign G[1][3] = P[0][3]&G[0][4]|G[0][3];
    assign G[1][4] = P[0][4]&G[0][5]|G[0][4];
    assign G[1][5] = P[0][5]&G[0][6]|G[0][5];
    assign G[1][6] = P[0][6]&G[0][7]|G[0][6];
    assign G[1][7] = G[0][7];
    
    //LAYER 2
    
    assign P[2][0] = P[1][0]&P[1][2];
    assign P[2][1] = P[1][1]&P[1][3];
    assign P[2][2] = P[1][2]&P[1][4];
    assign P[2][3] = P[1][3]&P[1][5];
    assign P[2][4] = P[1][4]&P[1][6];
    assign P[2][5] = P[1][5]&P[1][7];
    assign P[2][6] = P[1][6];
    assign P[2][7] = P[1][7];
    
    assign G[2][0] = P[1][0]&G[1][2]|G[1][0];
    assign G[2][1] = P[1][1]&G[1][3]|G[1][1];
    assign G[2][2] = P[1][2]&G[1][4]|G[1][2];
    assign G[2][3] = P[1][3]&G[1][5]|G[1][3];
    assign G[2][4] = P[1][4]&G[1][6]|G[1][4];
    assign G[2][5] = P[1][5]&G[1][7]|G[1][5];
    assign G[2][6] = G[1][6];
    assign G[2][7] = G[1][7];
    
    //LAYER 3
    
    assign P[3][0] = P[2][0]&P[2][4];
    assign P[3][1] = P[2][1]&P[2][5];
    assign P[3][2] = P[2][2]&P[2][6];
    assign P[3][3] = P[2][3]&P[2][7];
    assign P[3][4] = P[2][4];
    assign P[3][5] = P[2][5];
    assign P[3][6] = P[2][6];
    assign P[3][7] = P[2][7];
    
    assign G[3][0] = P[2][0]&G[2][4]|G[2][0];
    assign G[3][1] = P[2][1]&G[2][5]|G[2][1];
    assign G[3][2] = P[2][2]&G[2][6]|G[2][2];
    assign G[3][3] = P[2][3]&G[2][7]|G[2][3];
    assign G[3][4] = G[2][4];
    assign G[3][5] = G[2][5];
    assign G[3][6] = G[2][6];
    assign G[3][7] = G[2][7];
    
    
    //Sum S[i] = P[0][i]^G[2][i+1]
    
    assign S[7] = P[0][0]^G[3][1];
    assign S[6] = P[0][1]^G[3][2];
    assign S[5] = P[0][2]^G[3][3];
    assign S[4] = P[0][3]^G[3][4];
    assign S[3] = P[0][4]^G[3][5];
    assign S[2] = P[0][5]^G[3][6];
    assign S[1] = P[0][6]^G[3][7];
    assign S[0] = P[0][7]^Cin;
    
    //Carry Out
    
    assign Cout = G[3][0];
    
    
endmodule

