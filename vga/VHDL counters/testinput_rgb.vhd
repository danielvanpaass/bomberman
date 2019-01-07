LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;


ENTITY rgb IS
	PORT
	(
			clock : in std_logic;
			reset : in std_logic;
			video : in std_logic;
			r : out std_logic;
			g : out std_logic;
			b : out std_logic
	);
END rgb;

architecture behaviour OF rgb IS
begin		
	g <= '0';
   b <= '0';
  process(video, clock, reset)
  begin
  if (video = '1') then
		r <= '1';
	else
		r <= '0';
	end if;
  end process;
	
end behaviour;