LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY tb_es1 IS
END tb_es1;


ARCHITECTURE Behavior OF tb_es1 IS
  --Componente dichiarato nel file Es1.vhd
  COMPONENT es1    
    PORT ( SW : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
    LEDR : OUT STD_LOGIC_VECTOR(9 DOWNTO 0)); 
  END COMPONENT;
  --Segnali per la simulazione
  SIGNAL SW_t,LEDR_t: STD_LOGIC_VECTOR(9 DOWNTO 0);
  
BEGIN
  sim: es1 PORT MAP(SW_t,LEDR_t); --Assegnazione dei segnali test al componente
PROCESS  --Simulazione apertura e chiusura switch
BEGIN
  SW_t<="1111111111";
  WAIT FOR 10 ns;
  SW_t<="0000000000";
  WAIT FOR 10 ns;
END PROCESS;
END Behavior;
