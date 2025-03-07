LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY complete_select IS
  GENERIC ( N : integer:=16);
  PORT (A, B : IN SIGNED(N-1 downto 0);
        CR_in : IN STD_LOGIC;
        Clock : IN STD_LOGIC;
        RSTn : IN STD_LOGIC;
        OVF : OUT STD_LOGIC;
        S : OUT SIGNED(N-1 downto 0));
END complete_select;

ARCHITECTURE Behaviour OF complete_select IS

COMPONENT select16bit
  PORT (A, B : IN SIGNED(N-1 downto 0);
        Cin : IN STD_LOGIC;
        S : OUT SIGNED(N-1 DOWNTO 0);
        Cout : OUT STD_LOGIC);  
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
  
SIGNAL Q1,Q2,Sv: SIGNED(15 DOWNTO 0);
SIGNAL cout,Dv: std_logic;

BEGIN
rg1: regn PORT MAP(A,Clock,RSTn,Q1);
rg2: regn PORT MAP(B,Clock,RSTn,Q2);
slct: select16bit PORT MAP(Q1,Q2,CR_in,Sv,cout);
rg3: regn PORT MAP(Sv,Clock,RSTn,S);

Dv<=((not(A(N-1) and B(N-1)) and Sv(N-1)) and not(cout)) or ((A(N-1) and B(N-1)) and not(Sv(N-1) and cout)));

ff: flipflop PORT MAP(Dv,CLock,RSTn,OVF); 

END Behaviour;
