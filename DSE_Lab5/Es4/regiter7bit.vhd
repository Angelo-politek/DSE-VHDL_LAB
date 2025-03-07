LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY register7bit IS
PORT(Enable,Clock,Reset: in std_logic;
D: in std_logic_vector(6 downto 0):="0000000";
Q: out std_logic_vector(6 downto 0):="0000000");
END register7bit;

ARCHITECTURE dataflow OF register7bit IS

COMPONENT d_flipflop IS
PORT(D, Clock, Reset : in std_logic;
Q : out std_logic);
END COMPONENT;

SIGNAL Dv, Qv: std_logic_vector(6 downto 0):="0000000";
BEGIN

gen:
FOR i in 0 to 6 generate
Dv(i) <= (Enable and D(i)) or (Not(Enable) and Qv(i));
ff: d_flipflop PORT MAP(Dv(i), Clock, Reset, Qv(i));
END generate;
Q <= Qv;

END dataflow;