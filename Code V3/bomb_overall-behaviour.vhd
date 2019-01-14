library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of bomb_overall is
	type explosion_bomb_output is (RESET_STATE, BUFF, OUTPUT_HIGH, WAIT_STATE, WAIT1, WAIT2, WAIT3);

component buffer_bomb
	port (  clk	: in std_logic;
		reset: in std_logic;
		b_input: in std_logic;
		b_output: out std_logic);
end component;

component bomb_timer_main is
   port(clk        : in  std_logic;
	clk_30	   : in  std_logic;
	timer1	   : in  std_logic;
	reset 	   : in std_logic;
        explosion  : out std_logic;
	fin_explosion: out std_logic);
end component;

		
signal explosionb1, explosionb2, explosionb3, explosionb4, explosionb5, explosionb6, explosionb7, explosionb8: std_logic;
signal buff_p1_inb, buff_p2_inb : std_logic;	
signal new_explosion_bomb, explosion_bomb_buf_out, new_explosion_bomb_buf_out, explosion_bomb_buf, fin_explosion_b : std_logic_vector(7 downto 0);
signal state, new_state : explosion_bomb_output;
begin

	lb1l: process (clk, reset)
	begin
	if (clk'event and clk = '1') then
		if reset = '1' then
			state <= RESET_STATE;
		else
			state <= new_state;
			explosion_bomb_buf_out <= new_explosion_bomb_buf_out;
		end if;
	end if;
	end process;

	lbl2: process (state, explosion_bomb_buf, lethal_flag)
	begin
	case state is
		when RESET_STATE =>
		new_explosion_bomb_buf_out <= "00000000";
		if explosion_bomb_buf(0) = '1' OR explosion_bomb_buf(1) = '1' OR explosion_bomb_buf(2) = '1' OR explosion_bomb_buf(3) = '1' OR explosion_bomb_buf(4) = '1' OR explosion_bomb_buf(5) = '1' OR explosion_bomb_buf(6) = '1' OR explosion_bomb_buf(7) = '1' then
			new_state <= BUFF;
		else
			new_state <= RESET_STATE; 
		end if;

		when BUFF =>
		new_explosion_bomb_Buf_out <= explosion_bomb_buf;
		if fin_explosion_b(0) = '1' OR fin_explosion_b(1) = '1' OR fin_explosion_b(2) = '1' OR fin_explosion_b(3) = '1' OR fin_explosion_b(4) = '1' OR fin_explosion_b(5) = '1' OR fin_explosion_b(6) = '1' OR fin_explosion_b(7) = '1' then
			new_state <= RESET_STATE;
		else
			new_state <= WAIT_STATE;
		end if;
	
		when WAIT_STATE =>
		new_explosion_bomb_buf_out <= explosion_bomb_buf_out;
		if lethal_flag = '1' then
			new_state <= OUTPUT_HIGH;
		else
			new_state <= WAIT_STATE;
		end if;
		
		when OUTPUT_HIGH =>
		new_explosion_bomb_buf_out <= explosion_bomb_buf_out;
		if lethal_flag = '0' then
			new_state <= WAIT1;
		else
			new_state <= OUTPUT_HIGH;
		end if;
	
		when WAIT1 =>
		new_explosion_bomb_buf_out <= explosion_bomb_buf_out;
		if lethal_flag = '0' then
			new_state <= WAIT2;
		else
			new_state <= OUTPUT_HIGH;
		end if;

		when WAIT2 =>
		new_explosion_bomb_buf_out <= explosion_bomb_buf_out;
		if lethal_flag = '0' then
			new_state <= WAIT3;
		else
			new_state <= OUTPUT_HIGH;
		end if;

		when WAIT3 =>
		new_explosion_bomb_buf_out <= explosion_bomb_buf_out;
		if lethal_flag = '0' then
			new_state <= RESET_STATE;
		else
			new_state <= OUTPUT_HIGH;
		end if;
	end case;
	end process;

explosion_bomb <= explosion_bomb_buf_out;
fin_explosion_bomb <= fin_explosion_b;

buff_p1 <= buff_p1_inb;
buff_p2 <= buff_p2_inb;
BUFF1 : buffer_bomb port map (clk, reset, bombp1, buff_p1_inb);		-- Buffer input player 1
BUFF2 : buffer_bomb port map (clk, reset, bombp2, buff_p2_inb);  -- Buffer input player 2

timer1: bomb_timer_main port map (clk, clk_30, timer_p1(0), reset, explosion_bomb_buf(0), fin_explosion_b(0)); 
timer2: bomb_timer_main port map (clk, clk_30, timer_p1(1), reset, explosion_bomb_buf(1), fin_explosion_b(1)); 
timer3: bomb_timer_main port map (clk, clk_30, timer_p1(2), reset, explosion_bomb_buf(2), fin_explosion_b(2)); 
timer4: bomb_timer_main port map (clk, clk_30, timer_p1(3), reset, explosion_bomb_buf(3), fin_explosion_b(3)); 
timer5: bomb_timer_main port map (clk, clk_30, timer_p2(0), reset, explosion_bomb_buf(4), fin_explosion_b(4));  
timer6: bomb_timer_main port map (clk, clk_30, timer_p2(1), reset, explosion_bomb_buf(5), fin_explosion_b(5)); 
timer7: bomb_timer_main port map (clk, clk_30, timer_p2(2), reset, explosion_bomb_buf(6), fin_explosion_b(6)); 
timer8: bomb_timer_main port map (clk, clk_30, timer_p2(3), reset, explosion_bomb_buf(7), fin_explosion_b(7)); 


explosion <= explosion_bomb_buf(0) OR explosion_bomb_buf(1) OR explosion_bomb_buf(2) OR explosion_bomb_buf(3) OR explosion_bomb_buf(4) OR explosion_bomb_buf(5) OR explosion_bomb_buf(6) OR explosion_bomb_buf(7); -- 4 input OR gate

b_placed <= bombp1 OR bombp2;

end behaviour;

