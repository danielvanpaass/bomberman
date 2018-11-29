library IEEE;
use IEEE.std_logic_1164.ALL;
USE ieee.numeric_std.ALL; 

architecture hitbox_behaviour of hitbox is
type state_type is (begin_state, which_direction, attempt_to_right, attempt_to_left, attempt_to_up, attempt_to_down, right_output, left_output,up_output,down_output, cooldown);
SIGNAL dir_state_p1, dir_state_p2, new_state_p1, new_state_p2 : state_type;
signal new_x_p1, new_y_p1, new_x_p2, new_y_p2 : STD_logic_vector (3 downto 0);
signal check_x_p1, check_y_p1, check_x_p2, check_y_p2: std_logic_vector (3 downto 0); 
signal hitbox_count_p1, hitbox_count_p2: std_logic_vector (11 downto 0);
signal start_hitbox_count_p1, start_hitbox_count_p2, move_p1, move_p2: std_logic;
SIGNAL count_p1, count_p2, new_count_p1, new_count_p2 : unsigned (11 DOWNTO 0);
begin
 PROCESS (clk)

 BEGIN
  IF rising_edge (clk) THEN -- only on clock rising edge
        IF start_hitbox_count_p1 = '0' THEN
         count_p1 <= (OTHERS => '0');
           ELSE
          count_p1 <= new_count_p1;
         END IF;
	IF start_hitbox_count_p2 = '0' THEN
         count_p2 <= (OTHERS => '0');
           ELSE
          count_p2 <= new_count_p2;
         END IF;
     if reset = '1' then
	dir_state_p1 <= begin_state;
	 x_p1 <= "0001";
	y_p1 <= "0001";
	x_p2 <= "1001";
	y_p2 <= "1001";
	dir_state_p2 <= begin_state;
      else
	dir_state_p1 <= new_state_p1;
	 x_p1 <= new_x_p1;
	y_p1 <= new_y_p1;
	x_p2 <= new_x_p2;
	y_p2 <= new_y_p2;
	dir_state_p2 <= new_state_p2;
   END IF;
  END IF;
END PROCESS;
-- cooldown counters P1 and P2
 PROCESS (count_p1)
 BEGIN
  new_count_p1 <= count_p1 + 1;
 END PROCESS;
 hitbox_count_p1 <= std_logic_vector (count_p1);
PROCESS (count_p2)
 BEGIN
  new_count_p2 <= count_p2 + 1;
 END PROCESS;
 hitbox_count_p2 <= std_logic_vector (count_p2);
------------- Check if there's an obstacle module for P1 (might be a problem that this doesnt update on clock)
process (clk, crates, walls, check_x_p1, check_y_p1, bomb_x_a, bomb_y_a, bomb_a_active, bomb_x_b, bomb_y_b, bomb_b_active)---bomb_x_c, bomb_y_c, bomb_c_active,bomb_x_d, bomb_y_d, bomb_d_active,bomb_x_e, bomb_y_e, bomb_e_active,bomb_x_f, bomb_y_f, bomb_f_active,bomb_x_g, bomb_y_g, bomb_g_active,bomb_x_h, bomb_y_h, bomb_h_active
begin
	if (  
		(   crates(unsigned(check_x_p1) + unsigned(check_y_p1)*11) = '0'   )
	AND (  walls (  unsigned(check_x_p1)+unsigned(check_y_p1)*11) = '0')
	AND (    bomb_x_a /= std_logic_vector(check_x_p1) OR (bomb_y_a /= std_logic_vector(check_y_p1)) OR ( bomb_a_active = '0' ) )
	AND (    bomb_x_b /= std_logic_vector(check_x_p1) OR (bomb_y_b /= std_logic_vector(check_y_p1)) OR( bomb_b_active = '0' ) )
	--AND (    bomb_x_c /= std_logic_vector(check_x_p1) OR (bomb_y_c /= std_logic_vector(check_y_p1)) OR( bomb_c_active = '0' ) )
	--AND (    bomb_x_d /= std_logic_vector(check_x_p1) OR (bomb_y_d /= std_logic_vector(check_y_p1)) OR( bomb_d_active = '0' ) )
	--AND (    bomb_x_e /= std_logic_vector(check_x_p1) OR (bomb_y_e /= std_logic_vector(check_y_p1)) OR( bomb_e_active = '0' ) )
	--AND (    bomb_x_f /= std_logic_vector(check_x_p1) OR (bomb_y_f /= std_logic_vector(check_y_p1)) OR( bomb_f_active = '0' ) )
	--AND (    bomb_x_g /= std_logic_vector(check_x_p1) OR (bomb_y_g /= std_logic_vector(check_y_p1)) OR( bomb_g_active = '0' ) )
	--AND (    bomb_x_h /= std_logic_vector(check_x_p1) OR (bomb_y_h /= std_logic_vector(check_y_p1)) OR( bomb_h_active = '0' ) )
	) then
		move_p1 <= '1';
	else
		move_p1 <= '0';
	end if;
