`timescale 1ns/1ps

module tb_alu8;
    logic [7:0] A, B;
    logic [2:0] opcode;
    logic [7:0] result;
    integer passed;
    integer failed;

    alu8 dut (
        .A(A),
        .B(B),
        .opcode(opcode),
        .result(result)
    );

    task automatic check(
        input logic [2:0] op,
        input logic [7:0] a,
        input logic [7:0] b,
        input logic [7:0] expected
    );
        begin
            opcode = op;
            A = a;
            B = b;
            #10;

            if (result === expected) begin
                passed = passed + 1;
                $display("PASS: opcode=%b A=%0d B=%0d result=%0d",
                         opcode, A, B, result);
            end else begin
                failed = failed + 1;
                $display("FAIL: opcode=%b A=%0d B=%0d expected=%0d got=%0d",
                         opcode, A, B, expected, result);
            end
        end
    endtask

    initial begin
        passed = 0;
        failed = 0;

        check(3'b000, 8'd5,   8'd3,   8'd8);
        check(3'b001, 8'd5,   8'd3,   8'd2);
        check(3'b010, 8'd5,   8'd3,   8'd1);
        check(3'b011, 8'd5,   8'd3,   8'd7);
        check(3'b100, 8'd5,   8'd3,   8'd6);

        check(3'b000, 8'd255, 8'd1,   8'd0);
        check(3'b001, 8'd0,   8'd1,   8'd255);
        check(3'b101, 8'd5,   8'd3,   8'd0);

        $display("Test summary: %0d passed, %0d failed", passed, failed);
        if (failed != 0)
            $fatal(1, "ALU testbench failed");

        $finish;
    end
endmodule
