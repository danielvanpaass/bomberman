library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of hitscan is
	type hit_state is (rest, undicided, horizontal, plusform, vertical, vert_wait, vert_out, hori_wait, hori_out, victory_1, victory_2);
	signal state, new_state: hit_state;
	signal FF1: std_logic;
	signal coor_signed, new_coor_signed: signed(4 downto 0);
	signal coor_signed_p1: signed(4 downto 0);
	signal coor_signed_p2: signed(4 downto 0);
begin
	lbl1: process(clk)
	begin
		if (clk'event and clk = '1') then
			if res = '1' then
				state <= rest;
			else
				state <= new_state;
			end if;
		end if;
	end process;

	lbl2: process (Y_b, X_b, X_p1, Y_p1, X_p2, Y_p2, explode, state)
	begin
		case state is
			when rest =>
				FF1 <= '0';
				FF2_reset <= '1';
				read <= '0';
				victoryv <= "00";
				enable <= "00";
				X_out <= "0000";
				Y_out <= "0000";
				if (explode = '1' and X_b(0) = '1') then
					new_state <= horizontal;
				elsif (explode = '1') then
					new_state <= undicided;
				else
					new_state <= rest;
				end if;
			when undicided =>
				if Y_b(0) = '1' then
					new_state <= vertical;
				else
					new_state <= plusform;
				end if;
			when plusform =>
				FF1 <= '1';
				new_state <= vertical;

			when vertical =>
				FF2_reset <= '1';
				X_out <= X_b;
				coor_signed <= "0" & signed(Y_b) - "00011";
				coor_signed_p1 <= "0" & signed(Y_p1);
				coor_signed_p2 <= "0" & signed(Y_P2);
				new_state <= vert_wait;
			when vert_wait =>
				FF2_reset <= '0';
				read <= '0';
				new_state <= vert_out;
			when vert_out =>
				coor_signed <= coor_signed + "00001";
				if coor_signed(4) = '0' then
					Y_out <= std_logic_vector(coor_signed(3 downto 0));
					read <= '1';
				end if;				read <= '1';
				if (X_out = X_p1 AND coor_signed_p1 = coor_signed) then
					new_state <= victory_2;
				elsif (X_out = X_p2 AND coor_signed_p2 = coor_signed) then
					new_state <= victory_1;
				elsif coor_signed < 0  then
					new_state <= vert_wait;
				elsif (coor_signed > 9 and FF1 = '1') then
					new_state <= horizontal;
				elsif (FF2_read = '1' and FF1 = '1') then
					new_state <= horizontal;
				elsif FF2_read = '1' then
					new_state <= rest;
				else
					new_state <= vert_wait;
				end if;

			when horizontal =>
				read <= '0';
				FF2_reset <= '1';
				Y_out <= Y_b;
				new_state <= hori_wait;
				coor_signed <= "0" & signed(X_b) - "00011";
				coor_signed_p1 <= "0" & signed(X_p1);
				coor_signed_p2 <= "0" & signed(X_P2);
			when hori_wait =>
				FF2_reset <= '0';
				read <= '0';
				new_state <= hori_out;
			when hori_out =>
				coor_signed <= coor_signed + "00001";
				if coor_signed(4) = '0' then
					X_out <= std_logic_vector(coor_signed(3 downto 0));
					read <= '1';
				end if;
				if (Y_out = Y_p1 AND coor_signed_p1 = coor_signed) then
					new_state <= victory_2;
				elsif (Y_out = Y_p2 AND coor_signed_p2 = coor_signed) then
					new_state <= victory_1;
				elsif coor_signed < 0  then
					new_state <= hori_wait;
				elsif FF2_read = '1' then
					new_state <= rest;
				else
					new_state <= hori_wait;
				end if;

			when victory_1 =>
				victoryv <= "10";
				new_state <= victory_1;
			when victory_2 =>
				victoryv <= "11";
				new_state <= victory_2;
		end case;
	end process;
end behaviour;
