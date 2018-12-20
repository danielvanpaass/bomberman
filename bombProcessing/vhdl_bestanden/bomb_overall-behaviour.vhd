library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of bomb_overall is

component buffer_bomb
	port (  clk	: in std_logic;
		reset: in std_logic;
		b_input: in std_logic;
		b_output: out std_logic);
end component;

component bomb_handling
   port(clk	   : in  std_logic;
	reset  : in  std_logic;
	bombp1   : in  std_logic;
        bombp2 : in  std_logic;
        explosion1 : out std_logic;
	explosion2 : out std_logic;
	explosion5 : out std_logic;
	explosion6 : out std_logic);	
end component;
		
signal buff_out1, buff_out2: std_logic;	
begin
BUFF1 : buffer_bomb port map (clk, reset, bombp1, buff_out1);		-- Buffer input player 1
BUFF2 : buffer_bomb port map (clk, reset, bombp2, buff_out2);  -- Buffer input player 2


MAIN  : bomb_handling port map (clk, reset, buff_out1, buff_out2, explosion1, explosion2, explosion5, explosion6); -- Bomb handling entity

explosion <= explosion1 OR explosion2 OR explosion5 OR explosion6; -- 4 input OR gate

end behaviour;

