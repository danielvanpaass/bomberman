library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of bomb_xy_reg is
		type bomb_xy_reg_state is (STATE_RESET, STORE, BUFF, RELEASE_STATE);
	
signal new_x_b_buff, new_y_b_buff, x_b_buff, y_b_buff, new_x_b_out, new_y_b_out: std_logic_vector(3 downto 0);
signal state, new_state : bomb_xy_reg_state;

begin
	lbl1: process (clk, reset)
	begin
	if (clk'event and clk = '1') then
		if reset = '1' then
			state <= STATE_RESET;
		else
			state <= new_state;
			x_b_out <= new_x_b_out;
			y_b_out <= new_y_b_out;
			x_b_buff <= new_x_b_buff;
			y_b_buff <= new_y_b_buff;
		end if;
	end if;
	end process;
	
	lbl2: process (state, co_store, co_release, x_b, y_b)
	begin
	case state is
		when STATE_RESET =>
		start_hitscan <= '0';
		new_x_b_out <= "0000";
		new_y_b_out <= "0000";
		new_x_b_buff <= "0000";
		new_y_b_buff <= "0000";
		if co_store = '1' then
			new_state <= STORE;
		else
			new_state <= STATE_RESET;
		end if;
		
		when STORE =>
		start_hitscan <= '0';
		new_x_b_buff <= x_b;
		new_y_b_buff <= y_b;
		new_x_b_out <= "0000";
		new_y_b_out <= "0000";
		if (x_b(0) = '1' OR x_b(1) = '1' OR x_b(2) = '1' OR x_b(3) = '1' OR y_b(0) = '1' OR y_b(1) = '1' OR y_b(2) = '1' OR y_b(3) = '1') then
			new_state <= BUFF;
		else
			new_state <= STORE;
		end if;

		when BUFF =>
		start_hitscan <= '0';
		new_x_b_buff <= x_b_buff;
		new_y_b_buff <= y_b_buff;
		new_x_b_out <= "0000";
		new_y_b_out <= "0000";
		if co_release = '1' then
			new_state <= RELEASE_STATE;
		else
			new_state <= BUFF;
		end if;
		
		when RELEASE_STATE =>
		start_hitscan <= '1';
		new_x_b_buff <= x_b_buff;
		new_y_b_buff <= y_b_buff;
		new_x_b_out <= x_b_buff;
		new_y_b_out <= y_b_buff;
		new_state <= STATE_RESET;
	end case;
	end process;
end behaviour;

