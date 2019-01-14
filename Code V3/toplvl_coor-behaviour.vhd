library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of toplvl_coor is
--components used within toplvl_coor

--component selector is
-- port(p : in  std_logic;
--    b : in  std_logic;
--	p1 : out std_logic;
--	p2 : out std_logic);
--end component;

component playground is
   port(clk : in  std_logic;
	reset : in std_logic;
	lethalx : in std_logic_vector(3 downto 0);
	lethaly : in std_logic_vector(3 downto 0);
	lethal : in std_logic;
	y0 : out std_logic_vector(21 downto 0);
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

component bombcook is
   port(bombinit : in  std_logic;
	expl : in std_logic;
        playerx  : in  std_logic_vector(3 downto 0);
	playery  : in  std_logic_vector(3 downto 0);
	reset : in std_logic;
	clk : in std_logic;
	bombdisplay : out std_logic;
	bombx : out std_logic_vector(3 downto 0);
	bomby : out std_logic_vector(3 downto 0);
	expl_flag : out std_logic);
end component;

component bomb_select is
   port(startbomb : in  std_logic;
	clk : in std_logic;
	reset : in std_logic;
	bombno : out std_logic_vector(3 downto 0)
	);
end component;

component obstacle_map is
   port(playground : in  std_logic_vector(241 downto 0);
        obstacle   : out std_logic_vector(120 downto 0));
end component;

-- signal p1b, p2b: std_logic;
signal bombnop1, bombnop2: std_logic_vector(3 downto 0);
signal y0i, y1i, y2i, y3i, y4i, y5i, y6i, y7i, y8i, y9i, y10i: std_logic_vector(21 downto 0);
signal renderedmap: std_logic_vector(241 downto 0);

begin

-- BOMB MECHANICS
-- pbomb: selector port map(p_bomb, p_bombplant, p1b, p2b); --select bomb to initialize for specific player

timer_p1 <= bombnop1;
timer_p2 <= bombnop2;


bombselp1: bomb_select port map(p1_b, clk, reset, bombnop1); --select bomb to initialize (max 4 per player, 1 per player at the moment)

bombcooka: bombcook port map(bombnop1(0), expl_htoa(0), p1_x, p1_y, reset, clk, bomb_a_cook, bomb_a_x, bomb_a_y, bombflag_htoa(0)); --bombs a to d for player 1
bombcookb: bombcook port map(bombnop1(1), expl_htoa(1), p1_x, p1_y, reset, clk, bomb_b_cook, bomb_b_x, bomb_b_y, bombflag_htoa(1));
bombcookc: bombcook port map(bombnop1(2), expl_htoa(2), p1_x, p1_y, reset, clk, bomb_c_cook, bomb_c_x, bomb_c_y, bombflag_htoa(2));
bombcookd: bombcook port map(bombnop1(3), expl_htoa(3), p1_x, p1_y, reset, clk, bomb_d_cook, bomb_d_x, bomb_d_y, bombflag_htoa(3));

bombselp2: bomb_select port map(p2_b, clk, reset, bombnop2);

bombcooke: bombcook port map(bombnop2(0), expl_htoa(4), p2_x, p2_y, reset, clk, bomb_e_cook, bomb_e_x, bomb_e_y, bombflag_htoa(4)); --bombs e to h for player 2
bombcookf: bombcook port map(bombnop2(1), expl_htoa(5), p2_x, p2_y, reset, clk, bomb_f_cook, bomb_f_x, bomb_f_y, bombflag_htoa(5));
bombcookg: bombcook port map(bombnop2(2), expl_htoa(6), p2_x, p2_y, reset, clk, bomb_g_cook, bomb_g_x, bomb_g_y, bombflag_htoa(6));
bombcookh: bombcook port map(bombnop2(3), expl_htoa(7), p2_x, p2_y, reset, clk, bomb_h_cook, bomb_h_x, bomb_h_y, bombflag_htoa(7));

--MAP MECHANICS
mapmech: playground port map(clk, reset, lethaltile_x, lethaltile_y, lethal_flag, y0i, y1i, y2i, y3i, y4i, y5i, y6i, y7i, y8i, y9i, y10i);
lblrenderedmap: renderedmap <= y0i & y1i & y2i & y3i & y4i & y5i & y6i & y7i & y8i & y9i & y10i;
lblmaptoVGA: maptoVGA <= renderedmap;
-- row0: y0 <= y0i;
-- row1: y1 <= y1i;
-- row2: y2 <= y2i;
-- row3: y3 <= y3i;
-- row4: y4 <= y4i;
-- row5: y5 <= y5i;
-- row6: y6 <= y6i;
-- row7: y7 <= y7i;
-- row8: y8 <= y8i;
-- row9: y9 <= y9i;
-- row10: y10 <= y10i;

--OBSTACLE GRID RENDERING
lblobst: obstacle_map port map(renderedmap, obstacle_grid);

end behaviour;

