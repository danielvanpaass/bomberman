LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
ARCHITECTURE hitbox_behaviour OF hitbox IS
	TYPE state_type IS (begin_state, which_direction, attempt_to_right, attempt_to_left, attempt_to_up, attempt_to_down, right_output, left_output, up_output, down_output, stay_output, no_attempt, cooldown_state, output_portal_top, output_portal_bottom);
	SIGNAL dir_p1_state, new_state_p1                : state_type;
	SIGNAL dir_p2_state, new_state_p2                : state_type;
	SIGNAL check_x_p1, check_y_p1, new_x_p1, new_y_p1, x_p1, y_p1 : std_logic_vector (3 DOWNTO 0);
	SIGNAL check_x_p2, check_y_p2, new_x_p2, new_y_p2, x_p2, y_p2 : std_logic_vector (3 DOWNTO 0);
	SIGNAL begin_counting_p1, begin_counting_p2, move_p1, move_p2                            : std_logic; ---!!!
	SIGNAL count_players_p1, new_count_players_p1, count_players_p2, new_count_players_p2          : unsigned (4 DOWNTO 0);--(22 DOWNTO 0);
	SIGNAL walls_and_crates_inverted                 : std_logic_vector(0 TO 120);

	CONSTANT cooldown_end                            : unsigned(4 DOWNTO 0) := "00010"; ---"10110111000110110000000"
	--however, for simulation purposes we used much smaller values.
