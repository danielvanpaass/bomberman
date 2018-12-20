configuration bomb_select_tb_behaviour_cfg of bomb_select_tb is
   for behaviour
      for all: bomb_select use configuration work.bomb_select_behaviour_cfg;
      end for;
   end for;
end bomb_select_tb_behaviour_cfg;
