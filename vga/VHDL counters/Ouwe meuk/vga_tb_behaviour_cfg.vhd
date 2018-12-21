configuration vga_tb_behaviour_cfg of vga_tb is
   for behaviour
      for all: vga_controller use configuration work.vga_controller_behaviour_cfg;
      end for;
   end for;
end vga_tb_behaviour_cfg;
