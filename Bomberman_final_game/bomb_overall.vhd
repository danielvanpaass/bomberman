library IEEE;
use IEEE.std_logic_1164.ALL;

entity bomb_overall is
   port(clk        : in  std_logic;
	clk_30	   : in  std_logic;
	reset	   : in  std_logic;
        bombp1     : in  std_logic;
        bombp2     : in  std_logic;
	timer_p1	: in std_logic_vector(3 downto 0);
	timer_p2 : in std_logic_vector(3 downto 0);
	explosion	 : out std_logic;
        explosion_bomb : out std_logic_vector(7 downto 0));
end bomb_overall;

