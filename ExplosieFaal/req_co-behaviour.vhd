library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of req_co is
	type req_state is (RESET_STATE, BOMB_A, BOMB_B, BOMB_C, BOMB_D, BOMB_E, BOMB_F, BOMB_G, BOMB_H);

	signal state, new_state: req_state;

begin
	lbl1: process (clk, reset)
	begin
	if (clk'event and clk = '1') then
		if reset = '1' then
			state <= RESET_STATE;
		else 
			state <= new_state;
		end if;
	end if;
	end process;

	lbl2: process (state, fin_explosion)
	begin
	case state is
		when RESET_STATE =>
		req_out_x <= "0000";
		req_out_y <= "0000";
		if fin_explosion(0) = '1' then
			new_state <= BOMB_A;
		elsif fin_explosion(1) = '1' then
			new_state <= BOMB_B;
		elsif fin_explosion(2) = '1' then
			new_state <= BOMB_C;
		elsif fin_explosion(3) = '1' then
			new_state <= BOMB_D;
		elsif fin_explosion(4) = '1' then
			new_state <= BOMB_E;
		elsif fin_explosion(5) = '1' then
			new_state <= BOMB_F;
		elsif fin_explosion(6) = '1' then
			new_state <= BOMB_G;
		elsif fin_explosion(7) = '1' then
			new_state <= BOMB_H;
		else
			new_state <= RESET_STATE;
		end if;
		
		when BOMB_A =>
		req_out_x <= bomb_a_x;
		req_out_y <= bomb_a_y;
		new_state <= RESET_STATE;

		when BOMB_B =>
		req_out_x <= bomb_b_x;
		req_out_y <= bomb_b_y;
		new_state <= RESET_STATE;

		when BOMB_C =>
		req_out_x <= bomb_c_x;
		req_out_y <= bomb_c_y;
		new_state <= RESET_STATE;

		when BOMB_D =>
		req_out_x <= bomb_d_x;
		req_out_y <= bomb_d_y;
		new_state <= RESET_STATE;

		when BOMB_E =>
		req_out_x <= bomb_e_x;
		req_out_y <= bomb_e_y;
		new_state <= RESET_STATE;

		when BOMB_F =>
		req_out_x <= bomb_f_x;
		req_out_y <= bomb_f_y;
		new_state <= RESET_STATE;

		when BOMB_G =>
		req_out_x <= bomb_g_x;
		req_out_y <= bomb_g_y;
		new_state <= RESET_STATE;

		when BOMB_H =>
		req_out_x <= bomb_h_x;
		req_out_y <= bomb_h_y;
		new_state <= RESET_STATE;

		
	end case;
	end process;

	

end architecture behaviour;
