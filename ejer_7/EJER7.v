// MODULO PRINCIPAL
module EJER7 (
    input CLOCK_50,
    input [1:0] SW,
    input [0:0] KEY,
    output [0:0] LEDR
);

wire CLK_LENTO;

// DIVISOR DE FRECUENCIA
Divisor DIV1 (
    CLOCK_50,
    KEY[0],
    CLK_LENTO
);

// FLIP-FLOP JK
JK_FF FF1 (
    LEDR[0],
    SW[0],
    SW[1],
    CLK_LENTO,
    KEY[0]
);

endmodule


// DIVISOR DE FRECUENCIA
module Divisor (
    input CLOCK_50,
    input RST,
    output reg CLK_LENTO
);

reg [25:0] contador = 0;

always @(posedge CLOCK_50 or negedge RST)
begin
    if (!RST)
    begin
        contador <= 0;
        CLK_LENTO <= 0;
    end
    else if (contador == 24999999)
    begin
        contador <= 0;
        CLK_LENTO <= ~CLK_LENTO;
    end
    else
        contador <= contador + 1'b1;
end

endmodule


// FLIP-FLOP JK HECHO CON D
module JK_FF (
    output oQ,
    input iJ, iK, iCLK, iRST
);

wire JK;

assign JK = (iJ & ~oQ) | (~iK & oQ);

D_FF JK1 (oQ, JK, iCLK, iRST);

endmodule


// FLIP-FLOP D
module D_FF (
    output reg Q,
    input D, CLK, RST
);

always @(posedge CLK or negedge RST)
begin
    if (!RST)
        Q <= 1'b0;
    else
        Q <= D;
end

endmodule
