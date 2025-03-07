-- Codice contatore sincrono a n bit usando Q<=Q+1;
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY n_bit_counter_easy IS
GENERIC (N: integer:=16); -- n bit
PORT(Enable: in STD_LOGIC;
     Clock: in STD_LOGIC;
     Clear: in STD_LOGIC;
     Cout : buffer UNSIGNED(N-1 downto 0));
END n_bit_counter_easy;

ARCHITECTURE Behavior OF n_bit_counter_easy IS
BEGIN
PROCESS(Enable,Clock,Clear)
BEGIN
IF (Clear='0') THEN Cout<= (others=>'0');
ELSIF (Clear='1' and Enable='1') THEN
	IF (Clock'EVENT AND Clock = '1') THEN
		Cout<=Cout+1;
	END IF;
END IF;
END PROCESS;

END Behavior;
