LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY ff IS
  PORT (D, Clock, Reset : IN STD_LOGIC;
        Q : OUT STD_LOGIC);
END ff;

ARCHITECTURE Behavior OF ff IS
BEGIN
PROCESS (Clock, Reset)
BEGIN
IF (Reset = '1') THEN -- asynchronous clear
Q <= '0';
ELSIF (Clock'EVENT AND Clock = '1') THEN
Q <= D;
END IF;
END PROCESS;
END Behavior;
