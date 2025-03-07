-- decoder per display 7 seg con tutte le lettere necessarie

LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY decoder7 IS
PORT (C : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      Display : OUT STD_LOGIC_VECTOR(0 to 6));
END decoder7;

ARCHITECTURE Behavior OF decoder7 IS
BEGIN
PROCESS(C)
BEGIN
case C is               --0123456
when "000" => Display <= "1001000"; -- H
when "001" => Display <= "0110000"; -- E
when "010" => Display <= "1110001"; -- L 
when "011" => Display <= "0000001"; -- O 
when "100" => Display <= "0110001"; -- C
when "101" => Display <= "0011000"; -- P
when "110" => Display <= "0111000"; -- F
when others => Display <= "1111111";
end case;
END PROCESS;
END Behavior;
