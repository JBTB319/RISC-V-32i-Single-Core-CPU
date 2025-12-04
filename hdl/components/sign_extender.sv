module sign_extender (
   input logic [31:0] instruct,
   input logic [2:0] immSrc,
   output logic [31:0] extended
);
   always_comb begin 
      case (immSrc)
        2'b000: begin // U immediate
            output = {instruct[31:12], 12'b0};
        end
        2'b001: begin // I Immediate
            output = {{20{instruct[31]}},instruct[30:19]};
        end
        2'b010: begin // J Type
            output = { {11{instruct[31]}},instruct[31],instruct[19:12],instruct[20],instruct[30:21], 0};
        end
        2'b011: begin // S TYPE
            output = { {20{instruct[31]}}, instruct[31:25], instruct[11:7]} ;
        end
        2'b100: begin // B TYPE
            output = { { 19 {instruct[20]} }, instruct[31], instruct[7], instruct[30:25], instruct[11:8], 0}
        end
        default: output = {instruct[23:4], 12'b0};
      endcase
   end
endmodule