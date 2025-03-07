--test sommatore
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY tb_adder_8bit IS
END tb_adder_8bit;


ARCHITECTURE Behavior OF tb_adder_8bit IS
  COMPONENT signed_adder_8bit IS
  GENERIC ( N : integer:=8);
  PORT (A, B : IN SIGNED(N-1 downto 0);
        SUB : IN STD_LOGIC;
        Clock : IN STD_LOGIC;
        RST : IN STD_LOGIC;
        OVF : OUT STD_LOGIC;
        SUM : OUT SIGNED(N-1 downto 0));
  END COMPONENT;
  
  SIGNAL A_t,B_t,SUM_t: SIGNED(7 downto 0):="00000000"; -- segnali test
  SIGNAL Clock_t,SUB_t,OVF_t,RST_t: STD_LOGIC:='0';
BEGIN
add: signed_adder_8bit PORT MAP(A=>A_t,B=>B_t,SUB=>SUB_t,OVF=>OVF_t,Clock=>Clock_t,SUM=>SUM_t,RST=>RST_t);

PROCESS 
BEGIN 
  A_t<="00101101";
  WAIT FOR 100 ns;
  B_t<="01111111"; 
  WAIT FOR 100 ns; 
  A_t<="00101101";
  WAIT FOR 100 ns;
  SUB_t<='1';
  A_t<="10101101";
  WAIT FOR 100 ns;
  B_t<="00011111"; 
  WAIT FOR 100 ns; 
  SUB_t<='0';
  A_t<="00101101";
  WAIT FOR 100 ns; 
END PROCESS;

PROCESS -- simulazione clock
BEGIN
  Clock_t<='0';
  WAIT FOR 20 ns;
  Clock_t<='1'; 
  WAIT FOR 20 ns;
END PROCESS;     

END Behavior;







