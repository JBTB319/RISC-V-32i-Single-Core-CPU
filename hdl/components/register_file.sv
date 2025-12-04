module register_file (
   input logic WE3,
   input logic rst,
   input clk,
   input logic [32:0] WD3,
   input logic [4:0] A1,
   input logic [4:0] A2,
   input logic [4:0] A3,
   output logic [31:0] RD1,
   output logic [31:0] RD2
)
   logic [31:0] registers [32:0];

   always_ff @(posedge clock) begin 
      if (rst) begin
         registers <= {default: 32'h0}
      end else begin
         if(WE3) begin
            registers[A3] = WD3;
         end
      end
   end 
endmodule