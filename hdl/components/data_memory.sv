module data_memory (
   input logic [3:0] WriteEnable,
   input logic [31:0] address,
   input logic clk,
   input logic rst,
   input logic [31:0] WD,
   output logic [31:0] RD
);

   logic [31:0] data [65535:0];

   initial begin
      $readmemh("tb/test_data/storage.hex", data);
   end

   always_ff @(posedge clk) begin
      if (rst) begin
         RD <= 32'h0;
      end else begin
         // RISC-V Requires Byte Accessibility
         if (WriteEnable[0]) begin
            data[address][7:0] <= WD[7:0];
         end
         if (WriteEnable[0]) begin
            data[address][15:8] <= WD[15:8];
         end
         if (WriteEnable[0]) begin
            data[address][23:16] <= WD[23:16];
         end
         if (WriteEnable[0]) begin
            data[address][31:24] <= WD[31:24];
         end

         RD <= data[address];
      end
   end
endmodule