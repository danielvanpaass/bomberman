library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of buff is
   component reg
      port(d_in  : in  std_logic_vector(7 downto 0);
           d_out : out std_logic_vector(7 downto 0);
           clk   : in  std_logic;
           reset : in  std_logic);
   end component;

SIGNAL input_data_in, input_data_intermediate, input_data_out : std_logic_vector(7 DOWNTO 0);

BEGIN
 input_data_in <= up_p1&right_p1&down_p1&left_p1&up_p2&right_p2&down_p2&left_p2; -- bits to vector

 first_buffer : reg PORT MAP(d_in => input_data_in, clk => clk, reset => reset, d_out => input_data_intermediate);
 second_buffer : reg PORT MAP(d_in => input_data_intermediate, clk => clk, reset => reset, d_out => input_data_out);

buff_up_p1<= input_data_out(7);
buff_right_p1<= input_data_out(6);
buff_down_p1<= input_data_out(5);
buff_left_p1<= input_data_out(4);
buff_up_p2<= input_data_out(3);
buff_right_p2<= input_data_out(2);
buff_down_p2<= input_data_out(1);
buff_left_p2<= input_data_out(0);
end behaviour;

