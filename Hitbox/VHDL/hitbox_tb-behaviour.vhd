library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of hitbox_tb is
   component hitbox
    PORT (
     v_clk		   : IN std_logic;
     reset            : IN std_logic;
     walls_and_crates : IN std_logic_vector(0 TO 120);
     bomb_x_a         : IN std_logic_vector(3 DOWNTO 0);
     bomb_y_a         : IN std_logic_vector(3 DOWNTO 0);
     bomb_x_b         : IN std_logic_vector(3 DOWNTO 0);
     bomb_y_b         : IN std_logic_vector(3 DOWNTO 0);
     bomb_x_c         : IN std_logic_vector(3 DOWNTO 0);
     bomb_y_c         : IN std_logic_vector(3 DOWNTO 0);
     bomb_x_d         : IN std_logic_vector(3 DOWNTO 0);
     bomb_y_d         : IN std_logic_vector(3 DOWNTO 0);
     bomb_x_e         : IN std_logic_vector(3 DOWNTO 0);
     bomb_y_e         : IN std_logic_vector(3 DOWNTO 0);
     bomb_x_f         : IN std_logic_vector(3 DOWNTO 0);
     bomb_y_f         : IN std_logic_vector(3 DOWNTO 0);
     bomb_x_g         : IN std_logic_vector(3 DOWNTO 0);
     bomb_y_g         : IN std_logic_vector(3 DOWNTO 0);
     bomb_x_h         : IN std_logic_vector(3 DOWNTO 0);
     bomb_y_h         : IN std_logic_vector(3 DOWNTO 0);
     bomb_a_active    : IN std_logic;
     bomb_b_active    : IN std_logic;
     bomb_c_active    : IN std_logic;
     bomb_d_active    : IN std_logic;
     bomb_e_active    : IN std_logic;
     bomb_f_active    : IN std_logic;
     bomb_g_active    : IN std_logic;
     bomb_h_active    : IN std_logic;
     up_p1            : IN std_logic;
     right_p1         : IN std_logic;
     down_p1          : IN std_logic;
     left_p1          : IN std_logic;
     up_p2            : IN std_logic;
     right_p2         : IN std_logic;
     down_p2          : IN std_logic;
     left_p2          : IN std_logic;
     x_p1             : OUT std_logic_vector(3 DOWNTO 0);
     y_p1             : OUT std_logic_vector(3 DOWNTO 0);
     x_p2             : OUT std_logic_vector(3 DOWNTO 0);
     y_p2             : OUT std_logic_vector(3 DOWNTO 0)
    );
   end component;
   signal v_clk		   : std_logic;
   signal reset            : std_logic;
   signal walls_and_crates : std_logic_vector(0 TO 120);
   signal bomb_x_a         : std_logic_vector(3 DOWNTO 0);
   signal bomb_y_a         : std_logic_vector(3 DOWNTO 0);
   signal bomb_x_b         : std_logic_vector(3 DOWNTO 0);
   signal bomb_y_b         : std_logic_vector(3 DOWNTO 0);
   signal bomb_x_c         : std_logic_vector(3 DOWNTO 0);
   signal bomb_y_c         : std_logic_vector(3 DOWNTO 0);
   signal bomb_x_d         : std_logic_vector(3 DOWNTO 0);
   signal bomb_y_d         : std_logic_vector(3 DOWNTO 0);
   signal bomb_x_e         : std_logic_vector(3 DOWNTO 0);
   signal bomb_y_e         : std_logic_vector(3 DOWNTO 0);
   signal bomb_x_f         : std_logic_vector(3 DOWNTO 0);
   signal bomb_y_f         : std_logic_vector(3 DOWNTO 0);
   signal bomb_x_g         : std_logic_vector(3 DOWNTO 0);
   signal bomb_y_g         : std_logic_vector(3 DOWNTO 0);
   signal bomb_x_h         : std_logic_vector(3 DOWNTO 0);
   signal bomb_y_h         : std_logic_vector(3 DOWNTO 0);
   signal bomb_a_active    : std_logic;
   signal bomb_b_active    : std_logic;
   signal bomb_c_active    : std_logic;
   signal bomb_d_active    : std_logic;
   signal bomb_e_active    : std_logic;
   signal bomb_f_active    : std_logic;
   signal bomb_g_active    : std_logic;
   signal bomb_h_active    : std_logic;
   signal up_p1            : std_logic;
   signal right_p1         : std_logic;
   signal down_p1          : std_logic;
   signal left_p1          : std_logic;
   signal up_p2            : std_logic;
   signal right_p2         : std_logic;
   signal down_p2          : std_logic;
   signal left_p2          : std_logic;
   signal x_p1             : std_logic_vector(3 DOWNTO 0);
   signal y_p1             : std_logic_vector(3 DOWNTO 0);
   signal x_p2             : std_logic_vector(3 DOWNTO 0);
   signal y_p2             : std_logic_vector(3 DOWNTO 0);
