LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY tb_multiplier IS
END tb_multiplier;


ARCHITECTURE Behavior OF tb_multiplier IS
  COMPONENT multiplier 
    PORT (am_4bit, bm_4bit : IN STD_LOGIC_VECTOR(3 downto 0);
          prod_4bit : OUT STD_LOGIC_VECTOR(7 downto 0)); 
  END COMPONENT;
  
  SIGNAL A_t,B_t: STD_LOGIC_VECTOR(3 downto 0); -- segnali test
  SIGNAL prod_t: STD_LOGIC_VECTOR(7 downto 0);
BEGIN
mul: multiplier PORT MAP(am_4bit=>A_t,bm_4bit=>B_t,prod_4bit=>prod_t);


PROCESS
BEGIN -- simulazione a x b
  A_t<="1100"; -- 12
  B_t<="1011"; -- 11
  ----- 10000100  132
  --ASSERT prod_t = "10000100" REPORT "Errore! Risultato atteso: 132" SEVERITY ERROR;
  WAIT FOR 10 ms;
  A_t<="1001"; -- 9
  B_t<="0010"; -- 2
  ----- 00010010  18
  --ASSERT prod_t = "00010010" REPORT "Errore! Risultato atteso: 18" SEVERITY ERROR;
  WAIT FOR 10 ms; 
END PROCESS;
    

END Behavior;
