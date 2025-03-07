--multiplexer 5 a 1 a 15 bit per selezionare le parole da mostrare sui display
-- 000 -> H
-- 001 -> E
-- 010 -> L
-- 011 -> O
-- 100 -> C
-- 101 -> P
-- 110 -> F
-- 111 -> spento

LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY mux_5_1_15bit IS
PORT (sel: IN STD_LOGIC_VECTOR(1 downto 0);
      output : OUT STD_LOGIC_VECTOR(14 downto 0));
END mux_5_1_15bit;


ARCHITECTURE Behavior OF mux_5_1_15bit IS
BEGIN
PROCESS(sel)  --se non lo metto non compila da errore nel case, lo ha appena spiegato a lezione: se vogliamo usare le istruzioni case,loop,for devono essere all'interno di un process
BEGIN
case sel is
when "00" => output <= "000001010010011"; -- hello
when "01" => output <= "100001101101011"; -- ceppo
when "10" => output <= "100001010010011"; -- cello
when "11" => output <= "110001101101011"; -- feppo
when others => output <= "111111111111111"; -- questo copre tutte le rimanenti possibili combinazioni, essendo i vettori di tipo std_logic ci sono molte altre combinazioni oltre a quelle numeriche ES:"UXX"
end case;
END PROCESS;
END Behavior;

