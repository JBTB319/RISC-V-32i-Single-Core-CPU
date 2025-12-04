module alu (
   input logic [31:0] srcA,
   input logic [31:0] srcB,
   input logic [3:0] aluSel,
   output logic [31:0] aluResult
);

always_comb begin
   case (aluSel)
      4'b0000: begin aluResult = srcA + srcB; end 
      4'b0001: begin aluResult = srcA << srcB[4:0]; end 
      4'b0010: begin aluResult = {{31{1'b0}},($signed (srcA) < $signed (srcB) ? 1 : 0)}; end 
      4'b0011: begin aluResult = srcA; end  // Useless
      4'b0100: begin aluResult = srcA ^ srcB;  end 
      4'b0101: begin aluResult = srcA >> srcB[4:0]; end 
      4'b0110: begin aluResult = srcA | srcB; end 
      4'b0111: begin aluResult = srcA & srcB; end 
      4'b1000: begin aluResult = srcA; end // Useless
      4'b1001: begin aluResult = srcA; end // Useless
      4'b1010: begin aluResult = srcA; end // Useless
      4'b1011: begin aluResult = srcA; end // Useless
      4'b1100: begin aluResult = srcA - srcB;  end 
      4'b1101: begin aluResult = srcA >>> srcB[4:0]; end 
      4'b1110: begin aluResult = srcA; end // Useless
      4'b1111: begin aluResult = srcB; end
      default: begin aluResult = srcA; end // Useless
   endcase
end

endmodule