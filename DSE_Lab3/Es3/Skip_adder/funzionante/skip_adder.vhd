--code for the skipp/bypass carry adder

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY skip_adder IS
PORT(An,Bn: in SIGNED(3 DOWNTO 0);
Cin:in std_logic;
S: out SIGNED(3 DOWNTO 0);
Cout: out std_logic);
END skip_adder;

ARCHITECTURE behaviour OF skip_adder IS

COMPONENT adder_4bit
PORT(A,B: in SIGNED(3 DOWNTO 0);
Cin:in std_logic;
S: out SIGNED(3 DOWNTO 0);
Cout: out std_logic);
END COMPONENT;

COMPONENT mux
PORT(x,y,s: in std_logic;
m: out std_logic);
END COMPONENT;

SIGNAL P: std_logic_vector(3 DOWNTO 0);
SIGNAL pm,coutm: std_logic;

BEGIN

PROCESS(An,Bn,P)
BEGIN
for i in 0 to 3 loop
P(i) <= An(i) xor Bn(i);
END loop;
END PROCESS;
pm <= P(0) and P(1) and P(2) and P(3);

rca: adder_4bit PORT MAP(An,Bn,Cin,S,coutm);
mu: mux PORT MAP(Cin,coutm,Pm,Cout);

END behaviour;
