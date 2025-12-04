module sign_extender (
   input logic [23:0] extend,
   input logic [2:0] immSrc,
   output logic [31:0] extended
);
   always_comb begin 
      case (immSrc)
        2'b00: begin
            output = {extend[23:4], 12'b0};
        end
        2'b01: begin
            output = {{20{extend[23]}},extend[22:11]};
        end
        default: output = {extend[23:4], 12'b0};
      endcase
   end
endmodule