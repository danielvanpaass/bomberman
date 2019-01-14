library IEEE;
use IEEE.std_logic_1164.ALL;

entity playground is
   port(clk : in  std_logic;
	reset : in std_logic;
	lethalx : in std_logic_vector(3 downto 0);
	lethaly : in std_logic_vector(3 downto 0);
	lethal : in std_logic;
	bomb	: in std_logic_vector(4 downto 0);
	y0 : out std_logic_vector(21 downto 0);
	y1 : out std_logic_vector(21 downto 0);
	y2 : out std_logic_vector(21 downto 0);
	y3 : out std_logic_vector(21 downto 0);
	y4 : out std_logic_vector(21 downto 0);
	y5 : out std_logic_vector(21 downto 0);
	y6 : out std_logic_vector(21 downto 0);
	y7 : out std_logic_vector(21 downto 0);
	y8 : out std_logic_vector(21 downto 0);
	y9 : out std_logic_vector(21 downto 0);
	y10 : out std_logic_vector(21 downto 0));
end playground;

