library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of bombcook_tb is
   component bombcook
      port(bombinit : in  std_logic;
   	expl : in std_logic;
           playerx  : in  std_logic_vector(3 downto 0);
   	playery  : in  std_logic_vector(3 downto 0);
   	reset : in std_logic;
   	clk : in std_logic;
   	bombdisplay : out std_logic;
   	bombx : out std_logic_vector(3 downto 0);
   	bomby : out std_logic_vector(3 downto 0));
   end component;
   signal bombinit : std_logic;
   signal expl : std_logic;
   signal playerx  : std_logic_vector(3 downto 0);
   signal playery  : std_logic_vector(3 downto 0);
   signal reset : std_logic;
   signal clk : std_logic;
   signal bombdisplay : std_logic;
   signal bombx : std_logic_vector(3 downto 0);
   signal bomby : std_logic_vector(3 downto 0);

begin
test: bombcook port map (bombinit, expl, playerx, playery, reset, clk, bombdisplay, bombx, bomby);
   clk <= '1' after 0 ns,
	'0' after 10 ns when clk /= '0' else '1' after 10 ns;
   bombinit <= '0' after 0 ns,
	'1' after 25 ns,
	'0' after 40 ns,
	'1' after 265 ns,
	'0' after 285 ns;
   expl <= '0' after 0 ns,
	'1' after 150 ns,
	'0' after 250 ns;
--   playerx(0) <= '1' after 0 ns;
 --  playerx(1) <= '0' after 0 ns;
--   playerx(2) <= '1' after 0 ns;
 ---  playerx(3) <= '0' after 0 ns;
 ---  playery(0) <= '1' after 0 ns;
  -- playery(1) <= '0' after 0 ns;
 --  playery(2) <= '1' after 0 ns;
 --  playery(3) <= '0' after 0 ns;
playerx(3 downto 0) <= "0101" after 0 ns,
			"0110" after 65 ns;
playery(3 downto 0) <= "0101" after 0 ns,
			"1100" after 65 ns;
   reset <= '1' after 0 ns,
	'0' after 15 ns,
	'1' after 310 ns,
	'0' after 330 ns;
end behaviour;

