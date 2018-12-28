library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of tile_stdcrate is
type tile_stdcrate_states is (crate, explosion, empty);

signal state, new_state: tile_stdcrate_states;

begin

process (clk, reset)
  begin
   if (rising_edge (clk)) then
     if (reset = '1') then
       state <= crate;
     else
       state <= new_state;
     end if;
   end if;
end process;

process (state, xlethal, ylethal, expl)

	begin
	case state is
		when crate =>
		tiletype <= "10";
		if (xlethal = '1' AND ylethal = '1' AND expl = '1') then
			new_state <= explosion;
		else
			new_state <= crate;
		end if;

		when explosion =>
		tiletype <= "00";
		if (expl = '0') then
			new_state <= empty;
		else
			new_state <= explosion;
		end if;

		when empty =>
		tiletype <= "01";
		if (xlethal = '1' AND ylethal = '1' AND expl = '1') then
			new_state <= explosion;
		else
			new_state <= empty;
		end if;
	end case;
end process;


end behaviour;

