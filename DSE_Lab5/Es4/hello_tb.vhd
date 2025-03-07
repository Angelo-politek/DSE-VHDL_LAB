--this test bench was used with the enable that activates every 4 rising clock edges, for debugging purposes.

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY hello_tb IS
END hello_tb;

ARCHITECTURE behaviour OF hello_tb IS

COMPONENT hello_fsm IS
PORT(Reset,Clock: in std_logic;
HEX0,HEX1,HEX2,HEX3,HEX4,HEX5 : out std_logic_vector(6 downto 0));
END COMPONENT;

SIGNAL rst,clk: std_logic;
signal hx,hx2,hx3,hx4,hx5: std_logic_vector(6 downto 0);

BEGIN
sim: hello_fsm PORT MAP(rst,clk,hx,hx2,hx3,hx4,hx5);

PROCESS
BEGIN
clk <= '1';
WAIT FOR 1 ns;
clk <= '0';
WAIT FOR 1 ns;
END PROCESS;
PROCESS
BEGIN
rst <= '1';
WAIT FOR 200 ns;
END PROCESS;
END behaviour;
