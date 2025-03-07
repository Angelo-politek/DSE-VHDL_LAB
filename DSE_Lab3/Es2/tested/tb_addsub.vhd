--test sommatore completo
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY tb_addsub IS
END tb_addsub;


ARCHITECTURE Behavior OF tb_addsub IS
  COMPONENT signed_addsub_4bit 
    PORT (A4, B4 : IN SIGNED(3 downto 0);
          CR_in : IN STD_LOGIC;
          Sub : IN STD_LOGIC;    --- Sub=0 A+B   Sub=1 A-B
          Clock : IN STD_LOGIC;
          RSTn : IN STD_LOGIC;
          OVF : OUT STD_LOGIC;
          SUM4 : OUT SIGNED(3 downto 0)); 
  END COMPONENT;
  
  SIGNAL A_t,B_t,SUM_t: SIGNED(3 downto 0):="0000"; -- segnali test
  SIGNAL Sub_t,CR_t,OVF_t,RSTn_t,CLK_t: STD_LOGIC:='0';
BEGIN
signadd: signed_addsub_4bit PORT MAP(A4=>A_t,
                                    B4=>B_t,
                                    Sub=>Sub_t,
                                    CR_in=>CR_t,
                                    Clock=>CLK_t,
                                    RSTn=>RSTn_t,
                                    OVF=>OVF_t,
                                    SUM4=>SUM_t);


PROCESS -- simulazione a+b a-b
BEGIN 
  A_t<="0100"; --    4 +    4 -
  B_t<="0011"; --    3 =    3 = 
  ------0111 OVF=0   7      1 --0001 OVF=0
  RSTn_t<='1';
  WAIT FOR 100 ns;
  Sub_t<='1'; 
  WAIT FOR 100 ns; 
  Sub_t<='0'; 
  WAIT FOR 100 ns; 
  RSTn_t<='0'; -- simulazione reset
  WAIT FOR 50 ns;
END PROCESS;

PROCESS -- simulazione clock
BEGIN
  CLK_t<='0';
  WAIT FOR 10 ns;
  CLK_t<='1'; 
  WAIT FOR 10 ns;
END PROCESS;     

END Behavior;








