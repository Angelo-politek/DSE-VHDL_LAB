--test registro singolo
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY tb_reg IS
END tb_reg;


ARCHITECTURE Behavior OF tb_reg IS
  COMPONENT reg IS
  GENERIC ( N : integer:=8);
  PORT (R : IN SIGNED(N-1 DOWNTO 0);
        Clock, Reset,Enable : IN STD_LOGIC;
        Q : OUT SIGNED(N-1 DOWNTO 0));
  END COMPONENT;
  
  SIGNAL R_t,Q_t: SIGNED(7 downto 0):="00000000"; -- segnali test
  SIGNAL Clock_t,Reset_t,Enable_t: STD_LOGIC:='0';
BEGIN
reg_t: reg PORT MAP(R=>R_t,Clock=>Clock_t,Reset=>Reset_t,Enable=>Enable_t,Q=>Q_t);

PROCESS 
BEGIN 
  Enable_t<='1';
  R_t<="00101101";
  WAIT FOR 100 ns;
  R_t<="00111111"; 
  WAIT FOR 100 ns; 
  R_t<="00101101";
  WAIT FOR 100 ns;
  Enable_t<='0';
  R_t<="00101101";
  WAIT FOR 100 ns;
  R_t<="00111111"; 
  WAIT FOR 100 ns; 
  R_t<="00101101";
  WAIT FOR 100 ns; 
  Reset_t<='1'; -- simulazione reset
  WAIT FOR 50 ns;
  Reset_t<='0';
  WAIT FOR 50 ns;
END PROCESS;

PROCESS -- simulazione clock
BEGIN
  Clock_t<='0';
  WAIT FOR 20 ns;
  Clock_t<='1'; 
  WAIT FOR 20 ns;
END PROCESS;     

END Behavior;







