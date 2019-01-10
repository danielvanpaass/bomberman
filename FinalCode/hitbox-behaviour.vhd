LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
ARCHITECTURE hitbox_behaviour OF hitbox IS
	TYPE state_type IS (begin_state, which_direction, attempt_to_right, attempt_to_left, attempt_to_up, attempt_to_down, right_output, left_output, up_output, down_output, stay_output, no_attempt, cooldown_state);
	SIGNAL dir_p1_state, new_state_p1                : state_type;
	SIGNAL dir_p2_state, new_state_p2                : state_type;
	SIGNAL check_x_p1, check_y_p1, new_x_p1, new_y_p1, x_p1, y_p1 : std_logic_vector (3 DOWNTO 0);
	SIGNAL check_x_p2, check_y_p2, new_x_p2, new_y_p2, x_p2, y_p2 : std_logic_vector (3 DOWNTO 0);
	SIGNAL begin_counting_p1, begin_counting_p2, move_p1, move_p2                            : std_logic; ---!!!
	SIGNAL count_players_p1, new_count_players_p1, count_players_p2, new_count_players_p2          : unsigned (2 DOWNTO 0);
	SIGNAL walls_and_crates_inverted                 : std_logic_vector(0 TO 120);

	CONSTANT cooldown_end                            : unsigned(2 DOWNTO 0) := "111"; ---"0101111101011110000100"--this equalshalf switch_to_p1,
	--however, for simulation purposes we used much smaller values.
BEGIN
	walls_and_crates_inverted <= walls_and_crates;
	PROCESS (v_clk, reset)
	BEGIN
		IF rising_edge (v_clk) THEN
			IF reset = '1' THEN -- reset the whole system
				dir_p1_state <= begin_state;
				dir_p2_state <= begin_state;
				x_p1			 <= "0001";
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

	--- counter clock
	PROCESS (v_clk, begin_counting_p1)
		BEGIN
			IF rising_edge (v_clk) THEN
				IF (begin_counting_p1 = '0') THEN --so reset should be longer than v_clk cycle
					count_players_p1 <= (OTHERS => '0');
				ELSE
					count_players_p1 <= new_count_players_p1;
				END IF;
			END IF;
		END PROCESS;	
	PROCESS (v_clk, begin_counting_p2)
		BEGIN
			IF rising_edge (v_clk) THEN
				IF (begin_counting_p2 = '0') THEN --so reset should be longer than v_clk cycle
					count_players_p2 <= (OTHERS => '0');
				ELSE
					count_players_p2 <= new_count_players_p2;
				END IF;
			END IF;
		END PROCESS;	

		-- counter for P1 and P2 playtime
	PROCESS (count_players_p1)
		BEGIN
			new_count_players_p1 <= count_players_p1 + 1;
		END PROCESS;
	PROCESS (count_players_p2)
		BEGIN
			new_count_players_p2 <= count_players_p2 + 1;
		END PROCESS;
		x_p1_out <= x_p1;
		x_p2_out <= x_p2;
		y_p1_out <= y_p1;
		y_p2_out <= y_p2;
		
	PROCESS (right_p1, left_p1, up_p1, down_p1, dir_p1_state, new_x_p1, new_y_p1, x_p1, y_p1, move_p1, count_players_p1)
		BEGIN
			CASE dir_p1_state IS
				WHEN begin_state => 
					begin_counting_p1 <= '0';
					new_state_p1  <= which_direction;
					check_x_p1 <= "0000";--- could these be removed? the output of this isnt important at this state
					check_y_p1 <= "0000";--- could these be removed? the output of this isnt important at this state
					new_x_p1   <= "0001";
					new_y_p1   <= "0001";

				WHEN which_direction => 
					begin_counting_p1 <= '0';
					check_x_p1 <= "0000";
					check_y_p1 <= "0000";
					new_x_p1   <= x_p1;
					new_y_p1   <= y_p1;
					IF ((down_p1 = '0') AND (up_p1 = '0') AND (left_p1 = '0') AND (right_p1 = '1')) THEN ---maybe change this back to priority case
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
					--attempt states

				WHEN attempt_to_right => 
					begin_counting_p1 <= '0';
					new_x_p1   <= x_p1;
					new_y_p1   <= y_p1;
					check_x_p1 <= std_logic_vector(unsigned(x_p1) + "0001");
					check_y_p1 <= y_p1;
					new_state_p1 <= right_output;


				WHEN attempt_to_left => 
					begin_counting_p1 <= '0';
					new_x_p1   <= x_p1;
					new_y_p1   <= y_p1;
					check_x_p1 <= std_logic_vector(unsigned(x_p1) - "0001");
					check_y_p1 <= y_p1;
					new_state_p1 <= left_output;

				WHEN attempt_to_up => 
					begin_counting_p1 <= '0';
					new_x_p1   <= x_p1;
					new_y_p1   <= y_p1;
					check_x_p1 <= x_p1;
					check_y_p1 <= std_logic_vector(unsigned(y_p1) - "0001");
					new_state_p1 <= up_output;

				WHEN attempt_to_down => 
					begin_counting_p1 <= '0';
					new_x_p1   <= x_p1;
					new_y_p1   <= y_p1;
					check_x_p1 <= (x_p1);
					check_y_p1 <= std_logic_vector(unsigned(y_p1) + "0001");
					new_state_p1 	<= down_output;
					
				WHEN no_attempt =>
					begin_counting_p1 <= '0';
					new_x_p1   <= x_p1;
					new_y_p1   <= y_p1;
					check_x_p1 <= x_p1;
					check_y_p1 <= y_p1;
					new_state_p1 <= stay_output;

