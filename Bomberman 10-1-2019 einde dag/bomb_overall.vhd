library IEEE;
use IEEE.std_logic_1164.ALL;

entity bomb_overall is
   port(clk        : in  std_logic;
	clk_30	   : in  std_logic;
	reset	   : in  std_logic;
        bombp1     : in  std_logic;
        bombp2     : in  std_logic;
	explosion	 : out std_logic;
	b_placed	  : out std_logic;
        explosion_bomb : out std_logic_vector(7 downto 0);
	buff_p1	 : out std_logic;
	buff_p2  : out std_logic);
end bomb_overall;

