library IEEE;
use IEEE.std_logic_1164.ALL;

entity vga_controller is
   port(clk    		 : in std_logic;  
        reset  		 : in  std_logic;
        lay0		  : in std_logic_vector(241 downto 0);
	lay1	  : in std_logic_vector(7 downto 0);
	lay2	  : in std_logic_vector(7 downto 0);
	lay3	  : in std_logic_vector(7 downto 0);
	lay3en	  : in std_logic;
        red_out   : out std_logic;
        green_out : out std_logic;
        blue_out  : out std_logic;
        h_sync 		 : out std_logic;
        v_sync 		 : out std_logic;
	v_clk	  : out std_logic);
end vga_controller;