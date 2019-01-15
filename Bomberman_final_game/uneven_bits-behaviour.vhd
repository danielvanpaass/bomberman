library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of uneven_bits is

component uneven_bits 
 port(
        input  : in  std_logic_vector(21 downto 0);
        output : out std_logic_vector(10 downto 0));
end component;

signal x1,x3,x5,x7,x9,x11,x13,x15,x17,x19,x21 :std_logic;

begin

x1<=input(1);
x3<=input(3);
x5<=input(5);
x7<=input(7);
x9<=input(9);
x11<=input(11);
x13<=input(13);
x15<=input(15);
x17<=input(17);
x19<=input(19);
x21<=input(21);


output(0)<='1' when x1='1' else '0';
output(1)<='1' when x3='1' else '0';
output(2)<='1' when x5='1' else '0';
output(3)<='1' when x7='1' else '0';
output(4)<='1' when x9='1' else '0';
output(5)<='1' when x11='1' else '0';
output(6)<='1' when x13='1' else '0';
output(7)<='1' when x15='1' else '0';
output(8)<='1' when x17='1' else '0';
output(9)<='1' when x19='1' else '0';
output(10)<='1' when x21='1' else '0';

end behaviour;

