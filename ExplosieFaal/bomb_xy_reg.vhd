library IEEE;
use IEEE.std_logic_1164.ALL;

entity bomb_xy_reg is
   port(clk : in  std_logic;
	reset : in std_logic;
        x_b  : in  std_logic_vector(3 downto 0);
	y_b  : in  std_logic_vector(3 downto 0);
	co_release : in std_logic;
	co_store : in std_logic;
	start_hitscan : out std_logic;
	x_b_out : out std_logic_vector(3 downto 0);
	y_b_out : out std_logic_vector(3 downto 0));
end bomb_xy_reg;

