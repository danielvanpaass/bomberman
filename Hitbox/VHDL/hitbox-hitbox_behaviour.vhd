library IEEE;
use IEEE.std_logic_1164.ALL;

architecture hitbox_behaviour of hitbox is
type state_type is
signal check_crate_x, check_crate_y: std_logic_vector(3 downto 0);
begin
 PROCESS (clk)
 BEGIN
  IF rising_edge (clk) THEN -- only on clock rising edge
     if reset = '1' then
	dir_state_p1 <= begin_state;
	dir_state_p2 <= begin_state;
      else
	dir_state_p1 <= new_state;
	dir_state_p2 <= new_state;
   END IF;
  END IF;
END PROCESS;
combinatorial: process(state,)
begin
case dir_state_p1 is
	when begin_state=>
		new_x_p1 <= "0000";
		new_y_p1 <= "0000";
		new_state <= which_direction;
	when which_direction=>
	new_x_p1<= old_x_p1;
	new_y_p1<= old_y_p1;
	if right_p1 = '1' then
		new_state <= attempt_to_right;
	when attempt_to_right =>
		new_x_p1<= old_x_p1;
		new_y_p1<= old_y_p1;
		pass_enabled <= not((crates((conv_integer(old_y_p1)) * 11 + conv_integer(old_x_p1)+1))OR(walls((conv_integer(old_y_p1)) * 11 + conv_integer(old_x_p1)+1))
		if pass_enabled = '1' then
			new_state <= right_output;
		else 
			new_state <= which_direction;
		end if;
	when right_output
		new_x_p1 <= std_logic_vector(to_unsigned(to_integer(unsigned( old_x_p1 )) + 1, 4));
		new_y_p1 <= old_y_p1;
end

end hitbox_behaviour;

