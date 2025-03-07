-- Descrizione flipflop di tipo T 
LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY T_flipflop IS
  PORT (T, Clock, Reset : IN STD_LOGIC;
        Q : OUT STD_LOGIC);
END T_flipflop;

ARCHITECTURE Behavior OF T_flipflop IS
SIGNAL Q1: STD_LOGIC:='0';
BEGIN
Q<=Q1;
PROCESS (Clock, Reset)
BEGIN
IF (Reset = '1') THEN -- asynchronous clear
  Q1 <= '0';
  ELSIF (Clock'EVENT AND Clock = '1') THEN
    IF (T='1') THEN
      Q1<=not(Q1);
    ELSIF (T='0') THEN
      Q1<=Q1;
  END IF;   
END IF;
END PROCESS;
END Behavior;


