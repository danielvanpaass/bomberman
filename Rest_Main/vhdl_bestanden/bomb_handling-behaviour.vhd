library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour_bomb_handling of bomb_handling is
	type handling_state is (BOMB_RESET, BOMB_WAIT, TIMER1, TIME_START1, TIMER2, TIME_START2, TIMER5, TIME_START5, TIMER6, TIME_START6, DOUBLE);

component bomb_timer_main is
   port(clk        : in  std_logic;
	timer1	   : in  std_logic;
	reset 	   : in std_logic;
	count_reset: out std_logic;
        explosion  : out std_logic);
end component;

	signal state, new_state: handling_state;
	signal count_r1, count_r2, count_r5, count_r6, timer_start1, timer_start2, timer_start5, timer_start6, dflag: std_logic;
begin
	lbl1: process (clk)
	begin
	if (clk'event and clk = '1') then
		if reset = '1' then
			state <= BOMB_RESET;
		else 
			state <= new_state;
		end if;
	end if;
	end process;

	lbl2: process (state, bombp1, bombp2, count_r1)
	begin
	case state is
		when BOMB_RESET =>
		timer_start1 <= '0';
		timer_start2 <= '0';
		timer_start5 <= '0';
		timer_start6 <= '0';
		dflag <= '0';
		new_state <= BOMB_WAIT;

		when BOMB_WAIT =>
		timer_start1 <= '0';
		timer_start2 <= '0';
		timer_start5 <= '0';
		timer_start6 <= '0';
		dflag <= '0';
		if bombp1 = '1' AND bombp2 = '0' then
			new_state <= TIMER1;
		elsif bombp1 = '0' AND bombp2 = '1' then
			new_state <= TIMER5;
		elsif bombp1 = '1' AND bombp2 = '1' then
			new_state <= DOUBLE;
		else
			new_state <= BOMB_WAIT;
		end if;

		when DOUBLE =>
		timer_start1 <= '0';
		timer_start2 <= '0';
		timer_start5 <= '0';
		timer_start6 <= '0';
		dflag <= '1';
		new_state <= TIMER1;

		when TIMER1 =>
		timer_start1 <= '0';
		timer_start2 <= '0';
		timer_start5 <= '0';
		timer_start6 <= '0';
		dflag <= dflag;
		if count_r1 = '1' then
			new_state <= TIME_START1;
		else 
			new_state <= TIMER2;
		end if;

		when TIME_START1 =>
		timer_start1 <= '1';
		timer_start2 <= '0';
		timer_start5 <= '0';
		timer_start6 <= '0';
		if dflag = '1' then
			new_state <= TIMER5;
		else
			new_state <= BOMB_WAIT;
		end if;

		when TIMER2 =>
		timer_start1 <= '0';
		timer_start2 <= '0';
		timer_start5 <= '0';
		timer_start6 <= '0';
		dflag <= dflag;
		if count_r2 = '1' then
			new_state <= TIME_START2;
		else 
			new_state <= BOMB_WAIT;
		end if;

		when TIME_START2 =>
		timer_start1 <= '0';
		timer_start2 <= '1';
		timer_start5 <= '0';
		timer_start6 <= '0';
		if dflag = '1' then
			new_state <= TIMER5;
		else
			new_state <= BOMB_WAIT;
		end if;

		when TIMER5 =>
		timer_start1 <= '0';
		timer_start2 <= '0';
		timer_start5 <= '0';
		timer_start6 <= '0';
		dflag <= '0';
		if count_r5 = '1' then
			new_state <= TIME_START5;
		else 
			new_state <= TIMER6;
		end if;

		when TIME_START5 =>
		timer_start1 <= '0';
		timer_start2 <= '0';
		timer_start5 <= '1';
		timer_start6 <= '0';
		dflag <= '0';
		new_state <= BOMB_WAIT;

		when TIMER6 =>
		timer_start1 <= '0';
		timer_start2 <= '0';
		timer_start5 <= '0';
		timer_start6 <= '0';
		dflag <= '0';
		if count_r6 = '1' then
			new_state <= TIME_START6;
		else 
			new_state <= BOMB_WAIT;
		end if;

		when TIME_START6 =>
		timer_start1 <= '0';
		timer_start2 <= '0';
		timer_start5 <= '0';
		timer_start6 <= '1';
		dflag <= '0';
		new_state <= BOMB_WAIT;
	end case;
	end process;
	
	TM1 :  bomb_timer_main port map(clk,timer_start1,reset,count_r1,explosion1);			-- Timer main for timer 1
	TM2 :  bomb_timer_main port map(clk,timer_start2,reset,count_r2,explosion2);			-- Timer main for timer 2
	TM5 :  bomb_timer_main port map(clk,timer_start5,reset,count_r5,explosion5);   -- Timer main for timer 5
	TM6 :  bomb_timer_main port map(clk,timer_start6,reset,count_r6,explosion6);   -- Timer main for timer 6

end architecture behaviour_bomb_handling;



