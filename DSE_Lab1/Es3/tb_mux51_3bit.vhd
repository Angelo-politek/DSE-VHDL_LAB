--test mux 5 a 1 a 3 bit
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY tb_mux51_3bit IS
END tb_mux51_3bit;


ARCHITECTURE Behavior OF tb_mux51_3bit IS
  COMPONENT mux_5_1_3bit --componente definito nel file mux_5_1_3bit.vhd
    PORT (U3,V3,W3,A3,B3: IN STD_LOGIC_VECTOR(2 downto 0);
          SEL3: IN STD_LOGIC_VECTOR(2 downto 0);
          J3 : OUT STD_LOGIC_VECTOR(2 downto 0));  
  END COMPONENT;
  
  SIGNAL U3_t,V3_t,W3_t,A3_t,B3_t,J3_t: STD_LOGIC_VECTOR(2 downto 0); -- segnali test
  SIGNAL SEL3_t: STD_LOGIC_VECTOR(2 downto 0);
BEGIN
mux: mux_5_1_3bit PORT MAP(U3=>U3_t,V3=>V3_t,W3=>W3_t,A3=>A3_t,B3=>B3_t,SEL3=>SEL3_t,J3=>J3_t); --map segnali test nel componente
U3_t<="101"; --valori casuali per gli ingressi
V3_t<="011";
W3_t<="111";
A3_t<="100";
B3_t<="110";
PROCESS
BEGIN -- simulazione dello switch
  SEL3_t<="000"; 
  WAIT FOR 10 ns; 
  SEL3_t<="001";
  WAIT FOR 10 ns;
  SEL3_t<="010";
  WAIT FOR 10 ns; 
  SEL3_t<="011"; 
  WAIT FOR 10 ns; 
  SEL3_t<="100";
  WAIT FOR 10 ns;
  SEL3_t<="101";
  WAIT FOR 10 ns; 
  SEL3_t<="110"; 
  WAIT FOR 10 ns; 
  SEL3_t<="111";
  WAIT FOR 10 ns;
END PROCESS;
END Behavior;

