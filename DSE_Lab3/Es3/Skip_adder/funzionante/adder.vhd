--code for a full adder

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY adder IS
PORT(a,b,cin:in std_logic;
s,cout: out std_logic);
END;

ARCHITECTURE dataflow OF adder IS
BEGIN
s<= a xor b xor cin;
cout <= (a and b) or (cin and (a xor b));
END dataflow;
