library IEEE;
use IEEE.std_logic_1164.ALL;

entity hitscan_top is
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
	reg_out_x  : OUT std_logic_vector(3 downto 0);
	reg_out_y  : OUT std_logic_vector(3 downto 0);
        lethaltile_x_out : OUT std_logic_vector(3 downto 0);
        lethaltile_y_out : OUT std_logic_vector(3 downto 0));
end hitscan_top;

