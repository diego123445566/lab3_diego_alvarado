module ejer9 (iJ, iK, iCLK, oQ, oQnot); 
    output oQ, oQnot; 
    input iJ, iK, iCLK; 
    
    reg rQ = 1'b0; // Inicialización del registro
    
    assign oQnot = ~rQ;  
    assign oQ = rQ; 
    
    always @(posedge iCLK) 
    begin 
        if ((iJ == 1) && (iK == 0)) 
        begin 
            rQ <= 1'b1; // Set (Forzar a 1)
        end 
        else if ((iJ == 0) && (iK == 1)) 
        begin 
            rQ <= 1'b0; // Reset (Forzar a 0)
        end 
        else if ((iJ == 1) && (iK == 1)) 
        begin 
            rQ <= ~rQ;  // Toggle (Bascular)
        end 
        else 
        begin 
            rQ <= rQ;   // Memoria (Mantener estado)
        end 
    end 
endmodule 