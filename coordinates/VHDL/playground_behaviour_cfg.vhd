configuration playground_behaviour_cfg of playground is
   for behaviour
      for all: xy_convert use configuration work.xy_convert_behaviour_cfg;
      end for;
      for all: tile_stdempty use configuration work.tile_stdempty_behaviour_cfg;
      end for;
      for all: tile_stdcrate use configuration work.tile_stdcrate_behaviour_cfg;
      end for;
   end for;
end playground_behaviour_cfg;
