library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of bomb_select_tb is
   component bomb_select
      port(startbomb : in  std_logic;
   	clk : in std_logic;
   	reset : in std_logic;
   	bombno : out std_logic_vector(3 downto 0));
   end component;
   signal startbomb : std_logic;
   signal clk : std_logic;
   signal reset : std_logic;
   signal bombno : std_logic_vector(3 downto 0);
begin
test: bomb_select port map (startbomb, clk, reset, bombno);
clk <= '1' after 0 ns,
     '0' after 10 ns when clk /= '0' else '1' after 10 ns;
   startbomb <= '0' after 0 ns,
		'1' after 20 ns,
		'0' after 40 ns,
		'1' after 60 ns,
		'0' after 80 ns,
		'1' after 100 ns,
		'0' after 120 ns,
		'1' after 140 ns,
		'0' after 160 ns,
		'1' after 180 ns,
		'0' after 200 ns;
   reset <= '0' after 0 ns;
end behaviour;

