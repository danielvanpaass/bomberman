library IEEE;
use IEEE.std_logic_1164.ALL;

entity top_bomberman is
   port (up_p1:in std_logic;
         left_p1:in std_logic;
         right_p1:in std_logic;
         down_p1:in std_logic;
         down_p2:in std_logic;
         left_p2:in std_logic;
         up_p2:in std_logic;
         right_p2:in std_logic;
         clk:in std_logic;
         reset:in std_logic;
         bomb_p1:in std_logic;
         bomb_p2:in std_logic;
         TEMP:in std_logic;
         TEMP_vector:in std_logic_vector(7 downto 0);
         TEMP_vector4:in std_logic_vector(3 downto 0);
         vga_vsync:out std_logic;
         vga_hsync:out std_logic;
         TEMP3:out std_logic_vector(3 downto 0);
         TEMP4:out std_logic_vector(3 downto 0);
         TEMP6:out std_logic_vector(3 downto 0);
         TEMP7:out std_logic_vector(7 downto 0));
end top_bomberman;