begin
test: hitbox port map (v_clk, reset, walls_and_crates, bomb_x_a, bomb_y_a, bomb_x_b, bomb_y_b, bomb_x_c, bomb_y_c, bomb_x_d, bomb_y_d, bomb_x_e, bomb_y_e, bomb_x_f, bomb_y_f, bomb_x_g, bomb_y_g, bomb_x_h, bomb_y_h, bomb_a_active, bomb_b_active, bomb_c_active, bomb_d_active, bomb_e_active, bomb_f_active, bomb_g_active, bomb_h_active, up_p1, right_p1, down_p1, left_p1, up_p2, right_p2, down_p2, left_p2, x_p1, y_p1, x_p2, y_p2);
   v_clk <= '1' after 0 ns,
	'0' after 8000 ns when v_clk /= '0' else '1' after 8000 ns;
   reset <= '1' after 0 ns,
	'0' after 20000 ns;
   walls_and_crates <= "1111111111110000000001101010101011000000000110101010101100000000011010101010110000000001101010101011000000000111111111111";
   bomb_x_a(0) <= '0' after 0 ns;
   bomb_x_a(1) <= '0' after 0 ns;
   bomb_x_a(2) <= '1' after 0 ns;
   bomb_x_a(3) <= '0' after 0 ns;
   bomb_y_a(0) <= '1' after 0 ns;
   bomb_y_a(1) <= '0' after 0 ns;
   bomb_y_a(2) <= '0' after 0 ns;
   bomb_y_a(3) <= '0' after 0 ns;
   bomb_x_b(0) <= '0' after 0 ns;
   bomb_x_b(1) <= '0' after 0 ns;
   bomb_x_b(2) <= '0' after 0 ns;
   bomb_x_b(3) <= '0' after 0 ns;
   bomb_y_b(0) <= '0' after 0 ns;
   bomb_y_b(1) <= '0' after 0 ns;
   bomb_y_b(2) <= '0' after 0 ns;
   bomb_y_b(3) <= '0' after 0 ns;
   bomb_x_c(0) <= '0' after 0 ns;
   bomb_x_c(1) <= '0' after 0 ns;
   bomb_x_c(2) <= '0' after 0 ns;
   bomb_x_c(3) <= '0' after 0 ns;
   bomb_y_c(0) <= '0' after 0 ns;
   bomb_y_c(1) <= '0' after 0 ns;
   bomb_y_c(2) <= '0' after 0 ns;
   bomb_y_c(3) <= '0' after 0 ns;
   bomb_x_d(0) <= '0' after 0 ns;
   bomb_x_d(1) <= '0' after 0 ns;
   bomb_x_d(2) <= '0' after 0 ns;
   bomb_x_d(3) <= '0' after 0 ns;
   bomb_y_d(0) <= '0' after 0 ns;
   bomb_y_d(1) <= '0' after 0 ns;
   bomb_y_d(2) <= '0' after 0 ns;
   bomb_y_d(3) <= '0' after 0 ns;
   bomb_x_e(0) <= '0' after 0 ns;
   bomb_x_e(1) <= '0' after 0 ns;
   bomb_x_e(2) <= '0' after 0 ns;
   bomb_x_e(3) <= '0' after 0 ns;
   bomb_y_e(0) <= '0' after 0 ns;
   bomb_y_e(1) <= '0' after 0 ns;
   bomb_y_e(2) <= '0' after 0 ns;
   bomb_y_e(3) <= '0' after 0 ns;
   bomb_x_f(0) <= '0' after 0 ns;
   bomb_x_f(1) <= '0' after 0 ns;
   bomb_x_f(2) <= '0' after 0 ns;
   bomb_x_f(3) <= '0' after 0 ns;
   bomb_y_f(0) <= '0' after 0 ns;
   bomb_y_f(1) <= '0' after 0 ns;
   bomb_y_f(2) <= '0' after 0 ns;
   bomb_y_f(3) <= '0' after 0 ns;
   bomb_x_g(0) <= '0' after 0 ns;
   bomb_x_g(1) <= '0' after 0 ns;
   bomb_x_g(2) <= '0' after 0 ns;
   bomb_x_g(3) <= '0' after 0 ns;
   bomb_y_g(0) <= '0' after 0 ns;
   bomb_y_g(1) <= '0' after 0 ns;
   bomb_y_g(2) <= '0' after 0 ns;
   bomb_y_g(3) <= '0' after 0 ns;
   bomb_x_h(0) <= '0' after 0 ns;
   bomb_x_h(1) <= '0' after 0 ns;
   bomb_x_h(2) <= '0' after 0 ns;
   bomb_x_h(3) <= '0' after 0 ns;
   bomb_y_h(0) <= '0' after 0 ns;
   bomb_y_h(1) <= '0' after 0 ns;
   bomb_y_h(2) <= '0' after 0 ns;
   bomb_y_h(3) <= '0' after 0 ns;
   bomb_a_active <= '1' after 0 ns;
   bomb_b_active <= '0' after 0 ns;
   bomb_c_active <= '0' after 0 ns;
   bomb_d_active <= '0' after 0 ns;
   bomb_e_active <= '0' after 0 ns;
   bomb_f_active <= '0' after 0 ns;
   bomb_g_active <= '0' after 0 ns;
   bomb_h_active <= '0' after 0 ns;
   up_p1 <= '0' after 0 ns;
   right_p1 <= '1' after 0 ns;
   down_p1 <= '0' after 0 ns;
   left_p1 <= '0' after 0 ns;
   up_p2 <= '1' after 0 ns;
   right_p2 <= '0' after 0 ns;
   down_p2 <= '0' after 0 ns;
   left_p2 <= '0' after 0 ns;
end behaviour;

