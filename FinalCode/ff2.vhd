library IEEE;
use IEEE.std_logic_1164.ALL;

entity ff2 is
   port(read      : IN  std_logic;
        FF2_reset : IN  std_logic;
	clk	  : IN	std_logic;
        FF2_read  : OUT std_logic);
end ff2;

