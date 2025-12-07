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

   initial begin
      rst = 1;
      $display("%32d",DUT.pc.PC);
      #10;
      rst = 0;
      #10;
      $display("%32d",DUT.pc.PC);
   end

endmodule