end process;
------------and for P2
process (clk, crates, walls, check_x_p2, check_y_p2, bomb_x_a, bomb_y_a, bomb_a_active, bomb_x_b, bomb_y_b, bomb_b_active) --,bomb_x_c, bomb_y_c, bomb_c_active,bomb_x_d, bomb_y_d, bomb_d_active,bomb_x_e, bomb_y_e, bomb_e_active,bomb_x_f, bomb_y_f, bomb_f_active,bomb_x_g, bomb_y_g, bomb_g_active,bomb_x_h, bomb_y_h, bomb_h_active
begin
	if (  ( crates(  to_integer(unsigned(check_x_p2))+to_integer(unsigned(check_y_p2))*11) = '0')
	AND (  walls (  to_integer(unsigned(check_x_p2))+to_integer(unsigned(check_y_p2))*11) = '0')
	AND (    bomb_x_a /= std_logic_vector(check_x_p2) OR (bomb_y_a /= std_logic_vector(check_y_p2))  OR ( bomb_a_active = '0' ) )
	AND (    bomb_x_b /= std_logic_vector(check_x_p2) OR (bomb_y_b /= std_logic_vector(check_y_p2)) OR ( bomb_b_active = '0' ) )
	---AND (    bomb_x_c /= std_logic_vector(check_x_p2) OR (bomb_y_c /= std_logic_vector(check_y_p2)) OR ( bomb_c_active = '0' ) )
	--AND (    bomb_x_d /= std_logic_vector(check_x_p2) OR (bomb_y_d /= std_logic_vector(check_y_p2)) OR ( bomb_d_active = '0' ) )
	--AND (    bomb_x_e /= std_logic_vector(check_x_p2) OR (bomb_y_e /= std_logic_vector(check_y_p2)) OR ( bomb_e_active = '0' ) )
	--AND (    bomb_x_f /= std_logic_vector(check_x_p2) OR (bomb_y_f /= std_logic_vector(check_y_p2)) OR ( bomb_f_active = '0' ) )
	--AND (    bomb_x_g /= std_logic_vector(check_x_p2) OR (bomb_y_g /= std_logic_vector(check_y_p2)) OR ( bomb_g_active = '0' ) )
	--AND (    bomb_x_h /= std_logic_vector(check_x_p2) OR (bomb_y_h /= std_logic_vector(check_y_p2)) OR ( bomb_h_active = '0' ) )
	) then
		move_p2 <= '1';
	else
		move_p2 <= '0';
	end if;
end process;
-------------- 
 process(right_p1,left_p1, up_p1, down_p1, dir_state_p1, y_p1,  x_p1, crates, hitbox_count_p1, move_p1)
begin

