LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY d_flipflop IS
PORT(D, Clock, Reset : in std_logic:='0';
Q : out std_logic:='0');
END d_flipflop;

ARCHITECTURE dataflow OF d_flipflop IS
BEGIN
PROCESS(Clock,Reset)
BEGIN
IF Reset = '0' then
	Q <= '0';
ELSIF(rising_edge(Clock)) then
	Q <= D;
END IF;
END PROCESS;
END dataflow; 