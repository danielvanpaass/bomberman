library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of ff2 is
	signal FF2, new_FF2: unsigned(2 downto 0);
begin
	lbl1: process(clk)
	begin
		if (clk'event and clk = '1') then
			if FF2_reset = '1' then
				FF2 <= (others => '0');
			else
				FF2 <= new_FF2;
			end if;
		end if;
	end process;
	
	lbl2: process (read, FF2)
	begin
		if(read = '1') then
			new_FF2 <= FF2 + 1;
		else
			new_FF2 <= FF2;
		end if;

		if(FF2 = "101") then
			FF2_read <= '1';
		else
			FF2_read <= '0';
		end if;
	end process;
end behaviour;