case dir_state_p1 is
	when begin_state=>
	new_state_p1 <= which_direction;
	new_x_p1<=  x_p1;
	new_y_p1<= y_p1;
	start_hitbox_count_p1<='0';
	check_x_p1 <= "0000";
	check_y_p1 <= "0000";

	when which_direction=>
	start_hitbox_count_p1<='0';
	check_x_p1 <= "0000";
	check_y_p1 <= "0000";
	new_x_p1<=  x_p1;
	new_y_p1<= y_p1;
	if ((down_p1 = '0') AND (up_p1 = '0') AND (left_p1 = '0') AND (right_p1 = '1'))then
		new_state_p1 <= attempt_to_right;
	elsif ((down_p1 = '0') AND (up_p1 = '0') AND (left_p1 = '1') AND (right_p1 = '0')) then
		new_state_p1 <= attempt_to_left;

	elsif ((down_p1 = '0') AND (up_p1 = '1') AND (left_p1 = '0') AND (right_p1 = '0')) then
		new_state_p1 <= attempt_to_up;

	elsif ((down_p1 = '1') AND (up_p1 = '0') AND (left_p1 = '0') AND (right_p1 = '0')) then
		new_state_p1 <= attempt_to_down;

	else
	check_x_p1 <= "0000";
	check_y_p1 <= "0000";
	new_state_p1 <= which_direction;
	end if;




	--attempt states
	when attempt_to_right =>
		new_x_p1<=  x_p1;
		new_y_p1<= y_p1;
		check_x_p1 <= std_logic_vector(unsigned( x_p1)+"0001");
		check_y_p1 <= (y_p1);
		if( move_p1 = '1') then
			new_state_p1 <= right_output;
		else 
			new_state_p1 <= which_direction;
		end if;
	start_hitbox_count_p1<='0';
	when attempt_to_left =>
		new_x_p1<=  x_p1;
		new_y_p1<= y_p1;
		check_x_p1 <= std_logic_vector(unsigned( x_p1)-1);
		check_y_p1 <= (y_p1);
		if( move_p1 = '1') then
			new_state_p1 <= left_output;
		else 
			new_state_p1 <= which_direction;
		end if;
	start_hitbox_count_p1<='0';

	when attempt_to_up =>
		new_x_p1<=  x_p1;
		new_y_p1<= y_p1;
		check_x_p1 <= ( x_p1);
		check_y_p1 <= std_logic_vector(unsigned(y_p1)-1);
		if( move_p1 = '1') then
			new_state_p1 <= up_output;
		else 
			new_state_p1 <= which_direction;
		end if;
	start_hitbox_count_p1<='0';
	when attempt_to_down =>
		new_x_p1<=  x_p1;
		new_y_p1<= y_p1;
		check_x_p1 <= ( x_p1);
		check_y_p1 <= std_logic_vector(unsigned(y_p1)+1);
		if( move_p1 = '1') then
			new_state_p1 <= down_output;
		else 
			new_state_p1 <= which_direction;
		end if;
	start_hitbox_count_p1<='0';
--- output states
	when right_output =>
		new_state_p1 <= cooldown;
		new_x_p1 <= std_logic_vector(unsigned( x_p1)+"0001");
		new_y_p1 <= y_p1;
		start_hitbox_count_p1<='0';
		check_x_p1 <= "0000";
		check_y_p1 <= "0000";
		
	when left_output =>
		new_state_p1 <= cooldown;
		new_x_p1 <= std_logic_vector(unsigned( x_p1)-"0001");
		new_y_p1 <= y_p1;
	start_hitbox_count_p1<='0';
		check_x_p1 <= "0000";
		check_y_p1 <= "0000";
	when up_output =>
		new_state_p1 <= cooldown;
		new_x_p1 <= x_p1;
		new_y_p1 <= std_logic_vector(unsigned( y_p1)-"0001");
	start_hitbox_count_p1<='0';
		check_x_p1 <= "0000";
		check_y_p1 <= "0000";
	when down_output =>
		new_state_p1 <= cooldown;
		new_x_p1 <= x_p1;
		new_y_p1 <= std_logic_vector(unsigned( y_p1)+"0001");
		check_x_p1 <= "0000";
		check_y_p1 <= "0000";
	start_hitbox_count_p1<='0';
	when cooldown =>
	new_x_p1<=  x_p1;
	new_y_p1<= y_p1;
	start_hitbox_count_p1<='1';
		check_x_p1 <= "0000";
		check_y_p1 <= "0000";
	if (hitbox_count_p1 > "000000010101") then --"110000110101"
		new_state_p1<=which_direction;
	else
		new_state_p1<= cooldown;
	end if;
END CASE;

end process;
 process(right_p2,left_p2, up_p2, down_p2, dir_state_p2, y_p2,  x_p2, crates, hitbox_count_p2,  move_p2)
begin

