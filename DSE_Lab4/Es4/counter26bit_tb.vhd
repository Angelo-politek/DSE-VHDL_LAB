LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY counter26bit_tb IS 
END counter26bit_tb;

ARCHITECTURE behaviour OF counter26bit_tb IS

COMPONENT counter26bit 
PORT (Enable, Clock, Clear : in std_logic;
Q : out std_logic_vector(25 downto 0));
END COMPONENT;

SIGNAL Enable_tb,Clock_tb,Clear_tb : std_logic:='0';
SIGNAL Q_tb: std_logic_vector(25 downto 0):="00000000000000000000000000";

BEGIN

sim: counter26bit PORT MAP(Enable_tb,Clock_tb,Clear_tb,Q_tb);

PROCESS
BEGIN

Enable_tb <= '1';
WAIT FOR 1 sec;

Clear_tb <='1';

WAIT FOR 500 ms;

Clear_tb <= '0';

wait for 1 sec; 
END PROCESS;

PROCESS
BEGIN

Clock_tb <= '0';
WAIT FOR 10 ns;
Clock_tb <= '1';
WAIT FOR 10 ns;

END PROCESS;
END behaviour;