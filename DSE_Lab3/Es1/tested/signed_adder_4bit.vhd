-- sommatore completo a 4 bit per numeri signed con segnalazione di overflow
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY signed_adder_4bit IS
  GENERIC ( N : integer:=4);
  PORT (A4, B4 : IN SIGNED(3 downto 0);
        CR_in : IN STD_LOGIC;
        Clock : IN STD_LOGIC;
        RSTn : IN STD_LOGIC;
        OVF : OUT STD_LOGIC;
        SUM4 : OUT SIGNED(3 downto 0));
END signed_adder_4bit;

ARCHITECTURE Structure OF signed_adder_4bit IS
COMPONENT rca_4bit 
  PORT (a_4bit, b_4bit : IN SIGNED(3 downto 0);
        c_in : IN STD_LOGIC;
        c_out : OUT STD_LOGIC;
        sum_4bit : OUT SIGNED(3 downto 0));  
END COMPONENT;
COMPONENT flipflop 
  PORT (D, Clock, Resetn : IN STD_LOGIC;
        Q : OUT STD_LOGIC);  
END COMPONENT;
COMPONENT regn 
  PORT (R : IN SIGNED(N-1 DOWNTO 0);
        Clock, Resetn : IN STD_LOGIC;
        Q : OUT SIGNED(N-1 DOWNTO 0));  
END COMPONENT;
  

signal r1,r2: STD_LOGIC;
signal Q1,Q2,Y: SIGNED(3 downto 0);
BEGIN
reg1: regn PORT MAP(R=>A4,Q=>Q1,Clock=>Clock,Resetn=>RSTn);
reg2: regn PORT MAP(R=>B4,Q=>Q2,Clock=>Clock,Resetn=>RSTn);
rca: rca_4bit PORT MAP(a_4bit=>Q1, b_4bit=>Q2,c_in=>CR_in,c_out=>r1,sum_4bit=>Y);
reg3: regn PORT MAP(R=>Y,Q=>SUM4,Clock=>Clock,Resetn=>RSTn);
r2<=((not(A4(3) and B4(3)) and Y(3) and not(r1)) or ((A4(3) and B4(3)) and not(Y(3) and r1)));  -- per segnalare overflow
ff: flipflop PORT MAP(D=>r2,Q=>OVF,Clock=>Clock,Resetn=>RSTn);
END Structure;
