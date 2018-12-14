configuration toplvl_coor_behaviour_cfg of toplvl_coor is
   for behaviour
      for all: selector use configuration work.selector_behaviour_cfg;
      end for;
      for all: bomb_select use configuration work.bomb_select_behaviour_cfg;
      end for;
      for all: bombcook use configuration work.bombcook_behaviour_cfg;
      end for;
      for all: playground use configuration work.playground_behaviour_cfg;
      end for;
      for all: obstacle_map use configuration work.obstacle_map_behaviour_cfg;
      end for;
   end for;
end toplvl_coor_behaviour_cfg;
