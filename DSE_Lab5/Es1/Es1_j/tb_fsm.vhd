LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY tb_fsm IS
END tb_fsm;

ARCHITECTURE behaviour OF tb_fsm IS

COMPONENT one_hot_fsm IS
PORT(w,clock,reset: in std_logic;
z: out std_logic);
END COMPONENT;

SIGNAL w_tb, clk, rst, z_tb : std_logic:='0';

BEGIN

sim: one_hot_fsm PORT MAP(w_tb,clk,rst,z_tb);

PROCESS
BEGIN
rst <= '1';
w_tb <= '0';
WAIT FOR 12 ns;
w_tb <= '1';
WAIT FOR 4 ns;
W_tb <= '0';
WAIT FOR 6 ns;
rst <= '0';
WAIT FOR 4 ns;
rst <= '1';
WAIT FOR 12 ns;

END PROCESS;

PROCESS
BEGIN

clk <= '0';
WAIT FOR 1 ns;
clk <= '1';
WAIT FOR 1 ns;
END PROCESS;

END behaviour;
