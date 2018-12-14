library IEEE;
use IEEE.std_logic_1164.ALL;

entity bomb_process is
   port(X_b   : in std_logic_vector(3 downto 0);
	Y_b   : IN std_logic_vector(3 downto 0);
        reset   : IN		std_logic;
	clk   : IN  std_logic;
	X_p1  : IN  std_logic_vector(3 downto 0);
        Y_p1  : IN  std_logic_vector(3 downto 0);
        X_p2  : IN  std_logic_vector(3 downto 0);
        Y_p2  : IN  std_logic_vector(3 downto 0);
	victoryv   : OUT std_logic_vector(1 downto 0);
        lethaltile_x : OUT std_logic_vector(3 downto 0);
        lethaltile_y : OUT std_logic_vector(3 downto 0);
        bombp1     : IN  std_logic;
        bombp2     : IN  std_logic;
        explosion1 : OUT std_logic;
        explosion2 : OUT std_logic;
        explosion5 : OUT std_logic;
        explosion6 : OUT  std_logic);
end bomb_process;