BEGIN
	walls_and_crates_inverted <= walls_and_crates;
	PROCESS (clk, reset)
	BEGIN
		IF rising_edge (clk) THEN
			IF reset = '1' THEN -- reset the whole system
				dir_p1_state <= begin_state;
				dir_p2_state <= begin_state;
				x_p1			 <= "0001";--starting positions of the players
				y_p1			 <= "0001";
				x_p2			 <= "1001";
				y_p2			 <= "1001";
			ELSE
				dir_p1_state <= new_state_p1;
				dir_p2_state <= new_state_p2;
				x_p1         <= new_x_p1;
				y_p1         <= new_y_p1;
				x_p2         <= new_x_p2;
				y_p2         <= new_y_p2;
			END IF;
		END IF;
	END PROCESS;

	--- counter cooldown clock for P1
	PROCESS (clk, begin_counting_p1)
		BEGIN
			IF rising_edge (clk) THEN
				IF (begin_counting_p1 = '0') THEN --so reset should be longer than clk cycle
					count_players_p1 <= (OTHERS => '0');
				ELSE
					count_players_p1 <= new_count_players_p1;
				END IF;
			END IF;
		END PROCESS;					

		-- counter  P1
	PROCESS ( count_players_p1)--v_clk,
		BEGIN
			IF v_clk = '1' THEN			
			new_count_players_p1 <= count_players_p1 + 1;
			ELSE 
			new_count_players_p1 <= count_players_p1;
			END IF;
		END PROCESS;
	--- counter cooldown clock for P1
	PROCESS (clk, begin_counting_p2)
		BEGIN
			IF rising_edge (clk) THEN
				IF (begin_counting_p2 = '0') THEN 
					count_players_p2 <= (OTHERS => '0');
				ELSE
					count_players_p2 <= new_count_players_p2;
				END IF;
			END IF;
		END PROCESS;					

		-- counter P2 
	PROCESS ( count_players_p2)--v_clk,
		BEGIN
			IF v_clk = '1' THEN			
			new_count_players_p2 <= count_players_p2 + 1;
			ELSE 
			new_count_players_p2 <= count_players_p2;
			END IF;
		END PROCESS;
		x_p1_out <= x_p1;--these will be the output of the system
		x_p2_out <= x_p2;
		y_p1_out <= y_p1;
		y_p2_out <= y_p2;
	---- Player movement is determined here
	PROCESS (right_p1, left_p1, up_p1, down_p1, dir_p1_state, new_x_p1, new_y_p1, x_p1, y_p1, move_p1, count_players_p1)
		BEGIN
			CASE dir_p1_state IS
				WHEN begin_state => 
					begin_counting_p1 <= '0';
					new_state_p1  <= which_direction;
					check_x_p1 <= "0000";--the value of check_x and y are irrelevant as check_x will not be use right now
					check_y_p1 <= "0000";
					new_x_p1   <= "0001";
					new_y_p1   <= "0001";

				WHEN which_direction => --the intended direction of the player is determined
					begin_counting_p1 <= '0';
					check_x_p1 <= "0000";
					check_y_p1 <= "0000";
					new_x_p1   <= x_p1;
					new_y_p1   <= y_p1;
					IF ((down_p1 = '0') AND (up_p1 = '0') AND (left_p1 = '0') AND (right_p1 = '1')) THEN
						new_state_p1 <= attempt_to_right;
					ELSIF ((down_p1 = '0') AND (up_p1 = '0') AND (left_p1 = '1') AND (right_p1 = '0')) THEN
						new_state_p1 <= attempt_to_left;
					ELSIF ((down_p1 = '0') AND (up_p1 = '1') AND (left_p1 = '0') AND (right_p1 = '0')) THEN
						new_state_p1 <= attempt_to_up;
					ELSIF ((down_p1 = '1') AND (up_p1 = '0') AND (left_p1 = '0') AND (right_p1 = '0')) THEN
						new_state_p1 <= attempt_to_down;
					ELSE
						new_state_p1 <= which_direction;
					END IF;
					--attempt states: assign the tile where te players wants to go to check, so that it will be checked for obstacles

				WHEN attempt_to_right => 
					begin_counting_p1 <= '0';
					new_x_p1   <= x_p1;
					new_y_p1   <= y_p1;
					check_x_p1 <= std_logic_vector(unsigned(x_p1) + "0001");
					check_y_p1 <= y_p1;
					if(std_logic_vector(unsigned(x_p1) + "0001") = "1001" AND y_p1 = "0001") THEN
						new_state_p1 <= output_portal_top;
					else
						new_state_p1 <= right_output;
					END IF;

				WHEN attempt_to_left => 
					begin_counting_p1 <= '0';
					new_x_p1   <= x_p1;
					new_y_p1   <= y_p1;
					check_x_p1 <= std_logic_vector(unsigned(x_p1) - "0001");
					check_y_p1 <= y_p1;
					if (std_logic_vector(unsigned(x_p1) - "0001") = "0001" AND y_p1 = "1001") THEN
						new_state_p1 <= output_portal_bottom;
					else
						new_state_p1 <= left_output;
					END IF;

				WHEN attempt_to_up => 
					begin_counting_p1 <= '0';
					new_x_p1   <= x_p1;
					new_y_p1   <= y_p1;
					check_x_p1 <= x_p1;
					check_y_p1 <= std_logic_vector(unsigned(y_p1) - "0001");
					if(x_p1 = "1001" AND std_logic_vector(unsigned(y_p1) - "0001") = "0001") THEN
						new_state_p1 <= output_portal_top;
					else
						new_state_p1 <= up_output;
					END IF;

				WHEN attempt_to_down => 
					begin_counting_p1 <= '0';
					new_x_p1   <= x_p1;
					new_y_p1   <= y_p1;
					check_x_p1 <= (x_p1);
					check_y_p1 <= std_logic_vector(unsigned(y_p1) + "0001");
					if (x_p1 = "0001" AND std_logic_vector(unsigned(y_p1) + "0001") = "1001") THEN
						new_state_p1 <= output_portal_bottom;
					else
						new_state_p1 	<= down_output;
					END IF;
					
				WHEN no_attempt =>
					begin_counting_p1 <= '0';
					new_x_p1   <= x_p1;
					new_y_p1   <= y_p1;
					check_x_p1 <= x_p1;
					check_y_p1 <= y_p1;
					new_state_p1 <= stay_output;

				--- output states: here the intermediate signal is  given the new value of the player

				WHEN right_output => 
					begin_counting_p1 <= '0';
					check_x_p1 <= "0000";
					check_y_p1 <= "0000";
					IF (move_p1 = '1') THEN --the collision scanner has cleared the tile so the x coordinate is one bit higher now
						new_x_p1   <= std_logic_vector(unsigned(x_p1) + "0001");
						new_y_p1   <= y_p1;
					ELSE
						new_x_p1 <= x_p1; --else the players stays were he was
						new_y_p1   <= y_p1;
					END IF;
					new_state_p1 <= cooldown_state;

				WHEN left_output => 
					begin_counting_p1 <= '0';
					check_x_p1 <= "0000";
					check_y_p1 <= "0000";
					IF (move_p1 = '1') THEN
						new_x_p1   <= std_logic_vector(unsigned(x_p1) - "0001");
						new_y_p1   <= y_p1;
					ELSE
						new_x_p1	<= x_p1;
						new_y_p1   <= y_p1;
					END IF;
					new_state_p1 <= cooldown_state;
					
				WHEN up_output => 
					begin_counting_p1 <= '0';
					check_x_p1 <= "0000";
					check_y_p1 <= "0000";
					IF (move_p1 = '1') THEN
						new_x_p1   <= x_p1;
						new_y_p1   <= std_logic_vector(unsigned(y_p1) - "0001");
					ELSE
						new_x_p1	<= x_p1;
						new_y_p1   <= y_p1;
					END IF;
					new_state_p1 <= cooldown_state;						

				WHEN down_output => 
					begin_counting_p1 <= '0';
					check_x_p1 <= "0000";
					check_y_p1 <= "0000";
					IF (move_p1 = '1') THEN
						new_x_p1   <= x_p1;
						new_y_p1   <= std_logic_vector(unsigned(y_p1) + "0001");
					ELSE
						new_x_p1	<= x_p1;
						new_y_p1   <= y_p1;
					END IF;
					new_state_p1 <= cooldown_state;									

				WHEN stay_output => 
					begin_counting_p1 <= '0';
					check_x_p1 <= "0000";
					check_y_p1 <= "0000";
					IF (move_p1 = '1') THEN
						new_x_p1   <= x_p1;
						new_y_p1   <= y_p1;
					ELSE
						new_x_p1	<= x_p1;
						new_y_p1   <= y_p1;
					END IF;
					new_state_p1 <= cooldown_state;	

				WHEN output_portal_bottom =>
					begin_counting_p1 <= '0';
					check_x_p1 <= "0000";
					check_y_p1 <= "0000";
					new_x_p1 <= "1001";
					new_y_p1 <= "0001";
					new_state_p1 <= cooldown_state;	

				WHEN output_portal_top =>
					begin_counting_p1 <= '0';
					check_x_p1 <= "0000";
					check_y_p1 <= "0000";
					new_x_p1 <= "0001";
					new_y_p1 <= "1001";
					new_state_p1 <= cooldown_state;	
				--cooldown state: here the player will remain on the same spot until the cooldown has passed
				WHEN cooldown_state =>
					begin_counting_p1 <= '1';
					new_x_p1   <= x_p1;
					new_y_p1   <= y_p1;
					check_x_p1 <= "0000";
					check_y_p1 <= "0000";
					IF (count_players_p1 = cooldown_end) THEN
						new_state_p1 <= which_direction;
					ELSE
						new_state_p1 <= cooldown_state;
					END IF;

				END CASE;	
					
			END PROCESS;
		-----Collision scanner: this looks for obstacles at the tile of check_x and y of P1.
		PROCESS (walls_and_crates_inverted, check_x_p1, check_y_p1, bomb_x_a, bomb_y_a, bomb_a_active, bomb_x_b, bomb_y_b, bomb_b_active, bomb_x_c, bomb_y_c, bomb_c_active, bomb_x_d, bomb_y_d, bomb_d_active, bomb_x_e, bomb_y_e, bomb_e_active, bomb_x_f, bomb_y_f, bomb_f_active, bomb_x_g, bomb_y_g, bomb_g_active, bomb_x_h, bomb_y_h, bomb_h_active, clk, reset)
			
		BEGIN
			IF rising_edge (clk) THEN
				IF reset = '1' THEN -- reset the whole system
					move_p1 <= '0';
				ELSE
					IF (
					 (walls_and_crates_inverted(to_integer(unsigned(check_x_p1)) + to_integer(unsigned(check_y_p1)) * 11) = '0')
					 	AND (bomb_x_a /= std_logic_vector(check_x_p1) OR (bomb_y_a /= std_logic_vector(check_y_p1)) OR (bomb_a_active = '0'))
						AND (bomb_x_b /= std_logic_vector(check_x_p1) OR (bomb_y_b /= std_logic_vector(check_y_p1)) OR(bomb_b_active = '0'))
					 	AND (bomb_x_c /= std_logic_vector(check_x_p1) OR (bomb_y_c /= std_logic_vector(check_y_p1)) OR(bomb_c_active = '0'))
						AND (bomb_x_d /= std_logic_vector(check_x_p1) OR (bomb_y_d /= std_logic_vector(check_y_p1)) OR(bomb_d_active = '0'))
						AND (bomb_x_e /= std_logic_vector(check_x_p1) OR (bomb_y_e /= std_logic_vector(check_y_p1)) OR(bomb_e_active = '0'))
						AND (bomb_x_f /= std_logic_vector(check_x_p1) OR (bomb_y_f /= std_logic_vector(check_y_p1)) OR(bomb_f_active = '0'))
						AND (bomb_x_g /= std_logic_vector(check_x_p1) OR (bomb_y_g /= std_logic_vector(check_y_p1)) OR(bomb_g_active = '0'))
						AND (bomb_x_h /= std_logic_vector(check_x_p1) OR (bomb_y_h /= std_logic_vector(check_y_p1)) OR(bomb_h_active = '0'))
						) THEN
						move_p1 <= '1';--player may move
					ELSE
						move_p1 <= '0';--player can't move
					END IF;
				END IF;
			END IF;
		END PROCESS;
