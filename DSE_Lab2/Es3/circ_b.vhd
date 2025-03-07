-- circuito per impostare la seconda cifra del numero decimale

LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY circ_b IS
PORT (D : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      En : IN STD_LOGIC;
      H : OUT STD_LOGIC_VECTOR(0 to 6));
END circ_b;


ARCHITECTURE Behavior OF circ_b IS
BEGIN
PROCESS(D,En)
BEGIN
if (En='1') then -- se il num è maggiore di 9 mostra sempre 1 in d1
case D is               -- 0123456
when "1010" => H <= "1001111"; -- 10
when "1011" => H <= "1001111"; -- 11
when "1100" => H <= "1001111"; -- 12 
when "1101" => H <= "1001111"; -- 13 
when "1110" => H <= "1001111"; -- 14
when "1111" => H <= "1001111"; -- 15
when others => H <= "1111111";
end case;
else H <= "0000001"; -- altrimenti mostra 0
end if;
END PROCESS;
END Behavior;




