library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of hitbox_top_lvl is
   component buff
      port(up_p1         : in  std_logic;
           right_p1      : in  std_logic;
           down_p1       : in  std_logic;
           left_p1       : in  std_logic;
           up_p2         : in  std_logic;
           right_p2      : in  std_logic;
           down_p2       : in  std_logic;
           left_p2       : in  std_logic;
           clk           : in  std_logic;
           reset         : in  std_logic;
           buff_up_p1    : out std_logic;
           buff_right_p1 : out std_logic;
           buff_down_p1  : out std_logic;
           buff_left_p1  : out std_logic;
           buff_up_p2    : out std_logic;
           buff_right_p2 : out std_logic;
           buff_down_p2  : out std_logic;
           buff_left_p2  : out std_logic);
   end component;

   component hitbox
    PORT (
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
     x_p1_out         : OUT std_logic_vector(3 DOWNTO 0);
     y_p1_out         : OUT std_logic_vector(3 DOWNTO 0);
     x_p2_out         : OUT std_logic_vector(3 DOWNTO 0);
     y_p2_out         : OUT std_logic_vector(3 DOWNTO 0)
    );
   end component;
signal buff_up_p1, buff_right_p1 , buff_down_p1, buff_left_p1, buff_up_p2,  buff_right_p2 ,           buff_down_p2 ,        buff_left_p2 : std_logic;
begin
direction_buff1: buff port map (up_p1 , right_p1, down_p1 ,left_p1 , up_p2 ,right_p2, down_p2, left_p2 ,  clk , reset , buff_up_p1  , buff_right_p1 ,  buff_down_p1, buff_left_p1 ,  buff_up_p2   ,  buff_right_p2, buff_down_p2, buff_left_p2);
hitbox1: hitbox port map (v_clk,  reset , walls_and_crates, bomb_x_a ,bomb_y_a , bomb_x_b ,bomb_y_b ,bomb_x_c ,bomb_y_c,bomb_x_d,bomb_y_d, bomb_x_e ,bomb_y_e , bomb_x_f,bomb_y_f , bomb_x_g, bomb_y_g , bomb_x_h , bomb_y_h , bomb_a_active ,bomb_b_active , bomb_c_active, bomb_d_active, bomb_e_active , bomb_f_active ,  bomb_g_active , bomb_h_active  , buff_up_p1  , buff_right_p1 ,   buff_down_p1 ,  buff_left_p1 ,   buff_up_p2 , buff_right_p2 , buff_down_p2 , buff_left_p2  , x_p1 ,  y_p1 , x_p2 ,  y_p2);
end behaviour;



