library IEEE;
use IEEE.std_logic_1164.ALL;

entity last_bomb is
   port(clk : in  std_logic;
	reset : in std_logic;
	flag_htoa : in std_logic_vector(7 downto 0);
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
	explosion : out std_logic;
	expl_x : out std_logic_vector(3 downto 0);
	expl_y : out std_logic_vector(3 downto 0));
end last_bomb;


