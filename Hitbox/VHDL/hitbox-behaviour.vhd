LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
ARCHITECTURE hitbox_behaviour OF hitbox IS
 TYPE state_type IS (begin_state, which_direction, attempt_to_right, attempt_to_left, attempt_to_up, attempt_to_down, right_output, left_output, up_output, down_output, stay_output);
 SIGNAL dir_p1_state, new_state_p1 : state_type;
SIGNAL dir_p2_state, new_state_p2 : state_type;
 SIGNAL check_x_p1, check_y_p1 : std_logic_vector (3 DOWNTO 0);
SIGNAL check_x_p2, check_y_p2 : std_logic_vector (3 DOWNTO 0);
 SIGNAL hitbox_count_players : std_logic_vector (2 DOWNTO 0);
 SIGNAL begin_counting : std_logic; ---!!!
 SIGNAL count_players, new_count_players : unsigned (2 DOWNTO 0);
SIGNAL walls_and_crates_inverted : std_logic_vector(0 to 120);

 CONSTANT cooldown_end : std_logic_vector := "111"; ---"0101111101011110000100"--this equalshalf switch_to_p1,
--however, for simulation purposes we used much smaller values.
BEGIN
walls_and_crates_inverted <= walls_and_crates;
x_p1<=x_p1_local;
y_p1<=y_p1_local;
x_p2<=x_p2_local;
y_p2<=y_p2_local;
 PROCESS (v_clk, reset)
 BEGIN
  IF rising_edge (v_clk) THEN
   IF reset = '1' THEN -- reset the whole system
    dir_p1_state <= begin_state;
    dir_p2_state <= begin_state;
   ELSE
    dir_p1_state <= new_state_p1;
    dir_p2_state <= new_state_p2;
   END IF;
  END IF;
 END PROCESS;

