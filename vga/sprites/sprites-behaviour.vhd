library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of sprites is
 TYPE state_type IS (begin_state, display_sprite);
 SIGNAL which_sprite, new_state : state_type;
 signal v_map : std_logic_vector (3 downto 0);
signal h_map : std_logic_vector (3 downto 0);
signal coordinates_vector : std_logic_vector (241 downto 0);
signal P_vector, bomb_vector, crate_vector, explosion_vector, wall_vector : std_logic_vector (120 downto 0);
begin
coordinates_vector <= playground_y0&playground_y1&playground_y2&playground_y3&playground_y4&playground_y5&playground_y6&playground_y7&playground_y8&playground_y9&playground_y10;
 v_map <= input_v_map(5 downto 2);
h_map <= input_h_map(4 downto 1);
P_vector <= 
"0011111110001100000110001010101000111111111011111111111111111111111111101111100011011000001110111000011101110000111011100";
bomb_vector <=
"0000001100000000100101000111100000011111100001111001100011111001000111111110001111111100001111110000001111000000011110000";
crate_vector <= 
"1111111111111100000111111100011111011101110110001110001100111110011011101110111110001111111000001111100000001111000000011";
wall_vector <=
"1111101111111111011111111110111110000000000011011111011110111110110000000000011111011111111110111111111101111100000000000";
explosion_vector <=
"1111101111111111011111111110111110000000000011011111011110111110110000000000011111011111111110111111111101111100000000000";
PROCESS (clk, reset)
 BEGIN
  IF rising_edge (clk) THEN
   IF reset = '1' THEN -- reset the whole system
    which_sprite <= begin_state;

   ELSE
    which_sprite <= new_state;
   END IF;
  END IF;
 END PROCESS;

PROCESS (which_sprite)
BEGIN
CASE which_sprite IS
WHEN begin_state =>
    rgb<= "000";
WHEN display_sprite =>
if victory = '1' then
	rgb <= "000";
elsif (y_map = y_p1) and (x_map=x_p1) then
 	if ( P_vector(to_integer(unsigned(h_map)+to_integer(unsigned(v_map))*11)) = '1') then 
		rgb <= "001";
	else
		rgb <= "111";
	end if;
elsif (y_map = y_p2) and (x_map=x_p2) then
 	if ( P_vector(to_integer(unsigned(h_map)+to_integer(unsigned(v_map))*11)) = '1') then 
	rgb <= "100";
	else
	rgb <= "111";
	end if;
elsif   (x_map = x_bomb_a and y_map = y_bomb_a and bomb_a_enable = '1' ) OR --bomb
	(x_map = x_bomb_b and y_map = y_bomb_b and bomb_b_enable = '1' ) OR 
	(x_map = x_bomb_c and y_map = y_bomb_c and bomb_c_enable = '1' ) OR 
	(x_map = x_bomb_d and y_map = y_bomb_d and bomb_d_enable = '1' ) OR 
	(x_map = x_bomb_e and y_map = y_bomb_e and bomb_e_enable = '1' ) OR 
	(x_map = x_bomb_f and y_map = y_bomb_f and bomb_f_enable = '1' ) OR 
	(x_map = x_bomb_g and y_map = y_bomb_g and bomb_g_enable = '1' ) OR 
	(x_map = x_bomb_h and y_map = y_bomb_h and bomb_h_enable = '1' ) then
	if (bomb_vector(to_integer(unsigned(h_map)+to_integer(unsigned(v_map))*11)) = '1') then
	rgb <= "000";
	else
	rgb <= "111";
	end if;	
elsif    coordinates_vector((10-(to_integer(unsigned(y_map)))*11 + (10-to_integer(unsigned(x_map))) * 2 + 1) downto (to_integer(unsigned(y_map))*11 + to_integer(unsigned(x_map)) * 2) ) = "10" then--crate 
	if (crate_vector(to_integer(unsigned(h_map)+to_integer(unsigned(v_map))*11)) = '1') then
	rgb <= "010";
	else
	rgb <= "111";
	end if;	
elsif    coordinates_vector((10-to_integer(unsigned(y_map))*11 + (10-to_integer(unsigned(x_map))) * 2 + 1) downto (to_integer(unsigned(y_map))*11 + to_integer(unsigned(x_map)) * 2) ) = "01" then--empty 
	if (crate_vector(to_integer(unsigned(h_map)+to_integer(unsigned(v_map))*11)) = '1') then
	rgb <= "011";
	else
	rgb <= "111";
	end if;	
--elsif    coordinates_vector((10-to_integer(unsigned(y_map))*11 + to_integer(unsigned(x_map)) * 2 + 1) downto (to_integer(unsigned(y_map))*11 + to_integer(unsigned(x_map)) * 2) ) = "01" then
--	rgb<= "111";-- in case of simple empty tiles
elsif    coordinates_vector((to_integer(unsigned(y_map))*11 + (10-to_integer(unsigned(x_map)) )* 2 + 1) downto (to_integer(unsigned(y_map))*11 + to_integer(unsigned(x_map)) * 2) ) = "00" then--explosion 
	if (explosion_vector(to_integer(unsigned(h_map)+to_integer(unsigned(v_map))*11)) = '1') then
	rgb <= "011";
	else
	rgb <= "111";
	end if;	
else ---must be 11 so wall
	if (wall_vector(to_integer(unsigned(h_map)+to_integer(unsigned(v_map))*11)) = '1') then
	rgb <= "011";
	else
	rgb <= "111";
	end if;	
end if;
end case;
end process;
end behaviour;

