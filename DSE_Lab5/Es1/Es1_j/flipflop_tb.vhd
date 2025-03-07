LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY flipflop_tb IS
END flipflop_tb;

ARCHITECTURE behaviour OF flipflop_tb IS

COMPONENT D_flipflop IS
PORT(D, Clock, Reset : in std_logic;
Q : out std_logic);
END COMPONENT;

SIGNAL clk,rst,d_tb,q_tb : std_logic:='0';

BEGIN
sim: D_flipflop PORT MAP(d_tb,clk,rst,q_tb);

PROCESS
BEGIN
rst <= '1';
d_tb <= '1'; 
WAIT FOR 25 ns;
d_tb <= '0';
WAIT FOR 15 ns;
d_tb <= '1';
WAIT FOR 20 ns;
rst <= '0';
WAIT FOR 10 ns;
rst <= '1';
wait for 10 ns;
END PROCESS;

PROCESS
BEGIN
clk <= '0';
WAIT FOR 2 ns;
clk <= '1';
WAIT FOR 2 ns;
END PROCESS;
END behaviour;