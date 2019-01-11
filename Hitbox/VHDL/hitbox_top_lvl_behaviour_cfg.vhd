configuration hitbox_top_lvl_behaviour_cfg of hitbox_top_lvl is
   for behaviour
      for all: buff use configuration work.buff_behaviour_cfg;
      end for;
      for all: hitbox use configuration work.hitbox_hitbox_behaviour_cfg;
      end for;
   end for;
end hitbox_top_lvl_behaviour_cfg;
