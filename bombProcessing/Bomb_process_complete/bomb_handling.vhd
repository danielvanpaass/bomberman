library IEEE;
use IEEE.std_logic_1164.ALL;

entity bomb_handling is
   port(clk	   : in  std_logic;
	clk_30    : in std_logic;
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
end bomb_handling;
