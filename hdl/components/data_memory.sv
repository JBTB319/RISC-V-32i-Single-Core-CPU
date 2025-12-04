module data_memory (
   input logic WE,
   input logic [31:0] address,
   input logic clk,
   input logic rst,
   input logic [31:0] WD,
   output logic [31:0] RD
)
   logic [31:0] data [65535:0]
   always_ff @(posedge clk) begin
      if (rst)
   end
endmodule