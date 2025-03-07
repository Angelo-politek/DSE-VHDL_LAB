--test contatore
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY tb_cnt IS
END tb_cnt;


ARCHITECTURE Behavior OF tb_cnt IS
  COMPONENT n_bit_counter IS
  GENERIC (N: integer); -- n bit
  PORT(Enable: in STD_LOGIC;
       Clock: in STD_LOGIC;
       Clear: in STD_LOGIC;
       Cout : out STD_LOGIC_VECTOR(N-1 downto 0));
  END COMPONENT;
  
  SIGNAL Cout_t: STD_LOGIC_VECTOR(9 downto 0):="0000000000"; -- segnali test
  SIGNAL En_t,Clock_t,Clear_t: STD_LOGIC:='0';
BEGIN
cnt: n_bit_counter 	GENERIC MAP(N=>10)
			PORT MAP(Enable=>En_t,Clock=>Clock_t,Clear=>Clear_t,Cout=>Cout_t);

PROCESS 
BEGIN 
  En_t<='1';
  WAIT FOR 100 us;
  En_t<='0'; 
  WAIT FOR 100 ns; 
  Clear_t<='1';
  WAIT FOR 100 ns;
  Clear_t<='0';
END PROCESS;

PROCESS -- simulazione clock
BEGIN
  Clock_t<='0';
  WAIT FOR 20 ns;
  Clock_t<='1'; 
  WAIT FOR 20 ns;
END PROCESS;     

END Behavior;







