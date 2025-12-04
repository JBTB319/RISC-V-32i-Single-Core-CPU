module cpu_core (
   input clk
);

   alu alu_component;
   data_memory data_mem;
   instruction_memory in_mem;
   register_file reg_file;
   sign_extender sign_extend;
   program_counter pc;

endmodule