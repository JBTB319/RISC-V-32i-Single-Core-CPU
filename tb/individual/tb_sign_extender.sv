module tb_sign_extender;
   logic [31:0] instruct;
   logic [2:0] immSrc;
   logic [31:0] extended;

   // Instruction Types
   // U : LUI 
   // I : ADDI 1000
   // J : JAL 
   // S : SW
   // B : BR
   /* 
   h003e80b7 LUI
   h3e810093 ADDI
   h3e80006f JAL
   h3e112423 SW
   h00209663 BNE
   */

   sign_extender UUT (
      .instruct(instruct),
      .immSrc(immSrc),
      .extended(extended)
   );

   initial begin
      instruct = 32'h003e80b7; // Works
      immSrc = 3'd0;
      #1;
      $display("%32d LUI",extended);

      instruct = 32'h3e810093;
      immSrc = 3'd1;
      #1;
      $display("%32d ADD",extended); // Works
      
      instruct = 32'h3e80006f; // JAL x1 1000
      immSrc = 3'd2;
      #1;
      $display("%32d JAL",extended);

      instruct = 32'h3e112423;
      immSrc = 3'd3;
      #1;
      $display("%32d SW",extended);

      instruct = 32'h00209663;
      immSrc = 3'd4;
      #1;
      $display("%32d BNE",extended);
      $display("%32b BNE",extended);
      
   end
endmodule