case dir_state_p2 is
	when begin_state=>
	new_state_p2 <= which_direction;
	new_x_p2<=  x_p2;
	new_y_p2<= y_p2;
	start_hitbox_count_p2<='0';
	check_x_p2 <= "0000";
	check_y_p2 <= "0000";
	when which_direction=>
	new_x_p2<=  x_p2;
	new_y_p2<= y_p2;
	if ((down_p2 = '0') AND (up_p2 = '0') AND (left_p2 = '0') AND (right_p2 = '1'))then
		new_state_p2 <= attempt_to_right;

	elsif ((down_p2 = '0') AND (up_p2 = '0') AND (left_p2 = '1') AND (right_p2 = '0')) then
		new_state_p2 <= attempt_to_left;

	elsif ((down_p2 = '0') AND (up_p2 = '1') AND (left_p2 = '0') AND (right_p2 = '0')) then
		new_state_p2 <= attempt_to_up;

	elsif ((down_p2 = '1') AND (up_p2 = '0') AND (left_p2 = '0') AND (right_p2 = '0')) then
		new_state_p2 <= attempt_to_down;

	else
	new_state_p2 <= which_direction;
	check_x_p2 <= "0000";
	check_y_p2 <= "0000";
	end if;
	start_hitbox_count_p2<='0';
	--attempt states
	when attempt_to_right =>
		new_x_p2<=  x_p2;
		new_y_p2<= y_p2;
		check_x_p2 <= std_logic_vector(unsigned( x_p2)+1);
		check_y_p2 <= (y_p2);
		if( move_p2 = '1') then
			new_state_p2 <= right_output;
		else 
			new_state_p2 <= which_direction;
		end if;
	start_hitbox_count_p2<='0';
	when attempt_to_left =>
		new_x_p2<=  x_p2;
		new_y_p2<= y_p2;
		if( move_p2 = '1') then
			new_state_p2 <= left_output;
		else 
			new_state_p2 <= which_direction;
		end if;
		check_x_p2 <= std_logic_vector(unsigned( x_p2)-1);
		check_y_p2 <= (y_p2);
		start_hitbox_count_p2<='0';

	when attempt_to_up =>
		new_x_p2<=  x_p2;
		new_y_p2<= y_p2;
		if( move_p2 = '1') then
			new_state_p2 <= up_output;
		else 
			new_state_p2 <= which_direction;
		end if;
		check_x_p2 <= ( x_p2);
		check_y_p2 <= std_logic_vector(unsigned(y_p2)-1);
	start_hitbox_count_p2<='0';
	when attempt_to_down =>
		new_x_p2<=  x_p2;
		new_y_p2<= y_p2;
		if( move_p2 = '1') then
			new_state_p2 <= down_output;
		else 
			new_state_p2 <= which_direction;
		end if;
		check_x_p2 <= ( x_p2);
		check_y_p2 <= std_logic_vector(unsigned(y_p2)+1);
		start_hitbox_count_p2<='0';
--- output states
	when right_output =>
		new_state_p2 <= cooldown;
		new_x_p2 <= std_logic_vector(unsigned( x_p2)+"0001");
		new_y_p2 <= y_p2;
		start_hitbox_count_p2<='0';
		check_x_p2 <= "0000";
		check_y_p2 <= "0000";
	when left_output =>
		new_state_p2 <= cooldown;
		new_x_p2 <= std_logic_vector(unsigned( x_p2)-"0001");
		new_y_p2 <= y_p2;
		start_hitbox_count_p2<='0';
		check_x_p2 <= "0000";
		check_y_p2 <= "0000";
	when up_output =>
		new_state_p2 <= cooldown;
		new_x_p2 <= x_p2;
		new_y_p2 <= std_logic_vector(unsigned( y_p2)-"0001");
		start_hitbox_count_p2<='0';
		check_x_p2 <= "0000";
		check_y_p2 <= "0000";
	when down_output =>
		new_state_p2 <= cooldown;
		new_x_p2 <= x_p2;
		new_y_p2 <= std_logic_vector(unsigned( y_p2)+"0001");
		start_hitbox_count_p2<='0';
		check_x_p2 <= "0000";
		check_y_p2 <= "0000";

	when cooldown =>
	start_hitbox_count_p2<='1';
	if (hitbox_count_p2 > "001000110101") then --"110000110101"
		new_state_p2<=which_direction;
	else
		new_state_p2<= cooldown;
	end if;
	new_x_p2<=  x_p2;
	new_y_p2<= y_p2;
	check_x_p2 <= "0000";
	check_y_p2 <= "0000";
END CASE;

end process;

end hitbox_behaviour;
