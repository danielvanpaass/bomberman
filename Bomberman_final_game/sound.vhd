library IEEE;
use IEEE.std_logic_1164.ALL;

entity sound is
   port(clk           : in  std_logic;
	clk_60	      : in std_logic;
	reset		: in std_logic;
        victory       : in  std_logic_vector(1 downto 0);
        bomb_placed    : in  std_logic;
        bomb_exploded : in  std_logic;
        output        : out std_logic);
end sound;

