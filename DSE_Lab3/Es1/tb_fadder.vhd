--test full adder 1 bit 
LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

ENTITY tb_fadder IS
END tb_fadder;


ARCHITECTURE Behavior OF tb_fadder IS
  COMPONENT f_adder --componente definito nel file f_adder.vhd
    PORT (c_i, a, b : IN STD_LOGIC;
          sum,c_o : OUT STD_LOGIC); 
  END COMPONENT;
  
  SIGNAL in_t: STD_LOGIC_VECTOR(2 downto 0):="000"; -- segnali test
  SIGNAL s_t,c_o_t: STD_LOGIC;
BEGIN
fadd: f_adder PORT MAP(c_i=>in_t(0),a=>in_t(1),b=>in_t(2),sum=>s_t,c_o=>c_o_t); --map segnali test nel componente
PROCESS
BEGIN -- simulazione dello switch
  in_t<=in_t+"001"; 
  WAIT FOR 10 ns; 
END PROCESS;
END Behavior;


