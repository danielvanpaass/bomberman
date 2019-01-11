library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of bomb_process is

component bomb_overall is
   port(clk        : in  std_logic;
	clk_30	   : in std_logic;
	reset	   : in  std_logic;
        bombp1     : in  std_logic;
        bombp2     : in  std_logic;
	explosion  : out std_logic;
	b_placed   : out std_logic;
        explosion_bomb : out std_logic_vector(7 downto 0);
	buff_p1	 : out std_logic;
	buff_p2  : out std_logic);
end component;

component hitscan_top is
   port(X_b   : IN std_logic_vector(3 downto 0);
	Y_b   : IN std_logic_vector(3 downto 0);
        res   : IN		std_logic;
	clk   : IN  std_logic;
	explode : IN std_logic;
	X_p1  : IN  std_logic_vector(3 downto 0);
        Y_p1  : IN  std_logic_vector(3 downto 0);
        X_p2  : IN  std_logic_vector(3 downto 0);
        Y_p2  : IN  std_logic_vector(3 downto 0);
	lethal_flag : OUT std_logic;
	victoryv   : OUT std_logic_vector(1 downto 0);
        lethaltile_x : OUT std_logic_vector(3 downto 0);
        lethaltile_y : OUT std_logic_vector(3 downto 0));
end component;

signal explosion_inbetween : std_logic;
			
begin

b_explosion <= explosion_inbetween;
BOMB_TIMERS : bomb_overall port map (clk, clk_30, reset, bombp1, bombp2, b_placed, explosion_inbetween, explosion_bomb, buff_p1, buff_p2);
HITSCAN : hitscan_top port map (x_b, Y_b, reset, clk, explosion_inbetween, X_p1, Y_p1, X_p2, Y_p2, lethal_flag, victoryv, lethaltile_x, lethaltile_y);

end behaviour;

