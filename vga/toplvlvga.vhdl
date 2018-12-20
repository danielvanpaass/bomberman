
library IEEE;
use IEEE.std_logic_1164.ALL;

entity vga_top_lvl is
PORT (--part of vga_counter
  clk              : IN std_logic;
 
  reset            : IN std_logic;
vga_hsync  : OUT std_logic;
vga_vsync  : OUT std_logic;
clock_60hz : OUT std_logic;
x_out      : OUT std_logic_vector(3 DOWNTO 0);
y_out      : OUT std_logic_vector(3 DOWNTO 0);
		h_out      : OUT std_logic_vector(4 DOWNTO 0);
		v_out      : OUT std_logic_vector(5 DOWNTO 0);
--this is part of sprites
victory : in std_logic;
playground: in  std_logic_vector(241 downto 0);
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

	red : out std_logic;
	green : out std_logic;
	blue: out std_logic   --not sure

 );  
end vga_top_lvl;

library IEEE;
use IEEE.std_logic_1164.ALL;


architecture behaviour of vga_top_lvl IS
component vga_controller	
PORT
	(
		clk        : IN std_logic;
		reset      : IN std_logic;
		vga_hsync  : OUT std_logic;
		vga_vsync  : OUT std_logic;
		clock_60hz : OUT std_logic;
		x_out      : OUT std_logic_vector(3 DOWNTO 0);
		y_out      : OUT std_logic_vector(3 DOWNTO 0);
		h_out      : OUT std_logic_vector(4 DOWNTO 0);
		v_out      : OUT std_logic_vector(5 DOWNTO 0)
	);
END component;
component sprites 
   port(victory : in std_logic;
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
        input_h_map         : in  std_logic_vector(4 downto 0);
        input_v_map         : in  std_logic_vector(5 downto 0);
	red : out std_logic;
	green : out std_logic;
	blue: out std_logic);      
end component;
signal x_out_temp, y_out_temp  :  std_logic_vector(3 DOWNTO 0);
signal h_out_temp      : std_logic_vector(4 DOWNTO 0);
signal v_out_temp     : std_logic_vector(5 DOWNTO 0);

begin
map1: vga_controller port map (clk, reset, vga_hsync, vga_vsync, clock_60hz, x_out_temp, y_out_temp, h_out_temp, v_out_temp);
map2: sprites port map ( victory, playground, clk , reset , x_p1, y_p1, x_p2, y_p2, x_bomb_a, y_bomb_a, bomb_a_enable, x_bomb_b, y_bomb_b, bomb_b_enable, x_bomb_c, y_bomb_c, bomb_c_enable, x_bomb_d, y_bomb_d, bomb_d_enable, x_bomb_e, y_bomb_e, bomb_e_enable, x_bomb_f, y_bomb_f, bomb_f_enable, x_bomb_g, y_bomb_g, bomb_g_enable, x_bomb_h, y_bomb_h, bomb_h_enable, x_out_temp, y_out_temp, h_out_temp, v_out_temp, red, green, blue  );
end behaviour;
