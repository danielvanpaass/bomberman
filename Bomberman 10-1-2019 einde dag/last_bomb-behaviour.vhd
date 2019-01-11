library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of last_bomb is

type last_bomb_states is (hold, sample_a, sample_b, sample_c, sample_d, sample_e, sample_f, sample_g, sample_h);

signal state, new_state: last_bomb_states;
signal bombxsample, bombysample, new_bombxsample, new_bombysample : std_logic_vector(3 downto 0);

begin

process (clk, reset)
  begin
   if (rising_edge (clk)) then
     if (reset = '1') then
       state <= hold;
	bombxsample <= "0000";
	bombysample <= "0000";
     else
       state <= new_state;
		 bombxsample <= new_bombxsample;
		 bombysample <= new_bombysample;
     end if;
   end if;
end process;

process (state, flag_htoa,bombxsample,bombysample,bomb_a_x,bomb_a_y,bomb_b_x,bomb_b_y,bomb_c_x,bomb_c_y,bomb_d_x,bomb_d_y,bomb_e_x,bomb_e_y,bomb_f_x,bomb_f_y,bomb_g_x,bomb_g_y,bomb_h_x,bomb_h_y )

	begin
	case state is
		when hold =>
		new_bombxsample <= bombxsample;
		new_bombysample <= bombysample;
		expl_x <= bombxsample;
		expl_y <= bombysample;
		if (flag_htoa(7) = '1') then
			new_state <= sample_h;
		elsif (flag_htoa(6) = '1') then
			new_state <= sample_g;
		elsif (flag_htoa(5) = '1') then
			new_state <= sample_f;
		elsif (flag_htoa(4) = '1') then
			new_state <= sample_e;
		elsif (flag_htoa(3) = '1') then
			new_state <= sample_d;
		elsif (flag_htoa(2) = '1') then
			new_state <= sample_c;
		elsif (flag_htoa(1) = '1') then
			new_state <= sample_b;
		elsif (flag_htoa(0) = '1') then
			new_state <= sample_a;
		else
			new_state <= hold;
		end if;

		when sample_a =>
		new_bombxsample <= bomb_a_x;
		new_bombysample <= bomb_a_y;
		expl_x <= bomb_a_x;
		expl_y <= bomb_a_y;
		new_state <= hold;

		when sample_b =>
		new_bombxsample <= bomb_b_x;
		new_bombysample <= bomb_b_y;
		expl_x <= bomb_b_x;
		expl_y <= bomb_b_y;
		new_state <= hold;

		when sample_c =>
		new_bombxsample <= bomb_c_x;
		new_bombysample <= bomb_c_y;
		expl_x <= bomb_c_x;
		expl_y <= bomb_c_y;
		new_state <= hold;

		when sample_d =>
		new_bombxsample <= bomb_d_x;
		new_bombysample <= bomb_d_y;
		expl_x <= bomb_d_x;
		expl_y <= bomb_d_y;
		new_state <= hold;
		
		when sample_e =>
		new_bombxsample <= bomb_e_x;
		new_bombysample <= bomb_e_y;
		expl_x <= bomb_e_x;
		expl_y <= bomb_e_y;
		new_state <= hold;

		when sample_f =>
		new_bombxsample <= bomb_f_x;
		new_bombysample <= bomb_f_y;
		expl_x <= bomb_f_x;
		expl_y <= bomb_f_y;
		new_state <= hold;

		when sample_g =>
		new_bombxsample <= bomb_g_x;
		new_bombysample <= bomb_g_y;
		expl_x <= bomb_g_x;
		expl_y <= bomb_g_y;
		new_state <= hold;

		when sample_h =>
		new_bombxsample <= bomb_h_x;
		new_bombysample <= bomb_h_y;
		expl_x <= bomb_h_x;
		expl_y <= bomb_h_y;
		new_state <= hold;

	end case;
end process;

end behaviour;
