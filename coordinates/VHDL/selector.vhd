library IEEE;
use IEEE.std_logic_1164.ALL;

entity selector is
   port(p : in  std_logic;
        b : in  std_logic;
	p1 : out std_logic;
	p2 : out std_logic);
end selector;

architecture behaviour of selector is
begin

p1 <= ((NOT p) AND b);
p2 <= (p AND b);

end behaviour;
