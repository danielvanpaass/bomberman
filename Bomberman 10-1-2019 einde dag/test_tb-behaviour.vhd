library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of test_tb is
   component test
      port (p1_up:in std_logic;
            p1_right:in std_logic;
            p1_down:in std_logic;
            p1_left:in std_logic;
            p2_up:in std_logic;
            p2_right:in std_logic;
            p2_down:in std_logic;
            p2_left:in std_logic;
            clk:in std_logic;
            reset:in std_logic;
            bombp2:in std_logic;
            bombp1:in std_logic;
            hsync:out std_logic;
            vsync:out std_logic;
   			LED : out std_logic_vector(7 downto 0);
            r:out std_logic_vector(3 downto 0);
            g:out std_logic_vector(3 downto 0);
            b:out std_logic_vector(3 downto 0);
            sound_output:out std_logic);
   end component;
   signal p1_up: std_logic;
   signal p1_right: std_logic;
   signal p1_down: std_logic;
   signal p1_left: std_logic;
   signal p2_up: std_logic;
   signal p2_right: std_logic;
   signal p2_down: std_logic;
   signal p2_left: std_logic;
   signal clk: std_logic;
   signal reset: std_logic;
   signal bombp2: std_logic;
   signal bombp1: std_logic;
   signal hsync: std_logic;
   signal vsync: std_logic;
   signal LED : std_logic_vector(7 downto 0);
   signal r: std_logic_vector(3 downto 0);
   signal g: std_logic_vector(3 downto 0);
   signal b: std_logic_vector(3 downto 0);
   signal sound_output: std_logic;
begin
test1: test port map (p1_up, p1_right, p1_down, p1_left, p2_up, p2_right, p2_down, p2_left, clk, reset, bombp2, bombp1, hsync, vsync, LED, r, g, b, sound_output);
clk <= '1' after 0 ns,
     '0' after 100 ns when clk /= '0' else '1' after 100 ns;
   p1_up <= '0' after 0 ns;
   p1_right <= '0' after 0 ns;
   p1_down <= '0' after 0 ns;
   p1_left <= '0' after 0 ns;
   p2_up <= '0' after 0 ns;
   p2_right <= '0' after 0 ns;
   p2_down <= '0' after 0 ns;
   p2_left <= '0' after 0 ns;
   reset <= '1' after 0 ns,
	'0' after 300 ns;
   bombp2 <= '0' after 0 ns;
   bombp1 <= '0' after 0 ns;
end behaviour;

