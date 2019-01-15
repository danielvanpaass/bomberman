library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of timer_input is
	type timer_state is (TIMER_RESET, BUFF1, BUFF2, WAITINg);

component bomb_timer is
   port(clk         : in  std_logic;
	clk_30	    : in std_logic;
        count_reset : in  std_logic;
        count_out   : out std_logic_vector(7 downto 0)
	);
end component;

	signal state, new_state: timer_state;
	signal count_out: std_logic_vector(7 downto 0);
	signal count_reset_signal : std_logic;
begin
	lbl1: process (clk, reset)
	begin
	if (clk'event and clk = '1') then
		if reset = '1' then
			state <= TIMER_RESET;
		else 
			state <= new_state;
		end if;
	end if;
	end process;

	lbl2: process (state, bombp, count_out)
	begin
	case state is
		when TIMER_RESET =>
		bombout <= '0';
		count_reset_signal <= '1';
		if bombp = '1' then
			new_state <= BUFF1;
		else
			new_state <= TIMER_RESET;
		end if;

		when BUFF1 =>
		bombout <= '1';
		count_reset_signal <= '1';
		new_state <= BUFF2;

		when BUFF2 =>
		bombout <= '1';
		count_reset_signal <= '1';
		new_state <= WAITING;
		
		when WAITING =>
		bombout <= '0';
		count_reset_signal <= '0';
		if count_out = "00010100" then -- "1011111010111100001000000"
			new_state <= TIMER_RESET;
		else
			new_state <= WAITING;
		end if;

	end case;
	end process;

	
 	T1 : bomb_timer port map(clk,clk_60,count_reset_signal ,count_out);

end architecture behaviour;
