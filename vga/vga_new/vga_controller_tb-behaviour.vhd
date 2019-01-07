library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of vga_controller_tb is
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
   		v_out      : OUT std_logic_vector(5 DOWNTO 0);
   		video_on   : OUT std_logic
   	);
   end component;
   signal 		clk        : std_logic;
   signal reset      : std_logic;
   signal vga_hsync  : std_logic;
   signal vga_vsync  : std_logic;
   signal clock_60hz : std_logic;
   signal x_out      : std_logic_vector(3 DOWNTO 0);
   signal y_out      : std_logic_vector(3 DOWNTO 0);
   signal h_out      : std_logic_vector(4 DOWNTO 0);
   signal v_out      : std_logic_vector(5 DOWNTO 0);
   signal video_on   : std_logic;

begin 

   L1: VGA_controller port map (clk, reset, vga_hsync, vga_vsync, clock_60hz, x_out, y_out, h_out, v_out);
   
   clk <= '1' after 0 ns,
	   '0' after 40 ns  when clk /= '0' else '1' after 40 ns;

   reset <= '1' after  0 ns,
            '0' after 100 ns;

end architecture behaviour;
