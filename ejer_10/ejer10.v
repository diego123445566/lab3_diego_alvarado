// Módulo de Máquina de Estados de Mealy (Figura 3)
module ejer10 (
    input  wire ix,
    input  wire iCLK,
    input  wire iRST,
    output reg  oy
);

    // Definición de estados codificados en 2 bits
    reg [1:0] Prstate, Nxtstate;
    parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;

    // 1. Registro de estado (Lógica secuencial con Reset asíncrono activo en bajo)
    always @(posedge iCLK or negedge iRST) begin
        if (!iRST)
            Prstate <= S0;       // Reinicia al estado S0
        else
            Prstate <= Nxtstate; // Actualiza al siguiente estado en el flanco de reloj
    end

    // 2. Lógica del siguiente estado (Combinacional)
    always @(*) begin
        case (Prstate)
            S0: Nxtstate = ix ? S1 : S0;
            S1: Nxtstate = ix ? S3 : S0;
            S2: Nxtstate = ix ? S2 : S0;
            S3: Nxtstate = ix ? S2 : S0;
            default: Nxtstate = S0;
        endcase
    end

    // 3. Lógica de salida del modelo Mealy (Depende del estado actual y de la entrada 'ix')
    always @(*) begin
        case (Prstate)
            S0: oy = 1'b0;
            S1: oy = ix ? 1'b0 : 1'b1;
            S2: oy = ix ? 1'b0 : 1'b1;
            S3: oy = ix ? 1'b0 : 1'b1;
            default: oy = 1'b0;
        endcase
    end

endmodule 