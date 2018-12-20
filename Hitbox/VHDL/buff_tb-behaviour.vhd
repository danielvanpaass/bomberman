library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of buff_tb is
   component buff
      port(up_p1         : in  std_logic;
           right_p1      : in  std_logic;
           down_p1       : in  std_logic;
           left_p1       : in  std_logic;
           up_p2         : in  std_logic;
           right_p2      : in  std_logic;
           down_p2       : in  std_logic;
           left_p2       : in  std_logic;
           clk           : in  std_logic;
           reset         : in  std_logic;
           buff_up_p1    : out std_logic;
           buff_right_p1 : out std_logic;
           buff_down_p1  : out std_logic;
           buff_left_p1  : out std_logic;
           buff_up_p2    : out std_logic;
           buff_right_p2 : out std_logic;
           buff_down_p2  : out std_logic;
           buff_left_p2  : out std_logic);
   end component;
   signal up_p1         : std_logic;
   signal right_p1      : std_logic;
   signal down_p1       : std_logic;
   signal left_p1       : std_logic;
   signal up_p2         : std_logic;
   signal right_p2      : std_logic;
   signal down_p2       : std_logic;
   signal left_p2       : std_logic;
   signal clk           : std_logic;
   signal reset         : std_logic;
   signal buff_up_p1    : std_logic;
   signal buff_right_p1 : std_logic;
   signal buff_down_p1  : std_logic;
   signal buff_left_p1  : std_logic;
   signal buff_up_p2    : std_logic;
   signal buff_right_p2 : std_logic;
   signal buff_down_p2  : std_logic;
   signal buff_left_p2  : std_logic;
begin
test: buff port map (up_p1, right_p1, down_p1, left_p1, up_p2, right_p2, down_p2, left_p2, clk, reset, buff_up_p1, buff_right_p1, buff_down_p1, buff_left_p1, buff_up_p2, buff_right_p2, buff_down_p2, buff_left_p2);
clk <= '1' after 0 ns,
     '0' after 100 ns when clk /= '0' else '1' after 100 ns;
   up_p1 <= '0' after 0 ns,
'1' after 301 ns;
   right_p1 <= '0' after 0 ns;
   down_p1 <= '0' after 0 ns;
   left_p1 <= '0' after 0 ns;
   up_p2 <= '0' after 0 ns;
   right_p2 <= '0' after 0 ns;
   down_p2 <= '0' after 0 ns,
'1' after 376 ns,
'0' after 380 ns;
   left_p2 <= '0' after 0 ns;
   reset <= '1' after 0 ns,
'0' after 300 ns;
end behaviour;

