--testbench simulation done with smaller values- instead of 50M the first counter would also count from 0 to 9. This was done for simulation clarity (tested also with high numbers, like from 0 to 999 instead)

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY digit_flasher IS
PORT(Enable,Clock,Clear: in std_logic:='0';
HEX0: out std_logic_vector(6 downto 0):="0000000");
END digit_flasher;

ARCHITECTURE dataflow OF digit_flasher IS

COMPONENT decoder IS
PORT(N: in integer:=0;
HEX0: out std_logic_vector(6 downto 0));
END COMPONENT;

COMPONENT counter26bit 
PORT (Enable, Clock, Clear : in std_logic:='0';
Q : out std_logic_vector(25 downto 0):="00000000000000000000000000");
END COMPONENT;

COMPONENT digit_counter 
PORT(Enable,Clock,Clear : in std_logic:='0';
Q : out std_logic_vector(3 DOWNTO 0):="0000");
END COMPONENT;

SIGNAL Enable2,Clear1,Clear2: std_logic:='0';
SIGNAL Qv1: std_logic_vector(25 downto 0):="00000000000000000000000000";
SIGNAL Qv2: std_logic_vector(3 downto 0):="0000";
SIGNAL U1,U2: integer:=0;

BEGIN
CN0: counter26bit PORT MAP(Enable,Clock,Clear1,Qv1);
U1 <= to_integer(unsigned(std_logic_vector(Qv1)));
CN1: digit_counter PORT MAP(Enable2,Clock,Clear2,Qv2);
U2 <= to_integer(unsigned(std_logic_vector(Qv2)));
HEX: decoder PORT MAP(U2,HEX0);

PROCESS(Clock)
BEGIN
IF(Clear = '1') then
	Clear1 <= '1';
	Clear2 <= '1';
	Enable2 <= '0';
	elsif(Clear = '0') then
	IF(U1 = 49999998 and rising_edge(Clock)) then
	Enable2 <= '1';
	Clear1 <= '1';
	elsif(U1 = 49999999 and rising_edge(Clock)) then
	Enable2 <= '0';
	Clear1 <= '0';
END IF;
	IF(U2 = 9 and rising_edge(Clock) and U1 = 49999998) then
	Clear2 <= '1';
	elsif(U2 = 9 and rising_edge(Clock) and U1 = 49999999) then
	Clear2 <= '0';
END IF;
END IF;
END PROCESS;


END dataflow;
