module tb_program_counter;
   logic clk;
   logic rst;
   logic [31:0] next;
   logic [31:0] out;

   program_counter pc (
      .clk(clk),
      .rst(rst),
      .PCNext(next),
      .PC(out)
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
      next = 32'b0;
      #10;
      $display("%32b",out);
      rst = 0;
      
      for (i = 0; i < 32; i++) begin
         next = next + 4'b1000;
         #10;
         $display("%32b",out);
      end
   
      $finish;
   end

endmodule