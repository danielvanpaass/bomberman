library IEEE;
use IEEE.std_logic_1164.ALL;

entity hitbox is
   port(clk		 : in  std_logic;
	reset	 : in  std_logic;
        crates   : in  std_logic_vector(120 downto 0);
        walls    : in  std_logic_vector(120 downto 0);
	--bomb_x_P1a	 : in  std_logic_vector(3 downto 0);
	--bomb_y_P1a	 : in  std_logic_vector(3 downto 0);
	--bomb_x_P1b	 : in  std_logic_vector(3 downto 0);
	--bomb_y_P1b	 : in  std_logic_vector(3 downto 0);
	--bomb_x_P1c	 : in  std_logic_vector(3 downto 0);
	--bomb_y_P1c	 : in  std_logic_vector(3 downto 0);
	--bomb_x_P1d	 : in  std_logic_vector(3 downto 0);
	--bomb_y_P1d	 : in  std_logic_vector(3 downto 0);
	--bomb_x_P2a	 : in  std_logic_vector(3 downto 0);
	--bomb_y_P2a	 : in  std_logic_vector(3 downto 0);
	--bomb_x_P2b	 : in  std_logic_vector(3 downto 0);
	--bomb_y_P2b	 : in  std_logic_vector(3 downto 0);
	--bomb_x_P2c	 : in  std_logic_vector(3 downto 0);
	--bomb_y_P2c	 : in  std_logic_vector(3 downto 0);
	--bomb_x_P2d	 : in  std_logic_vector(3 downto 0);
	--bomb_y_P2d	 : in  std_logic_vector(3 downto 0);
        --up_p1    : in  std_logic;
        right_p1 : in  std_logic;
        --down_p1  : in  std_logic;
        --left_p1  : in  std_logic;
        --up_p2    : in  std_logic;
        --right_p2 : in  std_logic;
        --down_p2  : in  std_logic;
        --left_p2  : in  std_logic;
        x_p1 : out std_logic_vector(3 downto 0);
        y_p1 : out std_logic_vector(3 downto 0));
        --new_x_p2 : out std_logic_vector(3 downto 0);
        --new_y_p2 : out std_logic_vector(3 downto 0));
end hitbox;

