library IEEE;
use IEEE.std_logic_1164.ALL;

entity bomb_process is
   port(X_b   : in std_logic_vector(3 downto 0);
	Y_b   : IN std_logic_vector(3 downto 0);
        reset   : IN		std_logic;
	clk   : IN  std_logic;
	clk_30: IN std_logic;
	X_p1  : IN  std_logic_vector(3 downto 0);
        Y_p1  : IN  std_logic_vector(3 downto 0);
        X_p2  : IN  std_logic_vector(3 downto 0);
        Y_p2  : IN  std_logic_vector(3 downto 0);
	lethal_flag : OUT std_logic;
	victoryv   : OUT std_logic_vector(1 downto 0);
        lethaltile_x : OUT std_logic_vector(3 downto 0);
        lethaltile_y : OUT std_logic_vector(3 downto 0);
        bombp1     : IN  std_logic;
        bombp2     : IN  std_logic;
	b_explosion	 : out std_logic;
        explosion_bomb : out std_logic_vector(7 downto 0);
	buff_p1	: OUT std_logic;
	buff_p2 : OUT std_logic);
end bomb_process;

