library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of playground is

component tile_stdempty is
   port(xlethal : in  std_logic;
	ylethal : in std_logic;
	expl : in std_logic;
	clk : in std_logic;
	reset : in std_logic;
	tiletype : out std_logic_vector(1 downto 0));
end component;

component tile_stdcrate is
   port(xlethal : in  std_logic;
	ylethal : in std_logic;
	expl : in std_logic;
	clk : in std_logic;
	reset : in std_logic;
	tiletype : out std_logic_vector(1 downto 0));
end component;

component xy_convert is
   port(x_in : in  std_logic_vector(3 downto 0);
	y_in : in  std_logic_vector(3 downto 0);
	x0 : out std_logic;
	x1 : out std_logic;
	x2 : out std_logic;
	x3 : out std_logic;
	x4 : out std_logic;
	x5 : out std_logic;
	x6 : out std_logic;
	x7 : out std_logic;
	x8 : out std_logic;
	x9 : out std_logic;
	x10 : out std_logic;
	y0 : out std_logic;
	y1 : out std_logic;
	y2 : out std_logic;
	y3 : out std_logic;
	y4 : out std_logic;
	y5 : out std_logic;
	y6 : out std_logic;
	y7 : out std_logic;
	y8 : out std_logic;
	y9 : out std_logic;
	y10 : out std_logic);
end component;

signal xo0, xo1, xo2, xo3, xo4, xo5, xo6, xo7, xo8, xo9, xo10, yo0, yo1, yo2, yo3, yo4, yo5, yo6, yo7, yo8, yo9, yo10: std_logic;

begin
--xy conversion to call seperate fsms
xyconv: xy_convert port map(lethalx, lethaly, xo0, xo1, xo2, xo3, xo4, xo5, xo6, xo7, xo8, xo9, xo10, yo0, yo1, yo2, yo3, yo4, yo5, yo6, yo7, yo8, yo9, yo10);

--t1 to t11, for y1, "0000000000000000000000", all walls
t1to11: y0 <= "1111111111111111111111";

--t12 to t22, t12 and t22 being "00" (walls)
y1(21) <= '1'; --t12
y1(20) <= '1';
t13: tile_stdempty port map(xo1, yo1, lethal, clk, reset => reset, tiletype(1) => y1(19), tiletype(0) => y1(18));
t14: tile_stdempty port map(xo2, yo1, lethal, clk, reset => reset, tiletype(1) => y1(17), tiletype(0) => y1(16));
t15: tile_stdempty port map(xo3, yo1, lethal, clk, reset => reset, tiletype(1) => y1(15), tiletype(0) => y1(14));
t16: tile_stdcrate port map(xo4, yo1, lethal, clk, reset => reset, tiletype(1) => y1(13), tiletype(0) => y1(12));
t17: tile_stdcrate port map(xo5, yo1, lethal, clk, reset => reset, tiletype(1) => y1(11), tiletype(0) => y1(10));
t18: tile_stdcrate port map(xo6, yo1, lethal, clk, reset => reset, tiletype(1) => y1(9), tiletype(0) => y1(8));
t19: tile_stdempty port map(xo7, yo1, lethal, clk, reset => reset, tiletype(1) => y1(7), tiletype(0) => y1(6));
t20: tile_stdempty port map(xo8, yo1, lethal, clk, reset => reset, tiletype(1) => y1(5), tiletype(0) => y1(4));
t21: tile_stdempty port map(xo9, yo1, lethal, clk, reset => reset, tiletype(1) => y1(3), tiletype(0) => y1(2));
y1(1) <= '1'; --t22
y1(0) <= '1';

--t23 to t33, t23 and t33 being "00" (walls)
y2(21) <= '1'; --t23
y2(20) <= '1';
t24: tile_stdempty port map(xo1, yo2, lethal, clk, reset => reset, tiletype(1) => y2(19), tiletype(0) => y2(18));
y2(17) <= '1'; --wall
y3(16) <= '1'; --wall
t26: tile_stdcrate port map(xo3, yo2, lethal, clk, reset => reset, tiletype(1) => y2(15), tiletype(0) => y2(14));
y2(13) <= '1'; --wall
y2(12) <= '1'; --wall
t28: tile_stdcrate port map(xo5, yo2, lethal, clk, reset => reset, tiletype(1) => y2(11), tiletype(0) => y2(10));
y2(9) <= '1'; --wall
y2(8) <= '1'; --wall
t30: tile_stdcrate port map(xo7, yo2, lethal, clk, reset => reset, tiletype(1) => y2(7), tiletype(0) => y2(6));
y2(5) <= '1'; --wall
y2(4) <= '1'; --wall
t32: tile_stdempty port map(xo9, yo2, lethal, clk, reset => reset, tiletype(1) => y2(3), tiletype(0) => y2(2));
y2(1) <= '1'; --t33
y2(0) <= '1';

end behaviour;

