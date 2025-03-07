ct--code for standard Carry select adder (4 bits)

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY select4bit IS
PORT(A,B: in SIGNED(3 DOWNTO 0);
Cin: in std_logic;
S: out SIGNED(3 DOWNTO 0);
Cout: out std_logic);
END select4bit;

ARCHITECTURE behaviour of select4bit IS

COMPONENT rca4bit
PORT(A,B: in SIGNED(3 DOWNTO 0);
Cin: in std_logic;
S: out SIGNED(3 DOWNTO 0);
Cout: out std_logic);
END COMPONENT;

COMPONENT mux
PORT (x,y,s : IN STD_LOGIC;
      m : OUT STD_LOGIC); 
END COMPONENT;

SIGNAL sum1,sum2: SIGNED(3 downto 0);
SIGNAL Cout1,Cout2: std_logic;
BEGIN

rca1: rca4bit PORT MAP(A,B,'1',sum1,Cout1);
rca2: rca4bit PORT MAP(A,B,'0',sum2,Cout2);
selct: mux PORT MAP(Cout1,Cout2,Cin,Cout);

S <= sum1 when Cin = '1' else 
     sum2;

END behaviour;

