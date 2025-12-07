module control_unit (
   input logic [6:0] op,
   input logic [2:0] fun3,
   input logic [6:0] fun7,
   input logic zero,
   // Write Enablers
   output logic MemWrite,
   output logic RegWrite,
   // Multiplexor Selectors
   output logic ResultSrc,
   output logic RegSrc,
   output logic PCSrc,
   output logic PCOSrc,
   output logic ALUSrc,
   // Data Selectors
   output logic [3:0] ALUSel,
   output logic [2:0] ImmSel
);
   assign RegWrite = 1;
   assign ALUSrc = 1;
   assign MemWrite = 0;
   assign ResultSrc = 0;
   assign RegSrc = 0;
   assign PCOSrc = 0;
   assign PCSrc = 0;
   assign ImmSel = 3'b000;

   always_comb begin 
      case(fun3) 
         3'b000: begin
            ALUSel = 4'b0000;
         end
         3'b001: begin
            ALUSel = 4'b0001;
         end
         3'b101: begin
            if (fun7 == 7'h20) begin
               ALUSel = 4'b0101;
            end 
            else if (fun7 == 7'h0) begin
               ALUSel = 4'b1101;
            end
         end
      endcase
   end
endmodule