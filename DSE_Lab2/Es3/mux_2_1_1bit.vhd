-- multiplexer 2 a 1 a 1 bit con approccio dataflow

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux_2_1_1bit IS
PORT (x,y,s : IN STD_LOGIC;
      m : OUT STD_LOGIC); 
END mux_2_1_1bit;


ARCHITECTURE dataflow OF mux_2_1_1bit IS
BEGIN
m <= (NOT (s) AND x) OR (s AND y);  --implementazione logica del mux
END dataflow;
