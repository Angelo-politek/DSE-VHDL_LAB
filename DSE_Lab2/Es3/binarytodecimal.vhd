LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

ENTITY binarytodecimal IS
PORT (SW : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      HEX0,HEX1 : OUT STD_LOGIC_VECTOR(0 TO 6));
END binarytodecimal;


ARCHITECTURE Structure OF binarytodecimal IS
  COMPONENT converter --componente definito nel file converter.vhd
    PORT (v : IN UNSIGNED(3 DOWNTO 0);
          m : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
          z : OUT STD_LOGIC); 
  END COMPONENT;
  COMPONENT decoder --componente definito nel file decoder.vhd
    PORT (C : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
          Display : OUT STD_LOGIC_VECTOR(0 to 6)); 
  END COMPONENT;
  COMPONENT circ_b --componente definito nel file circ_b.vhd
    PORT (D : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
          En : IN STD_LOGIC;
          H : OUT STD_LOGIC_VECTOR(0 to 6)); 
  END COMPONENT;
  --segnali per i vari componenti
  SIGNAL Z1: STD_LOGIC;
  SIGNAL M1: STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN
--collegamento dei vari componenti
conv: converter PORT MAP(v=>UNSIGNED(SW),m=>M1,z=>Z1);
b: circ_b PORT MAP(D=>SW,En=>Z1,H=>HEX1);
dec: decoder PORT MAP(C=>M1,Display=>HEX0);
END Structure;







