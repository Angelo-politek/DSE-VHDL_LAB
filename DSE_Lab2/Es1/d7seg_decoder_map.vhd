--codice per assegnare in e out del decoder ai corrispondenti switch e display

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY d7seg_decoder_map IS
PORT (SW: IN STD_LOGIC_VECTOR(9 downto 0); --segnali assegnati alla scheda DE1
	    HEX0: OUT STD_LOGIC_VECTOR(6 downto 0));
END d7seg_decoder_map;


ARCHITECTURE Structure OF d7seg_decoder_map IS
  COMPONENT d7seg_decoder --componente definito in d7seg_decoder_map.vhd
    PORT (C: IN STD_LOGIC_VECTOR(2 downto 0);
          H: OUT STD_LOGIC_VECTOR(6 downto 0)); 
  END COMPONENT;
  --assegnazione dei segnali alle porte del dec
BEGIN
dec: d7seg_decoder PORT MAP(C=>SW(2 downto 0),H=>HEX0);   
END Structure;
