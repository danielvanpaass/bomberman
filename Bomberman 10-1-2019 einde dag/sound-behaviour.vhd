library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of sound is
	type sound_state is (RESET_STATE, BUFF, OUTPUT_HIGH, OUTPUT_LOW, H_LOW, H_HIGH, SOUND_LENGTH, VICTORY_F, VICTORY_T1, VICTORY_T2, VICTORY_T3, VICTORY_T4, BOMB_PLACED_F, BOMB_EXPLODED_F, VICT_END);

component timer is
	port (clk : in std_logic;
		timer_r : in std_logic;
		count_out : out std_logic_vector(15 downto 0));
end component;

component timer_30 is
   port(clk_30   : in  std_logic;
        timer_r30 : in  std_logic;
        count_out : out std_logic_vector(4 downto 0));
end component;



	signal state, new_state: sound_state;
	signal H, v_flag, bp_flag, be_flag, timer_on, timer_r, timer_r30, new_H, new_v, new_bp, new_be: std_logic;
	signal count, count_v, count_bp, count_be, new_count_v, new_count_bp, new_count_be :std_logic_vector(15 downto 0);
	signal length_signal: std_logic_vector(4 downto 0);
	signal note, new_note: std_logic_vector(2 downto 0);
begin

	lb11: process (clk, reset)
	begin
	if (clk'event and clk = '1') then
		if reset = '1' then
			state <= RESET_STATE;
			count_v <= "0000000000000000";
			count_be <= "0000000000000000";
			count_bp <= "0000000000000000";
			H <= '0';
		else
			state <= new_state;
			note <= new_note;
			H <= new_H;
			count_bp <= new_count_bp;
			count_v <= new_count_v;
			count_be <= new_count_be;
			v_flag <= new_v;
			bp_flag <= new_bp;
			be_flag <= new_be;
		end if;
	end if;
	end process;

	lb12: process (state, victory, bomb_placed, bomb_exploded, H, length_signal, note, count, v_flag, bp_flag, be_flag, count_v, count_be, count_bp)
	begin
	case state is
		when RESET_STATE =>
		new_H <= '1';
		new_note <= "000";
		output <= '0';
		timer_on <= '0';
		new_v <= '0';
		new_bp <= '0';
		new_be <= '0';
		timer_r30 <= '0';
		new_count_v <= "0000000000000000";
		new_count_be <= "0000000000000000";
		new_count_bp <= "0000000000000000";
		if victory(1) = '1' then
			new_state <= VICTORY_F;
		elsif bomb_placed = '1' then
			new_state <= BOMB_PLACED_F;
		elsif bomb_exploded = '1' then
			new_State <= BOMB_EXPLODED_F;
		else
			new_state <= RESET_STATE;
		end if;

		when VICTORY_F =>
		new_H <= H;
		new_note <= "001";
		output <= '0';
		timer_on <= '0';
		new_v <= '1';
		new_bp <= '0';
		new_be <= '0';
		timer_r30 <= '0';
		new_count_v <= count_v;
		new_count_be <= count_be;
		new_count_bp <= count_bp;
		new_state <= BUFF;

		when BOMB_PLACED_F =>
		new_H <= H;
		new_note <= note;
		output <= '0';
		timer_on <= '0';
		new_v <= '0';
		new_bp <= '1';
		new_be <= '0';
		timer_r30 <= '0';
		new_count_bp <= "1111111111111111";
		new_count_be <= count_be;
		new_count_v <= count_v;
		new_state <= BUFF;

		when BOMB_EXPLODED_F =>
		new_H <= H;
		new_note <= note;
		output <= '0';
		timer_on <= '0';
		new_v <= '0';
		new_bp <= '0';
		new_be <= '1';
		timer_r30 <= '0';
		new_count_be <= "1010111000111000";
		new_count_v <= count_v;
		new_count_bp <= count_bp;
		new_state <= BUFF;

		when BUFF =>
		new_H <= H;
		new_note <= note;
		output <= '0';
		timer_on <= '0';
		timer_r30 <= '1';
		new_v <= v_flag;
		new_bp <= bp_flag;
		new_be <= be_flag;
		new_count_v <= count_v;
		new_count_be <= count_be;
		new_count_bp <= count_bp;
		if H = '1' AND length_signal /= "11110"  then
			new_state <= OUTPUT_HIGH;
		elsif H = '0' AND length_signal /= "11110" then
			new_state <= OUTPUT_LOW;
		elsif length_signal = "11110" AND note = "010" then
			new_state <= VICTORY_T2;
		elsif length_signal = "11110" AND note = "011" then
			new_state <= VICTORY_T3;
		elsif length_signal = "11110" AND note = "100" then
			new_state <= VICTORY_T4;
		elsif length_signal = "11110" AND note = "101" then
			new_state <= VICT_END;
		else
			new_state <= RESET_STATE;
		end if;

		when VICTORY_T1 =>
		new_H <= H;
		new_note <= "010";
		output <= '0';
		timer_on <= '0';
		timer_r30 <= '1';
		new_count_v <= "0101001000001000";
		new_count_be <= count_be;
		new_count_bp <= count_bp;
		new_state <= BUFF;
		new_v <= v_flag;
		new_bp <= bp_flag;
		new_be <= be_flag;		

-- 0101001000001000

		when VICTORY_T2 =>
		new_H <= H;
		new_note <= "011";
		output <= '0';
		timer_on <= '0';
		timer_r30 <= '0';
		new_count_v <= "0101001000001000";
		new_count_be <= count_be;
		new_count_bp <= count_bp;
		new_v <= v_flag;
		new_bp <= bp_flag;
		new_be <= be_flag;
		if length_signal = "00000" then
			new_state <= OUTPUT_HIGH;	
		else
			new_state <= VICTORY_T2;
		end if;

		when VICTORY_T3 =>
		new_H <= H;
		new_note <= "100" ;
		output <= '0';
		timer_on <= '0';
		timer_r30 <= '0';
		new_count_v <= "0101001000001000";
		new_count_be <= count_be;
		new_count_bp <= count_bp;
		new_v <= v_flag;
		new_bp <= bp_flag;
		new_be <= be_flag;
		if length_signal = "00000" then
			new_state <= OUTPUT_HIGH;	
		else
			new_state <= VICTORY_T3;
		end if;

		when VICTORY_T4 =>
		new_H <= H;
		new_note <= "101";
		output <= '0';
		timer_on <= '0';
		timer_r30 <= '0';
		new_count_v <= "0101001000001000";
		new_count_be <= count_be;
		new_count_bp <= count_bp;
		new_v <= v_flag;
		new_bp <= bp_flag;
		new_be <= be_flag;
		if length_signal = "00000" then
			new_state <= OUTPUT_HIGH;	
		else
			new_state <= VICTORY_T4;
		end if;

		when VICT_END =>
		new_H <= H;
		new_note <= "111";
		output <= '0';
		timer_on <= '0';
		timer_r30 <= '0';
		new_count_v <= count_v;
		new_count_be <= count_be;
		new_count_bp <= count_bp;
		new_v <= v_flag;
		new_bp <= bp_flag;
		new_be <= be_flag;
		if length_signal = "00000" then
			new_state <= RESET_STATE;	
		else
			new_state <= VICT_END;
		end if;	

		when OUTPUT_HIGH =>
		new_H <= H;
		new_note <= note;
		output <= '1';
		timer_on <= '1';
		timer_r30 <= '1';
		new_count_v <= count_v;
		new_count_be <= count_be;
		new_count_bp <= count_bp;
		new_v <= v_flag;
		new_bp <= bp_flag;
		new_be <= be_flag;
		if ((count = count_v AND v_flag = '1') OR (count = count_bp AND bp_flag = '1') OR (count = count_be AND be_flag = '1')) then
			new_state <= H_LOW;
		else
			new_state <= OUTPUT_HIGH;
		end if;

		when OUTPUT_LOW =>
		new_H <= H;
		new_note <= note;
		output <= '0';
		timer_on <= '1';
		timer_r30 <= '1';
		new_count_v <= count_v;
		new_count_be <= count_be;
		new_count_bp <= count_bp;
		new_v <= v_flag;
		new_bp <= bp_flag;
		new_be <= be_flag;
		if ((count = count_v AND v_flag = '1') OR (count = count_bp AND bp_flag = '1') OR (count = count_be AND be_flag = '1')) then
			new_state <= H_HIGH;
		else
			new_state <= OUTPUT_LOW;
		end if;

		when H_LOW =>
		new_H <= '0';
		new_note <= note;
		output <= '0';
		timer_on <= '0';
		timer_r30 <= '1';
		new_count_v <= count_v;
		new_count_be <= count_be;
		new_count_bp <= count_bp;
		new_v <= v_flag;
		new_bp <= bp_flag;
		new_be <= be_flag;
		new_state <= SOUND_LENGTH;

		when H_HIGH =>
		new_H <= '1';
		new_note <= note;
		output <= '0';
		timer_on <= '0';
		timer_r30 <= '1';
		new_count_v <= count_v;
		new_count_be <= count_be;
		new_count_bp <= count_bp;
		new_v <= v_flag;
		new_bp <= bp_flag;
		new_be <= be_flag;
		new_state <= SOUND_LENGTH;

		when SOUND_LENGTH =>
		new_H <= H;
		new_note <= note;
		output <= '0';
		timer_on <= '0';
		timer_r30 <= '1';
		new_count_v <= count_v;
		new_count_be <= count_be;
		new_count_bp <= count_bp;
		new_v <= v_flag;
		new_bp <= bp_flag;
		new_be <= be_flag;
		if note = "001" then
			new_state <= VICTORY_T1;
		else
			new_state <= BUFF;
		end if;

	end case;
	end process;
	
	-- timer_r <= timer_on;
	T1 : timer port map (clk, timer_on, count);
	T1_30 : timer_30 port map (clk_30, timer_r30, length_signal);

end behaviour;

