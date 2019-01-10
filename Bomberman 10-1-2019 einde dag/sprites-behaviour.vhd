LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ARCHITECTURE behaviour OF sprites IS
	SIGNAL v_map : std_logic_vector (3 DOWNTO 0);
	SIGNAL h_map : std_logic_vector (3 DOWNTO 0);
	SIGNAL P_vector, bomb_vector, crate_vector, explosion_vector, wall_vector , victory_vector_right, victory_vector_1_left, victory_vector_2_left: std_logic_vector (0 TO 120);
	SIGNAL check_1, check_2 : std_logic;
	SIGNAL spritebit : INTEGER RANGE 0 TO 120;
	SIGNAL spritebit_victory : INTEGER RANGE 0 TO 241;
	SIGNAL rgb : std_logic_vector(11 DOWNTO 0);
BEGIN
	v_map <= input_v_map(5 DOWNTO 2);
	h_map <= input_h_map(4 DOWNTO 1);
	victory_vector_1_left <= 			"1010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101";
	victory_vector_2_left <= 			"0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010";
 	victory_vector_right <= 			"0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010";
	P_vector <= 			"0011111110000111111100011000001100110101011000101010100011111111101111111111111111111111111110111110001101100000111011100";
	bomb_vector <= 			"0000001100000000100101000001000100001111000000111111000011110011000111110010001111111100011111111000011111100000011110000";
	crate_vector <=			"1111111111111100000111111100011111011101110110011111001100011100011001111100110111011101111100011111110000011111111111111";
	wall_vector <= 			"1111101111111111011111111110111110000000000011011111011110111110110000000000011111011111111110111111111101111100000000000";
	explosion_vector <= 			"0000000110001100010010100111000011001010000101100100001001000100100110000110010010001100100111100100111001001000000001100";
	check_1 <= playground((10 - to_integer(unsigned(y_map))) * 22 + (10 - to_integer(unsigned(x_map))) * 2);
	check_2 <= playground((10 - to_integer(unsigned(y_map))) * 22 + ((10 - to_integer(unsigned(x_map))) * 2) + 1);
	spritebit <= (((to_integer(unsigned(h_map))) + (to_integer(unsigned(v_map)) * 11)));
						
	PROCESS (clk, reset, victory, playground, x_p1, y_p1, x_bomb_a, y_bomb_a, bomb_a_enable, x_bomb_b, y_bomb_b, bomb_b_enable, x_bomb_c, y_bomb_c, bomb_c_enable, x_bomb_d, y_bomb_d, bomb_d_enable, x_bomb_e, y_bomb_e, bomb_e_enable, x_bomb_f, y_bomb_f, bomb_f_enable, x_bomb_g, y_bomb_g, bomb_g_enable, x_bomb_h, y_bomb_h, bomb_h_enable, x_map, y_map, h_map, v_map, input_h_map, input_v_map)
	BEGIN
		IF rising_edge (clk) THEN
			IF reset = '1' THEN -- reset the whole system
				r <= "0000";
				g <= "0000";
				b <= "0000";
			ELSE
				IF (video_on = '0') THEN
					r <= "0000";
					g <= "0000";
					b <= "0000";
				ELSE
					IF victory(1) = '1' THEN	
						IF(victory(0) = '1') THEN
							IF (x_map = "0100"  AND y_map = "0101") THEN
								IF (victory_vector_1_left(spritebit) = '1') THEN
									r <= "1111";
									g <= "1111";
									b <= "1111";
								ELSE 
									r <= "1111";
									g <= "1111";
									b <= "1111";
								END IF;
							ELSIF (x_map = "0101" AND y_map = "0101") THEN
								IF (victory_vector_right(spritebit) = '1') THEN
									r <= "1111";
									g <= "1111";
									b <= "1111";
								ELSE 
									r <= "1111";
									g <= "1111";
									b <= "1111";
								END IF;
							ELSE
								r <= "1111";
								g <= "1111";
								b <= "1111";
							END IF;
						ELSE 		
							IF (x_map = "0101"  AND y_map = "0101") THEN
								IF (victory_vector_2_left(spritebit) = '1') THEN
									r <= "0000";
									g <= "0000";
									b <= "0000";
								ELSE 
									r <= "0000";
									g <= "0000";
									b <= "0000";
								END IF;
							ELSIF (x_map = "0101" AND y_map = "0101") THEN
								IF (victory_vector_right(spritebit) = '1') THEN
									r <= "0000";
									g <= "0000";
									b <= "0000";
								ELSE 
									r <= "0000";
									g <= "0000";
									b <= "0000";
								END IF;
							ELSE
								r <= "0000";
								g <= "0000";
								b <= "0000";
							END IF;
						END IF;
					ELSIF (check_1 = '0') AND (check_2 = '0') THEN--explosion
						IF (explosion_vector(spritebit) = '1') THEN
							r <= "1111";
							g <= "1100";
							b <= "0000";
						ELSE
							r <= "1111";
							g <= "0000";
							b <= "0000";
						END IF; 
					ELSIF (y_map = y_p1) AND (x_map = x_p1) THEN
						IF (P_vector(spritebit) = '1') THEN
							r <= "1111";
							g <= "0000";
							b <= "0000";
						ELSE
							r <= "0000";
							g <= "1001";
							b <= "0000";
						END IF;
					ELSIF (y_map = y_p2) AND (x_map = x_p2) THEN
						IF (P_vector(spritebit) = '1') THEN
							r <= "0000";
							g <= "0000";
							b <= "1111";
						ELSE
							r <= "0000";
							g <= "1001";
							b <= "0000";
						END IF;
					ELSIF (x_map = x_bomb_a AND y_map = y_bomb_a AND bomb_a_enable = '1') OR --bomb
						(x_map = x_bomb_b AND y_map = y_bomb_b AND bomb_b_enable = '1') OR
						(x_map = x_bomb_c AND y_map = y_bomb_c AND bomb_c_enable = '1') OR
						(x_map = x_bomb_d AND y_map = y_bomb_d AND bomb_d_enable = '1') OR
						(x_map = x_bomb_e AND y_map = y_bomb_e AND bomb_e_enable = '1') OR
						(x_map = x_bomb_f AND y_map = y_bomb_f AND bomb_f_enable = '1') OR
						(x_map = x_bomb_g AND y_map = y_bomb_g AND bomb_g_enable = '1') OR
						(x_map = x_bomb_h AND y_map = y_bomb_h AND bomb_h_enable = '1') THEN
						IF (bomb_vector(spritebit) = '1') THEN
							r <= "0000";
							g <= "0000";
							b <= "0000";
						ELSE
							r <= "0000";
							g <= "1001";
							b <= "0000";
						END IF; 
					ELSIF (check_1 = '0') AND (check_2 = '1') THEN
						IF (crate_vector(spritebit) = '1') THEN--crate
							r <= "1001";
							g <= "0101";
							b <= "0000";
						ELSE
							r <= "0011";
							g <= "0011";
							b <= "0000";
						END IF; 	
					ELSIF (check_1 = '1') AND (check_2 = '0') THEN--empty
							r <= "0000";
							g <= "1001";
							b <= "0000";
					
					ELSIF (check_1 = '1') AND (check_2 = '1') THEN---must be 11 so wall
						IF (wall_vector(spritebit) = '1') THEN
							r <= "1100";
							g <= "0000";
							b <= "0000";
							
						ELSE
							r <= "0111";
							g <= "0111";
							b <= "0111";
						END IF;
					END IF;
				END IF;
			END IF;
		END IF;
	END PROCESS;
END behaviour;

