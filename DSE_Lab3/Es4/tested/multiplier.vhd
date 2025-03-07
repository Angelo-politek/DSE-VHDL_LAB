LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY multiplier IS
  PORT (am_4bit, bm_4bit : IN STD_LOGIC_VECTOR(3 downto 0);
        prod_4bit : OUT STD_LOGIC_VECTOR(7 downto 0));
END multiplier;

ARCHITECTURE Structure OF multiplier IS
COMPONENT rca_4bit_mult --componente definito nel file rca_4bit_mult.vhd
  PORT (a_4bit, b_4bit : IN STD_LOGIC_VECTOR(3 downto 0);
        c_in : IN STD_LOGIC;
        c_out : OUT STD_LOGIC;
        sum_4bit : OUT STD_LOGIC_VECTOR(3 downto 0));  
END COMPONENT;
  

signal co_temp1,co_temp2,co_temp3: STD_LOGIC;
signal a_temp1,b_temp1,s_temp1: STD_LOGIC_VECTOR(3 downto 0);
signal a_temp2,b_temp2,s_temp2: STD_LOGIC_VECTOR(3 downto 0);
signal a_temp3,b_temp3,s_temp3: STD_LOGIC_VECTOR(3 downto 0);
BEGIN

rca0: rca_4bit_mult PORT MAP (a_4bit=>a_temp1,b_4bit=>b_temp1,c_in=>'0',c_out=>co_temp1,sum_4bit=>s_temp1);
rca1: rca_4bit_mult PORT MAP (a_4bit=>a_temp2,b_4bit=>b_temp2,c_in=>'0',c_out=>co_temp2,sum_4bit=>s_temp2);
rca2: rca_4bit_mult PORT MAP (a_4bit=>a_temp3,b_4bit=>b_temp3,c_in=>'0',c_out=>co_temp3,sum_4bit=>s_temp3);
  

-- continuo a chiedermi se si puo fare un ciclo for, ho provato con generate e loop ma non funziona

----a_temp1<=('0'&(bm_4bit(0) and am_4bit(3))&(bm_4bit(0) and am_4bit(2))&(bm_4bit(0) and am_4bit(1)));
a_temp1<=('0'&((bm_4bit(0)&bm_4bit(0)&bm_4bit(0)) and am_4bit(3 downto 1)));
----b_temp1<=((bm_4bit(1) and am_4bit(3))&(bm_4bit(1) and am_4bit(2))&(bm_4bit(1) and am_4bit(1))&(bm_4bit(1) and am_4bit(0)));
b_temp1<=((bm_4bit(1)&bm_4bit(1)&bm_4bit(1)&bm_4bit(1)) and am_4bit);
a_temp2<=(co_temp1 & s_temp1(3 downto 1));
----b_temp2<=((bm_4bit(2) and am_4bit(3))&(bm_4bit(2) and am_4bit(2))&(bm_4bit(2) and am_4bit(1))&(bm_4bit(2) and am_4bit(0)));
b_temp2<=((bm_4bit(2)&bm_4bit(2)&bm_4bit(2)&bm_4bit(2)) and am_4bit);
a_temp3<=(co_temp2 & s_temp2(3 downto 1));
----b_temp3<=((bm_4bit(3) and am_4bit(3))&(bm_4bit(3) and am_4bit(2))&(bm_4bit(3) and am_4bit(1))&(bm_4bit(3) and am_4bit(0)));
b_temp3<=((bm_4bit(3)&bm_4bit(3)&bm_4bit(3)&bm_4bit(3)) and am_4bit);
prod_4bit(7)<=co_temp3;
prod_4bit(6 downto 3)<=s_temp3;
prod_4bit(2)<=s_temp2(0);
prod_4bit(1)<=s_temp1(0);
prod_4bit(0)<=(bm_4bit(0) and am_4bit(0));


END Structure;








