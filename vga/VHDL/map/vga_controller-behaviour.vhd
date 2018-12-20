library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of vga_controller is

signal bombx :  std_logic_vector(3 downto 0);
signal bomby :  std_logic_vector(3 downto 0);
signal p1x :  std_logic_vector(3 downto 0);
signal p1y :  std_logic_vector(3 downto 0);
signal p2x :  std_logic_vector(3 downto 0);
signal p2y :  std_logic_vector(3 downto 0);

begin

process(clk,reset,lay0,lay1,lay2,lay3,lay3en)

variable h_count : integer range 0 to 479; -- horizontal counter value
variable v_count : integer range 0 to 524; -- vertical counter value
variable x  : integer range 0 to 11; -- horizontal position of the pixel
variable y	: integer range 0 to 11; -- vertical position of the pixel
variable rgb : std_logic_vector(2 downto 0);
variable c : std_logic_vector(1 downto 0);
variable v_clk_internal : std_logic;

begin

if(reset = '0') then								--reset state
	h_count := 0;
	v_count := 0;
	x	:= 0;
	y	:= 0;
	rgb := "001";
	c := "01";
	v_clk_internal := '0';
	
elsif(rising_edge(clk)) then					--non reset state
	if(h_count < 479) then						--h counter
		h_count := h_count + 1;
	else
		h_count := 0;
		if(v_count < 524) then					--vertical counter determined by horizontal counter
		v_count := v_count + 1;
		else
			v_count := 0;
			if(v_clk_internal	= '0') then					-- generating output clock to be used by other modules
				v_clk_internal := '1';
			else
				v_clk_internal := '0';
			end if;	
		end if;
	end if;
	
	
	

	if(h_count >= 40 and h_count < 282 and v_count <= 480) then -- generating the rgb signal to the output
		if(v_count >= 44*y and v_count <= 44*(y+1)) then
			if(h_count > 40 +22*x and h_count < 40 + 22*(x+1)) then
				red_out 	  <= rgb(0);
				green_out  <= rgb(1);
				blue_out   <= rgb(2);
			else 
				if(x = 11) then
					x := 0;
				else
					x := x + 1;
				end if;	
			end if;
		else 
			
			if(y = 11) then
					y := 0;
			else
					y := y + 1;
			end if;		
		end if;
	
	else
		red_out 	  <= '0';
		green_out 	<= '0';
		blue_out   <= '0'; 	
	end if;




	if(h_count > 335 and h_count < 433) then -- generating horizontal sync pulse
		h_sync <= '0';
	else
		h_sync <= '1';
	end if;

	if(v_count > 488 and v_count < 492) then -- generating vertical sync pulse
		v_sync <= '0';
	else
		v_sync <= '1';
	end if;
	


	-- generating the rgb signal
	
	c(1) := lay0(241-(2*x + 22*y));							-- assigning the correct two bits to the corresponding vector
	c(0) := lay0(241-(2*x + 22*y+1));
	bombx <= lay3(3) & lay3(2) & lay3(1) &lay3(0);		-- assigning coordinates
	bomby <= lay3(7) & lay3(6) & lay3(5) &lay3(4);
	p1x <= lay2(3) & lay2(2) & lay2(1) &lay2(0);
	p1y <= lay2(7) & lay2(6) & lay2(5) &lay2(4);
	p2x <= lay1(3) & lay1(2) & lay1(1) &lay1(0);
	p2y <= lay1(7) & lay1(6) & lay1(5) &lay1(4);
	
	if(lay3en = '1' and x = to_integer(unsigned(bombx)) and y = to_integer(unsigned(bomby)))then
		rgb := "000";
	elsif(x = to_integer(unsigned(p1x)) and y = to_integer(unsigned(p1y))) then
		rgb := "100";
	elsif(x = to_integer(unsigned(p2x)) and y = to_integer(unsigned(p2y))) then
		rgb := "001";
	else	
		if	  (c = "11")then
			rgb := "111";
		elsif(c = "01")then
			rgb := "010";
		elsif(c = "10")then
			rgb := "011";
		elsif(c = "00")then
			rgb := "101";
		else
			rgb := "000";
		end if;
	end if;
end if;



end process;

v_clk <= v_clk_internal;

end behaviour;
