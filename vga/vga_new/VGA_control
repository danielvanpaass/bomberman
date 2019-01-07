LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

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
		v_out      : OUT std_logic_vector(5 DOWNTO 0);
		video_on   : OUT std_logic
	);
END VGA_controller;

ARCHITECTURE behaviour OF VGA_controller IS
	-- type states   
	TYPE Position_states IS (H_hold, H_adder, V_hold, H_reset, Reset_vga, Clock);
	TYPE Block_states IS (H_reg, h_adder, x_adder, v_adder, y_adder, Reset_bl);
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
PROCESS (h_count, v_count)
begin
if (h_count > "000100110") AND (h_count < "100011001") AND (v_count < "111100001") then--- waarom 38 en 281?
	video_on <= '1';
else
	video_on <= '0';
end if;
--if x="0000" and h="00000" then
--	video_on <= '0';
--else
--	video_on <= '1';
--end if;
end process;

	--------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-- Position FSM--

	PROCESS (clk,reset)
	BEGIN
		IF (clk'event AND clk = '1') THEN
			IF reset = '1' THEN
				position <= Reset_vga;
				v_count <= (others => '0');--not sure, but this makes the signals h_count,v_count become green before the reset is over. prima denk ik
				h_count <= (others => '0');
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
				new_v_count      <= "0000000000";
				new_h_count      <= "000000000";
				output_clock <= '0';
				New_Position <= H_hold;

			WHEN H_reset =>
				new_h_count      <= "000000000";
				new_v_count      <= std_logic_vector(unsigned(v_count) + to_unsigned(1,6));
				New_Position <= H_hold;
				output_clock <= '0';

			WHEN H_hold =>
				output_clock <= '0';
				new_h_count <= h_count;
				new_v_count <= v_count;
				IF h_count = "111011111" THEN --479
					New_Position <= V_hold;
				ELSE
					New_Position <= H_adder;
				END IF;

			WHEN H_adder =>
				output_clock <= '0';
				new_v_count <= v_count;
				new_h_count      <= std_logic_vector(unsigned(h_count) + to_unsigned(1,6));
				New_Position <= H_hold;

			WHEN V_hold =>
				output_clock <= '0';
				new_h_count <= h_count;
				new_v_count <= v_count;
				IF v_count = "1000001100" AND (h_count="111011111") THEN 
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
			x <= (others => '0');
			y <= (others => '0');
			h <= (others => '0'); 
			v <= (others => '0');
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
			
	PROCESS (Blocks, h_count,x,h,y,v)
	BEGIN

		CASE Blocks IS
			WHEN Reset_bl =>
				new_blocks <= H_reg;
				new_h          <= "00000";
				new_v          <= "000000";
				new_x          <= "0000";
				new_y          <= "0000";
			WHEN H_reg =>
			new_x <= x;
			new_y <= y;
			new_h <= h;
			new_v <= v;
				IF (h_count < "000100111") OR (h_count > "100011000") THEN --39 or 280("100011000")??, should there also be a v_count ?volgens mij niet
					new_blocks <= H_reg;
				ELSIF h = "10101" and (x<"1010") THEN -- 22, h_count was h added =
					new_blocks <= x_adder;
				elsif h="10101" and x="1010" and v<"101011" then--if last pixel of block and not last row of block, add row
					new_blocks <= v_adder;
				elsif h = "10101" and (v="101011") and (x="1010")and (y<"1010") THEN --at x11 have to reset x and add y
					new_blocks <= y_adder;
				elsif h = "10101" and (v="101011") and (x="1010") and (y="1010") then
					new_blocks <= reset_bl;
				ELSE
					new_blocks <= H_adder;
				END IF;

			WHEN H_adder =>
			new_x <= x;
			new_y <= y;
			new_v <= v;
			new_h          <= std_logic_vector(unsigned(h) + 1);
				new_blocks <= H_reg;

			--WHEN H_reset =>
			--	new_x <= x;
			--new_y <= y;
			--new_v <= v;
			--	new_h      <= "00000";
			--	new_blocks <= x_adder;

			WHEN v_adder =>
			new_y <= y;
			--new_h <= "00000";-- new h should also be reset right? nee is al gedaan in x_adder
			new_v <= std_logic_vector(unsigned(v) + to_unsigned(1, 6));
			new_x <= "0000";
			new_h <= h;
			new_blocks <= H_reg;


			WHEN x_adder =>--also resets h
			new_y <= y;
			new_h  <= "00000";
			new_v <= v;
			new_x <= std_logic_vector(unsigned(x) + 1);
			new_blocks <= H_reg;

			WHEN y_adder =>
			new_x <= "0000";
			new_h <= h;
			new_v <= v;
			new_y <= std_logic_vector(unsigned(y) + 1);
			new_blocks <= H_reg; 
		
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
				h_sync <= '1'; --- h_count>433 zou niet voor moeten komen, Waarom niet?
				IF (h_count < "101001111") OR (h_count >"110110001") THEN --335 or 433 
					new_hor <= H_High;
				ELSE
					new_hor <= H_Low;
				END IF;

			WHEN H_Low =>
				h_sync <= '0';
				IF h_count <= "110110001" THEN --433??
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
				IF ((v_count < "0111101000"  ) or (v_count>"0111101100" )) THEN --488 or 492 added =
					new_ver <= V_High;
				ELSE
					new_ver <= V_Low;
				END IF;
			WHEN V_Low =>
				v_sync <= '0';
				IF v_count <="0111101100" THEN --492
					new_ver <= V_Low;
				ELSE
					new_ver <= V_High;
				END IF;
		END CASE;
	END PROCESS;

	vga_hsync <= h_sync;
	vga_vsync <= v_sync;
END behaviour;
