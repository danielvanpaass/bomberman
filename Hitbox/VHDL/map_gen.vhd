library IEEE;
use IEEE.std_logic_1164.ALL;

entity map_gen is
   port(crates	 	: out std_logic_vector(120 downto 0);
	walls 		: out std_logic_vector(120 downto 0));
end map_gen;


