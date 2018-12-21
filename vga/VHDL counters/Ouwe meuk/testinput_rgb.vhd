LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;


ENTITY rgb IS
	PORT
	(
			r : out std_logic;
			g : out std_logic;
			b : out std_logic
			
	);
END rgb;

architecture behaviour OF rgb IS
begin		
	
	r <= '1' after 0 ns;
   g <= '0' after 0 ns;
   b <= '0' after 0 ns;
  
	
end behaviour;