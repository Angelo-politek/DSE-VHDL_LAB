LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY rca16bit IS
PORT(A,B: in SIGNED(15 DOWNTO 0);
Cin: in std_logic;
S: out SIGNED(15 DOWNTO 0);
Cout : out std_logic);
ENd rca16bit;

ARCHITECTURE structure OF rca16bit IS

COMPONENT full_adder
PORT(a,b,cin:in std_logic;
s,cout: out std_logic);
END COMPONENT;

SIGNAL c : std_logic_vector(16 DOWNTO 0);
BEGIN
c(0) <= Cin;

gen:
For i in 0 to 15 generate
fa: full_adder PORT MAP(A(i),B(i),C(i),S(i),C(i+1));
end generate;

Cout <= C(16);
END structure;