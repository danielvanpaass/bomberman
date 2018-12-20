library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of last_bomb_tb is
   component last_bomb
      port(clk : in  std_logic;
   	reset : in std_logic;
   	flag_htoa : in std_logic_vector(7 downto 0);
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
   	expl_x : out std_logic_vector(3 downto 0);
   	expl_y : out std_logic_vector(3 downto 0));
   end component;
   signal clk : std_logic;
   signal reset : std_logic;
   signal flag_htoa : std_logic_vector(7 downto 0);
   signal bomb_a_x : std_logic_vector(3 downto 0);
   signal bomb_a_y : std_logic_vector(3 downto 0);
   signal bomb_b_x : std_logic_vector(3 downto 0);
   signal bomb_b_y : std_logic_vector(3 downto 0);
   signal bomb_c_x : std_logic_vector(3 downto 0);
   signal bomb_c_y : std_logic_vector(3 downto 0);
   signal bomb_d_x : std_logic_vector(3 downto 0);
   signal bomb_d_y : std_logic_vector(3 downto 0);
   signal bomb_e_x : std_logic_vector(3 downto 0);
   signal bomb_e_y : std_logic_vector(3 downto 0);
   signal bomb_f_x : std_logic_vector(3 downto 0);
   signal bomb_f_y : std_logic_vector(3 downto 0);
   signal bomb_g_x : std_logic_vector(3 downto 0);
   signal bomb_g_y : std_logic_vector(3 downto 0);
   signal bomb_h_x : std_logic_vector(3 downto 0);
   signal bomb_h_y : std_logic_vector(3 downto 0);
   signal expl_x : std_logic_vector(3 downto 0);
   signal expl_y : std_logic_vector(3 downto 0);
begin
test: last_bomb port map (clk, reset, flag_htoa, bomb_a_x, bomb_a_y, bomb_b_x, bomb_b_y, bomb_c_x, bomb_c_y, bomb_d_x, bomb_d_y, bomb_e_x, bomb_e_y, bomb_f_x, bomb_f_y, bomb_g_x, bomb_g_y, bomb_h_x, bomb_h_y, expl_x, expl_y);
 clk <= '1' after 0 ns,
      '0' after 10 ns when clk /= '0' else '1' after 10 ns;
 --  clk <= '0' after 0 ns;
   reset <= '0' after 0 ns;
   flag_htoa <= "00000000" after 0 ns,
"10000000" after 35 ns,
"00000000" after 55 ns,
"00000010" after 90 ns,
"00000000" after 110 ns,
"00100000" after 145 ns,
"00000000" after 165 ns,
"00000001" after 200 ns,
"00000000" after 220 ns,
"00000010" after 255 ns,
"00000000" after 275 ns,
"10000000" after 310 ns,
"00000000" after 330 ns;
   bomb_a_x <= "0001" after 0 ns;
   bomb_a_y <= "0001" after 0 ns;
   bomb_b_x <= "0010" after 0 ns,
"0000" after 150 ns;
   bomb_b_y <= "0010" after 0 ns,
"0000" after 150 ns;
   bomb_c_x <= "0011" after 0 ns;
   bomb_c_y <= "0011" after 0 ns;
   bomb_d_x <= "0100" after 0 ns;
   bomb_d_y <= "0100" after 0 ns;
   bomb_e_x <= "0101" after 0 ns;
   bomb_e_y <= "0101" after 0 ns;
   bomb_f_x <= "0110" after 0 ns;
   bomb_f_y <= "0110" after 0 ns;
   bomb_g_x <= "0111" after 0 ns;
   bomb_g_y <= "0111" after 0 ns;
   bomb_h_x <= "1000" after 0 ns,
"1111" after 150 ns;
   bomb_h_y <= "1000" after 0 ns,
"1111" after 150 ns;

end behaviour;

