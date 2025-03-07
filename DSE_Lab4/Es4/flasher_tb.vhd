LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY flasher_tb IS
END flasher_tb;

ARCHITECTURE behaviour OF flasher_tb IS

COMPONENT digit_flasher
PORT(Enable,Clock,Clear: in std_logic;
HEX0: out std_logic_vector(6 downto 0));
END COMPONENT;

SIGNAL Enabletb,Clocktb,Cleartb: std_logic:='0';
SIGNAL Htb: std_logic_vector(6 downto 0):="0000000";

BEGIN
sim: digit_flasher PORT MAP(Enabletb,Clocktb,Cleartb,Htb);

PROCESS
BEGIN
Enabletb <= '1';
WAIT FOR 2000 ns;
END PROCESS;

PROCESS
BEGIN
Clocktb <= '1';
WAIT FOR 10 ns;
Clocktb <= '0';
WAIT FOR 10 ns;
END PROCESS;
END behaviour;