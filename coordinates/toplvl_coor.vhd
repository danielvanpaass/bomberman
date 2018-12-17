library IEEE;
use IEEE.std_logic_1164.ALL;

entity toplvl_coor is
   port(clk : in  std_logic;
	reset : in std_logic;

        p1_x : in  std_logic_vector(3 downto 0); --player coordinates
	p1_y : in  std_logic_vector(3 downto 0);
	p2_x : in  std_logic_vector(3 downto 0);
	p2_y : in  std_logic_vector(3 downto 0);

--	p_bomb : in std_logic; --bomb planting commands
--	p_bombplant : in std_logic;
	
	p1_b : in std_logic;
	p2_b : in std_logic;
	expl_htoa : in std_logic_vector(7 downto 0);

	lethaltile_x : in  std_logic_vector(3 downto 0); --explosive tiles
	lethaltile_y : in  std_logic_vector(3 downto 0);
	lethal_flag : in std_logic;

	bomb_a_x : out std_logic_vector(3 downto 0); --8 bomb outputs, 4 per player
	bomb_a_y : out std_logic_vector(3 downto 0);
	bomb_a_cook : out std_logic;
	bomb_b_x : out std_logic_vector(3 downto 0);
	bomb_b_y : out std_logic_vector(3 downto 0);
	bomb_b_cook : out std_logic;
	bomb_c_x : out std_logic_vector(3 downto 0);
	bomb_c_y : out std_logic_vector(3 downto 0);
	bomb_c_cook : out std_logic;
	bomb_d_x : out std_logic_vector(3 downto 0);
	bomb_d_y : out std_logic_vector(3 downto 0);
	bomb_d_cook : out std_logic;
	bomb_e_x : out std_logic_vector(3 downto 0);
	bomb_e_y : out std_logic_vector(3 downto 0);
	bomb_e_cook : out std_logic;
	bomb_f_x : out std_logic_vector(3 downto 0);
	bomb_f_y : out std_logic_vector(3 downto 0);
	bomb_f_cook : out std_logic;
	bomb_g_x : out std_logic_vector(3 downto 0);
	bomb_g_y : out std_logic_vector(3 downto 0);
	bomb_g_cook : out std_logic;
	bomb_h_x : out std_logic_vector(3 downto 0);
	bomb_h_y : out std_logic_vector(3 downto 0);
	bomb_h_cook : out std_logic;

	bombflag_htoa : out std_logic_vector(7 downto 0);
--	maptoVGA : out std_logic_vector(241 downto 0);
	obstacle_grid : out std_logic_vector(120 downto 0);

	y0 : out std_logic_vector(21 downto 0); --output array, 2 bits per tile, 11 tiles per row, 11 rows
	y1 : out std_logic_vector(21 downto 0);
	y2 : out std_logic_vector(21 downto 0);
	y3 : out std_logic_vector(21 downto 0);
	y4 : out std_logic_vector(21 downto 0);
	y5 : out std_logic_vector(21 downto 0);
	y6 : out std_logic_vector(21 downto 0);
	y7 : out std_logic_vector(21 downto 0);
	y8 : out std_logic_vector(21 downto 0);
	y9 : out std_logic_vector(21 downto 0);
	y10 : out std_logic_vector(21 downto 0));
end toplvl_coor;

