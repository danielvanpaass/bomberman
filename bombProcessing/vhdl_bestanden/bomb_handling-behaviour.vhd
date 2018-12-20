library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour_bomb_handling of bomb_handling is
	type handling_state is (BOMB_RESET, BOMB_WAIT, TIMER1, TIME_START1, TIMER2, TIME_START2, TIMER3, TIME_START3, TIMER4, TIME_START4, TIMER5, TIME_START5, TIMER6, TIME_START6, TIMER7, TIME_START7, TIMER8, TIME_START8, DOUBLE);

component bomb_timer_main is
   port(clk        : in  std_logic;
	clk_30	   : in  std_logic;
	timer1	   : in  std_logic;
	reset 	   : in std_logic;
	count_reset: out std_logic;
        explosion  : out std_logic);
end component;

	signal state, new_state: handling_state;
	signal count_r1, count_r2, count_r3, count_r4, count_r5, count_r6, count_r7, count_r8, timer_start1, timer_start2, timer_start3, timer_start4, timer_start5, timer_start6, timer_start7, timer_start8, dflag, new_dflag: std_logic;
begin
	lbl1: process (clk)
	begin
	if (clk'event and clk = '1') then
		if reset = '1' then
			state <= BOMB_RESET;
		else 
			state <= new_state;
			dflag <= new_dflag;
		end if;
	end if;
	end process;

	lbl2: process (state, dflag, bombp1, bombp2, count_r1)
	begin
	case state is
		when BOMB_RESET =>
		timer_start1 <= '0';
		timer_start2 <= '0';
		timer_start3 <= '0';
		timer_start4 <= '0';
		timer_start5 <= '0';
		timer_start6 <= '0';
		timer_start7 <= '0';
		timer_start8 <= '0';
		new_dflag <= '0';
		new_state <= BOMB_WAIT;

		when BOMB_WAIT =>
		timer_start1 <= '0';
		timer_start2 <= '0';
		timer_start3 <= '0';
		timer_start4 <= '0';
		timer_start5 <= '0';
		timer_start6 <= '0';
		timer_start7 <= '0';
		timer_start8 <= '0';
		new_dflag <= '0';
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
		timer_start3 <= '0';
		timer_start4 <= '0';
		timer_start5 <= '0';
		timer_start6 <= '0';
		timer_start7 <= '0';
		timer_start8 <= '0';
		new_dflag <= '1';
		new_state <= TIMER1;

		when TIMER1 =>
		timer_start1 <= '0';
		timer_start2 <= '0';
		timer_start3 <= '0';
		timer_start4 <= '0';
		timer_start5 <= '0';
		timer_start6 <= '0';
		timer_start7 <= '0';
		timer_start8 <= '0';
		new_dflag <= dflag;
		if count_r1 = '1' then
			new_state <= TIME_START1;
		else 
			new_state <= TIMER2;
		end if;

		when TIME_START1 =>
		timer_start1 <= '1';
		timer_start2 <= '0';
		timer_start3 <= '0';
		timer_start4 <= '0';
		timer_start5 <= '0';
		timer_start6 <= '0';
		timer_start7 <= '0';
		timer_start8 <= '0';
		new_dflag <= dflag;
		if dflag = '1' then
			new_state <= TIMER5;
		else
			new_state <= BOMB_WAIT;
		end if;

		when TIMER2 =>
		timer_start1 <= '0';
		timer_start2 <= '0';
		timer_start3 <= '0';
		timer_start4 <= '0';
		timer_start5 <= '0';
		timer_start6 <= '0';
		timer_start7 <= '0';
		timer_start8 <= '0';
		new_dflag <= dflag;
		if count_r2 = '1' then
			new_state <= TIME_START2;
		else 
			new_state <= TIMER3;
		end if;

		when TIME_START2 =>
		timer_start1 <= '0';
		timer_start2 <= '1';
		timer_start3 <= '0';
		timer_start4 <= '0';
		timer_start5 <= '0';
		timer_start6 <= '0';
		timer_start7 <= '0';
		timer_start8 <= '0';
		new_dflag <= dflag;
		if dflag = '1' then
			new_state <= TIMER5;
		else

			new_state <= BOMB_WAIT;
		end if;

		when TIMER3 =>
		timer_start1 <= '0';
		timer_start2 <= '0';
		timer_start3 <= '0';
		timer_start4 <= '0';
		timer_start5 <= '0';
		timer_start6 <= '0';
		timer_start7 <= '0';
		timer_start8 <= '0';
		new_dflag <= dflag;
		if count_r3 = '1' then
			new_state <= TIME_START3;
		else 
			new_state <= TIMER4;
		end if;

		when TIME_START3 =>
		timer_start1 <= '0';
		timer_start2 <= '0';
		timer_start3 <= '1';
		timer_start4 <= '0';
		timer_start5 <= '0';
		timer_start6 <= '0';
		timer_start7 <= '0';
		timer_start8 <= '0';
		new_dflag <= dflag;
		if dflag = '1' then
			new_state <= TIMER5;
		else
			new_state <= BOMB_WAIT;
		end if;

		when TIMER4 =>
		timer_start1 <= '0';
		timer_start2 <= '0';
		timer_start3 <= '0';
		timer_start4 <= '0';
		timer_start5 <= '0';
		timer_start6 <= '0';
		timer_start7 <= '0';
		timer_start8 <= '0';
		new_dflag <= dflag;
		if count_r4 = '1' then
			new_state <= TIME_START4;
		else 
			new_state <= BOMB_WAIT;
		end if;

		when TIME_START4 =>
		timer_start1 <= '0';
		timer_start2 <= '0';
		timer_start3 <= '0';
		timer_start4 <= '1';
		timer_start5 <= '0';
		timer_start6 <= '0';
		timer_start7 <= '0';
		timer_start8 <= '0';
		new_dflag <= dflag;
		if dflag = '1' then
			new_state <= TIMER5;
		else
			new_state <= BOMB_WAIT;
		end if;

		when TIMER5 =>
		timer_start1 <= '0';
		timer_start2 <= '0';
		timer_start3 <= '0';
		timer_start4 <= '0';
		timer_start5 <= '0';
		timer_start6 <= '0';
		timer_start7 <= '0';
		timer_start8 <= '0';
		new_dflag <= '0';
		if count_r5 = '1' then
			new_state <= TIME_START5;
		else 
			new_state <= TIMER6;
		end if;

		when TIME_START5 =>
		timer_start1 <= '0';
		timer_start2 <= '0';
		timer_start3 <= '0';
		timer_start4 <= '0';
		timer_start5 <= '1';
		timer_start6 <= '0';
		timer_start7 <= '0';
		timer_start8 <= '0';
		new_dflag <= '0';
		new_state <= BOMB_WAIT;

		when TIMER6 =>
		timer_start1 <= '0';
		timer_start2 <= '0';
		timer_start3 <= '0';
		timer_start4 <= '0';
		timer_start5 <= '0';
		timer_start6 <= '0';
		timer_start7 <= '0';
		timer_start8 <= '0';
		new_dflag <= '0';
		if count_r6 = '1' then
			new_state <= TIME_START6;
		else 
			new_state <= TIMER7;
		end if;

		when TIME_START6 =>
		timer_start1 <= '0';
		timer_start2 <= '0';
		timer_start3 <= '0';
		timer_start4 <= '0';
		timer_start5 <= '0';
		timer_start6 <= '1';
		timer_start7 <= '0';
		timer_start8 <= '0';
		new_dflag <= '0';
		new_state <= BOMB_WAIT;

		when TIMER7 =>
		timer_start1 <= '0';
		timer_start2 <= '0';
		timer_start3 <= '0';
		timer_start4 <= '0';
		timer_start5 <= '0';
		timer_start6 <= '0';
		timer_start7 <= '0';
		timer_start8 <= '0';
		new_dflag <= '0';
		if count_r7 = '1' then
			new_state <= TIME_START7;
		else 
			new_state <= TIMER8;
		end if;

		when TIME_START7 =>
		timer_start1 <= '0';
		timer_start2 <= '0';
		timer_start3 <= '0';
		timer_start4 <= '0';
		timer_start5 <= '0';
		timer_start6 <= '0';
		timer_start7 <= '1';
		timer_start8 <= '0';
		new_dflag <= '0';
		new_state <= BOMB_WAIT;

		when TIMER8 =>
		timer_start1 <= '0';
		timer_start2 <= '0';
		timer_start3 <= '0';
		timer_start4 <= '0';
		timer_start5 <= '0';
		timer_start6 <= '0';
		timer_start7 <= '0';
		timer_start8 <= '0';
		new_dflag <= '0';
		if count_r8 = '1' then
			new_state <= TIME_START8;
		else 
			new_state <= BOMB_WAIT;
		end if;

		when TIME_START8 =>
		timer_start1 <= '0';
		timer_start2 <= '0';
		timer_start3 <= '0';
		timer_start4 <= '0';
		timer_start5 <= '0';
		timer_start6 <= '0';
		timer_start7 <= '0';
		timer_start8 <= '1';
		new_dflag <= '0';
		new_state <= BOMB_WAIT;
	end case;
	end process;
	
	TM1 :  bomb_timer_main port map(clk,clk_30,timer_start1,reset,count_r1,explosion1);			-- Timer main for timer 1
	TM2 :  bomb_timer_main port map(clk,clk_30,timer_start2,reset,count_r2,explosion2);			-- Timer main for timer 2
	TM3 :  bomb_timer_main port map(clk,clk_30,timer_start3,reset,count_r3,explosion3);			-- Timer main for timer 1
	TM4 :  bomb_timer_main port map(clk,clk_30,timer_start4,reset,count_r4,explosion4);			-- Timer main for timer 1
	TM5 :  bomb_timer_main port map(clk,clk_30,timer_start5,reset,count_r5,explosion5);   -- Timer main for timer 5
	TM6 :  bomb_timer_main port map(clk,clk_30,timer_start6,reset,count_r6,explosion6);   -- Timer main for timer 6
	TM7 :  bomb_timer_main port map(clk,clk_30,timer_start7,reset,count_r7,explosion7);			-- Timer main for timer 1
	TM8 :  bomb_timer_main port map(clk,clk_30,timer_start8,reset,count_r8,explosion8);			-- Timer main for timer 1

end architecture behaviour_bomb_handling;



