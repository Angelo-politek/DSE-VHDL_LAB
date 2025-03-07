-- shift a sinistra di 1 bit equivaalente a moltiplicare x 2
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY shift_sx IS
  GENERIC ( N : integer:=8);
  PORT (R : IN SIGNED(N-1 DOWNTO 0);
	Clock : IN STD_LOGIC;
	Sub_flag : OUT STD_LOGIC;
        Q : OUT SIGNED(N-1 DOWNTO 0));
END shift_sx;


ARCHITECTURE Behavior OF shift_sx IS
SIGNAL Q1: SIGNED(7 DOWNTO 0);
SIGNAL S: STD_LOGIC;
BEGIN
PROCESS (R,Clock)
BEGIN
S<=R(7);
IF (R="00000000") THEN
	Q1<="00000000";
	Sub_flag<='0';
	Q<=Q1;

ELSE
	Q1<= (R(6 downto 0) & '0');
	Sub_flag<='1';
	IF(Q1(7)/= S) THEN
		Q1(7)<=S;
	END IF;
	Q<=not Q1;
END IF;

END PROCESS;
END Behavior;
