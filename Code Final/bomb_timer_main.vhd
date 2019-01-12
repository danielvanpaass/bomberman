library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity bomb_timer_main is
   port(clk        : in  std_logic;
	clk_30	   : in  std_logic;
	timer1	   : in  std_logic;
	reset 	   : in std_logic;
        explosion  : out std_logic);
end bomb_timer_main;

