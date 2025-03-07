LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Tflipflop IS
PORT( T,Clock,Clear :in std_logic:='0';
Q: out std_logic:='0');
END Tflipflop;

ARCHITECTURE behaviour OF Tflipflop IS

SIGNAL temp,flag: std_logic :='0';

BEGIN
PROCESS(Clock)
BEGIN

IF ( Clear = '1') then
flag <= '1';
END IF;
IF (rising_edge(Clock)) then
	IF(flag = '1') then
	temp <= '0';
	flag <= '0';
	ELSIF(T='1') then 
	temp <= NOT(temp);
	ELSIF (T ='0') then 
	temp <= temp;
	END IF;
END IF;
END PROCESS;
Q <= temp;
END behaviour;
