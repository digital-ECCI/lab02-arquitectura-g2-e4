module sumador_restador(
    input [3:0] A,
    input [3:0] B,
    input Sel,
    output [3:0] Suma,
    output Co
);
    wire [3:0] B_mod;
    
    // XOR para controlar si se suma o se resta
    assign B_mod = B ^ {4{Sel}}; 

    // Instancia del sumador (o uso de operador +)
    // El acarreo de entrada (Cin) es la misma señal Sel
    assign {Co, Suma} = A + B_mod + Sel;

endmodule