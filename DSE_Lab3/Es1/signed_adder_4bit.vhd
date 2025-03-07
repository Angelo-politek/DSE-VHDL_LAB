LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY signed_adder_4bit IS
  GENERIC ( N : integer:=4);
  PORT (A4, B4 : IN SIGNED(3 downto 0);
        CR_in : IN STD_LOGIC;
        CLK : IN STD_LOGIC;
        RSTn : IN STD_LOGIC;
        OVF : OUT STD_LOGIC;
        HEXS, HEXB,HEXA : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
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
COMPONENT hexadecimal
PORT(INPUT: IN SIGNED(3 DOWNTO 0);
     OUTPUT: OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END COMPONENT;  

signal r1,r2: STD_LOGIC;
signal Q1,Q2,Y,SUM4: SIGNED(3 downto 0);

BEGIN
reg1: regn PORT MAP(R=>A4,Q=>Q1,Clock=>CLK,Resetn=>RSTn);
reg2: regn PORT MAP(R=>B4,Q=>Q2,Clock=>CLK,Resetn=>RSTn);
rca: rca_4bit PORT MAP(a_4bit=>A4, b_4bit=>B4,c_in=>CR_in,c_out=>r1,sum_4bit=>Y);
reg3: regn PORT MAP(R=>Y,Q=>SUM4,Clock=>CLK,Resetn=>RSTn);
r2<=(r1 xor Y(3));
ff: flipflop PORT MAP(D=>r2,Q=>OVF,Clock=>CLK,Resetn=>RSTn);
hex0: hexadecimal PORT MAP(SUM4, HEXS);
hex1: hexadecimal PORT MAP(A4,HEXA);
hex2: hexadecimal PORT MAP(B4,HEXB);
END Structure;







