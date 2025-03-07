--codice per assegnare in e out del mux ai corrispondenti switch e led

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux51_3bit_map IS
PORT (SW: IN STD_LOGIC_VECTOR(9 downto 0); --segnali assegnati alla scheda DE1
	    LEDR: OUT STD_LOGIC_VECTOR(9 downto 0));
END mux51_3bit_map;


ARCHITECTURE Structure OF mux51_3bit_map IS
  COMPONENT mux_5_1_3bit --componente definito in mux_5_1_3bit.vhd
    PORT (U3,V3,W3,A3,B3: IN STD_LOGIC_VECTOR(2 downto 0);
          SEL3: IN STD_LOGIC_VECTOR(2 downto 0);
          J3 : OUT STD_LOGIC_VECTOR(2 downto 0)); 
  END COMPONENT;

--assegnazione dei segnali alle porte del mux
BEGIN
mux: mux_5_1_3bit 
PORT MAP(U3=>"101",V3=>"010",W3=>"111",A3=>SW(2 downto 0),B3=>SW(5 downto 3),SEL3=>SW(8 downto 6),J3=>LEDR(2 downto 0));
--Come dice nella traccia U,V,W sono forzati a dei valori costanti
-- A e B sono assegnati agli switch da 5 a 0.
-- SEL agli switch da 8 a 6
--L'uscita è assegnata ai led da 2 a 0
END Structure;