--- output states

				WHEN right_output => 
					begin_counting_p1 <= '0';
					check_x_p1 <= "0000";
					check_y_p1 <= "0000";
					IF (move_p1 = '1') THEN
						new_x_p1   <= std_logic_vector(unsigned(x_p1) + "0001");
						new_y_p1   <= y_p1;
					ELSE
						new_x_p1			<= x_p1;
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
						new_x_p1			<= x_p1;
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
						new_x_p1			<= x_p1;
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
						new_x_p1			<= x_p1;
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
						new_x_p1			<= x_p1;
						new_y_p1   <= y_p1;
					END IF;
					new_state_p1 <= cooldown_state;	
				
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
				------------- Check if there's an obstacle module for P1 (might be a problem that this doesnt update on clock)
		PROCESS (right_p2, left_p2, up_p2, down_p2, dir_p2_state, new_x_p2, new_y_p2, x_p2, y_p2, move_p2, count_players_p2)
		BEGIN
			CASE dir_p2_state IS
				WHEN begin_state => 
					begin_counting_p2 <= '0';
					new_state_p2  <= which_direction;
					check_x_p2 <= "0000";--- could these be removed? the output of this isnt important at this state
					check_y_p2 <= "0000";--- could these be removed? the output of this isnt important at this state
					new_x_p2   <= "1001";
					new_y_p2   <= "1001";

				WHEN which_direction => 
					begin_counting_p2 <= '0';
					check_x_p2 <= "0000";
					check_y_p2 <= "0000";
					new_x_p2   <= x_p2;
					new_y_p2   <= y_p2;
					IF ((down_p2 = '0') AND (up_p2 = '0') AND (left_p2 = '0') AND (right_p2 = '1')) THEN ---maybe change this back to priority case
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
					--attempt states

				WHEN attempt_to_right => 
					begin_counting_p2 <= '0';
					new_x_p2   <= x_p2;
					new_y_p2   <= y_p2;
					check_x_p2 <= std_logic_vector(unsigned(x_p2) + "0001");
					check_y_p2 <= y_p2;
					new_state_p2 <= right_output;


				WHEN attempt_to_left => 
					begin_counting_p2 <= '0';
					new_x_p2   <= x_p2;
					new_y_p2   <= y_p2;
					check_x_p2 <= std_logic_vector(unsigned(x_p2) - "0001");
					check_y_p2 <= y_p2;
					new_state_p2 <= left_output;

				WHEN attempt_to_up => 
					begin_counting_p2 <= '0';
					new_x_p2   <= x_p2;
					new_y_p2   <= y_p2;
					check_x_p2 <= x_p2;
					check_y_p2 <= std_logic_vector(unsigned(y_p2) - "0001");
					new_state_p2 <= up_output;

				WHEN attempt_to_down => 
					begin_counting_p2 <= '0';
					new_x_p2   <= x_p2;
					new_y_p2   <= y_p2;
					check_x_p2 <= (x_p2);
					check_y_p2 <= std_logic_vector(unsigned(y_p2) + "0001");
					new_state_p2 	<= down_output;
					
				WHEN no_attempt =>
					begin_counting_p2 <= '0';
					new_x_p2   <= x_p2;
					new_y_p2   <= y_p2;
					check_x_p2 <= x_p2;
					check_y_p2 <= y_p2;
					new_state_p2 <= stay_output;

--- output states

				WHEN right_output => 
					begin_counting_p2 <= '0';
					check_x_p2 <= "0000";
					check_y_p2 <= "0000";
					IF (move_p2 = '1') THEN
						new_x_p2   <= std_logic_vector(unsigned(x_p2) + "0001");
						new_y_p2   <= y_p2;
					ELSE
						new_x_p2			<= x_p2;
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
						new_x_p2			<= x_p2;
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
						new_x_p2			<= x_p2;
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
						new_x_p2			<= x_p2;
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
						new_x_p2			<= x_p2;
						new_y_p2   <= y_p2;
					END IF;
					new_state_p2 <= cooldown_state;	
				
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
END hitbox_behaviour;
