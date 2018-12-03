library IEEE;
use IEEE.std_logic_1164.ALL;
USE ieee.numeric_std.ALL; 


architecture hitbox_behaviour of hitbox is
type state_type is (begin_state, which_direction, attempt_to_right, attempt_to_left, attempt_to_up, attempt_to_down, right_output, left_output,up_output,down_output);
type switch_type is (begin_state, P1, P2);
SIGNAL dir_state, new_state: state_type;
signal switch_state, new_switch_state: switch_type;
signal new_x_player, new_y_player, x_player, y_player : STD_logic_vector (3 downto 0);
signal check_x_player, check_y_player: std_logic_vector (3 downto 0); 
signal hitbox_count_players: std_logic_vector (11 downto 0);
signal start_hitbox_count_players, move_player, up_player, down_player, right_player, left_player: std_logic;
SIGNAL count_players,  new_count_players : unsigned (11 DOWNTO 0);
begin
 PROCESS (clk)

 BEGIN
  IF rising_edge (clk) THEN 

     if reset = '1' then -- reset the whole system
	dir_state <= begin_state;
	switch_state<= begin_state;
	count_players <= (OTHERS => '0');

	else
	dir_state <= new_state;
	switch_state<= new_switch_state;
	
      END IF;
      if start_hitbox_count_players='0' then
	count_players <= (OTHERS => '0');
	else
	count_players <= new_count_players;
	end if;
  END IF;
END PROCESS;



-- counter for P1 and P2 playtime
 PROCESS (count_players)
 BEGIN
  new_count_players <= count_players + 1;
 END PROCESS;
 hitbox_count_players <= std_logic_vector (count_players);

--------- decides which player is to play
PROCESS (switch_state, hitbox_count_players)
 BEGIN
case switch_state is
	when begin_state=>
		x_player <= "0001";
		y_player <= "0001";
		x_p1 <= "0001";
		y_p1 <= "0001";
		x_p2 <= "1001";
		y_p2 <= "1001";
		new_switch_state <= P1;
		start_hitbox_count_players <= '0';
		up_player <= '0';
		left_player <= '0';
		right_player <= '0';
		down_player <= '0';

	when P1=>

		x_player <= x_p1;
		y_player <= y_p1;
		start_hitbox_count_players <= '1';
		up_player <= up_p1;
		left_player <= left_p1;
		right_player <= right_p1;
		down_player <= down_p1;

		if ((hitbox_count_players = "000000110100")) then --P1 ends his turn
    		new_switch_state <= P2;
		x_p1 <= new_x_player; -- output the new location for P1
		y_p1 <= new_y_player;
  		else
		new_switch_state <= P1;
		end if;
	
	when P2 =>
		--p1_turn <= '0';-- p2 is active
		start_hitbox_count_players <= '1';
		x_player <= x_p2;
		y_player <= y_p2;
		up_player <= up_p2;
		left_player <= left_p2;
		right_player <= right_p2;
		down_player <= down_p2;
		if (hitbox_count_players > "000001110100") then -- should be the above but doubled, for the reset
		start_hitbox_count_players <= '0';--the reset
		new_switch_state<= P1;
    		x_p2<= new_x_player; -- output the new location for P2
		y_p2 <= new_y_player;-- or new_?
		else
		new_switch_state<= P2;
		end if;

end case;

 END PROCESS;
--------------

 process(right_player,left_player, up_player, down_player, dir_state, y_player,  x_player, crates, hitbox_count_players, move_player)
begin

case dir_state is
	when begin_state=>
	new_state <= which_direction;
	new_x_player<=  x_player;
	new_y_player<= y_player;
	check_x_player <= "0000";--- could these be removed? the output of this isnt important at this state
	check_y_player <= "0000";


	when which_direction=>
	check_x_player <= "0000";
	check_y_player <= "0000";
	if (hitbox_count_players = "000000110100" OR (hitbox_count_players > "000001110100")) then--- so dont go to attempt state if new player is inserted in fsm
		new_state <= which_direction;
	else
		if ((down_player = '0') AND (up_player = '0') AND (left_player = '0') AND (right_player = '1'))then  ---maybe change this back to priority case
		new_state <= attempt_to_right;
		elsif ((down_player = '0') AND (up_player = '0') AND (left_player = '1') AND (right_player = '0')) then
		new_state <= attempt_to_left;

		elsif ((down_player = '0') AND (up_player = '1') AND (left_player = '0') AND (right_player = '0')) then
			new_state <= attempt_to_up;

		elsif ((down_player = '1') AND (up_player = '0') AND (left_player = '0') AND (right_player = '0')) then
		new_state <= attempt_to_down;
		else
		check_x_player <= "0000";
		check_y_player <= "0000";
		new_state <= which_direction;
		end if;
	end if;


	--attempt states
	when attempt_to_right =>
		new_x_player<=  x_player;
		new_y_player<= y_player;
		check_x_player <= std_logic_vector(unsigned( x_player)+"0001");
		check_y_player <= (y_player);
		if( move_player = '1' ) then
			new_state <= right_output;
		else 
			new_state <= which_direction;
		end if;
		
	when attempt_to_left =>
		new_x_player<=  x_player;
		new_y_player<= y_player;
		check_x_player <= std_logic_vector(unsigned( x_player)-1);
		check_y_player <= (y_player);
		if( move_player = '1') then
			new_state <= left_output;
		else 
			new_state <= which_direction;
		end if;


	when attempt_to_up =>
		new_x_player<=  x_player;
		new_y_player<= y_player;
		check_x_player <= ( x_player);
		check_y_player <= std_logic_vector(unsigned(y_player)-1);
		if( move_player = '1') then
			new_state <= up_output;
		else 
			new_state <= which_direction;
		end if;

	when attempt_to_down =>
		new_x_player<=  x_player;
		new_y_player<= y_player;
		check_x_player <= ( x_player);
		check_y_player <= std_logic_vector(unsigned(y_player)+1);
		if( move_player = '1') then
			new_state <= down_output;
		else 
			new_state <= which_direction;
		end if;

