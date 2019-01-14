library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour_buffer of buffer_bomb is
	type buff_state is (BUFF_RESET, BUFF1, BUFF2, BUFF_WAIT);
	signal state, new_state: buff_state;
begin
	lbl1: process (clk, reset)
	begin
	if (clk'event and clk = '1') then
		if reset = '1' then
			state <= BUFF_RESET;
		else 
			state <= new_state;
		end if;
	end if;
	end process;

	lbl2: process (state, b_input)
	begin
	case state is
		when BUFF_RESET =>
		b_output <= '0';
		if b_input = '1' then
			new_state <= BUFF1;
		else 
			new_state <= BUFF_RESET;
		end if;
	
		when BUFF1 =>
		b_output <= '1';
		new_state <= BUFF2;

		when BUFF2 =>
		b_output <= '1';
		new_state <= BUFF_WAIT;
		
		when BUFF_WAIT =>
		b_output <= '0';
		if b_input = '0' then
			new_state <= BUFF_RESET;
		else
			new_state <= BUFF_WAIT;
		end if;
	end case;
	end process;

end architecture behaviour_buffer;

