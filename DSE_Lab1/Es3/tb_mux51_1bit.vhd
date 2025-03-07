--test mux 5 a 1 a 1 bit
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY tb_mux51_1bit IS
END tb_mux51_1bit;


ARCHITECTURE Behavior OF tb_mux51_1bit IS
  COMPONENT mux_5_1_1bit --componente definito nel file mux_5_1_1bit.vhd
    PORT (U,V,W,A,B: IN STD_LOGIC;
          SEL: IN STD_LOGIC_VECTOR(2 downto 0);
          J : OUT STD_LOGIC); 
  END COMPONENT;
  
  SIGNAL U_t,V_t,W_t,A_t,B_t,J_t: STD_LOGIC; -- segnali test
  SIGNAL SEL_t: STD_LOGIC_VECTOR(2 downto 0);
BEGIN
mux: mux_5_1_1bit PORT MAP(U=>U_t,V=>V_t,W=>W_t,A=>A_t,B=>B_t,SEL=>SEL_t,J=>J_t); --map segnali test nel componente
U_t<='0'; --valori casuali per gli ingressi
V_t<='1';
W_t<='1';
A_t<='1';
B_t<='0';
PROCESS
BEGIN -- simulazione dello switch
  SEL_t<="000"; 
  WAIT FOR 10 ns; 
  SEL_t<="001";
  WAIT FOR 10 ns;
  SEL_t<="010";
  WAIT FOR 10 ns; 
  SEL_t<="011"; 
  WAIT FOR 10 ns; 
  SEL_t<="100";
  WAIT FOR 10 ns;
  SEL_t<="101";
  WAIT FOR 10 ns; 
  SEL_t<="110"; 
  WAIT FOR 10 ns; 
  SEL_t<="111";
  WAIT FOR 10 ns;
END PROCESS;
END Behavior;
