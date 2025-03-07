LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY rca4bit IS
PORT(A,B: in SIGNED(3 DOWNTO 0);
Cin: in std_logic;
S: out SIGNED(3 DOWNTO 0);
Cout: out std_logic);
END rca4bit;

ARCHITECTURE behaviour OF rca4bit IS

COMPONENT full_adder
PORT(a,b,cin:IN std_logic;
s,cout: out std_logic);
END COMPONENT;

SIGNAL c: std_logic_vector(4 DOWNTO 0);
BEGIN
c(0) <= Cin;
gen:
for i in 0 to 3 generate
fa: full_adder PORT MAP(A(i),B(i),c(i),S(i),c(i+1));
end generate;
Cout <= c(4);
END behaviour;