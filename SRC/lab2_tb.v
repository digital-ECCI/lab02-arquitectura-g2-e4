`include "lab2.v"
`timescale 1ns / 1ps

module sumador_restador_tb;

    // Entradas
    reg [3:0] A;
    reg [3:0] B;
    reg Sel;

    // Salidas
    wire [3:0] Suma;
    wire Co;

    // Variables enteras para los bucles
    integer i, j;

    // Instanciar el módulo principal
    sumador_restador uut (
        .A(A), 
        .B(B), 
        .Sel(Sel), 
        .Suma(Suma), 
        .Co(Co)
    );

    // -----------------------------------------------------------
    // Bloque para generar el archivo de ondas (.vcd)
    // -----------------------------------------------------------
    initial begin
        $dumpfile("simulacion_sumador.vcd");
        $dumpvars(-1, uut);
    end

    // -----------------------------------------------------------
    // Bloque de estímulos (Prueba Exhaustiva Mejorada)
    // -----------------------------------------------------------
    initial begin
        $display("===============================================================");
        $display(" Iniciando simulacion exhaustiva (Suma y Resta emparejadas) ");
        $display("===============================================================\n");

        // Bucle externo para recorrer todos los valores de A (0 a 15)
        for (i = 0; i < 16; i = i + 1) begin
            A = i[3:0];
            
            // Bucle interno para recorrer todos los valores de B (0 a 15)
            for (j = 0; j < 16; j = j + 1) begin
                B = j[3:0];
                
                // 1. Probamos la SUMA
                Sel = 0;
                #5; // Esperamos a que el circuito reaccione
                $display("A=%d (bin:%b) | B=%d (bin:%b) || [SUMA  Sel=0] -> Suma=%d, Co=%b", 
                         A, A, B, B, Suma, Co);
                
                // 2. Probamos la RESTA inmediatamente después
                Sel = 1;
                #5; // Esperamos a que el circuito reaccione
                $display("A=%d (bin:%b) | B=%d (bin:%b) || [RESTA Sel=1] -> Suma=%b, Co=%b", 
                         A, A, B, B, Suma, Co);
                
                // Separador visual pequeño para el siguiente par de números
                $display("- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -");
            end
        end

        // Finalizar simulación
        #10;
        $display("\nSimulacion exhaustiva terminada con exito.");
        $finish;
    end
      
endmodule