-- mux 2 a 1 a 4 bit usando 4 mux 2 a 1 a 1 bit

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux_2_1_4bit IS
PORT 
(A,B: IN STD_LOGIC_VECTOR(3 downto 0);
SEL: IN STD_LOGIC;
K : OUT STD_LOGIC_VECTOR(3 downto 0)); 
END mux_2_1_4bit;


ARCHITECTURE Structure OF mux_2_1_4bit IS 
  COMPONENT mux_2_1_1bit --componente definito nel file mux_2_1_1bit.vhd
    PORT (x,y,s : IN STD_LOGIC;
          m : OUT STD_LOGIC); 
  END COMPONENT;
  --segnali per i vari componenti
  SIGNAL x0,x1,x2,x3,y0,y1,y2,y3,m0,m1,m2,m3,set: STD_LOGIC; --si poteva fare anche con dei vettori

BEGIN
--collegamento dei vari componenti
mux0: mux_2_1_1bit PORT MAP(x=>x0,y=>y0,s=>set,m=>m0); 
mux1: mux_2_1_1bit PORT MAP(x=>x1,y=>y1,s=>set,m=>m1);
mux2: mux_2_1_1bit PORT MAP(x=>x2,y=>y2,s=>set,m=>m2);
mux3: mux_2_1_1bit PORT MAP(x=>x3,y=>y3,s=>set,m=>m3);
set<=SEL;
x0<=A(0);
x1<=A(1);
x2<=A(2);
x3<=A(3);
y0<=B(0);
y1<=B(1);
y2<=B(2);
y3<=B(3);
K(0)<=m0;
K(1)<=m1;
K(2)<=m2;
K(3)<=m3;
END Structure;
