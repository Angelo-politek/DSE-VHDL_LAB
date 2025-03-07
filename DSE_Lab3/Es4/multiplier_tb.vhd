LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY multiplier_tb IS
END multiplier_tb;

ARCHITECTURE behaviour OF multiplier_tb IS
COMPONENT multiplier
PORT(A: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
     B: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
     Ahex,Bhex,DecP,UniP: OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END COMPONENT;

SIGNAL A_tb,B_tb: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL Ahex_tb,Bhex_tb,DecP_tb,UniP_tb: STD_LOGIC_VECTOR(6 DOWNTO 0);

BEGIN
mul: multiplier PORT MAP(A_tb,B_tb,Ahex_tb,Bhex_tb,DecP_tb,UniP_tb);

PROCESS
BEGIN
A_tb <= "0101";
B_tb <= "1010";
WAIT FOR 100 ns;

A_tb <= "0000";
B_tb <= "1111";
WAIT FOR 100 ns;

A_tb <= "1001";
B_tb <= "1110";
WAIT FOR 100 ns;

A_tb <= "1011";
B_tb <= "1111";
WAIT FOR 100 ns;
END PROCESS;
END behaviour;
