LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux IS
PORT (x,y,s : IN STD_LOGIC;
      m : OUT STD_LOGIC); 
END mux;


ARCHITECTURE dataflow OF mux IS
BEGIN
m <= (NOT (s) AND y) OR (s AND x);  
END dataflow;
