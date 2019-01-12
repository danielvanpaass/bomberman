library IEEE;
use IEEE.std_logic_1164.ALL;

entity tile_stdcrate is
   port(xlethal : in  std_logic;
	ylethal : in std_logic;
	expl : in std_logic;
	clk : in std_logic;
	reset : in std_logic;
	tiletype : out std_logic_vector(1 downto 0));
end tile_stdcrate;

