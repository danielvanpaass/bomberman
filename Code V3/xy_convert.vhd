library IEEE;
use IEEE.std_logic_1164.ALL;

entity xy_convert is
   port(x_in : in  std_logic_vector(3 downto 0);
	y_in : in  std_logic_vector(3 downto 0);	
	x1 : out std_logic;
	x2 : out std_logic;
	x3 : out std_logic;
	x4 : out std_logic;
	x5 : out std_logic;
	x6 : out std_logic;
	x7 : out std_logic;
	x8 : out std_logic;
	x9 : out std_logic;
	y1 : out std_logic;
	y2 : out std_logic;
	y3 : out std_logic;
	y4 : out std_logic;
	y5 : out std_logic;
	y6 : out std_logic;
	y7 : out std_logic;
	y8 : out std_logic;
	y9 : out std_logic);
end xy_convert;