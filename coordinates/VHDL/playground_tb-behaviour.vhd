library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of playground_tb is
   component playground
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
   signal clk : std_logic;
   signal reset : std_logic;
   signal lethalx : std_logic_vector(3 downto 0);
   signal lethaly : std_logic_vector(3 downto 0);
   signal lethal : std_logic;
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
test: playground port map (clk, reset, lethalx, lethaly, lethal, y0, y1, y2, y3, y4, y5, y6, y7, y8, y9, y10);
clk <= '1' after 0 ns,
     '0' after 100 ns when clk /= '0' else '1' after 100 ns;
--   clk <= '0' after 0 ns;
   reset <= '1' after 0 ns,
	'0' after 20 ns;
   lethalx <= "0010" after 0 ns,
	"0000" after 60 ns;
   lethaly <= "0001" after 0 ns,
	"0000" after 60 ns;
   lethal <= '0' after 0 ns,
	'1' after 40 ns;
end behaviour;

