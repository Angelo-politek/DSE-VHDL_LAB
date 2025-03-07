LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY D_flipflop IS
PORT(D, Clock, Reset : in std_logic;
Q : out std_logic);
END D_flipflop;

ARCHITECTURE dataflow OF D_flipflop IS
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