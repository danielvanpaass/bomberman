library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour_bomb_main of bomb_timer_main is
	type bomb_state is (TIMER_RESET, WAITING, BOMB_EXPLODED);

component bomb_timer is
   port(clk         : in  std_logic;
        count_reset : in  std_logic;
        count_out   : out std_logic_vector(24 downto 0)
	);
end component;

	signal state, new_state: bomb_state;
	signal count_out: std_logic_vector(24 downto 0);
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

	lbl2: process (state, timer1, count_out)
	begin
	case state is
		when TIMER_RESET =>
		explosion <= '0';
		count_reset_signal <= '1';
		if timer1 = '1' then
			new_state <= WAITING;
		else
			new_state <= TIMER_RESET;
		end if;
		
		when WAITING =>
		explosion <= '0';
		count_reset_signal <= '0';
		if count_out = "1011111010111100001000000" then -- "1011111010111100001000000"
			new_state <= BOMB_EXPLOded;
		else
			new_state <= WAITING;
		end if;

		when BOMB_EXPLODED =>
		explosion <= '1';
		count_reset_signal <= '1';
		new_state <= TIMER_RESET;
	end case;
	end process;

	
 	T1 : bomb_timer port map(clk,count_reset_signal ,count_out);

end architecture behaviour_bomb_main;
