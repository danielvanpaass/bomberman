library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;



ENTITY VGA_controller IS 
	PORT
	(
		clk    		  : in  STD_LOGIC;
		reset		    : in std_logic;
		vga_hsync  : out  STD_LOGIC;
		vga_vsync  : out  STD_LOGIC;
		clock_60hz 	  : out  std_logic;
		x_out : out std_logic_vector(3 downto 0);
		y_out : out std_logic_vector(3 downto 0);
  		h_out : out std_logic_vector(4 downto 0);
  		v_out : out std_logic_vector(5 downto 0)
	);
END VGA_controller;

architecture behaviour of VGA_controller is
    -- type states   
    type Position_states is (H_hold, H_adder, V_hold, H_reset, Reset_vga, Clock);
    type Block_states is (H_reg, h_adder, H_reset, x_adder, v_adder, y_adder, Reset_bl);
    type Hor_sync_states is (H_High, H_Low);
    type Ver_sync_states is (V_High, V_Low);
      
    -- state signals
    signal Position, New_position: Position_states;
    signal Blocks, new_blocks: Block_states;
    signal Hor, new_hor: Hor_sync_states;
    signal Ver, new_ver: Ver_sync_states;    
    -- value signals
    signal x, y : std_logic_vector(3 downto 0);
    signal h : std_logic_vector(4 downto 0);
    signal v : std_logic_vector(5 downto 0);
    signal h_count : std_logic_vector(8 downto 0); 
    signal v_count : std_logic_vector(9 downto 0);
    signal h_sync, v_sync, output_clock : std_logic;
    

begin
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Position FSM--

process (clk)
	begin
	if (clk'event and clk = '1') then
		if reset = '1' then
			position <= Reset_vga;
		else 
			position <= new_position;
		end if;
	end if;
end process;

process(position, h_count, v_count)
  begin

case Position is
  when Reset_vga => 
    output_clock <= '0';
    h_count <= "000000000";
    v_count <= "0000000000";       
    New_Position <= H_hold;
    
  when H_reset => 
    h_count <= "000000000";
    v_count <= v_count + 1;
    New_Position <= H_hold; 
    
  when H_hold =>
    if h_count > "111011111" then --479
      New_Position <= V_hold;
    else 
      New_Position <= H_adder;
    end if;
    
  when H_adder =>
    h_count <= h_count + 1;
    New_Position <= H_hold;
    
  when V_hold =>
    if v_count > "1000001100" then --524
      New_Position <= Clock;
    else 
      New_Position <= H_adder;
    end if;

  when Clock =>
     output_clock <= '1';
     new_position <= Reset_vga;	
    
end case;
end process;

clock_60hz <= output_clock; 


------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- determining x y and h v
process (clk)
	begin
	if (clk'event and clk = '1') then
		if reset = '1' then
			Blocks <= Reset_bl;
		else 
			Blocks <= new_blocks;
		end if;
	end if;
end process;

process(h_count, v_count, h, v, x, y)
  begin
    
case Blocks is
  when Reset_bl =>
    h <= "00000";
    v <= "000000";
    x <= "0000";
    y <= "0000";
    new_blocks <= H_reg;
  
  when H_reg =>
    if (h_count < "000100111") or (h_count > "100011000") then --39 or 280
      new_blocks <= H_reg;
    elsif h > "000010110" then -- 22
      new_blocks <= H_reset;
    else
      new_blocks <= H_adder;
    end if;
  
  when H_adder =>
    h <= h + 1;
    new_blocks <= H_reg;
    
  when H_reset =>
    h <= "00000";
    new_blocks <= x_adder;
        
  when v_adder =>
    v <= v + 1;
    x <= "0000";
    if (v < "101100") then --44
        new_blocks <= H_reg;
    else
        new_blocks <= y_adder;
    end if; 

  when x_adder =>
    x <= x + 1;
    if(x < "1011") then --11
      new_blocks <= H_reg;
    else
      new_blocks <= v_adder;   
    end if;  

  when y_adder =>
    y <= y + 1;
    if (y < "1011") then
      new_blocks <= H_reg;
    else
      new_blocks <= Reset_bl;
    end if;

end case;
end process;

x_out <= x;
y_out <= y;
h_out <= h;
v_out <= v;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Horizontal sync pulse FSM--
process (clk)
	begin
	if (clk'event and clk = '1') then
		if reset = '1' then
			 Hor <= H_High;
		else 
			Hor <= new_hor;
		end if;
	end if;
end process;

process(h_count)
  begin
    
case Hor is
 when H_High =>
   h_sync <= '1';
   if (h_count < "101001111") or (h_count > "110110001") then --335 or 433
      new_hor <= H_High;
   else
      new_hor <= H_Low;
  end if; 
  
  when H_Low =>
    h_sync <= '0';
    if h_count < "110110001" then --433??
      new_hor <= H_Low;
    else
      new_hor <= H_High;
  end if; 
  
end case;
end process;
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Vertical sync pulse FSM--
process (clk)
	begin
	if (clk'event and clk = '1') then
		if reset = '1' then
			 Ver <= V_High;
		else 
			Ver <= new_ver;
		end if;
	end if;
end process;

process(v_count)
  begin    
    case Ver is
    when V_High =>
      v_sync <= '1';
      if (v_count < "0111101000") or (v_count > "0111101100") then --488 or 492
        new_ver <= V_High;
      else
        new_ver <= V_Low;
      end if; 
  
    when V_Low =>
      v_sync <= '0';
      if v_count < "0110111011" then --443
       new_ver <= V_Low;
      else
       new_ver <= V_High;
      end if; 
    end case;
end process;

vga_hsync <= h_sync;
vga_vsync <= v_sync;


end behaviour;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------


--		lay0in		   : in std_logic_vector(241 downto 0);
--		lay1inx		  : in std_logic_vector(3 downto 0);
--		lay1iny		  : in std_logic_vector(3 downto 0);
--		lay2inx		  : in std_logic_vector(3 downto 0);
--		lay2iny		  : in std_logic_vector(3 downto 0);
--		lay3in	  	 : in std_logic_vector(7 downto 0);
--		lay3enin  	: in std_logic;