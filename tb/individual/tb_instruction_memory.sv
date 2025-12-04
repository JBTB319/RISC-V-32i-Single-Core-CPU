module tb_instruction_memory;
   logic clk;
   logic rst;
   logic [31:0] address;
   logic [31:0] instruction;
   
   instruction_memory UUT (
      .clk(clk),
      .rst(rst),
      .address(address),
      .instruction(instruction)
   );

   initial begin
      clk = 0;
   end

   always  begin
      forever begin
         #5;
         clk = ~clk;      
      end
   end

   initial begin
      rst = 1;
      #10;
      rst = 0;
      address = 32'b1;
      #10;
      $display("%32h",instruction);
      $finish;
   end

   
endmodule