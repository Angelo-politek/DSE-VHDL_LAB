LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY bcd_converter IS
PORT (SW : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
      HEX0,HEX1 : OUT STD_LOGIC_VECTOR(0 TO 6));
END bcd_converter;


ARCHITECTURE Structure OF bcd_converter IS
  COMPONENT decoder_bcd --componente definito nel file decoder.vhd
    PORT (C : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
          Display : OUT STD_LOGIC_VECTOR(0 to 6)); 
  END COMPONENT;


BEGIN
--collegamento dei vari componenti
dec1: decoder_bcd PORT MAP(C=>SW(5 downto 3),Display=>HEX1);
dec0: decoder_bcd PORT MAP(C=>SW(2 downto 0),Display=>HEX0);
END Structure;
