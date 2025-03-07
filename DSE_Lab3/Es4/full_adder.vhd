LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY full_adder IS
PORT(A,B,Cin: IN STD_LOGIC;
     S,Cout: OUT STD_LOGIC);
END full_adder;

ARCHITECTURE behaviour OF full_adder IS
BEGIN
S <= (A XOR B) XOR Cin;
Cout <= (A AND B) OR (Cin AND (A XOR B));
END behaviour;
