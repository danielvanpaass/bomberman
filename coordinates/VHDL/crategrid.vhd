library IEEE;
use IEEE.std_logic_1164.ALL;

entity crategrid is
   port(y1 : in std_logic_vector(2 downto 0); --crates in first row
	y2 : in std_logic_vector(2 downto 0);
	y3 : in std_logic_vector(6 downto 0);
	y4 : in std_logic_vector(3 downto 0);
	y5 : in std_logic_vector(5 downto 0);
	y6 : in std_logic_vector(3 downto 0);
	y7 : in std_logic_vector(6 downto 0);
	y8 : in std_logic_vector(2 downto 0);
	y9 : in std_logic_vector(2 downto 0);
	crategrid : out std_logic_vector (80 downto 0)
);
end crategrid;

