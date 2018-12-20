library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of selector_tb is
   component selector
      port(p : in  std_logic;
           b : in  std_logic;
   	p1 : out std_logic;
   	p2 : out std_logic);
   end component;
   signal p : std_logic;
   signal b : std_logic;
   signal p1 : std_logic;
   signal p2 : std_logic;
begin
test: selector port map (p, b, p1, p2);
-- clk <= '1' after 0 ns,
--      '0' after 100 ns when clk /= '0' else '1' after 100 ns;
   p <= '0' after 0 ns,
	'1' after 20 ns,
	'0' after 40 ns;

   b <= '0' after 0 ns,
	'1' after 20 ns,
	'0' after 25 ns,
	'1' after 40 ns;
end behaviour;

