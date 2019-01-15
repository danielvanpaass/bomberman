library IEEE;
use IEEE.std_logic_1164.ALL;

entity timer_input is
   port(clk     : in  std_logic;
        clk_60  : in  std_logic;
        bombp   : in  std_logic;
	reset   : in  std_logic;
        bombout : out std_logic);
end timer_input;

