
//
// controller.sv : Controlador RISC-V Monociclo 
//
// simulação: Waveform9.vwf
//
// Referencia dos códigos de entrada Semana5 teórica pg 53
// Referencia das saidas semana 10 prática pg 21

// lw				|| op(0000011), func3(010), funct7(_______)b5(5) || RegWrite(1), ImmSrc(00), ALUSrc(1), MemWrite(0), ResultSrc(1), Branch(0), ALUOp(00)      
// sw				|| op(0100011), func3(010), funct7(_______)b5(5) || RegWrite(0), ImmSrc(01), ALUSrc(1), MemWrite(1), ResultSrc(x), Branch(0), ALUOp(00)
// R-Type(add)	|| op(0110011), func3(000), funct7(0000000)b5(5) || RegWrite(1), ImmSrc(xx), ALUSrc(0), MemWrite(0), ResultSrc(0), Branch(0), ALUOp(10)
// beq			|| op(1100011), func3(000), funct7(_______)b5(5) || RegWrite(0), ImmSrc(10), ALUSrc(0), MemWrite(0), ResultSrc(x), Branch(1), ALUOp(01)

module controller(input  logic [6:0] op,
                  input  logic [2:0] funct3,
                  input  logic       funct7b5,
                  input  logic       Zero,
                  output logic [1:0] ResultSrc,
                  output logic       MemWrite,
                  output logic       PCSrc, ALUSrc,
                  output logic       RegWrite, Jump,
                  output logic [1:0] ImmSrc,
                  output logic [2:0] ALUControl);

  logic [1:0] ALUOp;
  logic       Branch;

  maindec md(op, ResultSrc, MemWrite, Branch,
             ALUSrc, RegWrite, Jump, ImmSrc, ALUOp);
  aludec  ad(op[5], funct3, funct7b5, ALUOp, ALUControl);

  assign PCSrc = Branch & Zero | Jump;
endmodule

