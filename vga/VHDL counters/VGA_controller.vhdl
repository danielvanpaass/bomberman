LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY VGA_controller IS
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
END VGA_controller;

ARCHITECTURE behaviour OF VGA_controller IS
	-- type states   
	TYPE Position_states IS (H_hold, H_adder, V_hold, H_reset, Reset_vga, Clock);
	TYPE Block_states IS (H_reg, h_adder, H_reset, x_adder, v_adder, y_adder, Reset_bl);
	TYPE Hor_sync_states IS (H_High, H_Low);
	TYPE Ver_sync_states IS (V_High, V_Low);

	-- state signals
	SIGNAL Position, New_position       : Position_states;
	SIGNAL Blocks, new_blocks           : Block_states;
	SIGNAL Hor, new_hor                 : Hor_sync_states;
	SIGNAL Ver, new_ver                 : Ver_sync_states;
	-- value signals
	SIGNAL x, new_x, y, new_y              : std_logic_vector(3 DOWNTO 0);
	SIGNAL h,new_h                      : std_logic_vector(4 DOWNTO 0);
	SIGNAL v,new_v                      : std_logic_vector(5 DOWNTO 0);
	SIGNAL h_count, new_h_count                      : std_logic_vector(8 DOWNTO 0);
	SIGNAL v_count ,   new_v_count                     : std_logic_vector(9 DOWNTO 0);
	SIGNAL h_sync, v_sync, output_clock : std_logic;
BEGIN
	--------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-- Position FSM--

	PROCESS (clk,reset)
	BEGIN
		IF (clk'event AND clk = '1') THEN
			IF reset = '1' THEN
				position <= Reset_vga;
				v_count      <= "0000000000";
				h_count      <= "000000000";
			ELSE
				position <= new_position;
				v_count <= new_v_count;
				h_count <= new_h_count;
			END IF;
		END IF;
	END PROCESS;

	PROCESS (position, h_count, v_count)
	BEGIN

		CASE Position IS
			WHEN Reset_vga =>
				output_clock <= '0';
				New_Position <= H_hold;

			WHEN H_reset =>
				new_h_count      <= "000000000";
				new_v_count      <= v_count + 1;
				New_Position <= H_hold;

			WHEN H_hold =>
				new_h_count <= h_count;
				new_v_count <= v_count;
				IF h_count = "111011111" THEN --479
					New_Position <= V_hold;
				ELSE
					New_Position <= H_adder;
				END IF;

			WHEN H_adder =>
				
				new_v_count <= v_count;
				new_h_count      <= h_count + 1;
				New_Position <= H_hold;

			WHEN V_hold =>
				new_h_count <= h_count;
				new_v_count <= v_count;
				IF v_count = "1000001100" THEN --524
					New_Position <= Clock;
				ELSE
					New_Position <= H_reset;
				END IF;

			WHEN Clock =>
				new_h_count <= h_count;
				new_v_count <= v_count;
				output_clock <= '1';
				new_position <= Reset_vga;

		END CASE;
	END PROCESS;

	clock_60hz <= output_clock;
	------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-- determining x y and h v
	PROCESS (clk, reset)
	BEGIN
		IF (clk'event AND clk = '1') THEN

			IF reset = '1' THEN
				h          <= "00000";
				v          <= "000000";
				x          <= "0000";
				y          <= "0000";
				Blocks <= Reset_bl;
			ELSE
			x <= new_x;
			y <= new_y;
			h <= new_h;
			v <= new_v;
			
				Blocks <= new_blocks;
			END IF;
		END IF;
	END PROCESS;
			x_out <= x;--moved from rising edge
			y_out <= y;
			h_out <= h;
			v_out <= v;
	PROCESS (Blocks, h_count)
	BEGIN

		CASE Blocks IS
			WHEN Reset_bl =>
				new_blocks <= H_reg;
			WHEN H_reg =>
			new_x <= x;
			new_y <= y;
			new_h <= h;
			new_v <= v;
				IF (h_count < "000100111") OR (h_count > "100011000") THEN --39 or 280
					new_blocks <= H_reg;
				ELSIF h > "10110" THEN -- 22, h_count was h
					new_blocks <= H_reset;
				ELSE
					new_blocks <= H_adder;
				END IF;

			WHEN H_adder =>
				new_x <= x;
			new_y <= y;
			new_v <= v;
				new_h          <= h + 1;
				new_blocks <= H_reg;

			WHEN H_reset =>
				new_x <= x;
			new_y <= y;
			new_v <= v;
				new_h      <= "00000";
				new_blocks <= x_adder;

			WHEN v_adder =>
			new_y <= y;
			new_h <= h;
				new_v <= v + 1;
				new_x <= "0000";
				IF (v < "101100") THEN --44
					new_blocks <= H_reg;
				ELSE
					new_blocks <= y_adder;
				END IF;

			WHEN x_adder =>
			new_y <= y;
			new_h <= h;
			new_v <= v;
				new_x <= x + 1;
				IF (x < "1011") THEN --11
					new_blocks <= H_reg;
				ELSE
					new_blocks <= v_adder;
				END IF;

			WHEN y_adder =>
				new_x <= x;
			new_h <= h;
			new_v <= v;
				new_y <= y + 1;
				IF (y < "1011") THEN
					new_blocks <= H_reg;
				ELSE
					new_blocks <= Reset_bl;
				END IF;

		END CASE;
	END PROCESS;



	--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--Horizontal sync pulse FSM--
	PROCESS (clk, reset)
	BEGIN
		IF (clk'event AND clk = '1') THEN
			IF reset = '1' THEN
				Hor <= H_High;
			ELSE
				Hor <= new_hor;
			END IF;
		END IF;
	END PROCESS;

	PROCESS (Hor, h_count)
	BEGIN

		CASE Hor IS
			WHEN H_High =>
				h_sync <= '1'; --- h_count>433 zou niet voor moeten komen
				IF (h_count < "101001111") OR (h_count > "110110001") THEN --335 or 433
					new_hor <= H_High;
				ELSE
					new_hor <= H_Low;
				END IF;

			WHEN H_Low =>
				h_sync <= '0';
				IF h_count < "110110001" THEN --433??
					new_hor <= H_Low;
				ELSE
					new_hor <= H_High;
				END IF;

		END CASE;
	END PROCESS;
	----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--Vertical sync pulse FSM--
	PROCESS (clk,reset)
	BEGIN
		IF (clk'event AND clk = '1') THEN
			IF reset = '1' THEN
				Ver <= V_High;
			ELSE
				Ver <= new_ver;
			END IF;
		END IF;
	END PROCESS;

	PROCESS (Ver, v_count)
	BEGIN
		CASE Ver IS
			WHEN V_High =>
				v_sync <= '1';
				IF (("0111101000" < v_count ) and ("0111101100" > v_count)) THEN --488 or 492
					new_ver <= V_Low;
				ELSE
					new_ver <= V_High;
				END IF;
			WHEN V_Low =>
				v_sync <= '0';
				IF v_count <"0111101100" THEN --492
					new_ver <= V_Low;
				ELSE
					new_ver <= V_High;
				END IF;
		END CASE;
	END PROCESS;

	vga_hsync <= h_sync;
	vga_vsync <= v_sync;
END behaviour;
-----------------------------------------------------------------------------------------------------------------------------

