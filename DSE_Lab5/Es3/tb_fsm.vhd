LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY tb_fsm IS
END tb_fsm;

ARCHITECTURE behaviour OF tb_fsm IS

COMPONENT two_process_fsm
PORT(W,Clock,Reset : std_logic;
Z: out std_logic);
END COMPONENT;

SIGNAL W_tb,Clk,Rst,Z_tb: std_logic:='0';

BEGIN
sim: two_process_fsm PORT MAP(W_tb,Clk,Rst,Z_tb);

PROCESS
BEGIN
Rst <= '1';
W_tb <= '0';
WAIT FOR 20 ns;
W_tb <= '1';
WAIT FOR 20 ns;
Rst <= '0';
WAIT FOR 10 ns;
Rst <= '1';
WAIT FOR 4 ns;
W_tb <= '0';
WAIT FOR 20 ns;
END PROCESS;

PROCESS
BEGIN
Clk <= '0';
WAIT FOR 1 ns;
Clk <= '1';
WAIT FOR 1 ns;
END PROCESS;

END behaviour;