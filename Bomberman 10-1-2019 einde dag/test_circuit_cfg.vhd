configuration test_circuit_cfg of test is
   for circuit
      for all: bomb_process use configuration work.bomb_process_behaviour_cfg;
      end for;
      for all: hitbox_top_lvl use configuration work.hitbox_top_lvl_behaviour_cfg;
      end for;
      for all: toplvl_coor use configuration work.toplvl_coor_behaviour_cfg;
      end for;
      for all: last_bomb use configuration work.last_bomb_behaviour_cfg;
      end for;
      for all: sound use configuration work.sound_behaviour_cfg;
      end for;
      for all: vga_controller use configuration work.vga_controller_behaviour_cfg;
      end for;
      for all: sprites use configuration work.sprites_behaviour_cfg;
      end for;
   end for;
end test_circuit_cfg;
