library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour_timer30 of timer_30 is
signal count, new_count : unsigned (4 downto 0);

begin
	process(clk_30, timer_r30)
	begin
	if (rising_edge (clk_30)) then
		if timer_r30 = '0' then
			count <= "00000";
		else
			count <= new_count;
		end if;
	end if;
	end process;

	process (count)
	begin
		new_count <= count + 1;
	end process;

	count_out <= std_logic_vector (count);

end behaviour_timer30;

