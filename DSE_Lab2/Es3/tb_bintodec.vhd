--test convertitore
LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

ENTITY tb_bintodec IS
END tb_bintodec;


ARCHITECTURE Behavior OF tb_bintodec IS
  COMPONENT binarytodecimal --componente definito nel file binarytodecimal.vhd
    PORT (SW : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
          HEX0,HEX1 : OUT STD_LOGIC_VECTOR(0 TO 6));  
  END COMPONENT;
  
  SIGNAL SW_t: STD_LOGIC_VECTOR(3 downto 0):="0000"; -- segnali test
  SIGNAL H0_t,H1_t: STD_LOGIC_VECTOR(0 to 6);
BEGIN
bintodec: binarytodecimal PORT MAP(SW=>SW_t,HEX0=>H0_t,HEX1=>H1_t); --map segnali test nel componente
PROCESS
BEGIN -- simulazione dello switch
  SW_t<=SW_t+"0001"; 
  WAIT FOR 10 ns; 
END PROCESS;
END Behavior;




