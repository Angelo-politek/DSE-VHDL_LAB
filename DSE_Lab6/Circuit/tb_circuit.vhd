--test circuito completo
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY tb_circuit IS
END tb_circuit;


ARCHITECTURE Behavior OF tb_circuit IS
COMPONENT circuit IS
  PORT (DATA_IN : IN SIGNED(7 DOWNTO 0);
        START,Clock: IN STD_LOGIC);
END COMPONENT;
  

  SIGNAL DATA_t: SIGNED(7 downto 0):="00000000";
  SIGNAL START_t,Clock_t: STD_LOGIC:='0';
BEGIN
Circuit_test: circuit PORT MAP(DATA_IN=>DATA_t,START=>START_t,Clock=>Clock_t);

PROCESS 
BEGIN 
DATA_t<="00000010";
wait for 40 ns;
START_t<='1';
wait for 80 ns;
DATA_t<="00000100";
wait for 80 ns;
DATA_t<="00001000";
wait for 800 ns;
START_t<='0';
wait for 800 ns;

END PROCESS;

PROCESS -- simulazione clock
BEGIN
  Clock_t<='0';
  WAIT FOR 20 ns;
  Clock_t<='1'; 
  WAIT FOR 20 ns;
END PROCESS;     

END Behavior;







