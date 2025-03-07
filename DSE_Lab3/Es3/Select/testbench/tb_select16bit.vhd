LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY tb_select16test IS
END tb_select16test;

ARCHITECTURE behaviour OF carry16test IS

COMPONENT select16bit
PORT(A,B: in SIGNED(15 DOWNTO 0);
Cin: in std_logic;
S: out SIGNED(15 DOWNTO 0);
Cout: out std_logic);
END COMPONENT;

SIGNAL atb,btb,stb: SIGNED(15 downto 0);
SIGNAL ctb,cotb: std_logic;

BEGIN
sim: select16bit PORT MAP(atb,btb,ctb,stb,cotb);
PROCESS
BEGIN
atb <= "1010101010110101";
btb <= "0111001011101001";
ctb <= '1';
WAIT FOR 100 ns;

atb <= "1010101010110101";
btb <= "0111001011101001";
ctb <= '0';
WAIT FOR 100 ns;


END PROCESS;
END behaviour;
