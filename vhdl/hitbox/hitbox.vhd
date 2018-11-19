library IEEE;
use IEEE.std_logic_1164.ALL;

entity hitbox is
   port(clk		 : in  std_logic;
	reset	 : in  std_logic;
	old_x_p1 : in  std_logic_vector(3 downto 0);
        old_y_p1 : in  std_logic_vector(3 downto 0);
        old_x_p2 : in  std_logic_vector(3 downto 0);
        old_y_p2 : in  std_logic_vector(3 downto 0);
        crates   : in  std_logic_vector(120 downto 0);
        up_p1    : in  std_logic;
        right_p1 : in  std_logic;
        down_p1  : in  std_logic;
        left_p1  : in  std_logic;
        up_p2    : in  std_logic;
        right_p2 : in  std_logic;
        down_p2  : in  std_logic;
        left_p2  : in  std_logic;
        new_x_p1 : out std_logic_vector(3 downto 0);
        new_y_p1 : out std_logic_vector(3 downto 0);
        new_x_p2 : out std_logic_vector(3 downto 0);
        new_y_p2 : out std_logic_vector(3 downto 0));
end hitbox;

