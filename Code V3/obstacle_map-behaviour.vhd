library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of obstacle_map is


component uneven_bits is
   port(input  : in  std_logic_vector(21 downto 0);
        output : out std_logic_vector(10 downto 0));
end component;

signal  y0,y1,y2,y3,y4,y5,y6,y7,y8,y9,y10: std_logic_vector(21 downto 0);

signal  o0,o1,o2,o3,o4,o5,o6,o7,o8,o9,o10: std_logic_vector(10 downto 0);


begin

y10<= playground(21 downto 0);
y9<=  playground(43 downto 22);
y8<=  playground (65 downto 44 );
y7<=  playground (87 downto 66);
y6<= playground( 109 downto 88);
y5<=  playground(131 downto 110);
y4<=  playground (153 downto 132);
y3<=  playground (175 downto 154);
y2<= playground( 197 downto 176);
y1<=  playground(219 downto 198);
y0<=  playground(241 downto 220);


U10: uneven_bits  port map(input =>y10,output=>o10);
U9: uneven_bits  port map(input =>y9,output=>o9);
U8: uneven_bits  port map(input =>y8,output=>o8);
U7: uneven_bits  port map(input =>y7,output=>o7);
U6: uneven_bits  port map(input =>y6,output=>o6);
U5: uneven_bits  port map(input =>y5,output=>o5);
U4: uneven_bits  port map(input =>y4,output=>o4);
U3: uneven_bits  port map(input =>y3,output=>o3);
U2: uneven_bits  port map(input =>y2,output=>o2);
U1: uneven_bits  port map(input =>y1,output=>o1);
U0: uneven_bits  port map(input =>y0,output=>o0);


obstacle<= o0  & o1  &  o2  & o3 & o4 & o5  &  o6  & o7 & o8  & o9  &  o10;   
end behaviour;
