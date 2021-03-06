library IEEE;
use IEEE.std_logic_1164.ALL;

entity hitbox_top_lvl is
PORT (
  clk		   : IN std_logic;
  v_clk		   : IN std_logic;
  reset            : IN std_logic;
  walls_and_crates : IN std_logic_vector(120 DOWNTO 0);
  bomb_x_a         : IN std_logic_vector(3 DOWNTO 0);
  bomb_y_a         : IN std_logic_vector(3 DOWNTO 0);
  bomb_x_b         : IN std_logic_vector(3 DOWNTO 0);
  bomb_y_b         : IN std_logic_vector(3 DOWNTO 0);
  bomb_x_c         : IN std_logic_vector(3 DOWNTO 0);
  bomb_y_c         : IN std_logic_vector(3 DOWNTO 0);
  bomb_x_d         : IN std_logic_vector(3 DOWNTO 0);
  bomb_y_d         : IN std_logic_vector(3 DOWNTO 0);
  bomb_x_e         : IN std_logic_vector(3 DOWNTO 0);
  bomb_y_e         : IN std_logic_vector(3 DOWNTO 0);
  bomb_x_f         : IN std_logic_vector(3 DOWNTO 0);
  bomb_y_f         : IN std_logic_vector(3 DOWNTO 0);
  bomb_x_g         : IN std_logic_vector(3 DOWNTO 0);
  bomb_y_g         : IN std_logic_vector(3 DOWNTO 0);
  bomb_x_h         : IN std_logic_vector(3 DOWNTO 0);
  bomb_y_h         : IN std_logic_vector(3 DOWNTO 0);
  bomb_a_active    : IN std_logic;
  bomb_b_active    : IN std_logic;
  bomb_c_active    : IN std_logic;
  bomb_d_active    : IN std_logic;
  bomb_e_active    : IN std_logic;
  bomb_f_active    : IN std_logic;
  bomb_g_active    : IN std_logic;
  bomb_h_active    : IN std_logic;
  up_p1            : IN std_logic;
  right_p1         : IN std_logic;
  down_p1          : IN std_logic;
  left_p1          : IN std_logic;
  up_p2            : IN std_logic;
  right_p2         : IN std_logic;
  down_p2          : IN std_logic;
  left_p2          : IN std_logic;
  x_p1             : OUT std_logic_vector(3 DOWNTO 0);
  y_p1             : OUT std_logic_vector(3 DOWNTO 0);
  x_p2             : OUT std_logic_vector(3 DOWNTO 0);
  y_p2             : OUT std_logic_vector(3 DOWNTO 0)
 );  
end hitbox_top_lvl;



