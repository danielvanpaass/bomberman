library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of bomb_process is

component bomb_overall is
   port(clk        : in  std_logic;
	reset	   : in  std_logic;
        bombp1     : in  std_logic;
        bombp2     : in  std_logic;
        explosion1 : out std_logic;
        explosion2 : out std_logic;
        explosion5 : out std_logic;
        explosion6 : out  std_logic;
	explosion	 : out std_logic);
end component;

component hitscan_top is
   port(x_b   : IN std_logic_vector(3 downto 0);
	Y_b   : IN std_logic_vector(3 downto 0);
        res   : IN		std_logic;
	clk   : IN  std_logic;
	explode : IN std_logic;
	X_p1  : IN  std_logic_vector(3 downto 0);
        Y_p1  : IN  std_logic_vector(3 downto 0);
        X_p2  : IN  std_logic_vector(3 downto 0);
        Y_p2  : IN  std_logic_vector(3 downto 0);
	victoryv   : OUT std_logic_vector(1 downto 0);
        lethaltile_x : OUT std_logic_vector(3 downto 0);
        lethaltile_y : OUT std_logic_vector(3 downto 0));
end component;
		
signal b_explosion : std_logic;	
begin

BOMB_TIMERS : bomb_overall port map (clk, reset, bombp1, bombp2, explosion1, explosion2, explosion5, explosion6, b_explosion);
HITSCAN : hitscan_top port map (x_b, Y_b, reset, clk, b_explosion, X_p1, Y_p1, X_p2, Y_p2, victoryv, lethaltile_x, lethaltile_y);

end behaviour;

