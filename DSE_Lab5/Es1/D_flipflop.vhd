-- flip flop di tipo D usando solo istruzioni semplici di assegnazione
LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY D_flipflop IS
  PORT (D, CLK: IN STD_LOGIC;
        Q : OUT STD_LOGIC);
END D_flipflop;



ARCHITECTURE Dataflow OF D_flipflop IS
SIGNAL s1,s2,s3,s4,s5,s6: STD_LOGIC;
BEGIN
s1<= s4 nand s2;
s2<= s1 nand CLK;
s3<= (CLK nand s2) nand s4;
s4<= D nand s3;
s5<= s2 nand s6;
s6<= s3 nand s5;
Q<=s5;

END Dataflow;
