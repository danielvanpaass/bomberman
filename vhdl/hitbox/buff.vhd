library IEEE;
use IEEE.std_logic_1164.ALL;

entity buff is
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
end buff;


