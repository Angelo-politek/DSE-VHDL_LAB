-- questo file deve prendere l'uscita a 15 bit del mux e shiftare i bit per mostrare le lettere in ordine diverso
-- ogni lettera è rappresentata da 3 bit quindi lo shifter deve shiftare a sinistra i bit 3 alla volta
-- in caso di errori il decoder è programmato in modo tale che se riceve in input una sequenza di bit non
-- riconosciuta allora tutti i segmenti del display saranno spenti (utile per il debug)

LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY shifter IS
PORT (input : IN STD_LOGIC_VECTOR(14 downto 0);
      sel: IN STD_LOGIC_VECTOR(2 downto 0);
      output : OUT STD_LOGIC_VECTOR(14 downto 0));
END shifter;


ARCHITECTURE Behavior OF shifter IS    
-- 432 109 876 543 210
 -- 011 011 110 101 011
BEGIN
PROCESS(input,sel)
BEGIN
-- l'idea quì è quella di prendere i bit iniziali e di appenderli alla fine per shiftare a sinistra
case sel is
when "000" => output<=input;
when "001" => output<=(input(11 downto 0)&input(14 downto 12));
when "010" => output<=(input(8 downto 0)&input(14 downto 9));
when "011" => output<=(input(5 downto 0)&input(14 downto 6));
when "100" => output<=(input(2 downto 0)&input(14 downto 3));
when others => output<="111111111111111"; 
-- in tutti gli altri casi invece di ricomiciare da capo spegne tutti i display
end case;
END PROCESS;
END Behavior;
