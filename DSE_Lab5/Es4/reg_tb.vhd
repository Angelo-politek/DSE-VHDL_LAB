LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY reg_tb IS
END reg_tb;

ARCHITECTURE behaviour OF reg_tb IS

COMPONENT register7bit 
PORT(Enable,Clock,Reset: in std_logic;
D: in std_logic_vector(6 downto 0);
Q: out std_logic_vector(6 downto 0));
END COMPONENT;

SIGNAL Ena,Clk,Rst: std_logic:='0';
SIGNAL Dt,Qt: std_logic_vector(6 downto 0):="0000000";

BEGIN

sim: register7bit PORT MAP(Ena,Clk,Rst,Dt,Qt);

PROCESS
BEGIN
Rst <= '1';
Ena <= '1';
Dt <= "0100110";
WAIT FOR 2 ns;
Dt <= "1110101";
WAIT FOR 1 ns;
Dt <= "0000000";
Ena <= '0';
WAIT FOR 1 ns;
Dt <= "1010001";
WAIT FOR 3 ns;
Dt <= "0001101";
WAIT FOR 3 ns;
Dt <= "1111111";
Ena <= '1';
WAIT FOR 3 ns;
Rst <= '0';
WAIT FOR 3 ns;

END PROCESS;

PROCESS
BEGIN
Clk <= '0';
WAIT FOR 1 ns;
Clk <= '1';
WAIT FOR 1 ns;
END PROCESS;

END behaviour;