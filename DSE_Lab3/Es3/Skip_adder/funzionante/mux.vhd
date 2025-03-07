LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux IS
PORT(x,y,s: in std_logic;
m: out std_logic);
END mux;

ARCHITECTURE dataflow OF mux IS
BEGIN
m <= x when s='1' else
	y;
END dataflow;
