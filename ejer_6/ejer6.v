// Flip-Flop T hecho con flip-flop D y compuertas
module ejer6 (oQ, iT, iCLK, iRST);
    output oQ;
    input iT, iCLK, iRST;
    wire DT;
    
    // Corregido: se usan 'oQ' e 'iT' que son los nombres declarados en el módulo
    assign DT = oQ ^ iT; 
    
    // Instancia del Flip-Flop D
    D_FF D1 (oQ, DT, iCLK, iRST);
endmodule

// Flip-Flop D
module D_FF (Q, D, CLK, RST);
    output reg Q;
    input D, CLK, RST;
    
    always @ (posedge CLK or negedge RST) begin
        if (~RST) 
            Q = 1'b0;
        else 
            Q = D;
    end
endmodule 