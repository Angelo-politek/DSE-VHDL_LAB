-- decoder per bcd seg con i numeri da 0 a 7

LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY decoder_bcd IS
PORT (C : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      Display : OUT STD_LOGIC_VECTOR(0 to 6));
END decoder_bcd;


ARCHITECTURE Behavior OF decoder_bcd IS
BEGIN
PROCESS(C)
BEGIN
case C is               -- 0123456
when "000" => Display <= "0000001"; -- 0
when "001" => Display <= "1001111"; -- 1
when "010" => Display <= "0010010"; -- 2 
when "011" => Display <= "0000111"; -- 3 
when "100" => Display <= "1001100"; -- 4
when "101" => Display <= "0100100"; -- 5
when "110" => Display <= "0100000"; -- 6
when "111" => Display <= "0001111"; -- 7
when others => Display <= "1111111";
end case;
END PROCESS;
END Behavior;




