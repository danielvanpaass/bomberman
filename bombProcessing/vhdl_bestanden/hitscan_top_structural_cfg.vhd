configuration hitscan_top_structural_cfg of hitscan_top is
   for structural
      for all: ff2 use configuration work.ff2_behaviour_cfg;
      end for;
      for all: hitscan use configuration work.hitscan_behaviour_cfg;
      end for;
   end for;
end hitscan_top_structural_cfg;
