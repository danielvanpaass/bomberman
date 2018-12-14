library IEEE;
use IEEE.std_logic_1164.ALL;

entity bomb_select is
   port(startbomb : in  std_logic;
	clk : in std_logic;
	reset : in std_logic;
	bombno : out std_logic_vector(3 downto 0));
end bomb_select;

architecture behaviour of bomb_select is

type bomb_select_states is (b1w, b1, b2w, b2, b3w, b3, b4w, b4);

signal state, new_state: bomb_select_states;

begin

process (clk, reset)
  begin
   if (rising_edge (clk)) then
     if (reset = '1') then
       state <= b1w;
     else
       state <= new_state;
     end if;
   end if;
end process;

process (state, startbomb)
	begin
	case state is
		when b1w =>
		bombno(0) <= '0';
		bombno(1) <= '0';
		bombno(2) <= '0';
		bombno(3) <= '0';
		if (startbomb = '1') then
			new_state <= b1;
		else
			new_state <= b1w;
		end if;
		when b1 =>
		bombno(0) <= '1';
		bombno(1) <= '0';
		bombno(2) <= '0';
		bombno(3) <= '0';
		if (startbomb = '0') then
			new_state <= b2w;
		else
			new_state <= b1;
		end if;
		when b2w =>
		bombno(0) <= '0';
		bombno(1) <= '0';
		bombno(2) <= '0';
		bombno(3) <= '0';
		if (startbomb = '1') then
			new_state <= b2;
		else
			new_state <= b2w;
		end if;
		when b2 =>
		bombno(0) <= '0';
		bombno(1) <= '1';
		bombno(2) <= '0';
		bombno(3) <= '0';
		if (startbomb = '0') then
			new_state <= b3w;
		else
			new_state <= b2;
		end if;
		when b3w =>
		bombno(0) <= '0';
		bombno(1) <= '0';
		bombno(2) <= '0';
		bombno(3) <= '0';
		if (startbomb = '1') then
			new_state <= b3;
		else
			new_state <= b3w;
		end if;
		when b3 =>
		bombno(0) <= '0';
		bombno(1) <= '0';
		bombno(2) <= '1';
		bombno(3) <= '0';
		if (startbomb = '0') then
			new_state <= b4w;
		else
			new_state <= b3;
		end if;
		when b4w =>
		bombno(0) <= '0';
		bombno(1) <= '0';
		bombno(2) <= '0';
		bombno(3) <= '0';
		if (startbomb = '1') then
			new_state <= b4;
		else
			new_state <= b4w;
		end if;
		when b4 =>
		bombno(0) <= '0';
		bombno(1) <= '0';
		bombno(2) <= '0';
		bombno(3) <= '1';
		if (startbomb = '0') then
			new_state <= b1w;
		else
			new_state <= b4;
		end if;
	end case;
end process;
end architecture;
