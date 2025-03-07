-- decoder esadecimale a 4 bit per display 7 seg 

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY hex_decoder IS
PORT (C : IN UNSIGNED(3 DOWNTO 0);
      H : OUT STD_LOGIC_VECTOR(0 to 6));
END hex_decoder;


ARCHITECTURE Behavior OF hex_decoder IS
BEGIN
PROCESS(C)
BEGIN
case C is          --0123456
when "0000" => H <= "0000001"; -- 0
when "0001" => H <= "1001111"; -- 1
when "0010" => H <= "0010010"; -- 2 
when "0011" => H <= "0000110"; -- 3 
when "0100" => H <= "1001100"; -- 4
when "0101" => H <= "0100100"; -- 5
when "0110" => H <= "0100000"; -- 6
when "0111" => H <= "0001111"; -- 7
when "1000" => H <= "0000000"; -- 8
when "1001" => H <= "0000100"; -- 9
when "1010" => H <= "0001000"; -- A
when "1011" => H <= "1100000"; -- B
when "1100" => H <= "0110001"; -- C
when "1101" => H <= "1000010"; -- D
when "1110" => H <= "0110000"; -- E
when "1111" => H <= "0111000"; -- F
when others => H <= "1111111";
end case;
END PROCESS;
END Behavior;

