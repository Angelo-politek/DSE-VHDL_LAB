--test mux 2 a 1 a 4 bit
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY tb_mux21_4bit IS
END tb_mux21_4bit;


ARCHITECTURE Behavior OF tb_mux21_4bit IS
  COMPONENT mux_2_1_4bit --componente definito in mux_2_1_4bit.vhd
    PORT (A,B: IN STD_LOGIC_VECTOR(3 downto 0);
          SEL: IN STD_LOGIC;
          K : OUT STD_LOGIC_VECTOR(3 downto 0)); 
  END COMPONENT;
  --segnali test
  SIGNAL X_t,Y_t,M_t: STD_LOGIC_VECTOR(3 downto 0);
  SIGNAL S_t: STD_LOGIC;

BEGIN
--map segnali test nel componente
mux: mux_2_1_4bit PORT MAP(A=>X_t,B=>Y_t,SEL=>S_t,K=>M_t);
X_t<="1101"; --valori casuali per gli ingressi
Y_t<="0011";
--simulazione dello switch
PROCESS
BEGIN
  S_t<='1';
  WAIT FOR 10 ns;
  S_t<='0';
  WAIT FOR 10 ns;  
END PROCESS;
END Behavior;

