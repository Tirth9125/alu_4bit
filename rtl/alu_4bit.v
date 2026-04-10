module alu_4bit (
    input clk,
    input  [3:0] A, B,
    input  [1:0] sel,
    output reg [3:0] Y,
    output reg carry
);

always @(posedge clk) begin
    case (sel)
        2'b00: {carry, Y} <= A + B;
        2'b01: begin Y <= A & B; carry <= 0; end
        2'b10: begin Y <= A | B; carry <= 0; end
        2'b11: begin Y <= A ^ B; carry <= 0; end
        default: begin Y <= 0; carry <= 0; end
    endcase
end

endmodule
