module control_unit (
   input logic [6:0] op,
   input logic [2:0] fun3,
   input logic [6:0] fun7,
   input logic zero,
   output logic PCSrc,
   output logic [2:0] ALUsel,
   output logic MemWrite,
   output logic RegWrite,
   output logic [3:0] ImmSel,
   output logic ALUSrc
);


endmodule