library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of hitscan is
	type hit_state is (rest, undicided, horizontal, plusform, vertical, vert_wait, vert_out, hori_wait, hori_out, victory_1, victory_2);
	signal state, new_state: hit_state;
	signal FF1, new_FF1: std_logic;
	signal coor_signed, new_coor_signed: signed(4 downto 0);
	signal coor_unsigned_p1_x, coor_unsigned_p1_y, coor_unsigned_p2_x, coor_unsigned_p2_y, coor_unsigned_b_x, coor_unsigned_b_y, coor_unsigned, new_coor_unsigned: unsigned(3 downto 0);
	signal new_coor_unsigned_p1_x, new_coor_unsigned_p1_y, new_coor_unsigned_p2_x, new_coor_unsigned_p2_y, new_coor_unsigned_b_x, new_coor_unsigned_b_y: unsigned(3 downto 0);
	signal new_lethaltile_x, new_lethaltile_y, lethaltile_x, lethaltile_y: std_logic_vector(3 downto 0);

begin
	lbl1: process(clk)
	begin
		if (clk'event and clk = '1') then
			if res = '1' then
				state <= rest;
				FF1 <= '1';
				coor_unsigned_p1_x <= "0000";
				coor_unsigned_p1_y <= "0000";
				coor_unsigned_p2_x <= "0000";
				coor_unsigned_p2_y <= "0000";
				coor_unsigned_b_x <= "0000";
				coor_unsigned_b_y <= "0000";
				lethaltile_y <= "0000";
				lethaltile_x <= "0000";
				coor_unsigned <= "0000";
				coor_signed <= "00000";
			else
				state <= new_state;
				FF1 <= new_FF1;
				coor_unsigned_p1_x <= new_coor_unsigned_p1_x;
				coor_unsigned_p1_y <= new_coor_unsigned_p1_y;
				coor_unsigned_p2_x <= new_coor_unsigned_p2_x;
				coor_unsigned_p2_y <= new_coor_unsigned_p2_y;
				coor_unsigned_b_x <= new_coor_unsigned_b_x;
				coor_unsigned_b_y <= new_coor_unsigned_b_y;
				lethaltile_y <= new_lethaltile_y;
				lethaltile_x <= new_lethaltile_x;
				coor_unsigned <= new_coor_unsigned;
				coor_signed <= new_coor_signed;
			end if;
		end if;
	end process;

	lbl2: process (Y_b, X_b, X_p1, Y_p1, X_p2, Y_p2, explode,FF2_read, state)
	begin
		case state is
-- Everything needs to be reset in the rest state and checked if a bomb is exploding
			when rest =>
				new_FF1 <= '0';
				FF2_reset <= '1';
				read <= '0';
				lethal_flag <= '0';
				victoryv <= "00";
				new_lethaltile_x <= "0000";
				new_lethaltile_y <= "0000";
				new_coor_unsigned_p1_x <= unsigned(X_p1);
				new_coor_unsigned_p1_y <= unsigned(Y_p1);
				new_coor_unsigned_p2_x <= unsigned(X_p2);
				new_coor_unsigned_p2_y <= unsigned(Y_p2);
				new_coor_unsigned_b_x <= unsigned(X_b);
				new_coor_unsigned_b_y <= unsigned(Y_b);
				new_coor_signed <= "00000";
				new_coor_unsigned <= "0000";
				if (explode = '1' and X_b(0) = '1') then
					new_state <= horizontal;
				elsif (explode = '1') then
					new_state <= undicided;
				else
					new_state <= rest;
				end if;
-- If a bomb is not right above and below a wall, the system does not know if it needs to be an explosion in a vertical line or in a plus form.
			when undicided => 
				new_FF1 <= FF1;
				FF2_reset <= '0';
				read <= '0';
				lethal_flag <= '0';
				victoryv <= "00";
				new_lethaltile_x <= "0000";
				new_lethaltile_y <= "0000";
				new_coor_unsigned_p1_x <= coor_unsigned_p1_x;
				new_coor_unsigned_p1_y <= coor_unsigned_p1_y;
				new_coor_unsigned_p2_x <= coor_unsigned_p2_x;
				new_coor_unsigned_p2_y <= coor_unsigned_p2_y;
				new_coor_unsigned_b_x <= coor_unsigned_b_x;
				new_coor_unsigned_b_y <= coor_unsigned_b_y;
				new_coor_signed <= "00000";
				new_coor_unsigned <= "0000";
				if coor_unsigned_b_y(0) = '1' then
					new_state <= vertical;
				else
					new_state <= plusform;
				end if;
-- It has been decided that a plus form needs to be generated and FF1 stores that.
			when plusform =>
				FF2_reset <= '0';
				read <= '0';
				lethal_flag <= '0';
				victoryv <= "00";
				new_lethaltile_x <= "0000";
				new_lethaltile_y <= "0000";
				new_coor_unsigned_p1_x <= coor_unsigned_p1_x;
				new_coor_unsigned_p1_y <= coor_unsigned_p1_y;
				new_coor_unsigned_p2_x <= coor_unsigned_p2_x;
				new_coor_unsigned_p2_y <= coor_unsigned_p2_y;
				new_coor_unsigned_b_x <= coor_unsigned_b_x;
				new_coor_unsigned_b_y <= coor_unsigned_b_y;
				new_coor_signed <= "00000";
				new_coor_unsigned <= "0000";
				new_FF1 <= '1';
				new_state <= vertical;

-- All the requirements to make a vertical line are being initiated
			when vertical =>
				new_FF1 <= FF1;
				read <= '0';
				lethal_flag <= '0';
				victoryv <= "00";
				new_lethaltile_y <= "0000";
				new_coor_unsigned_p1_x <= coor_unsigned_p1_x;
				new_coor_unsigned_p1_y <= coor_unsigned_p1_y;
				new_coor_unsigned_p2_x <= coor_unsigned_p2_x;
				new_coor_unsigned_p2_y <= coor_unsigned_p2_y;
				new_coor_unsigned_b_x <= coor_unsigned_b_x;
				new_coor_unsigned_b_y <= coor_unsigned_b_y;
				new_coor_unsigned <= "0000";
				FF2_reset <= '1';
				new_lethaltile_x <= std_logic_vector(coor_unsigned_b_x);
				new_coor_signed <= "0" & signed(coor_unsigned_b_y) - "00010";
				new_state <= vert_wait;
			when vert_wait =>
				new_FF1 <= FF1;
				FF2_reset <= '0';
				read <= '0';
				lethal_flag <= '0';
				victoryv <= "00";
				new_lethaltile_x <= lethaltile_x;
				new_lethaltile_y <= lethaltile_y;
				new_coor_unsigned_p1_x <= coor_unsigned_p1_x;
				new_coor_unsigned_p1_y <= coor_unsigned_p1_y;
				new_coor_unsigned_p2_x <= coor_unsigned_p2_x;
				new_coor_unsigned_p2_y <= coor_unsigned_p2_y;
				new_coor_unsigned_b_x <= coor_unsigned_b_x;
				new_coor_unsigned_b_y <= coor_unsigned_b_y;
				new_coor_signed <= coor_signed;
				new_coor_unsigned <= coor_unsigned;
				FF2_reset <= '0';
				read <= '0';
				lethal_flag <= '0';
				new_state <= vert_out;
-- If a player is hit, the victory state will be taken. If a wall is met or it has checked enough tiles and needs to be a plus form, the FSM will go to horizontal. If it is not a plusform, the FSM will go to rest state. Otherwise it will go back to the wait state
			when vert_out =>
				new_FF1 <= FF1;
				FF2_reset <= '0';
				victoryv <= "00";
				new_lethaltile_x <= lethaltile_x;
				new_coor_unsigned_p1_x <= coor_unsigned_p1_x;
				new_coor_unsigned_p1_y <= coor_unsigned_p1_y;
				new_coor_unsigned_p2_x <= coor_unsigned_p2_x;
				new_coor_unsigned_p2_y <= coor_unsigned_p2_y;
				new_coor_unsigned_b_x <= coor_unsigned_b_x;
				new_coor_unsigned_b_y <= coor_unsigned_b_y;
				new_coor_signed <= coor_signed + "00001";
				read <= '1';
				if coor_signed(4) = '0' then
					new_lethaltile_y <= std_logic_vector(coor_signed(3 downto 0));
					new_coor_unsigned <= unsigned(coor_signed(3 downto 0));
					lethal_flag <= '1';
					if (coor_unsigned_b_x = coor_unsigned_p1_x AND coor_unsigned_p1_y = coor_unsigned) then
						new_state <= victory_2;
					elsif (coor_unsigned_b_x = coor_unsigned_p2_x AND coor_unsigned_p2_y = coor_unsigned) then
						new_state <= victory_1;
					elsif (coor_unsigned > 9 and FF1 = '1') then
						new_state <= horizontal;
					elsif (FF2_read = '1' and FF1 = '1') then
						new_state <= horizontal;
					elsif FF2_read = '1' then
						new_state <= rest;
					else
						new_state <= vert_wait;
					end if;
				else
					new_state <= vert_wait;
					new_lethaltile_y <= lethaltile_y;
					lethal_flag <= '0';
				end if;
-- If a player is hit, the victory state will be taken. If it checked enough tiles or has met a border wall, it will go to the rest state. Otherwise, it will go to the wait sate
			when horizontal =>
				new_FF1 <= FF1;
				read <= '0';
				lethal_flag <= '0';
				victoryv <= "00";
				new_lethaltile_x <= "0000";
				new_coor_unsigned_p1_x <= coor_unsigned_p1_x;
				new_coor_unsigned_p1_y <= coor_unsigned_p1_y;
				new_coor_unsigned_p2_x <= coor_unsigned_p2_x;
				new_coor_unsigned_p2_y <= coor_unsigned_p2_y;
				new_coor_unsigned_b_x <= coor_unsigned_b_x;
				new_coor_unsigned_b_y <= coor_unsigned_b_y;
				new_coor_unsigned <= "0000";
				FF2_reset <= '1';
				new_lethaltile_y <= std_logic_vector(coor_unsigned_b_y);
				new_coor_signed <= "0" & signed(coor_unsigned_b_x) - "00010";
				new_state <= hori_wait;
			when hori_wait =>
				new_FF1 <= FF1;
				FF2_reset <= '0';
				read <= '0';
				lethal_flag <= '0';
				victoryv <= "00";
				new_lethaltile_x <= lethaltile_x;
				new_lethaltile_y <= lethaltile_y;
				new_coor_unsigned_p1_x <= coor_unsigned_p1_x;
				new_coor_unsigned_p1_y <= coor_unsigned_p1_y;
				new_coor_unsigned_p2_x <= coor_unsigned_p2_x;
				new_coor_unsigned_p2_y <= coor_unsigned_p2_y;
				new_coor_unsigned_b_x <= coor_unsigned_b_x;
				new_coor_unsigned_b_y <= coor_unsigned_b_y;
				new_coor_signed <= coor_signed;
				new_coor_unsigned <= coor_unsigned;
				new_state <= hori_out;
			when hori_out =>
				new_FF1 <= FF1;
				FF2_reset <= '0';
				lethal_flag <= '0';
				victoryv <= "00";
				new_lethaltile_y <= lethaltile_y;
				new_coor_unsigned_p1_x <= coor_unsigned_p1_x;
				new_coor_unsigned_p1_y <= coor_unsigned_p1_y;
				new_coor_unsigned_p2_x <= coor_unsigned_p2_x;
				new_coor_unsigned_p2_y <= coor_unsigned_p2_y;
				new_coor_unsigned_b_x <= coor_unsigned_b_x;
				new_coor_unsigned_b_y <= coor_unsigned_b_y;
				new_coor_signed <= coor_signed + "00001";
				read <= '1';
				if coor_signed(4) = '0' then
					new_lethaltile_x <= std_logic_vector(coor_signed(3 downto 0));
					new_coor_unsigned <= unsigned(coor_signed(3 downto 0));
					lethal_flag <= '1';
					if (coor_unsigned_b_y  = coor_unsigned_p1_y AND coor_unsigned_p1_y = coor_unsigned) then
						new_state <= victory_2;
					elsif (coor_unsigned_b_y = coor_unsigned_p2_y AND coor_unsigned_p2_x = coor_unsigned) then
						new_state <= victory_1;
					elsif FF2_read = '1' then
						new_state <= rest;
					else
						new_state <= hori_wait;
					end if;
				else
					new_state <= hori_wait;
					new_lethaltile_x <= lethaltile_x;
					new_coor_unsigned <= coor_unsigned;
					lethal_flag <= '0';
				end if;
-- The victory states will generate a victory signal with the winning player
			when victory_1 =>	
				new_FF1 <= FF1;
				FF2_reset <= '0';
				read <= '0';
				lethal_flag <= '0';
				new_lethaltile_x <= "0000";
				new_lethaltile_y <= "0000";
				new_coor_unsigned_p1_x <= coor_unsigned_p1_x;
				new_coor_unsigned_p1_y <= coor_unsigned_p1_y;
				new_coor_unsigned_p2_x <= coor_unsigned_p2_x;
				new_coor_unsigned_p2_y <= coor_unsigned_p2_y;
				new_coor_unsigned_b_x <= coor_unsigned_b_x;
				new_coor_unsigned_b_y <= coor_unsigned_b_y;
				new_coor_signed <= "00000";
				new_coor_unsigned <= "0000";
				victoryv <= "10";
				new_state <= victory_1;
			when victory_2 =>
				new_FF1 <= FF1;
				FF2_reset <= '0';
				read <= '0';
				lethal_flag <= '0';
				new_lethaltile_x <= "0000";
				new_lethaltile_y <= "0000";
				new_coor_unsigned_p1_x <= coor_unsigned_p1_x;
				new_coor_unsigned_p1_y <= coor_unsigned_p1_y;
				new_coor_unsigned_p2_x <= coor_unsigned_p2_x;
				new_coor_unsigned_p2_y <= coor_unsigned_p2_y;
				new_coor_unsigned_b_x <= coor_unsigned_b_x;
				new_coor_unsigned_b_y <= coor_unsigned_b_y;
				new_coor_signed <= "00000";
				new_coor_unsigned <= "0000";
				victoryv <= "11";
				new_state <= victory_2;
		end case;
	end process;
	
	lethaltile_x_out <= lethaltile_x;
	lethaltile_y_out <= lethaltile_y;
end behaviour;
