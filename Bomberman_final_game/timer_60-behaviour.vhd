library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of timer_60 is
signal count, new_count : unsigned (4 downto 0);

begin
	process(clk, timer_r60)
	begin
	if (rising_edge (clk)) then
		if timer_r60 = '0' then
			count <= "00000";
		else
			count <= new_count;
		end if;
	end if;
	end process;

	process (count, clk_60)
	begin
		if clk_60 = '1' then
			new_count <= count + 1;
		else
			new_count <= count;
		end if;
	end process;

	count_out <= std_logic_vector (count);

end behaviour;

