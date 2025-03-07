LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY rca_test IS
END rca_test;

ARCHITECTURE behaviour OF rca_test IS

COMPONENT rca
PORT(Av,Bv: IN std_logic_vector(3 DOWNTO 0);
     C : IN std_logic;
     Sv: OUT std_logic_vector(3 DOWNTO 0);
     Co : OUT std_logic);
END COMPONENT;

SIGNAL atb,btb,stb : std_logic_vector(3 downto 0);
SIGNAL ctb,cotb: std_logic;

BEGIN
RCASIM: rca PORT MAP(atb,btb,ctb,stb,cotb);
PROCESS
BEGIN
atb <= "0101";
btb <= "1010";
ctb <= '0';
WAIT FOR 100 ns;

atb <= "1111";
btb <= "1111";
ctb <= '1';
WAIT FOR 100 ns;

atb <= "1000";
btb <= "1001";
ctb <= '0';
WAIT FOR 100 ns;

atb <= "1010";
btb <= "1001";
WAIT FOR 100 ns;

END PROCESS;
END behaviour;


