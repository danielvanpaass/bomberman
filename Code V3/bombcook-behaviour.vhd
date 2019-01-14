library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of bombcook is

type bombcook_states is (nobomb, cook, still_cook, explosion_flag, explode);

signal state, new_state: bombcook_states;
signal bombxsample, bombysample, new_bombxsample, new_bombysample : std_logic_vector(3 downto 0);

begin

process (clk, reset)
  begin
   if (rising_edge (clk)) then
     if (reset = '1') then
       state <= nobomb;
     else
       state <= new_state;
		 bombxsample <= new_bombxsample;
		 bombysample <= new_bombysample;
     end if;
   end if;
end process;

process (state, bombinit, expl,bombxsample,bombysample,playerx,playery)

	begin
	case state is
		when nobomb =>
		bombx <= "0000";
		bomby <= "0000";
		new_bombxsample <= "0000";
		new_bombysample <= "0000";
		bombdisplay <= '0';
		expl_flag <= '0';
		if (bombinit = '1') then
			new_state <= cook;
		else
			new_state <= nobomb;
		end if;

		when cook =>
		new_bombxsample <= playerx;
		new_bombysample <= playery;
		bombx <= "0000";
		bomby <= "0000";
		bombdisplay <= '0';
		expl_flag <= '0';
		new_state <= still_cook;

		when still_cook =>
		new_bombxsample <= bombxsample;
		new_bombysample <= bombysample;
		bombx <= bombxsample;
		bomby <= bombysample;
		bombdisplay <= '1';
		expl_flag <= '0';
		if (expl = '1') then
			new_state <= explosion_flag;
		else
			new_state <= still_cook;
		end if;

		when explosion_flag =>
		new_bombxsample <= bombxsample;
		new_bombysample <= bombysample;
		bombx <= bombxsample;
		bomby <= bombysample;
		bombdisplay <= '1';
		expl_flag <= '1';
		new_state <= explode;

		when explode =>
		new_bombxsample <= bombxsample;
		new_bombysample <= bombysample;
		bombx <= bombxsample;
		bomby <= bombysample;
		bombdisplay <= '0';
		expl_flag <= '0';
		if (expl = '0') then
			new_state <= nobomb;
		else
			new_state <= explode;
		end if;

	end case;
end process;

end behaviour;
