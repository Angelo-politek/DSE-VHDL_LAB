--code for a 4bit full adder

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY adder_4bit IS

PORT(A,B: in SIGNED(3 DOWNTO 0);
Cin:in std_logic;
S: out SIGNED(3 DOWNTO 0);
Cout: out std_logic);
END adder_4bit;

ARCHITECTURE dataflow OF adder_4bit IS

COMPONENT adder
PORT(a,b,cin:in std_logic;
s,cout: out std_logic);
END COMPONENT;

SIGNAL c: std_logic_vector(4 DOWNTO 0);

BEGIN
C(0)<=Cin;
gen:
for i in 0 to 3 generate
RCA: adder PORT MAP(A(i),B(i),C(i),S(i),C(i+1));
END generate;
Cout <= C(4);
END dataflow;
