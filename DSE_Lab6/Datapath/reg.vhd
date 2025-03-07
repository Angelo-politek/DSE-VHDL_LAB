LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY reg IS
  GENERIC ( N : integer:=8);
  PORT (R : IN SIGNED(N-1 DOWNTO 0);
        Clock, Reset,Enable : IN STD_LOGIC;
        Q : OUT SIGNED(N-1 DOWNTO 0));
END reg;


ARCHITECTURE Behavior OF reg IS
BEGIN
PROCESS (Clock, Reset)
BEGIN
IF (Reset = '1') THEN
	Q <= (OTHERS => '0');
ELSIF (Clock'EVENT AND Clock = '1') THEN
	IF (Enable = '1') THEN
		Q <= R;
	END IF;
END IF;
END PROCESS;
END Behavior;
