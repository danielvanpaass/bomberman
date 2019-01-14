library IEEE;
use IEEE.std_logic_1164.ALL;

entity bombhandling is
port(clk : in std_logic;
	clk_30_input : in std_logic;
	reset : in std_logic;
	victoryflag : out std_logic_vector(1 downto 0);
	pos_xp1 : in std_logic_vector(3 downto 0);
	pos_xp2 : in std_logic_vector(3 downto 0);
	pos_yp1 : in std_logic_vector(3 downto 0);
	pos_yp2 : in std_logic_vector(3 downto 0);
	bombp1	: in std_logic;
	bombp2 	: in std_logic;
	explos_sound : out std_logic;
	placed_sound :	out std_logic;
	bomb_a	: out std_logic;	
	bomb_b	: out std_logic;		
	bomb_c	: out std_logic;		
	bomb_d	: out std_logic;		
	bomb_e	: out std_logic;		
	bomb_f	: out std_logic;		
	bomb_g	: out std_logic;		
	bomb_h	: out std_logic;	
	VGA	: out std_logic_vector(241 downto 0);
	obstacle: out std_logic_vector(120 downto 0));		
end bombhandling;

