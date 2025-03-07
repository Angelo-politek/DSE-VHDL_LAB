--comparatore >9
LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


ENTITY comparator IS
PORT (A: IN UNSIGNED(3 DOWNTO 0);
      Q: OUT STD_LOGIC);
END comparator;


ARCHITECTURE Behavior OF comparator IS
BEGIN  
PROCESS(A)
variable b: UNSIGNED(3 DOWNTO 0):="1001";
BEGIN
if (A>b) then Q<='1';
else Q<='0';
end if;
END PROCESS;
END Behavior;


