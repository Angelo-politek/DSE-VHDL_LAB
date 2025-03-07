-- sommatore completo a 4 bit per numeri signed con segnalazione di overflow
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY signed_adder_8bit IS
  GENERIC ( N : integer:=8);
  PORT (A, B : IN SIGNED(N-1 downto 0);
        SUB : IN STD_LOGIC;
        Clock,Enable : IN STD_LOGIC;
        RST : IN STD_LOGIC;
        OVF : OUT STD_LOGIC;
        SUM : OUT SIGNED(N-1 downto 0));
END signed_adder_8bit;

ARCHITECTURE Structure OF signed_adder_8bit IS
COMPONENT rca_8bit 
  PORT (a_4bit, b_4bit : IN SIGNED(7 downto 0);
        c_in : IN STD_LOGIC;
        c_out : OUT STD_LOGIC;
        sum_4bit : OUT SIGNED(7 downto 0));  
END COMPONENT;
COMPONENT ff 
  PORT (D, Clock, Reset : IN STD_LOGIC;
        Q : OUT STD_LOGIC);  
END COMPONENT;
COMPONENT reg 
  PORT (R : IN SIGNED(N-1 DOWNTO 0);
        Clock, Reset,Enable : IN STD_LOGIC;
        Q : OUT SIGNED(N-1 DOWNTO 0));  
END COMPONENT;
  

signal r1,r2: STD_LOGIC;
signal Q1,Q2,Y: SIGNED(7 downto 0);
BEGIN
--reg1: reg PORT MAP(R=>A,Q=>Q1,Clock=>Clock,Reset=>RST,Enable=>Enable);
reg2: reg PORT MAP(R=>B,Q=>Q2,Clock=>Clock,Reset=>RST,Enable=>Enable);
rca: rca_8bit PORT MAP(a_4bit=>A, b_4bit=>Q2,c_in=>SUB,c_out=>r1,sum_4bit=>Y);
reg3: reg PORT MAP(R=>Y,Q=>SUM,Clock=>Clock,Reset=>RST,Enable=>Enable);
r2<=(r1 xor Y(3));  -- per segnalare overflow
flipflop: ff PORT MAP(D=>r2,Q=>OVF,Clock=>Clock,Reset=>RST);
END Structure;
