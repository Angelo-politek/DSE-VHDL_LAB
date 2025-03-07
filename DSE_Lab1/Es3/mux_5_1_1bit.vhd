-- mux 5 a 1 a 1 bit usando 4 mux 2 a 1 a 1 bit

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux_5_1_1bit IS
PORT 
(U,V,W,A,B: IN STD_LOGIC;
SEL: IN STD_LOGIC_VECTOR(2 downto 0);
J : OUT STD_LOGIC); 
END mux_5_1_1bit;


ARCHITECTURE Structure OF mux_5_1_1bit IS 
  COMPONENT mux_2_1_1bit --componente definito nel file mux_2_1_1bit.vhd
    PORT (x,y,s : IN STD_LOGIC;
          m : OUT STD_LOGIC); 
  END COMPONENT;
  --segnali per i vari componenti
  SIGNAL t0,t1,t2,t3: STD_LOGIC; --si poteva fare anche con un vettore

BEGIN
--collegamento dei vari componenti
mux0: mux_2_1_1bit PORT MAP(x=>U,y=>V,s=>SEL(0),m=>t0); 
mux1: mux_2_1_1bit PORT MAP(x=>W,y=>A,s=>SEL(0),m=>t1);
mux2: mux_2_1_1bit PORT MAP(x=>t0,y=>t1,s=>SEL(1),m=>t2);
mux3: mux_2_1_1bit PORT MAP(x=>t2,y=>B,s=>SEL(2),m=>J);
-- ho scoperto che è inutile definire tanti segnali come avevo fatto nel file mux_2_1_4bit.vhd
END Structure;
