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
   // RegWrite Instructions: I, R, 
   // MemWrite Instructions: L, S


   // PCSrc       | 1 = PC + OFF_SET, 0 = PC + 4
   // ResultSrc   | 1 = MEM         , 0 = ALU Value
   // ALUSrc      | 1 = Imm         , 0 = r2
   // PCOSrc      | 1 = JALR        , 0 = JAL

   assign RegWrite = (op == 7'h13) | (op == 7'h33);
   assign ALUSrc = (op == 7'h13);                     // 1 = imm, 0 == r2
   assign MemWrite = 0;
   assign ResultSrc = 0;                              // 1 = Mem, 0 == ALU Rest
   assign RegSrc = 0;
   assign PCOSrc = 0;                                 
   assign PCSrc = 0;                                  // 1 = PC+O, 0 == PC+4

   always_comb begin
      case (op)
         4'h13: begin // I-Types
            ImmSel = 3'b000;
         end
         4'h03: begin // LD
            ImmSel = 3'b000;
         end
         4'h23: begin // S type
            ImmSel = 3'b001;
         end
         4'h63: begin // B Type
            ImmSel = 3'b010;
         end
         4'h17: begin // U Type
            ImmSel = 3'b011;
         end
         4'h37: begin // U Type
            ImmSel = 3'b011;
         end
         4'h6f: begin // J Type | JAL
            ImmSel = 3'b100;
         end
         4'h67: begin // I Type | But JALR
            ImmSel = 3'b000;
         end
         default: ImmSel = 3'b000;
      endcase
   end

   always_comb begin 
      case(fun3) 
         3'h0: begin
            if (fun7 == 7'h20) begin
               ALUSel = 4'b1100; // Sub
            end else begin
               ALUSel = 4'b0000; // Add
            end
         end
         3'h1: begin
            ALUSel = 4'b0001;
         end
         3'h2: begin
            ALUSel = 4'b0010;
         end
         3'h5: begin
            if (fun7 == 7'h20) begin
               ALUSel = 4'b0101;
            end 
            else if (fun7 == 7'h0) begin
               ALUSel = 4'b1101;
            end
         end
         3'h4: begin
            ALUSel = 4'b0100;
         end
         3'h6: begin
            ALUSel = 4'b0110;
         end
         3'h7: begin
            ALUSel = 4'b0111; // And
         end
      endcase
   end
endmodule