library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour_bomb_timer of bomb_timer is
signal count, new_count	: unsigned (7 downto 0);

begin
	process (clk)
	begin
		if (clk'event and clk = '1') then						-- Check whether counter should be on or off
			if (count_reset = '1') then
				count <= (others => '0');
			else
				count <= new_count;
			end if;
		end if;
	end process;

	process (count, clk_60)							-- Add one to new_count if timer is on
	begin
		if clk_60 = '1' then
			new_count <= count + 1;
		else
			new_count <= count;
		end if;
	end process;

	count_out <= std_logic_vector (count);
end behaviour_bomb_timer;