--- counter clock
PROCESS (v_clk, begin_counting)
BEGIN
 IF rising_edge (v_clk) THEN
	IF (begin_counting = '0') THEN --so reset should be longer than v_clk cycle
	count_players <= (OTHERS => '0');
	ELSE 
	      count_players <= new_count_players;
	END IF;
  END IF;
 END PROCESS;

 -- counter for P1 and P2 playtime
 PROCESS (count_players)
 BEGIN
  new_count_players <= count_players + 1;
 END PROCESS;
 hitbox_count_players <= std_logic_vector (count_players);

 PROCESS (right_p1, left_p1, up_p1, down_p1, dir_p1_state, hitbox_count_players, x_p1_local, y_p1_local)
 BEGIN
  CASE dir_p1_state IS
   WHEN begin_state =>
    x_p1_local <= "0001";
    y_p1_local <= "0001";
    new_state <= which_direction;
    check_x_p1 <= "0000";--- could these be removed? the output of this isnt important at this state
    check_y_p1 <= "0000";--- could these be removed? the output of this isnt important at this state

   WHEN which_direction =>
    check_x_p1 <= "0000";
    check_y_p1 <= "0000";
    IF ((down_p1 = '0') AND (up_p1 = '0') AND (left_p1 = '0') AND (right_p1 = '1')) THEN ---maybe change this back to priority case
      new_state <= attempt_to_right;
    ELSIF ((down_p1 = '0') AND (up_p1 = '0') AND (left_p1 = '1') AND (right_p1 = '0')) THEN
      new_state <= attempt_to_left;
    ELSIF ((down_p1 = '0') AND (up_p1 = '1') AND (left_p1 = '0') AND (right_p1 = '0')) THEN
      new_state <= attempt_to_up;
    ELSIF ((down_p1 = '1') AND (up_p1 = '0') AND (left_p1 = '0') AND (right_p1 = '0')) THEN
      new_state <= attempt_to_down;
    ELSE
      new_state <= which_direction;
    END IF;
    --attempt states

   WHEN attempt_to_right =>
    new_x_p1 <= x_p1;
    new_y_p1 <= y_p1;
    check_x_p1 <= std_logic_vector(unsigned(x_p1) + "0001");
    check_y_p1 <= (y_p1);
     new_state <= right_output;
   WHEN attempt_to_left =>
    new_x_p1 <= x_p1;
    new_y_p1 <= y_p1;
    check_x_p1 <= std_logic_vector(unsigned(x_p1) - 1);
    check_y_p1 <= (y_p1);
     new_state <= left_output;

   WHEN attempt_to_up =>
    new_x_p1 <= x_p1;
    new_y_p1 <= y_p1;
    check_x_p1 <= (x_p1);
    check_y_p1 <= std_logic_vector(unsigned(y_p1) - 1);
     new_state <= up_output;

   WHEN attempt_to_down =>
    new_x_player <= x_player;
    new_y_player <= y_player;
    check_x_player <= (x_player);
    check_y_player <= std_logic_vector(unsigned(y_player) + 1);
    IF (move_player = '1') THEN
     new_state <= down_output;
    ELSE
     new_state <= stay_output;
    END IF;
    --- output states
   WHEN right_output =>
    new_x_player <= std_logic_vector(unsigned(x_player) + "0001");
    new_y_player <= y_player;
    check_x_player <= "0000";
    check_y_player <= "0000";
    IF (switch_players = '1') THEN --
     new_state <= which_direction;
    ELSE
     new_state <= right_output;
    END IF;
   WHEN left_output =>
    new_x_player <= std_logic_vector(unsigned(x_player) - "0001");
    new_y_player <= y_player;
    check_x_player <= "0000";
    check_y_player <= "0000";
    IF (switch_players = '1') THEN --
     new_state <= which_direction;
    ELSE
     new_state <= left_output;
    END IF;
   WHEN up_output =>
    new_x_player <= x_player;
    new_y_player <= std_logic_vector(unsigned(y_player) - "0001");
    check_x_player <= "0000";
    check_y_player <= "0000";
    IF (switch_players = '1') THEN --
     new_state <= which_direction;
    ELSE
     new_state <= up_output;
    END IF;
   WHEN down_output =>
    new_x_player <= x_player;
    new_y_player <= std_logic_vector(unsigned(y_player) + "0001");
    check_x_player <= "0000";
    check_y_player <= "0000";
    IF (switch_players = '1') THEN -- this signal changes when P2 goes to one or reversed
     new_state <= which_direction;
    ELSE
     new_state <= down_output;
    END IF;
   WHEN stay_output =>
    new_x_player <= x_player;
    new_y_player <= y_player;
    check_x_player <= "0000";
    check_y_player <= "0000";
   IF (switch_players = '1') THEN -- this signal changes when P2 goes to one or reversed
     new_state <= which_direction;
    ELSE
     new_state <= stay_output;
    END IF;
  END CASE;
 END PROCESS;
 ------------- Check if there's an obstacle module for P1 (might be a problem that this doesnt update on clock)
 PROCESS ( walls_and_crates_inverted, check_x_player, check_y_player, bomb_x_a, bomb_y_a, bomb_a_active, bomb_x_b, bomb_y_b, bomb_b_active, bomb_x_c, bomb_y_c, bomb_c_active, bomb_x_d, bomb_y_d, bomb_d_active, bomb_x_e, bomb_y_e, bomb_e_active, bomb_x_f, bomb_y_f, bomb_f_active, bomb_x_g, bomb_y_g, bomb_g_active, bomb_x_h, bomb_y_h, bomb_h_active)
 BEGIN
  IF (
   (walls_and_crates_inverted(to_integer(unsigned(check_x_player)) + to_integer(unsigned(check_y_player)) * 11) = '0')
   AND (bomb_x_a /= std_logic_vector(check_x_player) OR (bomb_y_a /= std_logic_vector(check_y_player)) OR (bomb_a_active = '0'))
   AND (bomb_x_b /= std_logic_vector(check_x_player) OR (bomb_y_b /= std_logic_vector(check_y_player)) OR(bomb_b_active = '0'))
   AND (bomb_x_c /= std_logic_vector(check_x_player) OR (bomb_y_c /= std_logic_vector(check_y_player)) OR(bomb_c_active = '0'))
   AND (bomb_x_d /= std_logic_vector(check_x_player) OR (bomb_y_d /= std_logic_vector(check_y_player)) OR(bomb_d_active = '0'))
   AND (bomb_x_e /= std_logic_vector(check_x_player) OR (bomb_y_e /= std_logic_vector(check_y_player)) OR(bomb_e_active = '0'))
   AND (bomb_x_f /= std_logic_vector(check_x_player) OR (bomb_y_f /= std_logic_vector(check_y_player)) OR(bomb_f_active = '0'))
   AND (bomb_x_g /= std_logic_vector(check_x_player) OR (bomb_y_g /= std_logic_vector(check_y_player)) OR(bomb_g_active = '0'))
   AND (bomb_x_h /= std_logic_vector(check_x_player) OR (bomb_y_h /= std_logic_vector(check_y_player)) OR(bomb_h_active = '0'))
   ) THEN
   move_player <= '1';
  ELSE
   move_player <= '0';
  END IF;
 END PROCESS;
END hitbox_behaviour;



