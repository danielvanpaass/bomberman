library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of reg is
begin
PROCESS (clk, reset) -- only triggered by clock
 BEGIN
  IF rising_edge(clk) THEN -- only on clock rising edge
   IF reset = '1' THEN
    d_out <= "00000000";
   ELSE
    d_out <= d_in;
   END IF;
  END IF;
 END PROCESS;
end behaviour;

