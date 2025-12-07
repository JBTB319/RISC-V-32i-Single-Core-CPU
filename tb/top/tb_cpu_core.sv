module tb_cpu_core;
   logic clk;
   logic rst;

   cpu_core DUT (
      .clk(clk),
      .rst(rst)
   );

   initial begin
      clk = 0;
   end

   always begin
      forever begin
         #5 clk = ~clk;
      end
   end

   int i;

   initial begin
      rst = 1;
      #10;
      rst = 0;
      #10;

      for (i = 0; i < 11; i++) begin
         $display("--------- Control Values --------");
         $display("MemWrite=%b", DUT.MemWrite);
         $display("RegWrite=%b", DUT.RegWrite);
         $display("ResultSrc=%b", DUT.ResultSrc);
         $display("RegSrc=%b", DUT.RegSrc);
         $display("PCSrc=%b", DUT.PCSrc);
         $display("PCOSrc=%b", DUT.PCOSrc);
         $display("ALUSrc=%b", DUT.ALUSrc);
         $display("---------  Instruction Data --------");
         $display("PC=\t\t%8d",DUT.pc.PC);
         $display("INSTRUCTION=\t%8h",DUT.instruction);
         $display("EXTENDED=\t%8d",DUT.extended);
         $display("REG 1=\t\t%8d", DUT.reg_file.A1);
         $display("REG 2=\t\t%8d", DUT.reg_file.A2);
         $display("REG D=\t\t%8d",DUT.reg_file.A3);
         $display("REG 1D=\t\t%8d", DUT.reg_file.registers[DUT.reg_file.A1]);
         $display("REG 2D=\t\t%8d", DUT.reg_file.registers[DUT.reg_file.A2]);
         $display("REG DD=\t\t%8d",DUT.reg_file.registers[DUT.reg_file.A3]);
         $display("REG DEST=\t%8d", DUT.RegData);
         $display("ALU_RES=\t%8d", DUT.aluResult);
         $display("REG_DATA=\t%8d", DUT.RegData);
         #10;
      end

      for(int i = 0; i < 11; i++) begin
         $display("%8h",DUT.reg_file.registers[i]);
      end

      $finish;
   end

endmodule