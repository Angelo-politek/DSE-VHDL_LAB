LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY decoder IS
PORT(N: in integer:=0;
HEX0: out std_logic_vector(6 downto 0));
END decoder;

ARCHITECTURE dataflow OF decoder IS
BEGIN
HEX0 <= "1000000" when N = 0 else
	"1111001" when N = 1 else
	"0100100" when N = 2 else
	"0110000" when N = 3 else
	"0011001" when N = 4 else
	"0010010" when N = 5 else
	"0000010" when N = 6 else
	"1111000" when N = 7 else
	"0000000" when N = 8 else
	"0010000" when N = 9 else
	"1111111";
END dataflow;
