library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour_timer of timer is
signal count, new_count : unsigned (15 downto 0);

begin
	process(clk)
	begin
		if (rising_edge (clk)) then
			if timer_r = '0' then
				count <= (others => '0');
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

end behaviour_timer;
