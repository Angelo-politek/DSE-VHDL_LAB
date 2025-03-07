LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY multiplier IS
PORT(A: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
     B: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
     Ahex,Bhex,DecP,UniP: OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END multiplier;

ARCHITECTURE behaviour OF multiplier IS

COMPONENT full_adder
PORT(A,B,Cin: IN STD_LOGIC;
     S,Cout: OUT STD_LOGIC);
END COMPONENT;

COMPONENT rca
PORT(Av,Bv: IN std_logic_vector(3 DOWNTO 0);
     C : IN std_logic;
     Sv: OUT std_logic_vector(3 DOWNTO 0);
     Co : OUT std_logic);
END COMPONENT;

COMPONENT hexadecimal
PORT(INPUT : IN std_logic_vector(3 DOWNTO 0);
     OUTPUT : OUT std_logic_vector(6 DOWNTO 0));
END COMPONENT;

COMPONENT decoder
PORT(INPUT: IN std_logic_vector(7 DOWNTO 0);
     HEX3,HEX2: OUT std_logic_vector(0 TO 6));
END COMPONENT;

SIGNAL P: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL Av1,Av2,Av3,Bv1,Bv2,Bv3: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL Cout1,Cout2,Cout3: std_logic;
BEGIN
P <= "00000000";
Av2 <= "0000";
Av3 <= "0000";

P(0) <= A(0) AND B(0); 

-- primo rca
Av1 <= ('0' & (A(3) AND B(0)) & (A(2) AND B(0)) & (A(1) AND B(0)));
Bv1 <= ((A(3) AND B(1)) & (A(2) AND B(1)) & (A(1) AND B(1)) & (A(0) AND B(1)));

RCA1: rca PORT MAP(Av1,Bv1,'0',Av2,Cout1);
P(1) <= Av2(0);

-- secondo rca
Av2 <= Cout1 & Av2(3 DOWNTO 1);

Bv2 <= ((A(3) AND B(2)) & (A(2) AND B(2)) & (A(1) AND B(2)) & (A(0) AND B(2)));

RCA2: rca PORT MAP(Av2,Bv2,'0',Av3,Cout2);

P(2) <= Av3(0);

--terzo rca
Av3 <= Cout2 & Av3(3 DOWNTO 1);

Bv3 <= ((A(3) AND B(3)) & (A(2) AND B(3)) & (A(1) AND B(3)) & (A(0) AND B(3)));

RCA3: rca PORT MAP(Av3,Bv3,'0',P(6 DOWNTO 3),Cout3);
P(7) <= Cout3;

--uscita su decoder
HEXA : hexadecimal PORT MAP(A,Ahex);
HEXB : hexadecimal PORT MAP(B,Bhex);
HEXP : decoder PORT MAP(P,Decp,Unip);

END behaviour;