library IEEE;
use IEEE.std_logic_1164.ALL;

entity hitscan is
   port(X_b   : IN std_logic_vector(3 downto 0);
	Y_b   : IN std_logic_vector(3 downto 0);
        res   : IN		std_logic;
	clk   : IN  std_logic;
	explode : IN std_logic;
	FF2_read : IN std_logic;
	X_p1  : IN  std_logic_vector(3 downto 0);
        Y_p1  : IN  std_logic_vector(3 downto 0);
        X_p2  : IN  std_logic_vector(3 downto 0);
        Y_p2  : IN  std_logic_vector(3 downto 0);
	victoryv   : OUT std_logic_vector(1 downto 0);
	read  : OUT std_logic;
	FF2_reset : OUT std_logic;
        lethaltile_x : OUT std_logic_vector(3 downto 0);
        lethaltile_y : OUT std_logic_vector(3 downto 0));
end hitscan;
