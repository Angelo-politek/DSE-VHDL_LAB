--circuito per impostare la cifra d0 quando V>9
LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY circ_a IS
PORT (B: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      Y: OUT STD_LOGIC_VECTOR(2 DOWNTO 0));
END circ_a;


ARCHITECTURE Behavior OF circ_a IS
BEGIN
PROCESS(B)
BEGIN
case B is
when "010" => Y<="000"; -- 0
when "011" => Y<="001"; -- 1
when "100" => Y<= "010"; -- 2
when "101" => Y<="011"; -- 3
when "110" => Y<="100"; -- 4
when "111" => Y<="101"; -- 5
when others => Y<="000";
end case;
END PROCESS;
END Behavior;



