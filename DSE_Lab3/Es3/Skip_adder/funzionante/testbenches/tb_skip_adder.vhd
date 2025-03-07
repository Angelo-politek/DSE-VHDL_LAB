LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY tb_skip_adder IS
END tb_skip_adder;

ARCHITECTURE behaviour OF tb_skip_adder IS

COMPONENT skip_adder IS
PORT(A,B: in SIGNED(3 DOWNTO 0);
Cin:in std_logic;
S: out SIGNED(3 DOWNTO 0);
Cout: out std_logic);
END COMPONENT;

SIGNAL atb,btb,stb: SIGNED(3 DOWNTO 0);
SIGNAL ctb,coutb: std_logic;

BEGIN
sim: skip_adder PORT MAP(atb,btb,ctb,stb,coutb);
PROCESS
BEGIN
atb <= "1010";
btb <= "1111";
ctb<='1';
WAIT FOR 100 ns;

atb <= "1010";
btb <= "0101";
ctb<='0';
WAIT FOR 100 ns;

atb <= "1010";
btb <= "0101";
ctb<='1';
WAIT FOR 100 ns;

END PROCESS;
END behaviour;
