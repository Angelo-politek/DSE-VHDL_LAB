-- decoder per display 7 seg con i numeri da 0 a 9

LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY decoder IS
PORT (C : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      Display : OUT STD_LOGIC_VECTOR(0 to 6));
END decoder;


ARCHITECTURE Behavior OF decoder IS
BEGIN
PROCESS(C)
BEGIN
case C is               -- 0123456
when "0000" => Display <= "0000001"; -- 0
when "0001" => Display <= "1001111"; -- 1
when "0010" => Display <= "0010010"; -- 2 
when "0011" => Display <= "0000111"; -- 3 
when "0100" => Display <= "1001100"; -- 4
when "0101" => Display <= "0100100"; -- 5
when "0110" => Display <= "0100000"; -- 6
when "0111" => Display <= "0001111"; -- 7
when "1000" => Display <= "0000000"; -- 8
when "1001" => Display <= "0000100"; -- 9
when others => Display <= "1111111";
end case;
END PROCESS;
END Behavior;


