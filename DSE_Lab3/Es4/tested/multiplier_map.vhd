LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY multiplier_map IS
  GENERIC ( N : integer:=4);
  PORT (SW : IN STD_LOGIC_VECTOR(9 downto 0);
        HEX0: OUT STD_LOGIC_VECTOR(0 to 6);
        HEX1: OUT STD_LOGIC_VECTOR(0 to 6);
        HEX2: OUT STD_LOGIC_VECTOR(0 to 6);
        HEX3: OUT STD_LOGIC_VECTOR(0 to 6));
END multiplier_map;

ARCHITECTURE Structure OF multiplier_map IS
COMPONENT multiplier 
  PORT (am_4bit, bm_4bit : IN STD_LOGIC_VECTOR(3 downto 0);
        prod_4bit : OUT STD_LOGIC_VECTOR(7 downto 0));  
END COMPONENT;
COMPONENT hex_decoder 
  PORT (C : IN SIGNED(3 DOWNTO 0);
        H : OUT STD_LOGIC_VECTOR(0 to 6)); 
END COMPONENT;

  

signal Adec,Bdec,Pdec0,Pdec1: SIGNED(3 downto 0);
signal Pdec: STD_LOGIC_VECTOR(7 downto 0);
BEGIN
Bdec<=SIGNED(SW(7 downto 4));
Adec<=SIGNED(SW(3 downto 0));
Pdec1<=SIGNED(Pdec(7 downto 4));
Pdec0<=SIGNED(Pdec(3 downto 0));
mul: multiplier PORT MAP(am_4bit=>SW(7 downto 4),bm_4bit=>SW(3 downto 0),prod_4bit=>Pdec);
dec0: hex_decoder PORT MAP(C=>Adec,H=>HEX0);
dec1: hex_decoder PORT MAP(C=>Bdec,H=>HEX1);
dec2: hex_decoder PORT MAP(C=>Pdec0,H=>HEX2);
dec3: hex_decoder PORT MAP(C=>Pdec1,H=>HEX3);
END Structure;












