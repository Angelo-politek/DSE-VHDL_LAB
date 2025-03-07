LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;

ENTITY hexadecimal IS
PORT(INPUT : IN std_logic_vector(3 DOWNTO 0);
     OUTPUT : OUT std_logic_vector(6 DOWNTO 0));
END hexadecimal;

ARCHITECTURE behaviour OF hexadecimal IS
BEGIN
OUTPUT <= "1000000" when INPUT = "0000" else
	  "1111001" when INPUT = "0001" else
	  "0010010" when INPUT = "0010" else
	  "0110000" when INPUT = "0011" else
	  "0011001" when INPUT = "0100" else
	  "0010010" when INPUT = "0101" else
	  "0000010" when INPUT = "0110" else
	  "1111000" when INPUT = "0111" else
	  "0000000" when INPUT = "1000" else
	  "0011000" when INPUT = "1001" else
	  "0001000" when INPUT = "1010" else
	  "0000000" when INPUT = "1011" else
	  "1000110" when INPUT = "1100" else
	  "1000000" when INPUT = "1101" else
	  "0000110" when INPUT = "1110" else
	  "0001110";
END behaviour;