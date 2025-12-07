module tb_data_memory;
   logic [3:0] WriteEnable;
   logic [31:0] address;
   logic clk;
   logic rst;
   logic [31:0] WD;
   logic [31:0] RD;

   data_memory UUT (
      .WriteEnable(WriteEnable),
      .address(address),
      .clk(clk),
      .rst(rst),
      .WD(WD),
      .RD(RD)
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
      WriteEnable = 4'b0;
      rst = 1;
      #10;
      rst = 0;
      #10;

      for(i = 0; i < 5; i++) begin
         address = i;
         #10;
         $display("%32h", RD);
      end

      $finish;
   end

endmodule