library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of ff2 is
	signal FF2, new_FF2: unsigned(2 downto 0);
begin
	lbl1: process(clk, FF2_reset)
	begin
-- If the reset becomes 1 the FF2 counter needs to be reset. If it is not, than it is able to count
		if (clk'event and clk = '1') then
			if FF2_reset = '1' then
				FF2 <= (others => '0');
			else
				FF2 <= new_FF2;
			end if;
		end if;
	end process;
	
	lbl2: process (read, FF2)
-- Every time read becomes 1, a tile has been checked and thus need to be counted
	begin
		if(read = '1') then
			new_FF2 <= FF2 + 1;
		else
			new_FF2 <= FF2;
		end if;

-- The last part checks for the right amount of times that different tiles need to be checked
		if(FF2 = "100") then
			FF2_read <= '1';
		else
			FF2_read <= '0';
		end if;
	end process;
end behaviour;

