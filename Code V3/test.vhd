library IEEE;
use IEEE.std_logic_1164.ALL;

entity test is
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
         r:out std_logic_vector(3 downto 0);
         g:out std_logic_vector(3 downto 0);
         b:out std_logic_vector(3 downto 0);
         sound_output:out std_logic);
end test;