--this process is the same as  before but for P2
PROCESS (right_p2, left_p2, up_p2, down_p2, dir_p2_state, new_x_p2, new_y_p2, x_p2, y_p2, move_p2, count_players_p2)
		BEGIN
			CASE dir_p2_state IS
				WHEN begin_state => 
					begin_counting_p2 <= '0';
					new_state_p2  <= which_direction;
					check_x_p2 <= "0000";--the value of check_x and y are irrelevant as check_x will not be use right now
					check_y_p2 <= "0000";
					new_x_p2   <= "1001";
					new_y_p2   <= "1001";

				WHEN which_direction => --the intended direction of the player is determined
					begin_counting_p2 <= '0';
					check_x_p2 <= "0000";
					check_y_p2 <= "0000";
					new_x_p2   <= x_p2;
					new_y_p2   <= y_p2;
					IF ((down_p2 = '0') AND (up_p2 = '0') AND (left_p2 = '0') AND (right_p2 = '1')) THEN
						new_state_p2 <= attempt_to_right;
					ELSIF ((down_p2 = '0') AND (up_p2 = '0') AND (left_p2 = '1') AND (right_p2 = '0')) THEN
						new_state_p2 <= attempt_to_left;
					ELSIF ((down_p2 = '0') AND (up_p2 = '1') AND (left_p2 = '0') AND (right_p2 = '0')) THEN
						new_state_p2 <= attempt_to_up;
					ELSIF ((down_p2 = '1') AND (up_p2 = '0') AND (left_p2 = '0') AND (right_p2 = '0')) THEN
						new_state_p2 <= attempt_to_down;
					ELSE
						new_state_p2 <= which_direction;
					END IF;
					--attempt states: assign the tile where te players wants to go to check, so that it will be checked for obstacles

				WHEN attempt_to_right => 
					begin_counting_p2 <= '0';
					new_x_p2   <= x_p2;
					new_y_p2   <= y_p2;
					check_x_p2 <= std_logic_vector(unsigned(x_p2) + "0001");
					check_y_p2 <= y_p2;
					if(std_logic_vector(unsigned(x_p2) + "0001") = "1001" AND y_p2 = "0001") THEN--teleport from the right bottom tile
						new_state_p2 <= output_portal_top;
					else
						new_state_p2 <= right_output;
					END IF;

				WHEN attempt_to_left => 
					begin_counting_p2 <= '0';
					new_x_p2   <= x_p2;
					new_y_p2   <= y_p2;
					check_x_p2 <= std_logic_vector(unsigned(x_p2) - "0001");
					check_y_p2 <= y_p2;
					if (std_logic_vector(unsigned(x_p2) - "0001") = "0001" AND y_p2 = "1001") THEN--teleport from the left bottom tile
						new_state_p2 <= output_portal_bottom;
					else
						new_state_p2 <= left_output;
					END IF;

				WHEN attempt_to_up => 
					begin_counting_p2 <= '0';
					new_x_p2   <= x_p2;
					new_y_p2   <= y_p2;
					check_x_p2 <= x_p2;
					check_y_p2 <= std_logic_vector(unsigned(y_p2) - "0001");
					if(x_p2 = "1001" AND std_logic_vector(unsigned(y_p2) - "0001") = "0001") THEN
						new_state_p2 <= output_portal_top;
					else
						new_state_p2 <= up_output;
					END IF;

				WHEN attempt_to_down => 
					begin_counting_p2 <= '0';
					new_x_p2   <= x_p2;
					new_y_p2   <= y_p2;
					check_x_p2 <= x_p2;
					check_y_p2 <= std_logic_vector(unsigned(y_p2) + "0001");
					if (x_p2 = "0001" AND std_logic_vector(unsigned(y_p2) + "0001") = "1001") THEN
						new_state_p2 <= output_portal_bottom;
					else
						new_state_p2 	<= down_output;
					END IF;
					
				WHEN no_attempt =>
					begin_counting_p2 <= '0';
					new_x_p2   <= x_p2;
					new_y_p2   <= y_p2;
					check_x_p2 <= x_p2;
					check_y_p2 <= y_p2;
					new_state_p2 <= stay_output;

				--- output states: here the intermediate signal is  given the new value of the player

				WHEN right_output => 
					begin_counting_p2 <= '0';
					check_x_p2 <= "0000";
					check_y_p2 <= "0000";
					IF (move_p2 = '1') THEN --the collision scanner has cleared the tile so the x coordinate is one bit higher now
						new_x_p2   <= std_logic_vector(unsigned(x_p2) + "0001");
						new_y_p2   <= y_p2;
					ELSE
						new_x_p2 <= x_p2; --else the players stays were he was
						new_y_p2   <= y_p2;
					END IF;
					new_state_p2 <= cooldown_state;

				WHEN left_output => 
					begin_counting_p2 <= '0';
					check_x_p2 <= "0000";
					check_y_p2 <= "0000";
					IF (move_p2 = '1') THEN
						new_x_p2   <= std_logic_vector(unsigned(x_p2) - "0001");
						new_y_p2   <= y_p2;
					ELSE
						new_x_p2	<= x_p2;
						new_y_p2   <= y_p2;
					END IF;
					new_state_p2 <= cooldown_state;
					
				WHEN up_output => 
					begin_counting_p2 <= '0';
					check_x_p2 <= "0000";
					check_y_p2 <= "0000";
					IF (move_p2 = '1') THEN
						new_x_p2   <= x_p2;
						new_y_p2   <= std_logic_vector(unsigned(y_p2) - "0001");
					ELSE
						new_x_p2	<= x_p2;
						new_y_p2   <= y_p2;
					END IF;
					new_state_p2 <= cooldown_state;						

				WHEN down_output => 
					begin_counting_p2 <= '0';
					check_x_p2 <= "0000";
					check_y_p2 <= "0000";
					IF (move_p2 = '1') THEN
						new_x_p2   <= x_p2;
						new_y_p2   <= std_logic_vector(unsigned(y_p2) + "0001");
					ELSE
						new_x_p2	<= x_p2;
						new_y_p2   <= y_p2;
					END IF;
					new_state_p2 <= cooldown_state;									

				WHEN stay_output => 
					begin_counting_p2 <= '0';
					check_x_p2 <= "0000";
					check_y_p2 <= "0000";
					IF (move_p2 = '1') THEN
						new_x_p2   <= x_p2;
						new_y_p2   <= y_p2;
					ELSE
						new_x_p2	<= x_p2;
						new_y_p2   <= y_p2;
					END IF;
					new_state_p2 <= cooldown_state;	

				WHEN output_portal_bottom =>--is being teleported to the upper right corner
					begin_counting_p2 <= '0';
					check_x_p2 <= "0000";
					check_y_p2 <= "0000";
					new_x_p2 <= "1001";
					new_y_p2 <= "0001";
					new_state_p2 <= cooldown_state;	

				WHEN output_portal_top =>--is being teleported to the upper left corner
					begin_counting_p2 <= '0';
					check_x_p2 <= "0000";
					check_y_p2 <= "0000";
					new_x_p2 <= "0001";
					new_y_p2 <= "1001";
					new_state_p2 <= cooldown_state;	
				--cooldown state: here the player will remain on the same spot until the cooldown has passed
				WHEN cooldown_state =>
					begin_counting_p2 <= '1';
					new_x_p2   <= x_p2;
					new_y_p2   <= y_p2;
					check_x_p2 <= "0000";
					check_y_p2 <= "0000";
					IF (count_players_p2 = cooldown_end) THEN
						new_state_p2 <= which_direction;
					ELSE
						new_state_p2 <= cooldown_state;
					END IF;

				END CASE;	
					
			END PROCESS;
		------------- Check if there's an obstacle for p2
		PROCESS (walls_and_crates_inverted, check_x_p2, check_y_p2, bomb_x_a, bomb_y_a, bomb_a_active, bomb_x_b, bomb_y_b, bomb_b_active, bomb_x_c, bomb_y_c, bomb_c_active, bomb_x_d, bomb_y_d, bomb_d_active, bomb_x_e, bomb_y_e, bomb_e_active, bomb_x_f, bomb_y_f, bomb_f_active, bomb_x_g, bomb_y_g, bomb_g_active, bomb_x_h, bomb_y_h, bomb_h_active, clk, reset)	
		BEGIN
			IF rising_edge (clk) THEN
				IF reset = '1' THEN -- reset the whole system
					move_p2 <= '0';
				ELSE
					IF (
					 (walls_and_crates_inverted(to_integer(unsigned(check_x_p2)) + to_integer(unsigned(check_y_p2)) * 11) = '0')
					 	AND (bomb_x_a /= std_logic_vector(check_x_p2) OR (bomb_y_a /= std_logic_vector(check_y_p2)) OR (bomb_a_active = '0'))
						AND (bomb_x_b /= std_logic_vector(check_x_p2) OR (bomb_y_b /= std_logic_vector(check_y_p2)) OR(bomb_b_active = '0'))
					 	AND (bomb_x_c /= std_logic_vector(check_x_p2) OR (bomb_y_c /= std_logic_vector(check_y_p2)) OR(bomb_c_active = '0'))
						AND (bomb_x_d /= std_logic_vector(check_x_p2) OR (bomb_y_d /= std_logic_vector(check_y_p2)) OR(bomb_d_active = '0'))
						AND (bomb_x_e /= std_logic_vector(check_x_p2) OR (bomb_y_e /= std_logic_vector(check_y_p2)) OR(bomb_e_active = '0'))
						AND (bomb_x_f /= std_logic_vector(check_x_p2) OR (bomb_y_f /= std_logic_vector(check_y_p2)) OR(bomb_f_active = '0'))
						AND (bomb_x_g /= std_logic_vector(check_x_p2) OR (bomb_y_g /= std_logic_vector(check_y_p2)) OR(bomb_g_active = '0'))
						AND (bomb_x_h /= std_logic_vector(check_x_p2) OR (bomb_y_h /= std_logic_vector(check_y_p2)) OR(bomb_h_active = '0'))
						) THEN
						move_p2 <= '1';
					ELSE
						move_p2 <= '0';
					END IF;
				END IF;
			END IF;
		END PROCESS;
END hitbox_behaviour;
