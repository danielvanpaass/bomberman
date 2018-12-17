library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of sprites is
 TYPE state_type IS (begin_state, display_sprite);
 SIGNAL which_sprite, new_state : state_type;
 signal p1_vector, p2_vector, bomb_vector, wall_vector, crate_vector, explosion_vector: std_logic_vector(120 downto 0);
begin
alias v_map : std_logic_vector(4 downto 0) is input_v_map(6 downto 2);
alias h_map : std_logic_vector(3 downto 0) is input_h_map(5 downto 1);
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
if (y_map = y_p1) and (x_map=x_p1) then
 	if ( P1_vector(to_integer(unsigned(h_map)+to_integer(unsigned(v_map))*11)) = '1') then 
	rgb <= "001";
	else
	rgb <= "111";
	end if;
 	elsif ( P2_vector(to_integer(unsigned(h_map)+to_integer(unsigned(v_map))*11)) = '1') then 
	rgb <= "100";
	else
	rgb <= "111";
	end if;
elsif   (x_map = x_bomb_a and y_map = y_bomb_a and bomb_a_enable == '1' ) OR 
	(x_map = x_bomb_b and y_map = y_bomb_b and bomb_b_enable == '1' ) OR 
	(x_map = x_bomb_c and y_map = y_bomb_c and bomb_c_enable == '1' ) OR 
	(x_map = x_bomb_d and y_map = y_bomb_d and bomb_d_enable == '1' ) OR 
	(x_map = x_bomb_e and y_map = y_bomb_e and bomb_e_enable == '1' ) OR 
	(x_map = x_bomb_f and y_map = y_bomb_f and bomb_f_enable == '1' ) OR 
	(x_map = x_bomb_g and y_map = y_bomb_g and bomb_g_enable == '1' ) OR 
	(x_map = x_bomb_h and y_map = y_bomb_h and bomb_h_enable == '1' ) then
	if (bomb_vector(to_integer(unsigned(h_map)+to_integer(unsigned(v_map))*11)) = '1') then
	rgb <= "000";
	else
	rgb <= "111";
	end if;
elsif  (play(to_integer(unsigned(h_map)+to_integer(unsigned(v_map))*11)) = '1'x_map)  
		
	
	end if;

end if;
end case;
end process;
end behaviour;

