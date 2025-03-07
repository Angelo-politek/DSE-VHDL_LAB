-- decoder per display a 7 segmenti
-- funzioni logiche ricavate dalle tabelle di verità:
-- H6 =  c2 + c1
-- H5 = c2c0 + c2c1
-- H4 = c2c0 + c2c1 = H4
-- H3 = (c2c1c0)' + c2c0 + c2c1 
-- H2 = c1 + c0
-- H1 = c1 + c0 = H1
-- H0 = (c2c0)' + c2c0 + c1 
-- La traccia chiedeva di usare solo le istruzioni semplici del vhdl

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY d7seg_decoder IS
PORT 
(C: IN STD_LOGIC_VECTOR(2 downto 0);
 H: OUT STD_LOGIC_VECTOR(6 downto 0)); 
END d7seg_decoder;


ARCHITECTURE Dataflow OF d7seg_decoder IS 
BEGIN
H(6)<= (C(2) or C(1));
H(5)<= (C(2) and C(0)) or (C(2) and C(1));
H(4)<= (C(2) and C(0)) or (C(2) and C(1));
H(3)<= (not(C(2)) and not(C(1)) and not(C(0))) or (C(2) and C(0)) or (C(2) and C(1));
H(2)<= (C(1) or C(0));
H(1)<= C(1) or C(0);
H(0)<= ((not(C(2)) and not(C(0))) or (C(2) and C(0)) or C(1));  
END Dataflow;
