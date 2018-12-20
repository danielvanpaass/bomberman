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
   		read  : OUT std_logic;
   		FF2_reset : OUT std_logic;
           		lethaltile_x : OUT std_logic_vector(3 downto 0);
           		lethaltile_y : OUT std_logic_vector(3 downto 0));
   end component;

	signal FF2_read, FF2_reset : std_logic;

begin

pm_ff2: FF2 port map(read,FF2_reset,clk,FF2_read);
pm_hs: hitscan port map(X_b, Y_b,res,clk,explode,FF2_read,X_p1,Y_p1,X_p2,Y_p2,victoryv,read,FF2_reset,lethaltile_x,lethaltile_y);
end structural;
