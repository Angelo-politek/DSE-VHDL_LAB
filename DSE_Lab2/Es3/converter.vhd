LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

ENTITY converter IS
PORT (v : IN UNSIGNED(3 DOWNTO 0);
      m : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      z : OUT STD_LOGIC);
END converter;


ARCHITECTURE Structure OF converter IS
  COMPONENT mux_2_1_1bit --componente definito nel file mux_2_1_1bit.vhd
    PORT (x,y,s : IN STD_LOGIC;
          m : OUT STD_LOGIC); 
  END COMPONENT;
  COMPONENT comparator --componente definito nel file comparator.vhd
    PORT (A: IN UNSIGNED(3 DOWNTO 0);
          Q: OUT STD_LOGIC); 
  END COMPONENT;
  COMPONENT circ_a --componente definito nel file circ_a.vhd
    PORT (B: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
          Y: OUT STD_LOGIC_VECTOR(2 DOWNTO 0)); 
  END COMPONENT;
  --segnali per i vari componenti
  SIGNAL Q1: STD_LOGIC;
  SIGNAL Y1: STD_LOGIC_VECTOR(2 DOWNTO 0); 
  SIGNAL V1: STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN
--collegamento dei vari componenti
mux3: mux_2_1_1bit PORT MAP(x=>v(3),y=>'0',s=>Q1,m=>m(3));
mux2: mux_2_1_1bit PORT MAP(x=>v(2),y=>Y1(2),s=>Q1,m=>m(2));
mux1: mux_2_1_1bit PORT MAP(x=>v(1),y=>Y1(1),s=>Q1,m=>m(1));
mux0: mux_2_1_1bit PORT MAP(x=>v(0),y=>Y1(0),s=>Q1,m=>m(0));
comp: comparator PORT MAP(A=>v,Q=>Q1);
a: circ_a PORT MAP(B=>V1(2 downto 0),Y=>Y1); 
z<=Q1;
V1<=STD_LOGIC_VECTOR(v); -- per convertire unsigned in stdlogicvector
END Structure;





