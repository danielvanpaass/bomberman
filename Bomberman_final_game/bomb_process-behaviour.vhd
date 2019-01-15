library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of bomb_process is

component bomb_overall is
   port(clk        : in  std_logic;
	clk_60	   : in std_logic;
	reset	   : in  std_logic;
	timer_p1 : in std_logic_vector(3 downto 0);
	timer_p2 : in std_logic_vector(3 downto 0);
	explosion  : out std_logic;
        explosion_bomb : out std_logic_vector(7 downto 0));
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
        lethaltile_x_out : OUT std_logic_vector(3 downto 0);
        lethaltile_y_out : OUT std_logic_vector(3 downto 0));
end component;

component timer_input is
   port(clk     : in  std_logic;
        clk_60  : in  std_logic;
        bombp   : in  std_logic;
	reset   : in  std_logic;
        bombout : out std_logic);
end component;



signal explosion_inbetween, bomb_in1, bomb_in2 : std_logic;
			
begin

b_explosion <= explosion_inbetween;

T1 : timer_input port map (clk, clk_60, bombp1, reset, bomb_in1);
T2 : timer_input port map (clk, clk_60, bombp2, reset, bomb_in2);

buff_p1 <= bomb_in1;
buff_p2 <= bomb_in2;
b_placed <= bomb_in1 OR bomb_in2;

BOMB_TIMERS : bomb_overall port map (clk, clk_60, reset, timer_p1, timer_p2, explosion_inbetween, explosion_bomb);
HITSCAN : hitscan_top port map (x_b, Y_b, reset, clk, explosion, X_p1, Y_p1, X_p2, Y_p2, lethal_flag, victoryv, lethaltile_x, lethaltile_y);

end behaviour;

