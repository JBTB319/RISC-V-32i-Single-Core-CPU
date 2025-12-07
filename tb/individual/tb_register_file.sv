module tb_register_file;
   logic WriteEnable;
   logic rst;
   logic clk;
   logic [4:0] A1; // R1
   logic [4:0] A2; // R2
   logic [4:0] A3; // RD
   logic [31:0] WriteData; // Data
   logic [31:0] RD1;
   logic [31:0] RD2;

   register_file UUT (
      .WriteEnable(WriteEnable),
      .rst(rst),
      .clk(clk),
      .WriteData(WriteData),
      .A1(A1),
      .A2(A2),
      .A3(A3),
      .RD1(RD1),
      .RD2(RD2)
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
      WriteEnable = 1;

      // Set all registers to their integer value
      for(int i = 0; i < 32; i++) begin
         WriteData = i;
         A3 = i;
         #10;
      end

      WriteEnable = 0;

      for(int i = 0; i < 32; i++) begin
         A1 = i;
         #10;
         $display("%32d",RD1);
      end

      for(int i = 0; i < 32; i++) begin
         A2 = i;
         #10;
         $display("%32d",RD2);
      end

      $finish;
   end

endmodule