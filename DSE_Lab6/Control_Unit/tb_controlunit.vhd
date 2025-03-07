--test dcontrol unit
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY tb_controlunit IS
END tb_controlunit;


ARCHITECTURE Behavior OF tb_controlunit IS
COMPONENT ControlUnit IS
	PORT( START,Clock: in std_logic;
	      Cout: in std_logic_vector(9 downto 0);
	      RESET,WR,RD,CLEAR,MEM,DONE,NXT,Reg_out,SHIFT,SUM,SUB: out std_logic;
	      SEL: out std_logic_vector(1 downto 0));
END COMPONENT;
  

  SIGNAL SEL_t: STD_LOGIC_VECTOR(1 downto 0):="00";
  SIGNAL Cout_t: STD_LOGIC_VECTOR(9 downto 0):="0000000000";
  SIGNAL START_t,Clock_t,RESET_t,WR_t,RD_t,CLEAR_t,MEM_t,DONE_t,NXT_t,Reg_out_t,SHIFT_t,SUM_t,SUB_t: STD_LOGIC:='0';
BEGIN
CU: ControlUnit PORT MAP(START=>START_t,Clock=>Clock_t,RESET=>RESET_t,WR=>WR_t,RD=>RD_t,CLEAR=>CLEAR_t,MEM=>MEM_t,DONE=>DONE_t,NXT=>NXT_t,Reg_out=>Reg_out_t,SHIFT=>SHIFT_t,SUM=>SUM_t,SUB=>SUB_t,SEL=>SEL_t,Cout=>Cout_t);

PROCESS 
BEGIN 
START_t<='1';
wait for 400 ns;
Cout_t<="1111111111";
wait for 40 ns;
Cout_t<="0000000000";
wait for 800 ns;
Cout_t<="1111111111";
wait for 200 ns;
Cout_t<="0000000000";
wait for 40 ns;
 

END PROCESS;

PROCESS -- simulazione clock
BEGIN
  Clock_t<='0';
  WAIT FOR 20 ns;
  Clock_t<='1'; 
  WAIT FOR 20 ns;
END PROCESS;     

END Behavior;







