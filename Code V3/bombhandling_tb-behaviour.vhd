library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of bombhandling_tb is
   component bombhandling
   port(clk : in std_logic;
   	clk_30_input : in std_logic;
   	reset : in std_logic;
   	victoryflag : out std_logic_vector(1 downto 0);
   	pos_xp1 : in std_logic_vector(3 downto 0);
   	pos_xp2 : in std_logic_vector(3 downto 0);
   	pos_yp1 : in std_logic_vector(3 downto 0);
   	pos_yp2 : in std_logic_vector(3 downto 0);
   	bombp1	: in std_logic;
   	bombp2 	: in std_logic;
   	explos_sound : out std_logic;
   	placed_sound :	out std_logic;
   	bomb_a	: out std_logic;	
   	bomb_b	: out std_logic;		
   	bomb_c	: out std_logic;		
   	bomb_d	: out std_logic;		
   	bomb_e	: out std_logic;		
   	bomb_f	: out std_logic;		
   	bomb_g	: out std_logic;		
   	bomb_h	: out std_logic;	
   	VGA	: out std_logic_vector(241 downto 0);
   	obstacle: out std_logic_vector(120 downto 0));		
   end component;
   signal clk : std_logic;
   signal clk_30_input : std_logic;
   signal reset : std_logic;
   signal victoryflag : std_logic_vector(1 downto 0);
   signal pos_xp1 : std_logic_vector(3 downto 0);
   signal pos_xp2 : std_logic_vector(3 downto 0);
   signal pos_yp1 : std_logic_vector(3 downto 0);
   signal pos_yp2 : std_logic_vector(3 downto 0);
   signal bombp1	: std_logic;
   signal bombp2 	: std_logic;
   signal explos_sound : std_logic;
   signal placed_sound : std_logic;
   signal bomb_a	: std_logic;
   signal bomb_b	: std_logic;
   signal bomb_c	: std_logic;
   signal bomb_d	: std_logic;
   signal bomb_e	: std_logic;
   signal bomb_f	: std_logic;
   signal bomb_g	: std_logic;
   signal bomb_h	: std_logic;
   signal VGA	: std_logic_vector(241 downto 0);
   signal obstacle: std_logic_vector(120 downto 0);
begin
test: bombhandling port map (clk, clk_30_input, reset, victoryflag, pos_xp1, pos_xp2, pos_yp1, pos_yp2, bombp1, bombp2, explos_sound, placed_sound, bomb_a, bomb_b, bomb_c, bomb_d, bomb_e, bomb_f, bomb_g, bomb_h, VGA, obstacle);
-- clk <= '1' after 0 ns,
--      '0' after 100 ns when clk /= '0' else '1' after 100 ns;
   clk <= '1' after 0 ns,
	'0' after 20 ns when clk /= '0' else '1' after 20 ns;
   clk_30_input <= '0' after 0 ns;
   reset <= '1' after 0 ns,
	'0' after 500 ns,
	'1' after 15000 ns,
	'0' after 16000 ns;
   pos_xp1(0) <= '1' after 0 ns;
   pos_xp1(1) <= '1' after 0 ns,
		'0' after 2500 ns;
   pos_xp1(2) <= '0' after 0 ns;
   pos_xp1(3) <= '0' after 0 ns;
   pos_xp2(0) <= '0' after 0 ns;
   pos_xp2(1) <= '0' after 0 ns;
   pos_xp2(2) <= '0' after 0 ns;
   pos_xp2(3) <= '0' after 0 ns;
   pos_yp1(0) <= '1' after 0 ns,
		'0' after 2500 ns;
   pos_yp1(1) <= '0' after 0 ns,
		'1' after 2500 ns;
   pos_yp1(2) <= '0' after 0 ns;
   pos_yp1(3) <= '0' after 0 ns;
   pos_yp2(0) <= '0' after 0 ns;
   pos_yp2(1) <= '0' after 0 ns;
   pos_yp2(2) <= '1' after 0 ns;
   pos_yp2(3) <= '0' after 0 ns;
   bombp1 <= '0' after 0 ns,
		'1' after 2000 ns,
		'0' after 2500 ns,
		'1' after 8000 ns,
		'0' after 9000 ns;
   bombp2 <= '0' after 0 ns,
		'1' after 20000 ns,
		'0' after 21000 ns;

end behaviour;

