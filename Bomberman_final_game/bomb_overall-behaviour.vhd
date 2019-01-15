library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of bomb_overall is

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
        explosion  : out std_logic);
end component;

		
signal explosionb1, explosionb2, explosionb3, explosionb4, explosionb5, explosionb6, explosionb7, explosionb8: std_logic;
signal buff_p1_inb, buff_p2_inb : std_logic;	
signal explosion_buf : std_logic_vector(7 downto 0);
begin

			

buff_p1 <= buff_p1_inb;
buff_p2 <= buff_p2_inb;
BUFF1 : buffer_bomb port map (clk, reset, bombp1, buff_p1_inb);		-- Buffer input player 1
BUFF2 : buffer_bomb port map (clk, reset, bombp2, buff_p2_inb);  -- Buffer input player 2


timer1: bomb_timer_main port map (clk, clk_30, timer_p1(0), reset, explosion_buf(0)); 
timer2: bomb_timer_main port map (clk, clk_30, timer_p1(1), reset, explosion_buf(1)); 
timer3: bomb_timer_main port map (clk, clk_30, timer_p1(2), reset, explosion_buf(2)); 
timer4: bomb_timer_main port map (clk, clk_30, timer_p1(3), reset, explosion_buf(3)); 
timer5: bomb_timer_main port map (clk, clk_30, timer_p2(0), reset, explosion_buf(4)); 
timer6: bomb_timer_main port map (clk, clk_30, timer_p2(1), reset, explosion_buf(5)); 
timer7: bomb_timer_main port map (clk, clk_30, timer_p2(2), reset, explosion_buf(6)); 
timer8: bomb_timer_main port map (clk, clk_30, timer_p2(3), reset, explosion_buf(7)); 


explosion <= explosion_buf(0) OR explosion_buf(1) OR explosion_buf(2) OR explosion_buf(3) OR explosion_buf(4) OR explosion_buf(5) OR explosion_buf(6) OR explosion_buf(7); -- 4 input OR gate
explosion_bomb <= explosion_buf;
b_placed <= bombp1 OR bombp2;

end behaviour;

