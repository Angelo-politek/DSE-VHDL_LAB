LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY tb_signed_adder IS
END tb_signed_adder;


ARCHITECTURE Behavior OF tb_signed_adder IS
  COMPONENT signed_adder_4bit 
    PORT (A4, B4 : IN SIGNED(3 downto 0);
          CR_in : IN STD_LOGIC;
          CLK : IN STD_LOGIC;
          RSTn : IN STD_LOGIC;
          OVF : OUT STD_LOGIC;
          SUM4 : OUT SIGNED(3 downto 0)); 
  END COMPONENT;
  
  SIGNAL A_t,B_t,SUM_t: SIGNED(3 downto 0); -- segnali test
  SIGNAL CR_t,OVF_t,RSTn_t,CLK_t: STD_LOGIC;
BEGIN
signadd: signed_adder_4bit PORT MAP(A4=>A_t,
                                    B4=>B_t,
                                    CR_in=>CR_t,
                                    CLK=>CLK_t,
                                    RSTn=>RSTn_t,
                                    OVF=>OVF_t,
                                    SUM4=>SUM_t);
A_t<="0100";
B_t<="0011";
------0111 OVF=0

PROCESS
BEGIN -- simulazione a+b+1
  RSTn_t<='1';
  WAIT FOR 10 ns;
  CR_t<='0'; 
  WAIT FOR 10 ns; 
  CR_t<='1'; 
---- 1000 OVF=1
  WAIT FOR 10 ns; 
  RSTn_t<='0';
  WAIT FOR 10 ns;
END PROCESS;
PROCESS
BEGIN
  CLK_t<='0';
  WAIT FOR 15 ns;
  CLK_t<='1'; 
  WAIT FOR 15 ns;
END PROCESS;     

END Behavior;






