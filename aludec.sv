//
// aludec.sv : Decodificador da ALU
//

module aludec(input  logic       opb5,
              input  logic [2:0] funct3,
              input  logic       funct7b5, 
              input  logic [1:0] ALUOp,
              output logic [2:0] ALUControl);

  logic  RtypeSub;
  assign RtypeSub = funct7b5 & opb5;  // TRUE for R-type subtract instruction

  always_comb
    case(ALUOp)
      2'b00:                ALUControl = 3'b000; // addition
      2'b01: case(funct3)
				
				default: ALUControl = 3'b001; // subtraction
					
				endcase
		
		
      default: case(funct3) // R-type or I-type ALU
                 3'b000:  if (RtypeSub) 
                            ALUControl = 3'b001; // sub 1
                          else          
                            ALUControl = 3'b000; // add, addi 0
                 3'b010:    ALUControl = 3'b101; // slt, slti 5
                 3'b110:    ALUControl = 3'b011; // or, ori 3
                 3'b111:    ALUControl = 3'b010; // and, andi 2
					  
					  3'b001: 	ALUControl = 3'b110; //sll, slli 6 
					  
					  3'b101: 	ALUControl = 3'b111; //srl, srli 7
					  3'b100: 	ALUControl = 3'b100; //xor 4
					  
					  //3'b001: 	ALUControl = 3'b100; //to bne
					  
                 default:   ALUControl = 3'bxxx; // ???
               endcase
    endcase
endmodule

