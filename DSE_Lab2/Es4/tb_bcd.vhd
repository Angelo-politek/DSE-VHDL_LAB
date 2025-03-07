--test es4 
LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

ENTITY tb_bcd IS
END tb_bcd;


ARCHITECTURE Behavior OF tb_bcd IS
  COMPONENT bcd_converter --componente definito nel file bcd_converter.vhd
    PORT (SW : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
          HEX0,HEX1 : OUT STD_LOGIC_VECTOR(0 TO 6));  
  END COMPONENT;
  
  SIGNAL SW_t: STD_LOGIC_VECTOR(5 downto 0):="000000"; -- segnali test
  SIGNAL H0_t,H1_t: STD_LOGIC_VECTOR(0 to 6);
BEGIN
bcd: bcd_converter PORT MAP(SW=>SW_t,HEX0=>H0_t,HEX1=>H1_t); --map segnali test nel componente
PROCESS
BEGIN -- simulazione dello switch
  SW_t<=SW_t+"000001"; 
  WAIT FOR 10 ns; 
END PROCESS;
END Behavior;






