
//
// imem.sv : memoria de instrucoes
//
// Simulacao: Waverform6.vwf
//
// Funciona como memora ROM (read-only), 
//  sendo inicializado com as instrucoes contidas 
//  no arquivo riscvtes.txt (apenas p/ simulacao)
//
// Capacidade de armazenamento: 64 posicoes de 32 bits.)
//

module imem(input logic [31:0] a,
				output logic [31:0] rd);
	
	logic [31:0] RAM[63:0];
	
	//initial
	//	$readmemh("riscvtest.txt",RAM);
	

  initial
  begin
		RAM[0]  = 32'h00400393; //addi
		RAM[1]  = 32'h00100e13; //addi
	 RAM[2]  = 32'h01c39463;	//	BNE
	RAM[9]  = 32'h0043f313;	 // andi
  end
  
    
	
	assign rd = RAM[a[31:2]]; // word aligned

endmodule