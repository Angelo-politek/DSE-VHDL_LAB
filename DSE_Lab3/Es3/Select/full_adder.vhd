LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY full_adder IS
PORT(a,b,cin:IN std_logic;
s,cout: out std_logic);
END full_adder;

ARCHITECTURE dataflow OF full_adder IS
BEGIN
s<= a xor b xor cin;
cout <= (a and b) or (cin and (a xor b));
END dataflow;
