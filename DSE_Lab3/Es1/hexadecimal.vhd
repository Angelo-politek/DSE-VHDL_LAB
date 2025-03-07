LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;
USE ieee.numeric_std.all;
ENTITY hexadecimal IS
PORT (INPUT: IN SIGNED(3 DOWNTO 0);
	OUTPUT: OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END hexadecimal;

ARCHITECTURE behaviour OF hexadecimal IS
SIGNAL hex_output: UNSIGNED(3 DOWNTO 0);
BEGIN
hex_output <= UNSIGNED(INPUT);
OUTPUT <=  "1000000" when hex_output = "0000" else
        "1111001" when hex_output = "0001" else -- da qui in poi sono da "invertire" i bit dell'encoder, sistemo quando avrò tempo.
        "0100100" when hex_output = "0010" else -- li ho invertiti, se però volete controllare o cambiare altro fate
        "0110000" when hex_output = "0011" else
	"0011001" when hex_output = "0100" else
	"0010010" when hex_output = "0101" else
	"0000010" when hex_output = "0110" else
	"1111000" when hex_output = "0111" else
	"0000000" when hex_output = "1000" else
	"0010000" when hex_output = "1001" else
	"0001000" when hex_output = "1010" else
	"0000011" when hex_output = "1011" else
	"1000110" when hex_output = "1100" else
	"0100001" when hex_output = "1101" else
	"0000110" when hex_output = "1110" else
	"0001110";
END  behaviour;
