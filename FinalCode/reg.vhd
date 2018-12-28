library IEEE;
use IEEE.std_logic_1164.ALL;

entity reg is
   port(d_in  : in  std_logic_vector(7 downto 0);
        d_out : out std_logic_vector(7 downto 0);
        clk   : in  std_logic;
        reset : in  std_logic);
end reg;
