module program_counter (
   input logic clk,
   input logic rst,
   input logic [31:0] PCNext,
   output logic [31:0] PC
);
   always_ff @(posedge clk) begin
      if (rst) begin
         PC <= 32'h0;
      end else begin
         PC <= PCNext;
      end
   end
endmodule