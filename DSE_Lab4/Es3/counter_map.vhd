-- interfaccia per visualizzare i numeri in esadecimale sui display 
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY counter_map IS
  GENERIC ( N : integer:=16);
  PORT (SW : IN STD_LOGIC_VECTOR(9 downto 0);
        KEY : IN STD_LOGIC_VECTOR(1 downto 0);
        HEX0,HEX1,HEX2,HEX3: OUT STD_LOGIC_VECTOR(0 to 6));
END counter_map;

ARCHITECTURE Structure OF counter_map IS
COMPONENT n_bit_counter_easy 
  GENERIC (N: integer:=16); -- n bit
	PORT(Enable: in STD_LOGIC;
		  Clock: in STD_LOGIC;
		  Clear: in STD_LOGIC;
		  Cout : buffer UNSIGNED(N-1 downto 0));  
END COMPONENT;
COMPONENT hex_decoder 
  PORT (C : IN UNSIGNED(3 DOWNTO 0);
        H : OUT STD_LOGIC_VECTOR(0 to 6)); 
END COMPONENT;

  

signal out_tmp: UNSIGNED(N-1 downto 0);
BEGIN
counter: n_bit_counter_easy PORT MAP(Enable=>SW(1),Clock=>KEY(0),Clear=>SW(0),Cout=>out_tmp);
dec3: hex_decoder PORT MAP(C=>out_tmp(15 downto 12),H=>HEX3);
dec2: hex_decoder PORT MAP(C=>out_tmp(11 downto 8),H=>HEX2);
dec1: hex_decoder PORT MAP(C=>out_tmp(7 downto 4),H=>HEX1);
dec0: hex_decoder PORT MAP(C=>out_tmp(3 downto 0),H=>HEX0);
END Structure;
