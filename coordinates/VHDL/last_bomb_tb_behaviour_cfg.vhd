configuration last_bomb_tb_behaviour_cfg of last_bomb_tb is
   for behaviour
      for all: last_bomb use configuration work.last_bomb_behaviour_cfg;
      end for;
   end for;
end last_bomb_tb_behaviour_cfg;
