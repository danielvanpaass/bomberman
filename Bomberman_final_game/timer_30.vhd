library IEEE;
use IEEE.std_logic_1164.ALL;

entity timer_60 is
   port(clk		: in std_logic;
	clk_60   : in  std_logic;
        timer_r60 : in  std_logic;
        count_out : out std_logic_vector(4 downto 0));
end timer_60;

