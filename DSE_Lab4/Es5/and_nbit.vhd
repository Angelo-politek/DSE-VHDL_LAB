-- porta and a n bit (in pratica un comparatore)
LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY and_nbit IS
  GENERIC (N: integer);
  PORT (A, B : IN STD_LOGIC_VECTOR(N-1 downto 0);
        Y : OUT STD_LOGIC);
END and_nbit;

ARCHITECTURE Behavior OF and_nbit IS
BEGIN
PROCESS(A,B)
BEGIN
IF (A=B) THEN Y<='1';
ELSE Y<='0';
END IF;
END PROCESS;
END Behavior;






