module alu8 (
    input  logic [7:0] A,
    input  logic [7:0] B,
    input  logic [2:0] opcode,
    output logic [7:0] result
);
    always_comb begin
        case (opcode)
            3'b000: result = A + B;
            3'b001: result = A - B;
            3'b010: result = A & B;
            3'b011: result = A | B;
            3'b100: result = A ^ B;
            default: result = 8'b00000000;
        endcase
    end
endmodule
