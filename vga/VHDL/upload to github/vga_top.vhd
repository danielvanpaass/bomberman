LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY vga_top_lvl IS
	PORT
	(--part of vga_counter
		clk           : IN std_logic;

		reset         : IN std_logic;
		--this is part of sprites
		victory       : IN std_logic;
		playground    : IN std_logic_vector(241 DOWNTO 0);
		x_p1          : IN std_logic_vector(3 DOWNTO 0);
		y_p1          : IN std_logic_vector(3 DOWNTO 0);
		x_p2          : IN std_logic_vector(3 DOWNTO 0);
		y_p2          : IN std_logic_vector(3 DOWNTO 0);
		x_bomb_a      : IN std_logic_vector(3 DOWNTO 0);
		y_bomb_a      : IN std_logic_vector(3 DOWNTO 0);
		bomb_a_enable : IN std_logic;
		x_bomb_b      : IN std_logic_vector(3 DOWNTO 0);
		y_bomb_b      : IN std_logic_vector(3 DOWNTO 0);
		bomb_b_enable : IN std_logic;
		x_bomb_c      : IN std_logic_vector(3 DOWNTO 0);
		y_bomb_c      : IN std_logic_vector(3 DOWNTO 0);
		bomb_c_enable : IN std_logic;
		x_bomb_d      : IN std_logic_vector(3 DOWNTO 0);
		y_bomb_d      : IN std_logic_vector(3 DOWNTO 0);
		bomb_d_enable : IN std_logic;
		x_bomb_e      : IN std_logic_vector(3 DOWNTO 0);
		y_bomb_e      : IN std_logic_vector(3 DOWNTO 0);
		bomb_e_enable : IN std_logic;
		x_bomb_f      : IN std_logic_vector(3 DOWNTO 0);
		y_bomb_f      : IN std_logic_vector(3 DOWNTO 0);
		bomb_f_enable : IN std_logic;
		x_bomb_g      : IN std_logic_vector(3 DOWNTO 0);
		y_bomb_g      : IN std_logic_vector(3 DOWNTO 0);
		bomb_g_enable : IN std_logic;
		x_bomb_h      : IN std_logic_vector(3 DOWNTO 0);
		y_bomb_h      : IN std_logic_vector(3 DOWNTO 0);
		bomb_h_enable : IN std_logic;

		vga_hsync     : OUT std_logic;
		vga_vsync     : OUT std_logic;
		clock_60hz    : OUT std_logic;
		red           : OUT std_logic_vector(3 downto 0);
		green         : OUT std_logic_vector(3 downto 0);
		blue          : OUT std_logic_vector (3 downto 0) --not sure
		

	);
END vga_top_lvl;

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
ARCHITECTURE behaviour OF vga_top_lvl IS
	COMPONENT vga_controller
		PORT
		(
			clk        : IN std_logic;
			reset      : IN std_logic;
			vga_hsync  : OUT std_logic;
			vga_vsync  : OUT std_logic;
			clock_60hz : OUT std_logic;
			x_out      : OUT std_logic_vector(3 DOWNTO 0);
			y_out      : OUT std_logic_vector(3 DOWNTO 0);
			h_out      : OUT std_logic_vector(4 DOWNTO 0);
			v_out      : OUT std_logic_vector(5 DOWNTO 0)
		);
	END COMPONENT;
	COMPONENT sprites
		PORT
		(
			clk           : IN std_logic;
			reset         : IN std_logic;
			victory       : IN std_logic;
			playground    : IN std_logic_vector(241 DOWNTO 0);
			x_p1          : IN std_logic_vector(3 DOWNTO 0);
			y_p1          : IN std_logic_vector(3 DOWNTO 0);
			x_p2          : IN std_logic_vector(3 DOWNTO 0);
			y_p2          : IN std_logic_vector(3 DOWNTO 0);
			x_bomb_a      : IN std_logic_vector(3 DOWNTO 0);
			y_bomb_a      : IN std_logic_vector(3 DOWNTO 0);
			bomb_a_enable : IN std_logic;
			x_bomb_b      : IN std_logic_vector(3 DOWNTO 0);
			y_bomb_b      : IN std_logic_vector(3 DOWNTO 0);
			bomb_b_enable : IN std_logic;
			x_bomb_c      : IN std_logic_vector(3 DOWNTO 0);
			y_bomb_c      : IN std_logic_vector(3 DOWNTO 0);
			bomb_c_enable : IN std_logic;
			x_bomb_d      : IN std_logic_vector(3 DOWNTO 0);
			y_bomb_d      : IN std_logic_vector(3 DOWNTO 0);
			bomb_d_enable : IN std_logic;
			x_bomb_e      : IN std_logic_vector(3 DOWNTO 0);
			y_bomb_e      : IN std_logic_vector(3 DOWNTO 0);
			bomb_e_enable : IN std_logic;
			x_bomb_f      : IN std_logic_vector(3 DOWNTO 0);
			y_bomb_f      : IN std_logic_vector(3 DOWNTO 0);
			bomb_f_enable : IN std_logic;
			x_bomb_g      : IN std_logic_vector(3 DOWNTO 0);
			y_bomb_g      : IN std_logic_vector(3 DOWNTO 0);
			bomb_g_enable : IN std_logic;
			x_bomb_h      : IN std_logic_vector(3 DOWNTO 0);
			y_bomb_h      : IN std_logic_vector(3 DOWNTO 0);
			bomb_h_enable : IN std_logic;
			x_map         : IN std_logic_vector(3 DOWNTO 0);
			y_map         : IN std_logic_vector(3 DOWNTO 0);
			input_h_map   : IN std_logic_vector(4 DOWNTO 0);
			input_v_map   : IN std_logic_vector(5 DOWNTO 0);
			red           : OUT std_logic;
			green         : OUT std_logic;
			blue          : OUT std_logic);
	END COMPONENT;

	component pre_vga_dac_4
		port
		(
			r     : in STD_LOGIC;
			g     : in STD_LOGIC;
			b     : in STD_LOGIC;
			vga_r : out STD_LOGIC_VECTOR(3 downto 0);
			vga_g : out STD_LOGIC_VECTOR(3 downto 0);
			vga_b : out STD_LOGIC_VECTOR(3 downto 0)
		);
	end component;



	SIGNAL x_out_temp, y_out_temp : std_logic_vector(3 DOWNTO 0);
	SIGNAL h_out_temp             : std_logic_vector(4 DOWNTO 0);
	SIGNAL v_out_temp             : std_logic_vector(5 DOWNTO 0);
	signal blue_temp, green_temp, red_temp : std_logic;

BEGIN
	map1 : vga_controller PORT MAP(
		clk, reset, vga_hsync, vga_vsync, clock_60hz, x_out_temp, y_out_temp, h_out_temp, v_out_temp);
	map2 : sprites PORT MAP (
		clk, reset, victory, playground, x_p1, y_p1, x_p2, y_p2, x_bomb_a, y_bomb_a, bomb_a_enable, x_bomb_b, y_bomb_b, bomb_b_enable, x_bomb_c, y_bomb_c, bomb_c_enable, x_bomb_d, y_bomb_d, bomb_d_enable, x_bomb_e, y_bomb_e, bomb_e_enable, x_bomb_f, y_bomb_f, bomb_f_enable, x_bomb_g, y_bomb_g, bomb_g_enable, x_bomb_h, y_bomb_h, bomb_h_enable, x_out_temp, y_out_temp, h_out_temp, v_out_temp, red_temp, green_temp, blue_temp);
map3 : pre_vga_dac_4 port map ( red_temp, green_temp, blue_temp, red, green, blue);
END behaviour;
