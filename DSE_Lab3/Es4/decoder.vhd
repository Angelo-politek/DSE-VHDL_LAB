LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;
USE ieee.numeric_std.all;
ENTITY decoder IS
PORT(INPUT: IN std_logic_vector(7 DOWNTO 0);
     HEX3,HEX2: OUT std_logic_vector(0 TO 6));
END decoder;

ARCHITECTURE behaviour OF decoder IS
SIGNAL dec,uni: integer;
BEGIN
dec <= to_integer(unsigned(INPUT)) / 10;
uni <= to_integer(unsigned(INPUT)) mod 10;
HEX3 <= "1000000" when dec = 0 else
	  "1111001" when dec = 1 else
	  "0010010" when dec = 2 else
	  "0110000" when dec = 3 else
	  "0011001" when dec = 4 else
	  "0010010" when dec = 5 else
	  "0000010" when dec = 6 else
	  "1111000" when dec = 7 else
	  "0000000" when dec = 8 else
	  "0011000";

HEX2 <= "1000000" when uni = 0 else
	  "1111001" when uni = 1 else
	  "0010010" when uni = 2 else
	  "0110000" when uni = 3 else
	  "0011001" when uni = 4 else
	  "0010010" when uni = 5 else
	  "0000010" when uni = 6 else
	  "1111000" when uni = 7 else
	  "0000000" when uni = 8 else
	  "0011000";
END behaviour;

