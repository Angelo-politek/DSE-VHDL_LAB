
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY reg8bit IS
PORT(Enable,Clock,Reset: in std_logic;
D: in std_logic_vector(7 downto 0);
Q: out std_logic_vector(7 downto 0));
END reg8bit;

ARCHITECTURE dataflow OF reg8bit IS

COMPONENT d_flipflop IS
PORT(D,Clock,Reset: in std_logic;
Q: out std_logic);
END COMPONENT;

SIGNAL Dff,Qff: std_logic_vector(7 downto 0):="00000000";
BEGIN

gen8bit:
FOR i in 0 to 7 generate
dff(i) <= (D(i) AND Enable) OR (not(Enable) AND Qff(i));
ff: d_flipflop PORT MAP(Dff(i),Clock,Reset,Qff(i));
END generate;

Q <= Qff;

END dataflow;