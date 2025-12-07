module register_file (
   input logic WriteEnable,
   input logic rst,
   input clk,
   input logic [31:0] WriteData,
   input logic [4:0] A1,
   input logic [4:0] A2,
   input logic [4:0] A3,
   output logic [31:0] RD1,
   output logic [31:0] RD2
);
   logic [31:0] registers [31:0];

   always_ff @(posedge clk) begin 
      if (rst) begin
         registers <= '{default: 32'h0};
         RD1 <= 32'b0;
         RD2 <= 32'b0;
      end else begin
         if(WriteEnable) begin
            registers[A3] = WriteData;
         end

         RD1 <= registers[A1];
         RD2 <= registers[A2];
      end
   end
endmodule