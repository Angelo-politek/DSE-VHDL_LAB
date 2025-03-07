-- shift a destra di 2 bit equivaalente a moltiplicare x 0,25
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY shift2_dx IS
  GENERIC ( N : integer:=8);
  PORT (R : IN SIGNED(N-1 DOWNTO 0);
 	Clock : IN STD_LOGIC;
        Q : OUT SIGNED(N-1 DOWNTO 0));
END shift2_dx;


ARCHITECTURE Behavior OF shift2_dx IS
SIGNAL Q1: SIGNED(7 DOWNTO 0);
SIGNAL S: STD_LOGIC;
BEGIN
PROCESS (R,Clock)
BEGIN
S<=R(7);
Q1<= "00" & R(7 downto 2);
IF(Q1(7)/= S) THEN
	Q1(7)<=S;
END IF;
Q<=Q1;
END PROCESS;
END Behavior;
