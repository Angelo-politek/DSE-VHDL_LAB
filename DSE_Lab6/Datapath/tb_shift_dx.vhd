LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY tb_shift_dx IS
END tb_shift_dx;


ARCHITECTURE Behavior OF tb_shift_dx IS
  COMPONENT shift_dx IS
  GENERIC ( N : integer:=8);
  PORT (R : IN SIGNED(N-1 DOWNTO 0);
        Q : OUT SIGNED(N-1 DOWNTO 0));
  END COMPONENT;
  
  SIGNAL R_t,Q_t: SIGNED(7 downto 0):="00000000"; -- segnali test
  BEGIN
shift: shift_dx PORT MAP(R=>R_t,Q=>Q_t);

PROCESS 
BEGIN 
  R_t<="00101101";
  WAIT FOR 100 ns;
  R_t<="00111111"; 
  WAIT FOR 100 ns; 
  R_t<="00101101";
  WAIT FOR 100 ns;
  R_t<="00101101";
  WAIT FOR 100 ns;
  R_t<="00111111"; 
  WAIT FOR 100 ns; 
  R_t<="00101101";
  WAIT FOR 100 ns; 
END PROCESS;
    

END Behavior;






