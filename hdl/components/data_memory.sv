module data_memory (
   input logic [3:0] WE,
   input logic [31:0] address,
   input logic clk,
   input logic rst,
   input logic [31:0] WD,
   output logic [31:0] RD
);
   logic [31:0] data [65535:0]
   always_ff @(posedge clk) begin
      if (rst) begin
         data <= {default:32'h0};
      end else begin
         // RISC-V Requires Byte Accessibility
      
         if (WE[0]) begin
            memory[address][7:0] <= RD[7:0];
         end
         if (WE[0]) begin
            memory[address][15:8] <= RD[15:8];
         end
         if (WE[0]) begin
            memory[address][23:16] <= RD[23:16];
         end
         if (WE[0]) begin
            memory[address][31:24] <= RD[31:24];
         end
      end
   end
endmodule