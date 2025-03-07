LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY tb_rca16bit IS
END tb_rca16bit;

ARCHITECTURE behaviour OF rca_test IS

COMPONENT rca16bit
PORT(A,B: in SIGNED(15 DOWNTO 0);
Cin: in std_logic;
S: out SIGNED(15 DOWNTO 0);
Cout : out std_logic);
END COMPONENT;

SIGNAL atb,btb,stb: SIGNED(15 DOWNTO 0);
SIGNAL ctb,cotb: std_logic;

BEGIN
sim: rca16bit PORT MAP(atb,btb,ctb,stb,cotb);

PROCESS
BEGIN
atb <= "0110100110100011";
btb <= "0011011111010110";
ctb <= '0';
WAIT FOR 100 ns;
END PROCESS;
END behaviour;
