--test mux 2 a 1 a 4 bit
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY tb_mux21_1bit IS
END tb_mux21_1bit;


ARCHITECTURE Behavior OF tb_mux21_1bit IS
  COMPONENT mux_2_1_1bit --componente definito nel file mux_2_1_1bit.vhd
    PORT (x,y,s : IN STD_LOGIC;
          m : OUT STD_LOGIC); 
  END COMPONENT;
  
  SIGNAL A,B,K,SET: STD_LOGIC; -- segnali test

BEGIN
mux: mux_2_1_1bit PORT MAP(x=>A,y=>B,s=>SET,m=>K); --map segnali test nel componente
A<='1'; --valori casuali per gli ingressi
B<='0';
PROCESS
BEGIN
  SET<='1'; 
  WAIT FOR 10 ns; -- simulazione dello switch
  SET<='0';
  WAIT FOR 10 ns;  
END PROCESS;
END Behavior;
