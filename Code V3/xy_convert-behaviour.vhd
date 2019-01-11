library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of xy_convert is
begin

--x coordinate conversion
x1 <= ((NOT x_in(3)) AND (NOT x_in(2)) AND (NOT x_in(1)) AND x_in(0));
x2 <= ((NOT x_in(3)) AND (NOT x_in(2)) AND x_in(1) AND (NOT x_in(0)));
x3 <= ((NOT x_in(3)) AND (NOT x_in(2)) AND x_in(1) AND x_in(0));
x4 <= ((NOT x_in(3)) AND x_in(2) AND (NOT x_in(1)) AND (NOT x_in(0)));
x5 <= ((NOT x_in(3)) AND x_in(2) AND (NOT x_in(1)) AND x_in(0));
x6 <= ((NOT x_in(3)) AND x_in(2) AND x_in(1) AND (NOT x_in(0)));
x7 <= ((NOT x_in(3)) AND x_in(2) AND x_in(1) AND x_in(0));
x8 <= (x_in(3) AND (NOT x_in(2)) AND (NOT x_in(1)) AND (NOT x_in(0)));
x9 <= (x_in(3) AND (NOT x_in(2)) AND (NOT x_in(1)) AND x_in(0));


--y coordinate conversion

y1 <= ((NOT y_in(3)) AND (NOT y_in(2)) AND (NOT y_in(1)) AND y_in(0));
y2 <= ((NOT y_in(3)) AND (NOT y_in(2)) AND y_in(1) AND (NOT y_in(0)));
y3 <= ((NOT y_in(3)) AND (NOT y_in(2)) AND y_in(1) AND y_in(0));
y4 <= ((NOT y_in(3)) AND y_in(2) AND (NOT y_in(1)) AND (NOT y_in(0)));
y5 <= ((NOT y_in(3)) AND y_in(2) AND (NOT y_in(1)) AND y_in(0));
y6 <= ((NOT y_in(3)) AND y_in(2) AND y_in(1) AND (NOT y_in(0)));
y7 <= ((NOT y_in(3)) AND y_in(2) AND y_in(1) AND y_in(0));
y8 <= (y_in(3) AND (NOT y_in(2)) AND (NOT y_in(1)) AND (NOT y_in(0)));
y9 <= (y_in(3) AND (NOT y_in(2)) AND (NOT y_in(1)) AND y_in(0));


end behaviour;


