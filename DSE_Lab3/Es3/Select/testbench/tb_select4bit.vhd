LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY tb_select4bit IS
END tb_select4bit;

ARCHITECTURE behaviour OF carry_test IS

COMPONENT select4bit
PORT(A,B: in SIGNED(3 DOWNTO 0);
Cin: in std_logic;
S: out SIGNED(3 DOWNTO 0);
Cout: out std_logic);
END COMPONENT;

SIGNAL atb,btb,stb: SIGNED(3 downto 0);
SIGNAL ctb,cotb: std_logic;

BEGIN
sim: select4bit PORT MAP(atb,btb,ctb,stb,cotb);
PROCESS
BEGIN
atb <= "1010";
btb <= "0111";
ctb <= '1';
WAIT FOR 100 ns;

atb <= "1010";
btb <= "0111";
ctb <= '0';
WAIT FOR 100 ns;

atb <= "1011";
btb <= "0111";
ctb <= '1';
WAIT FOR 100 ns;

END PROCESS;
END behaviour;
