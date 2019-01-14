library IEEE;
use IEEE.std_logic_1164.ALL;
-- This connects EVERYTHING
architecture structural of hitscan_top is
   component ff2
      port(read      : IN  std_logic;
           FF2_reset : IN  std_logic;
   	   clk	     : IN	std_logic;
           FF2_read  : OUT std_logic);
   end component;

   component hitscan
      port(X_b   : IN std_logic_vector(3 downto 0);
   		Y_b   : IN std_logic_vector(3 downto 0);
        		res   : IN		std_logic;
   		clk   : IN  std_logic;
   		explode : IN std_logic;
   		FF2_read : IN std_logic;
   		X_p1  : IN  std_logic_vector(3 downto 0);
           		Y_p1  : IN  std_logic_vector(3 downto 0);
           		X_p2  : IN  std_logic_vector(3 downto 0);
           		Y_p2  : IN  std_logic_vector(3 downto 0);
   		victoryv   : OUT std_logic_vector(1 downto 0);
		lethal_flag : OUT std_logic;
   		read  : OUT std_logic;
   		FF2_reset : OUT std_logic;
           		lethaltile_x_out : OUT std_logic_vector(3 downto 0);
           		lethaltile_y_out : OUT std_logic_vector(3 downto 0));
   end component;

component req_co is
     port(clk : in std_logic;
	reset : in std_logic;
	fin_explosion : in std_logic_vector(7 downto 0);	
	bomb_a_x : in std_logic_vector(3 downto 0);
	bomb_a_y : in std_logic_vector(3 downto 0);
	bomb_b_x : in std_logic_vector(3 downto 0);
	bomb_b_y : in std_logic_vector(3 downto 0);
	bomb_c_x : in std_logic_vector(3 downto 0);
	bomb_c_y : in std_logic_vector(3 downto 0);
	bomb_d_x : in std_logic_vector(3 downto 0);
	bomb_d_y : in std_logic_vector(3 downto 0);
	bomb_e_x : in std_logic_vector(3 downto 0);
	bomb_e_y : in std_logic_vector(3 downto 0);
	bomb_f_x : in std_logic_vector(3 downto 0);
	bomb_f_y : in std_logic_vector(3 downto 0);
	bomb_g_x : in std_logic_vector(3 downto 0);
	bomb_g_y : in std_logic_vector(3 downto 0);
	bomb_h_x : in std_logic_vector(3 downto 0);
	bomb_h_y : in std_logic_vector(3 downto 0);
	req_out_x: out std_logic_vector(3 downto 0);
	req_out_y: out std_logic_vector(3 downto 0));
end component;


	signal read, FF2_read, FF2_reset, explode_read: std_logic;
	signal x_b_out, y_b_out, x_b_buff, y_b_buff : std_logic_vector(3 downto 0);

begin

pm_ff2: FF2 port map(read,FF2_reset,clk,FF2_read);
pm_hs: hitscan port map(X_b_buff, Y_b_buff,res,clk,explode_read,FF2_read,X_p1,Y_p1,X_p2,Y_p2,victoryv,lethal_flag,read,FF2_reset,lethaltile_x_out,lethaltile_y_out);

req : req_co port map (clk, res, fin_explosion, bomb_a_x, bomb_a_y, bomb_b_x, bomb_b_y, bomb_c_x, bomb_c_y, bomb_d_x, bomb_d_y, bomb_e_x, bomb_e_y, bomb_f_x, bomb_f_y, bomb_g_x, bomb_g_y, bomb_h_x, bomb_h_y, x_b_out, y_b_out);

explode_read <= explode;

reg_out_x <= x_b_buff;
reg_out_y <= y_b_buff; 


x_b_buff(0) <= x_b_out(0) OR x_b_out(0);
x_b_buff(1) <= x_b_out(1) OR x_b_out(1);
x_b_buff(2) <= x_b_out(2) OR x_b_out(2);
x_b_buff(3) <= x_b_out(3) OR x_b_out(3); 

y_b_buff(0) <= y_b_out(0) OR y_b_out(0); 
y_b_buff(1) <= y_b_out(1) OR y_b_out(1); 
y_b_buff(2) <= y_b_out(2) OR y_b_out(2);
y_b_buff(3) <= y_b_out(3) OR y_b_out(3);
end structural;

