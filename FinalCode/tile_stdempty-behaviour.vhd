library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of tile_stdempty is
type tile_stdempty_states is (empty, explosion);

signal state, new_state: tile_stdempty_states;

begin

process (clk)
  begin
   if (rising_edge (clk)) then
     if (reset = '1') then
       state <= empty;
     else
       state <= new_state;
     end if;
   end if;
end process;

process (state, expl, xlethal, ylethal)

	begin
	case state is
		when empty =>
		tiletype <= "01";
		if (xlethal = '1' AND ylethal = '1' AND expl = '1') then
			new_state <= explosion;
		else
			new_state <= empty;
		end if;

		when explosion =>
		tiletype <= "00";
		if (expl = '0') then
			new_state <= empty;
		else
			new_state <= explosion;
		end if;
	end case;
end process;


end behaviour;

