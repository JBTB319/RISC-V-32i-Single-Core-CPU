module sign_extender (
   input logic [31:0] instruct,
   input logic [2:0] immSrc,
   output logic [31:0] extended
);
   always_comb begin 
      case (immSrc)
        3'b000: begin // U immediate
            extended = {instruct[31:12], 12'b0};
        end
        3'b001: begin // I Immediate
            extended = {{20{instruct[31]}},instruct[31:20]};
        end
        3'b010: begin // J Type
            extended = { {11{instruct[31]}},instruct[31],instruct[19:12],instruct[20],instruct[30:21], 1'b0};
        end
        3'b011: begin // S TYPE
            extended = { {20{instruct[31]}}, instruct[31:25], instruct[11:7]} ;
        end
        3'b100: begin // B TYPE
            extended = { { 19 {instruct[20]} }, instruct[31], instruct[7], instruct[30:25], instruct[11:8], 1'b0};
        end
        default: extended = {instruct[23:4], 12'b0};
      endcase
   end
endmodule