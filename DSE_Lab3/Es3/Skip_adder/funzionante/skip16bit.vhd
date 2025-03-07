LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY skip16bit IS
PORT(A,B: in SIGNED(15 DOWNTO 0);
Cin:in std_logic;
S: out SIGNED(15 DOWNTO 0);
Cout: out std_logic);
END skip16bit;

ARCHITECTURE dataflow OF skip16bit IS

COMPONENT skip_adder
PORT(An,Bn: in SIGNED(3 DOWNTO 0);
Cin:in std_logic;
S: out SIGNED(3 DOWNTO 0);
Cout: out std_logic);
END COMPONENT;

SIGNAL c: std_logic_vector(3 DOWNTO 0);
BEGIN
C(0)<=Cin;
sk0: skip_adder PORT MAP(A(3 DOWNTO 0),B(3 DOWNTO 0),C(0),S(3 DOWNTO 0),C(1));
sk1: skip_adder PORT MAP(A(7 DOWNTO 4),B(7 DOWNTO 4),C(1),S(7 DOWNTO 4),C(2));
sk2: skip_adder PORT MAP(A(11 DOWNTO 8),B(11 DOWNTO 8),C(2),S(11 DOWNTO 8),C(3));
sk3: skip_adder PORT MAP(A(15 DOWNTO 12),B(15 DOWNTO 12),C(3),S(15 DOWNTO 12),Cout);
ENd dataflow;