module ejer1 (
    input wire CLOCK_50,    // Reloj de 50 MHz integrado en la tarjeta DE0-CV
    input wire [9:0] SW,    // Switches de la placa (hasta SW9)
    output reg LEDR0        // Salida hacia un LED
);

    // Contador para dividir la frecuencia de 50 MHz y hacerla visible al ojo humano
    reg [25:0] contador = 0;

    always @(posedge CLOCK_50) begin
        // Cada 25 millones de ciclos invierte el estado del LED (aprox. cada 0.5 segundos)
        if (contador == 25000000 - 1) begin
            LEDR0 <= ~LEDR0;
            contador <= 0;
        end else begin
            contador <= contador + 1;
        end
    end

endmodule 