configuration obstacle_map_tb_behaviour_cfg of obstacle_map_tb is
   for behaviour
      for all: obstacle_map use configuration work.obstacle_map_behaviour_cfg;
      end for;
   end for;
end obstacle_map_tb_behaviour_cfg;
