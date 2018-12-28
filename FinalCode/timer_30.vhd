library IEEE;
use IEEE.std_logic_1164.ALL;

entity timer_30 is
   port(clk_30   : in  std_logic;
        timer_r30 : in  std_logic;
        count_out : out std_logic_vector(4 downto 0));
end timer_30;

