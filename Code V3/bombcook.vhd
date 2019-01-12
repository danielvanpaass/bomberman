library IEEE;
use IEEE.std_logic_1164.ALL;

entity bombcook is
   port(bombinit : in  std_logic;
	expl : in std_logic;
        playerx  : in  std_logic_vector(3 downto 0);
	playery  : in  std_logic_vector(3 downto 0);
	reset : in std_logic;
	clk : in std_logic;
	bombdisplay : out std_logic;
	bombx : out std_logic_vector(3 downto 0);
	bomby : out std_logic_vector(3 downto 0);
	expl_flag : out std_logic);
end bombcook;

