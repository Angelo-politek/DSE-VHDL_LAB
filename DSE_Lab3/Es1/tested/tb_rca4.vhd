--test rca
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY tb_rca4 IS
END tb_rca4;


ARCHITECTURE Behavior OF tb_rca4 IS
  COMPONENT rca_4bit 
    PORT (a_4bit, b_4bit : IN SIGNED(3 downto 0);
          c_in : IN STD_LOGIC;
          c_out : OUT STD_LOGIC;
          sum_4bit : OUT SIGNED(3 downto 0)); 
  END COMPONENT;
  
  SIGNAL a_t,b_t,s_t: SIGNED(3 downto 0); -- segnali test
  SIGNAL co_t,ci_t: STD_LOGIC;
BEGIN
rca: rca_4bit PORT MAP(a_4bit=>a_t,b_4bit=>b_t,c_in=>ci_t,c_out=>co_t,sum_4bit=>s_t); --map segnali test nel componente
a_t<="1110";
b_t<="0001";
------0101

PROCESS
BEGIN -- simulazione a+b+1
  ci_t<='0'; 
  WAIT FOR 10 ns; 
  ci_t<='1'; 
  WAIT FOR 10 ns; 
END PROCESS;
END Behavior;



