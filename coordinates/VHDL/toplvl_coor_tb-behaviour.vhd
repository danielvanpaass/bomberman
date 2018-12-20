library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of toplvl_coor_tb is
   component toplvl_coor
      port(clk : in  std_logic;
   	reset : in std_logic;
   
           p1_x : in  std_logic_vector(3 downto 0); --player coordinates
   	p1_y : in  std_logic_vector(3 downto 0);
   	p2_x : in  std_logic_vector(3 downto 0);
   	p2_y : in  std_logic_vector(3 downto 0);
   
   	
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
   end component;
   signal clk : std_logic;
   signal reset : std_logic;
   signal p1_x : std_logic_vector(3 downto 0);
   signal p1_y : std_logic_vector(3 downto 0);
   signal p2_x : std_logic_vector(3 downto 0);
   signal p2_y : std_logic_vector(3 downto 0);
   signal p1_b : std_logic;
   signal p2_b : std_logic;
   signal expl_htoa : std_logic_vector(7 downto 0);
   signal lethaltile_x : std_logic_vector(3 downto 0);
   signal lethaltile_y : std_logic_vector(3 downto 0);
   signal lethal_flag : std_logic;
   signal bomb_a_x : std_logic_vector(3 downto 0);
   signal bomb_a_y : std_logic_vector(3 downto 0);
   signal bomb_a_cook : std_logic;
   signal bomb_b_x : std_logic_vector(3 downto 0);
   signal bomb_b_y : std_logic_vector(3 downto 0);
   signal bomb_b_cook : std_logic;
   signal bomb_c_x : std_logic_vector(3 downto 0);
   signal bomb_c_y : std_logic_vector(3 downto 0);
   signal bomb_c_cook : std_logic;
   signal bomb_d_x : std_logic_vector(3 downto 0);
   signal bomb_d_y : std_logic_vector(3 downto 0);
   signal bomb_d_cook : std_logic;
   signal bomb_e_x : std_logic_vector(3 downto 0);
   signal bomb_e_y : std_logic_vector(3 downto 0);
   signal bomb_e_cook : std_logic;
   signal bomb_f_x : std_logic_vector(3 downto 0);
   signal bomb_f_y : std_logic_vector(3 downto 0);
   signal bomb_f_cook : std_logic;
   signal bomb_g_x : std_logic_vector(3 downto 0);
   signal bomb_g_y : std_logic_vector(3 downto 0);
   signal bomb_g_cook : std_logic;
   signal bomb_h_x : std_logic_vector(3 downto 0);
   signal bomb_h_y : std_logic_vector(3 downto 0);
   signal bomb_h_cook : std_logic;
   signal bombflag_htoa : std_logic_vector(7 downto 0);
   signal obstacle_grid : std_logic_vector(120 downto 0);
   signal y0 : std_logic_vector(21 downto 0);
   signal y1 : std_logic_vector(21 downto 0);
   signal y2 : std_logic_vector(21 downto 0);
   signal y3 : std_logic_vector(21 downto 0);
   signal y4 : std_logic_vector(21 downto 0);
   signal y5 : std_logic_vector(21 downto 0);
   signal y6 : std_logic_vector(21 downto 0);
   signal y7 : std_logic_vector(21 downto 0);
   signal y8 : std_logic_vector(21 downto 0);
   signal y9 : std_logic_vector(21 downto 0);
   signal y10 : std_logic_vector(21 downto 0);
begin
test: toplvl_coor port map (clk, reset, p1_x, p1_y, p2_x, p2_y, p1_b, p2_b, expl_htoa, lethaltile_x, lethaltile_y, lethal_flag, bomb_a_x, bomb_a_y, bomb_a_cook, bomb_b_x, bomb_b_y, bomb_b_cook, bomb_c_x, bomb_c_y, bomb_c_cook, bomb_d_x, bomb_d_y, bomb_d_cook, bomb_e_x, bomb_e_y, bomb_e_cook, bomb_f_x, bomb_f_y, bomb_f_cook, bomb_g_x, bomb_g_y, bomb_g_cook, bomb_h_x, bomb_h_y, bomb_h_cook, bombflag_htoa, obstacle_grid, y0, y1, y2, y3, y4, y5, y6, y7, y8, y9, y10);
   clk <= '1' after 0 ns,
        '0' after 10 ns when clk /= '0' else '1' after 10 ns;
--   clk <= '0' after 0 ns;
   reset <= '0' after 0 ns;
   p1_x		<= "0001" after 0 ns,
	"0010" after 50 ns,
	"0011" after 100 ns,
	"0010" after 250 ns,
	"0001" after 300 ns;
   p1_y		<= "0001" after 0 ns,
	"0010" after 350 ns,
	"0011" after 400 ns;
   p2_x		<= "1001" after 0 ns,
	"1000" after 1050 ns,
	"0111" after 1100 ns,
	"1000" after 1250 ns,
	"1001" after 1300 ns;
   p2_y		<= "1001" after 0 ns,
	"1000" after 1350 ns,
	"0111" after 1400 ns;
   p1_b <= '0' after 0 ns,
	'1' after 150 ns,
	'0' after 200 ns;
   p2_b <= '0' after 0 ns,
	'1' after 1150 ns,
	'0' after 1200 ns;
   expl_htoa(0) <= '0' after 0 ns,
	'1' after 450 ns,
	'0' after 500 ns;
   expl_htoa(1) <= '0' after 0 ns;
   expl_htoa(2) <= '0' after 0 ns;
   expl_htoa(3) <= '0' after 0 ns;
   expl_htoa(4) <= '0' after 0 ns,
	'1' after 1450 ns,
	'0' after 1500 ns;
   expl_htoa(5) <= '0' after 0 ns;
   expl_htoa(6) <= '0' after 0 ns;
   expl_htoa(7) <= '0' after 0 ns;
   lethaltile_x <= "0000" after 0 ns,
	"0011" after 550 ns,
	"0001" after 650 ns,
	"0010" after 700 ns,
	"0011" after 750 ns,
	"0100" after 800 ns,
	"0101" after 850 ns,

	"0111" after 1550 ns;

   lethaltile_y <= "0000" after 0 ns,
	"0010" after 550 ns,
	"0011" after 600 ns,
	"0001" after 650 ns;
   lethal_flag <= '0' after 0 ns,
	'1' after 550 ns,
	'0' after 900 ns;
end behaviour;

