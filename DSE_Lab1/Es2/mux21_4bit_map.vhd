--codice per assegnare in e out del mux ai corrispondenti switch e led

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux21_4bit_map IS
PORT(SW: IN STD_LOGIC_VECTOR(9 downto 0); --segnali assegnati alla scheda DE1
	  LEDR: OUT STD_LOGIC_VECTOR(9 downto 0)); 
END mux21_4bit_map;


ARCHITECTURE Structure OF mux21_4bit_map IS
  COMPONENT mux_2_1_4bit --componente definito in mux_2_1_4bit.vhd
    PORT (A,B: IN STD_LOGIC_VECTOR(3 downto 0);
          SEL: IN STD_LOGIC;
          K : OUT STD_LOGIC_VECTOR(3 downto 0)); 
  END COMPONENT;
 
--assegnazione dei segnali alle porte del mux
BEGIN
mux: mux_2_1_4bit 
PORT MAP(A=>SW(3 downto 0),B=>SW(7 downto 4),SEL=>SW(8),K=>LEDR(3 downto 0));
END Structure;
