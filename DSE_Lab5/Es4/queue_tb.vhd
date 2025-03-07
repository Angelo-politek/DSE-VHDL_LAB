LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY queue_tb IS
END queue_tb;

ARCHITECTURE behaviour of queue_tb IS

COMPONENT queue_reg IS
PORT(Enable,Clock,Reset: std_logic;
D: std_logic_vector(6 downto 0);
Q0,Q1,Q2,Q3,Q4 : out std_logic_vector(6 downto 0):="0000000");
END COMPONENT;

SIGNAL Ena,Clk,Rst: std_logic:='0';
SIGNAL Dt,Q0t,Q1t,Q2t,Q3t,Q4t: std_logic_vector(6 downto 0):="0000000";

BEGIN

sim: queue_reg PORT MAP(Ena,Clk,Rst,Dt,Q0t,Q1t,Q2t,Q3t,Q4t);

PROCESS
BEGIN
Ena <= '1';
Rst <= '1';
Dt <= "1111111";
WAIT FOR 4 ns;
Dt <= "0000001";
WAIT FOR 4 ns;
Dt <= "0001111";
WAIT FOR 4 ns;
Ena <= '0';
WAIT FOR 2 ns;
Dt <= "0101011";
WAIT FOR 5 ns;
Dt <= "1100111";

END PROCESS;

PROCESS
BEGIN
Clk <= '1';
WAIT FOR 1 ns;
CLk <= '0';
WAIT FOR 1 ns;
END PROCESS;
END behaviour;