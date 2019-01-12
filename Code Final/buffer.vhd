library IEEE;
use IEEE.std_logic_1164.ALL;

entity buffer_bomb is
   port(clk    : in  std_logic;
	reset  : in  std_logic;
        b_input  : in  std_logic;
        b_output : out std_logic);
end buffer_bomb;

