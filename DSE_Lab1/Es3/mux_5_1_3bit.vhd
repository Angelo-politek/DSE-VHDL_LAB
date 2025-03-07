-- mux 5 a 1 a 3 bit usando 3 mux 5 a 1 a 1 bit

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux_5_1_3bit IS
PORT 
(U3,V3,W3,A3,B3: IN STD_LOGIC_VECTOR(2 downto 0);
SEL3: IN STD_LOGIC_VECTOR(2 downto 0);
J3 : OUT STD_LOGIC_VECTOR(2 downto 0)); 
END mux_5_1_3bit;


ARCHITECTURE Structure OF mux_5_1_3bit IS 
  COMPONENT mux_5_1_1bit --componente definito nel file mux_5_1_1bit.vhd
    PORT (U,V,W,A,B: IN STD_LOGIC;
          SEL: IN STD_LOGIC_VECTOR(2 downto 0);
          J : OUT STD_LOGIC);
  END COMPONENT;
  --segnali per i vari componenti
  SIGNAL t0,t1,t2,t3: STD_LOGIC; --si poteva fare anche con un vettore

BEGIN
--collegamento dei vari componenti
mux0: mux_5_1_1bit PORT MAP(U=>U3(0),V=>V3(0),W=>W3(0),A=>A3(0),B=>B3(0),J=>J3(0),SEL=>SEL3); 
mux1: mux_5_1_1bit PORT MAP(U=>U3(1),V=>V3(1),W=>W3(1),A=>A3(1),B=>B3(1),J=>J3(1),SEL=>SEL3);
mux2: mux_5_1_1bit PORT MAP(U=>U3(2),V=>V3(2),W=>W3(2),A=>A3(2),B=>B3(2),J=>J3(2),SEL=>SEL3);
END Structure;
