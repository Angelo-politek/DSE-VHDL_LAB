--test registro shift
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY tb_reg_shift8 IS
END tb_reg_shift8;


ARCHITECTURE Behavior OF tb_reg_shift8 IS
  COMPONENT reg_shift8 IS
  GENERIC ( N : integer:=8);
  PORT (X_in : IN SIGNED(N-1 DOWNTO 0);
        Clock, Reset,Shift : IN STD_LOGIC;
        X,X1,X2,X3 : OUT SIGNED(N-1 DOWNTO 0));
  END COMPONENT;
  
  SIGNAL Xin_t,X_t,X1_t,X2_t,X3_t: SIGNED(7 downto 0):="00000000"; -- segnali test
  SIGNAL Clock_t,Reset_t,Shift_t: STD_LOGIC:='0';
BEGIN
reg_t: reg_shift8 PORT MAP(X_in=>Xin_t,Clock=>Clock_t,Reset=>Reset_t,Shift=>Shift_t,X=>X_t,X1=>X1_t,X2=>X2_t,X3=>X3_t);

PROCESS 
BEGIN 
  Xin_t<="00101101";
  WAIT FOR 320 ns;
  Xin_t<="00111111";
  WAIT FOR 320 ns;
  Xin_t<="11101000";
  WAIT FOR 320 ns;
  Xin_t<="00110000";
  WAIT FOR 320 ns;
  Reset_t<='1'; -- simulazione reset
  WAIT FOR 40 ns;
  Reset_t<='0';
  WAIT FOR 40 ns;
END PROCESS;

PROCESS -- simulazione clock
BEGIN
  Clock_t<='0';
  WAIT FOR 20 ns;
  Clock_t<='1'; 
  WAIT FOR 20 ns;
END PROCESS;   


PROCESS 
BEGIN
  Shift_t<='1'; 
  WAIT FOR 20 ns;
  Shift_t<='0'; 
  WAIT FOR 20 ns;
END PROCESS;    

END Behavior;






