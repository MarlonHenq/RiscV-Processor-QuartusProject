// Waveform10.vwf

module top(input  logic        clk, reset, 
           output logic [31:0] WriteData, DataAdr, 
           output logic        MemWrite,
			  output logic [31:0] Instr,
			  output logic ALUSrc
			  );

  logic [31:0] PC, ReadData;
  
  // instantiate processor and memories
  riscvsingle rvsingle(clk, reset, PC, Instr, MemWrite, DataAdr, 
                       WriteData, ReadData, ALUSrc);
					  
  imem imem(PC, Instr);
  
  dmem dmem(clk, MemWrite, DataAdr, WriteData, ReadData);
  
    
endmodule

