library IEEE;
use IEEE.std_logic_1164.ALL;

entity obstacle_map is
   port(playground : in  std_logic_vector(241 downto 0);
        obstacle   : out std_logic_vector(120 downto 0));
end obstacle_map;

