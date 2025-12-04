module instruction_memory (
   input logic clk,
   input logic rst,
   input logic [31:0] address,
   output logic [31:0] instruction
);

   logic [31:0] memory [65535:0];

   always_ff @(posedge clk) begin
      if (rst) begin
         memory <= {default: 32'h0};
      end else begin
         instruction <= memory[address];
      end
   end
endmodule