--- output states
	when right_output =>
		new_x_player <= std_logic_vector(unsigned( x_player)+"0001");
		new_y_player <= y_player;
		check_x_player <= "0000";
		check_y_player <= "0000";
		if (hitbox_count_players = "000000110100" OR (hitbox_count_players > "000001110100")) then -- 
			new_state<=which_direction;
		else
			new_state<= right_output;
		end if;
		
	when left_output =>
		new_x_player <= std_logic_vector(unsigned( x_player)-"0001");
		new_y_player <= y_player;
		check_x_player <= "0000";
		check_y_player <= "0000";
		if (hitbox_count_players = "000000110100" OR (hitbox_count_players > "000001110100")) then -- 
			new_state<=which_direction;
		else
			new_state<= left_output;
		end if;
	when up_output =>
		new_x_player <= x_player;
		new_y_player <= std_logic_vector(unsigned( y_player)-"0001");
		check_x_player <= "0000";
		check_y_player <= "0000";
		if (hitbox_count_players = "000000110100" OR (hitbox_count_players > "000001110100")) then -- 
			new_state<=which_direction;
		else
			new_state<= up_output;
		end if;
	when down_output =>
		new_x_player <= x_player;
		new_y_player <= std_logic_vector(unsigned( y_player)+"0001");
		check_x_player <= "0000";
		check_y_player <= "0000";
		if (hitbox_count_players = "000000110100" OR (hitbox_count_players > "000001110100")) then -- this signal changes when P2 goes to one or 
			new_state<=which_direction;
		else
			new_state<= down_output;
		end if;
	
END CASE;

end process;
 
------------- Check if there's an obstacle module for P1 (might be a problem that this doesnt update on clock)
process (clk, crates, walls, check_x_player, check_y_player, bomb_x_a, bomb_y_a, bomb_a_active, bomb_x_b, bomb_y_b, bomb_b_active)---bomb_x_c, bomb_y_c, bomb_c_active,bomb_x_d, bomb_y_d, bomb_d_active,bomb_x_e, bomb_y_e, bomb_e_active,bomb_x_f, bomb_y_f, bomb_f_active,bomb_x_g, bomb_y_g, bomb_g_active,bomb_x_h, bomb_y_h, bomb_h_active
begin
	if (  
		(   crates(  to_integer(unsigned(check_x_player))+to_integer(unsigned(check_y_player))*11) = '0')
	AND (  walls (  to_integer(unsigned(check_x_player))+to_integer(unsigned(check_y_player))*11) = '0')
	AND (    bomb_x_a /= std_logic_vector(check_x_player) OR (bomb_y_a /= std_logic_vector(check_y_player)) OR ( bomb_a_active = '0' ) )
	AND (    bomb_x_b /= std_logic_vector(check_x_player) OR (bomb_y_b /= std_logic_vector(check_y_player)) OR( bomb_b_active = '0' ) )
	--AND (    bomb_x_c /= std_logic_vector(check_x_player) OR (bomb_y_c /= std_logic_vector(check_y_player)) OR( bomb_c_active = '0' ) )
	--AND (    bomb_x_d /= std_logic_vector(check_x_player) OR (bomb_y_d /= std_logic_vector(check_y_player)) OR( bomb_d_active = '0' ) )
	--AND (    bomb_x_e /= std_logic_vector(check_x_player) OR (bomb_y_e /= std_logic_vector(check_y_player)) OR( bomb_e_active = '0' ) )
	--AND (    bomb_x_f /= std_logic_vector(check_x_player) OR (bomb_y_f /= std_logic_vector(check_y_player)) OR( bomb_f_active = '0' ) )
	--AND (    bomb_x_g /= std_logic_vector(check_x_player) OR (bomb_y_g /= std_logic_vector(check_y_player)) OR( bomb_g_active = '0' ) )
	--AND (    bomb_x_h /= std_logic_vector(check_x_player) OR (bomb_y_h /= std_logic_vector(check_y_player)) OR( bomb_h_active = '0' ) )
	) then
		move_player <= '1';
	else
		move_player <= '0';
	end if;
end process;

end hitbox_behaviour;

