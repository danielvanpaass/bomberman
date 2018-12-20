library IEEE;
use IEEE.std_logic_1164.ALL;

entity uneven_bits is
   port(
        input  : in  std_logic_vector(21 downto 0);
        output : out std_logic_vector(10 downto 0));
end uneven_bits;

