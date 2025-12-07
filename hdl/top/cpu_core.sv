module cpu_core (
   input logic rst,
   input logic clk
);
   /*  Control Unit Varibales   */
   logic MemWrite;
   logic RegWrite;
   // Multiplexor Selectors
   logic ResultSrc;
   logic RegSrc;
   logic PCSrc;
   logic PCOSrc;
   logic ALUSrc;
   // Data Selectors
   logic [3:0] ALUSel;
   logic [2:0] ImmSel;
   logic [31:0] extended;

   // Data
   logic [31:0] PC;
   logic [31:0] instruction;
   logic [31:0] RD1;
   logic [31:0] RD2;
   logic [31:0] memOut;
   logic [31:0] aluResult;

   logic PC_4 = PC + 32'd4;
   logic PC_OFF = PC + extended;

   logic [3:0] DataWriteEnable = MemWrite ? 4'b1111 : 4'b0000;
   logic [31:0] Result = ResultSrc ? memOut : aluResult;
   logic [31:0] RegData = RegSrc ? PC_4 : Result;
   logic [31:0] PCOffData = PCOSrc ? PC_OFF : PC_OFF;
   logic [31:0] PCNext = PCSrc ? PCOffData : PC_4;
   logic [31:0] srcB = (ALUSrc) ? extended : RD2;


   program_counter pc (
      .clk(clk),
      .rst(rst),
      .PCNext(PCNext),
      .PC(PC)
   );

   instruction_memory in_mem (
      .rst(rst),
      .clk(clk),
      .address(PC),
      .instruction(instruction)
   );

   control_unit unit (
      .op(instruction[6:0]),
      .fun3(instruction[14:12]),
      .fun7(instruction[31:25]),
      .MemWrite(MemWrite),
      .RegWrite(RegWrite),
      .ResultSrc(ResultSrc),
      .RegSrc(RegSrc),
      .PCSrc(PCSrc),
      .PCOSrc(PCOSrc),
      .ALUSrc(ALUSrc),
      .ALUSel(ALUSel),
      .ImmSel(ImmSel)
   );

   register_file reg_file (
      .WriteEnable(RegWrite),
      .rst(rst),
      .clk(clk),
      .WriteData(RegData),
      .A1(instruction[19:15]),
      .A2(instruction[24:20]),
      .A3(instruction[11:7]),
      .RD1(RD1),
      .RD2(RD2)
   );

   sign_extender sign_extend (
      .instruct(instruction),
      .immSrc(ImmSel),
      .extended(extended)
   );
   
   alu alu_component (
      .srcA(RD1),
      .srcB(srcB),
      .aluSel(ALUSel),
      .aluResult(aluResult)
   );

   data_memory data_mem(
      .WriteEnable(DataWriteEnable),
      .address(aluResult),
      .clk(clk),
      .rst(rst),
      .WD(RD2),
      .RD(memOut)
   );
endmodule