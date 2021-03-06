library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of tile_stdempty_tb is
   component tile_stdempty
      port(xlethal : in  std_logic;
   	ylethal : in std_logic;
   	expl : in std_logic;
   	clk : in std_logic;
   	reset : in std_logic;
   	tiletype : out std_logic_vector(1 downto 0));
   end component;
   signal xlethal : std_logic;
   signal ylethal : std_logic;
   signal expl : std_logic;
   signal clk : std_logic;
   signal reset : std_logic;
   signal tiletype : std_logic_vector(1 downto 0);
begin
test: tile_stdempty port map (xlethal, ylethal, expl, clk, reset, tiletype);
   clk <= '1' after 0 ns,
          '0' after 10 ns when clk /= '0' else '1' after 10 ns;
   xlethal <= '0' after 0 ns,
'1' after 70 ns,
	'0' after 90 ns;
   ylethal <= '0' after 0 ns,
'1' after 70 ns,
	'0' after 90 ns;
   expl <= '0' after 0 ns,
'1' after 70 ns,
	'0' after 150 ns;
--   clk <= '0' after 0 ns;
   reset <= '0' after 0 ns,
	'1' after 5 ns,
	'0' after 25 ns;
end behaviour;

