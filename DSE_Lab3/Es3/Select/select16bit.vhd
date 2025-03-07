LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY select16bit IS
PORT(A,B: in SIGNED(15 DOWNTO 0);
Cin: in std_logic;
S: out SIGNED(15 DOWNTO 0);
Cout: out std_logic);
END select16bit;

ARCHITECTURE structure OF select16bit IS

COMPONENT select4bit
PORT(A,B: in SIGNED(3 DOWNTO 0);
Cin: in std_logic;
S: out SIGNED(3 DOWNTO 0);
Cout: out std_logic);
END COMPONENT;

SIGNAL c : std_logic_vector(4 DOWNTO 0);
BEGIN
C(0) <= Cin;

slc0: select4bit PORT MAP(A(3 DOWNTO 0),B(3 DOWNTO 0),C(0),S(3 DOWNTO 0),C(1));
slc1: select4bit PORT MAP(A(7 DOWNTO 4),B(7 DOWNTO 4),C(1),S(7 DOWNTO 4),C(2));
slc2: select4bit PORT MAP(A(11 DOWNTO 8),B(11 DOWNTO 8),C(2),S(11 DOWNTO 8),C(3));
slc3: select4bit PORT MAP(A(15 DOWNTO 12),B(15 DOWNTO 12),C(3),S(15 DOWNTO 12),C(4));

Cout <= C(4);

END structure;
