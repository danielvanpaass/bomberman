library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of bomb_process is

component bomb_overall is
   port(clk        : in  std_logic;
	clk_30	   : in std_logic;
	reset	   : in  std_logic;
        bombp1     : in  std_logic;
        bombp2     : in  std_logic;
	timer_p1 : in std_logic_vector(3 downto 0);
	timer_p2 : in std_logic_vector(3 downto 0);
	reg_x	 : in std_logic_vector(3 downto 0);
	reg_y	 : in std_logic_vector(3 downto 0);
	lethal_flag : in std_logic;
	explosion  : out std_logic;
	b_placed   : out std_logic;
        explosion_bomb : out std_logic_vector(7 downto 0);
        fin_explosion_bomb : out std_logic_vector(7 downto 0);
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
	bomb_a_x : in std_logic_vector(3 downto 0);
	bomb_a_y : in std_logic_vector(3 downto 0);
	bomb_b_x : in std_logic_vector(3 downto 0);
	bomb_b_y : in std_logic_vector(3 downto 0);
	bomb_c_x : in std_logic_vector(3 downto 0);
	bomb_c_y : in std_logic_vector(3 downto 0);
	bomb_d_x : in std_logic_vector(3 downto 0);
	bomb_d_y : in std_logic_vector(3 downto 0);
	bomb_e_x : in std_logic_vector(3 downto 0);
	bomb_e_y : in std_logic_vector(3 downto 0);
	bomb_f_x : in std_logic_vector(3 downto 0);
	bomb_f_y : in std_logic_vector(3 downto 0);
	bomb_g_x : in std_logic_vector(3 downto 0);
	bomb_g_y : in std_logic_vector(3 downto 0);
	bomb_h_x : in std_logic_vector(3 downto 0);
	bomb_h_y : in std_logic_vector(3 downto 0);
	explosion : IN std_logic_vector(7 downto 0);
	fin_explosion : IN std_logic_vector(7 downto 0);
	lethal_flag : OUT std_logic;
	victoryv   : OUT std_logic_vector(1 downto 0);
	reg_out_x  : OUT std_logic_vector (3 downto 0);
	reg_out_y  : OUT std_logic_vector (3 downto 0);
        lethaltile_x_out : OUT std_logic_vector(3 downto 0);
        lethaltile_y_out : OUT std_logic_vector(3 downto 0));
end component;

signal explosion_inbetween, lethal_flag_buff : std_logic;
signal explosion_buff, fin_explosion_buff : std_logic_vector(7 downto 0);
signal reg_x_buff, reg_y_buff : std_logic_vector(3 downto 0);
			
begin
lethal_flag <= lethal_flag_buff;
b_explosion <= explosion_inbetween;
explosion_bomb <= explosion_buff;
BOMB_TIMERS : bomb_overall port map (clk, clk_30, reset, bombp1, bombp2, timer_p1, timer_p2, reg_x_buff, reg_y_buff, lethal_flag_buff, explosion_inbetween, b_placed, explosion_buff, fin_explosion_buff, buff_p1, buff_p2);
HITSCAN : hitscan_top port map (x_b, Y_b, reset, clk, explosion, X_p1, Y_p1, X_p2, Y_p2, bomb_a_x, bomb_a_y, bomb_b_x, bomb_b_y, bomb_c_x, bomb_c_y, bomb_d_x, bomb_d_y, bomb_e_x, bomb_e_y, bomb_f_x, bomb_f_y, bomb_g_x, bomb_g_y, bomb_h_x, bomb_h_y, explosion_buff, fin_explosion_buff, lethal_flag_buff, victoryv, reg_x_buff, reg_y_buff, lethaltile_x, lethaltile_y);

end behaviour;

