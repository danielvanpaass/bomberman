library IEEE;
use IEEE.std_logic_1164.ALL;

entity sprites is
   port(victory : in std_logic_vector (1 downto 0);
playground: in  std_logic_vector(241 downto 0);
	clk : in std_logic;
	reset: in std_logic;
        x_p1          : in  std_logic_vector(3 downto 0);
        y_p1          : in  std_logic_vector(3 downto 0);
       x_p2          : in  std_logic_vector(3 downto 0);
       y_p2          : in  std_logic_vector(3 downto 0);
        x_bomb_a      : in  std_logic_vector(3 downto 0);
        y_bomb_a      : in  std_logic_vector(3 downto 0);
        bomb_a_enable : in  std_logic;
        x_bomb_b      : in  std_logic_vector(3 downto 0);
        y_bomb_b      : in  std_logic_vector(3 downto 0);
        bomb_b_enable : in  std_logic;
        x_bomb_c      : in  std_logic_vector(3 downto 0);
        y_bomb_c      : in  std_logic_vector(3 downto 0);
        bomb_c_enable : in  std_logic;
        x_bomb_d      : in  std_logic_vector(3 downto 0);
        y_bomb_d      : in  std_logic_vector(3 downto 0);
        bomb_d_enable : in  std_logic;
        x_bomb_e      : in  std_logic_vector(3 downto 0);
        y_bomb_e      : in  std_logic_vector(3 downto 0);
        bomb_e_enable : in  std_logic;
        x_bomb_f      : in  std_logic_vector(3 downto 0);
        y_bomb_f      : in  std_logic_vector(3 downto 0);
        bomb_f_enable : in  std_logic;
        x_bomb_g      : in  std_logic_vector(3 downto 0);
        y_bomb_g      : in  std_logic_vector(3 downto 0);
        bomb_g_enable : in  std_logic;
        x_bomb_h      : in  std_logic_vector(3 downto 0);
        y_bomb_h      : in  std_logic_vector(3 downto 0);
        bomb_h_enable : in  std_logic;
        x_map         : in  std_logic_vector(3 downto 0);
        y_map         : in  std_logic_vector(3 downto 0);
        input_h_map         : in  std_logic_vector(4 downto 0);--changed from 5 downto 0
        input_v_map         : in  std_logic_vector(5 downto 0);--changed from 6 downto 0
	video_on : in std_logic;
	red : out std_logic;
	green : out std_logic;
	blue: out std_logic);      
end sprites;




