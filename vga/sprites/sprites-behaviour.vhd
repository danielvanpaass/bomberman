library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of sprites is
 signal v_map : std_logic_vector (3 downto 0);
signal h_map : std_logic_vector (3 downto 0);
signal coordinates_vector : std_logic_vector (241 downto 0);
signal P_vector, bomb_vector, crate_vector, explosion_vector, wall_vector : std_logic_vector (120 downto 0);
begin
v_map <= input_v_map(5 downto 2);
h_map <= input_h_map(4 downto 1);
P_vector <= 
"0011111110000111111100011000001100110101011000101010100011111111101111111111111111111111111110111110001101100000111011100";
bomb_vector <=
"0000001100000000100101000001000100001111000000111111000011110011000111110010001111111100011111111000011111100000011110000";
crate_vector <= 
"1111111111111100000111111100011111011101110110011111001100011100011001111100110111011101111100011111110000011111000000011";
wall_vector <=
"1111101111111111011111111110111110000000000011011111011110111110110000000000011111011111111110111111111101111100000000000";
explosion_vector <=
"0000000110001100010010100111000011001010000101100100001001000100100110000110010010001100100111100100111001001000000001100";

PROCESS (victory, playground, x_p1, y_p1, x_bomb_a , y_bomb_a, bomb_a_enable, x_bomb_b, y_bomb_b, bomb_b_enable, x_bomb_c,  y_bomb_c, bomb_c_enable, x_bomb_d, y_bomb_d, bomb_d_enable, x_bomb_e, y_bomb_e, bomb_e_enable, x_bomb_f, y_bomb_f ,bomb_f_enable , x_bomb_g, y_bomb_g, bomb_g_enable, x_bomb_h, y_bomb_h, bomb_h_enable, x_map, y_map, h_map, v_map)
BEGIN

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
elsif    coordinates_vector(((10-(to_integer(unsigned(y_map)))*11 + (10-to_integer(unsigned(x_map))) * 2 + 1) = "1") AND  ((to_integer(unsigned(y_map))*11 + to_integer(unsigned(x_map)) * 2) ) = "0") then--crate 
	if (crate_vector(to_integer(unsigned(h_map)+to_integer(unsigned(v_map))*11)) = '1') then
	rgb <= "110";
	else
	rgb <= "111";
	end if;	
elsif    coordinates_vector((10-to_integer(unsigned(y_map))*11 + (10-to_integer(unsigned(x_map))) * 2 + 1) downto (to_integer(unsigned(y_map))*11 + to_integer(unsigned(x_map)) * 2) ) = "01" then--empty 
	rgb <= "111";
elsif    coordinates_vector((to_integer(unsigned(y_map))*11 + (10-to_integer(unsigned(x_map)) )* 2 + 1) downto (to_integer(unsigned(y_map))*11 + to_integer(unsigned(x_map)) * 2) ) = "00" then--explosion 
	if (explosion_vector(to_integer(unsigned(h_map)+to_integer(unsigned(v_map))*11)) = '1') then
	rgb <= "000";
	else
	rgb <= "111";
	end if;	
else ---must be 11 so wall
	if (wall_vector(to_integer(unsigned(h_map)+to_integer(unsigned(v_map))*11)) = '1') then
	rgb <= "000";
	else
	rgb <= "111";
	end if;
end if;	
end process;
end behaviour;



