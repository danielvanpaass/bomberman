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
	explosion3 : out std_logic;
	explosion4 : out std_logic;
	explosion5 : out std_logic;
	explosion6 : out std_logic;
	explosion7 : out std_logic;
	explosion8 : out std_logic);	
end component;
		
signal explosionb1, explosionb2, explosionb3, explosionb4, explosionb5, explosionb6, explosionb7, explosionb8: std_logic;	
begin
BUFF1 : buffer_bomb port map (clk, reset, bombp1, buff_p1);		-- Buffer input player 1
BUFF2 : buffer_bomb port map (clk, reset, bombp2, buff_p2);  -- Buffer input player 2


MAIN  : bomb_handling port map (clk, reset, buff_p1, buff_p2, explosionb1, explosionb2, explosionb3, explosionb4, explosionb5, explosionb6, explosionb7, explosionb8); -- Bomb handling entity

explosion <= explosionb1 OR explosionb2 OR explosionb3 OR explosionb4 OR explosionb5 OR explosionb6 OR explosionb7 OR explosionb8; -- 4 input OR gate
explosion_bomb <= explosionb1 & explosionb2 & explosionb3 & explosionb4 & explosionb5 & explosionb6 & explosionb7 & explosionb8;

end behaviour;

