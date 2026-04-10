module tb_alu;

reg clk;
reg [3:0] A, B;
reg [1:0] sel;
wire [3:0] Y;
wire carry;

alu_4bit uut (
    .clk(clk),
    .A(A),
    .B(B),
    .sel(sel),
    .Y(Y),
    .carry(carry)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    A = 0; B = 0; sel = 0;

    #10 A=4'b0011; B=4'b0101; sel=2'b00;
    #10 sel=2'b01;
    #10 sel=2'b10;
    #10 sel=2'b11;

    #10 A=4'b1111; B=4'b0001; sel=2'b00;
    #10 sel=2'b01;
    #10 sel=2'b10;
    #10 sel=2'b11;

    #20 $finish;
end

endmodule
