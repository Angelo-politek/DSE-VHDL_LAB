LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY tb_skip16bit IS
END tb_skip16bit;

ARCHITECTURE behaviour OF skip16test IS

COMPONENT skip16bit
PORT(A,B: in SIGNED(15 DOWNTO 0);
Cin:in std_logic;
S: out SIGNED(15 DOWNTO 0);
Cout: out std_logic);
END COMPONENT;

SIGNAL atb,btb,stb: SIGNED(15 DOWNTO 0);
SIGNAL ctb,coutb: std_logic;

BEGIN
sim: skip16bit PORT MAP(atb,btb,ctb,stb,coutb);
PROCESS
BEGIN
atb <= "1010110111101001";
btb <= "0101110001010100";
ctb <= '1';
WAIT FOR 100 ns;
atb <= "1110110000111001";
btb <= "0101001000101100";
ctb <= '0';
WAIT FOR 100 ns;
atb <= "0010010111101001";
btb <= "0101111001010111";
ctb <= '1';
WAIT FOR 100 ns;
END PROCESS;
END behaviour;
