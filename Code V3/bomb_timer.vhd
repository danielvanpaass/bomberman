library IEEE;
use IEEE.std_logic_1164.ALL;

entity bomb_timer is
   port(clk 		    : in std_logic;
	clk_30      : in  std_logic;
        count_reset : in  std_logic;
        count_out   : out std_logic_vector(6 downto 0)
	);
end bomb_timer;
