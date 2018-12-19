library IEEE;
use IEEE.std_logic_1164.ALL;
use ieee.std_logic_unsigned.all;

entity VGA_tb is
end entity VGA_tb;

architecture behaviour of VGA_tb is
   component VGA_controller
      port (clk, reset                        : in std_logic;
            vga_hsync, vga_vsync, clock_60hz  : out std_logic;
            x_out, y_out                      : out std_logic_vector (2 downto 0);
            h_out                             : out std_logic_vector (2 downto 0);
            v_out                             : out std_logic_vector (2 downto 0));        
   end component;

signal clk, reset                        : std_logic;
signal vga_hsync, vga_vsync, clock_60hz  : std_logic;
signal x_out, y_out                      : std_logic_vector (2 downto 0);
signal h_out                             : std_logic_vector (2 downto 0);
signal v_out                             : std_logic_vector (2 downto 0); 

begin 

   L1: VGA_controller port map (clk, reset, vga_hsync, vga_vsync, clock_60hz, x_out, y_out, h_out, v_out);
   
   clk <= '1' after 0 ns,
	   '0' after 40 ns  when clk /= '0' else '1' after 40 ns;

   reset <= '1' after  0 ns,
            '0' after 100 ns,
            '1' after  2410 ns,
            '0' after  2510 ns; 

end architecture behaviour;

