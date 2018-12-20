library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of xy_convert_tb is
   component xy_convert
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
   signal x_in : std_logic_vector(3 downto 0);
   signal y_in : std_logic_vector(3 downto 0);
   signal x0 : std_logic;
   signal x1 : std_logic;
   signal x2 : std_logic;
   signal x3 : std_logic;
   signal x4 : std_logic;
   signal x5 : std_logic;
   signal x6 : std_logic;
   signal x7 : std_logic;
   signal x8 : std_logic;
   signal x9 : std_logic;
   signal x10 : std_logic;
   signal y0 : std_logic;
   signal y1 : std_logic;
   signal y2 : std_logic;
   signal y3 : std_logic;
   signal y4 : std_logic;
   signal y5 : std_logic;
   signal y6 : std_logic;
   signal y7 : std_logic;
   signal y8 : std_logic;
   signal y9 : std_logic;
   signal y10 : std_logic;
begin
test: xy_convert port map (x_in, y_in, x0, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, y0, y1, y2, y3, y4, y5, y6, y7, y8, y9, y10);
-- clk <= '1' after 0 ns,
--      '0' after 100 ns when clk /= '0' else '1' after 100 ns;
   x_in <= "0000" after 0 ns, --x0
		"0111" after 10 ns, --x7
		"0010" after 20 ns; --x2
   y_in <= "1001" after 0 ns, --y9
		"0000" after 10 ns, --y0
		"0110" after 20 ns; --y6
end behaviour;

