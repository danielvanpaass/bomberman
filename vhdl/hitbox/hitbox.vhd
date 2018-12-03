library IEEE;
use IEEE.std_logic_1164.ALL;

entity hitbox is
   port(clk		 : in  std_logic;
	reset	 : in  std_logic;
        walls_and_crates   : in  std_logic_vector(120 downto 0);
	bomb_x_a	 : in  std_logic_vector(3 downto 0);
	bomb_y_a	 : in  std_logic_vector(3 downto 0);
	bomb_x_b	 : in  std_logic_vector(3 downto 0);
	bomb_y_b	 : in  std_logic_vector(3 downto 0);

	bomb_a_active : in std_logic;
	bomb_b_active : in std_logic;

        up_p1    : in  std_logic;
        right_p1 : in  std_logic;
        down_p1  : in  std_logic;
        left_p1  : in  std_logic;
        up_p2    : in  std_logic;
        right_p2 : in  std_logic;
        down_p2  : in  std_logic;
        left_p2  : in  std_logic;
        x_p1 : out std_logic_vector(3 downto 0);
        y_p1 : out std_logic_vector(3 downto 0);
        x_p2 : out std_logic_vector(3 downto 0);
        y_p2 : out std_logic_vector(3 downto 0));

end hitbox;

