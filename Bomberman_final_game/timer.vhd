library IEEE;
use IEEE.std_logic_1164.ALL;

entity timer is
   port(clk   : in  std_logic;
        timer_r : in  std_logic;
        count_out : out std_logic_vector(15 downto 0));
end timer;

