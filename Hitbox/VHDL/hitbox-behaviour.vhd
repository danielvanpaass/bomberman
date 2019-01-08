LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
ARCHITECTURE hitbox_behaviour OF hitbox IS
 TYPE state_type IS (begin_state, which_direction, attempt_to_right, attempt_to_left, attempt_to_up, attempt_to_down, right_output, left_output, up_output, down_output, stay_output);
 TYPE switch_type IS (begin_state, P1, P2, fromP1toP2, fromP2toP1);
 SIGNAL dir_state, new_state : state_type;
 SIGNAL switch_state, new_switch_state : switch_type;
 SIGNAL new_x_player, new_y_player, x_player, y_player : STD_logic_vector (3 DOWNTO 0);
 SIGNAL check_x_player, check_y_player : std_logic_vector (3 DOWNTO 0);
 SIGNAL hitbox_count_players : std_logic_vector (3 DOWNTO 0);
 SIGNAL begin_counting, move_player, up_player, down_player, right_player, left_player, switch_players : std_logic;
 SIGNAL count_players, new_count_players : unsigned (3 DOWNTO 0);
SIGNAL walls_and_crates_inverted : std_logic_vector(0 to 120);
SIGNAL x_p1_local, y_p1_local, x_p2_local, y_p2_local : std_logic_vector( 3 downto 0);
 CONSTANT switch_to_p2 : std_logic_vector := "0011"; ---"0101111101011110000100"--this equalshalf switch_to_p1,
 CONSTANT switch_to_p1 : std_logic_vector := "1000"; --:= "1011111010111100001000"- this equals0.25 seconds, meaning that a full cycle of P1+P2 turn is in 0.25 seconds.
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
    dir_state <= begin_state;
    switch_state <= begin_state;
   ELSE
    dir_state <= new_state;
    switch_state <= new_switch_state;
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
 --------- decides which player is to play
 PROCESS (switch_state, hitbox_count_players)
 BEGIN
  CASE switch_state IS
   WHEN begin_state =>
    switch_players <= '0';
    x_player <= "0001";
    y_player <= "0001";
    x_p1_local <= "0001";
    y_p1_local <= "0001";
    x_p2_local <= "1001";
    y_p2_local <= "1001";
    new_switch_state <= P1;
    begin_counting <= '0';
    up_player <= '0';
    left_player <= '0';
    right_player <= '0';
    down_player <= '0';
   WHEN P1 =>
    x_player <= x_p1_local;
    y_player <= y_p1_local;
    begin_counting <= '1';
    up_player <= up_p1;
    left_player <= left_p1;
    right_player <= right_p1;
    down_player <= down_p1;
    IF ((hitbox_count_players = switch_to_p2)) THEN --P1 ends his turn
     new_switch_state <= fromP1toP2;
    ELSE
     new_switch_state <= P1;
     switch_players <= '0';
    END IF;
   WHEN fromP1toP2 =>
    x_p1_local <= new_x_player;
    y_p1_local <= new_y_player;
    switch_players <= '1';
    new_switch_state <= P2;
    x_player <= new_x_player;--just to not have outputs undefined, the value of x_player shouldnt matter
    y_player <= new_y_player;
   WHEN P2 =>
    begin_counting <= '1';
    x_player <= x_p2_local;
    y_player <= y_p2_local;
    up_player <= up_p2;
    left_player <= left_p2;
    right_player <= right_p2;
    down_player <= down_p2;
    IF (hitbox_count_players = switch_to_p1) THEN -- should be the above but doubled, for the reset
     new_switch_state <= fromP2toP1;

    ELSE
     new_switch_state <= P2;
     switch_players <= '0';
    END IF;
   WHEN fromP2toP1 =>
    new_switch_state <= P1;
    begin_counting <= '0';
    x_p2_local <= new_x_player; -- output the new location for P2
    y_p2_local <= new_y_player;-- or new_?
    switch_players <= '1';
    x_player <= new_x_player;--just to not have outputs undefined, the value of x_player shouldnt matter
    y_player <= new_y_player;
  END CASE;
 END PROCESS;
 --------------
 PROCESS (right_player, left_player, up_player, down_player, dir_state, hitbox_count_players, move_player, switch_players)
 BEGIN
  CASE dir_state IS
   WHEN begin_state =>
    new_state <= which_direction;
    new_x_player <= x_player;--- could these be removed? the output of this isnt important at this state
    new_y_player <= y_player;--- could these be removed? the output of this isnt important at this state
    check_x_player <= "0000";--- could these be removed? the output of this isnt important at this state
    check_y_player <= "0000";--- could these be removed? the output of this isnt important at this state

   WHEN which_direction =>
    check_x_player <= "0000";
    check_y_player <= "0000";
    IF (switch_players = '1') THEN--- so dont go to attempt state if new player is inserted in fsm
     new_state <= which_direction;
    ELSE
     IF ((down_player = '0') AND (up_player = '0') AND (left_player = '0') AND (right_player = '1')) THEN ---maybe change this back to priority case
      new_state <= attempt_to_right;
     ELSIF ((down_player = '0') AND (up_player = '0') AND (left_player = '1') AND (right_player = '0')) THEN
      new_state <= attempt_to_left;
     ELSIF ((down_player = '0') AND (up_player = '1') AND (left_player = '0') AND (right_player = '0')) THEN
      new_state <= attempt_to_up;
     ELSIF ((down_player = '1') AND (up_player = '0') AND (left_player = '0') AND (right_player = '0')) THEN
      new_state <= attempt_to_down;
     ELSE
      new_state <= stay_output;
      new_x_player <= x_player;
      new_y_player <= y_player;
     END IF;
    END IF;
    --attempt states

   WHEN attempt_to_right =>
    new_x_player <= x_player;
    new_y_player <= y_player;
    check_x_player <= std_logic_vector(unsigned(x_player) + "0001");
    check_y_player <= (y_player);
    IF (move_player = '1') THEN
     new_state <= right_output;
    ELSE
     new_state <= stay_output;
    END IF;
   WHEN attempt_to_left =>
    new_x_player <= x_player;
    new_y_player <= y_player;
    check_x_player <= std_logic_vector(unsigned(x_player) - 1);
    check_y_player <= (y_player);
    IF (move_player = '1') THEN
     new_state <= left_output;
    ELSE
     new_state <= stay_output;
    END IF;
   WHEN attempt_to_up =>
    new_x_player <= x_player;
    new_y_player <= y_player;
    check_x_player <= (x_player);
    check_y_player <= std_logic_vector(unsigned(y_player) - 1);
    IF (move_player = '1') THEN
     new_state <= up_output;
    ELSE
     new_state <= stay_output;
    END IF;
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



