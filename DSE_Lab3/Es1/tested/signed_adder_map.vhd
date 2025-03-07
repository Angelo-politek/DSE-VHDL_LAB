-- interfaccia per visualizzare i numeri in esadecimale sui display 
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY signed_adder_map IS
  GENERIC ( N : integer:=4);
  PORT (SW : IN STD_LOGIC_VECTOR(9 downto 0);
        KEY : IN STD_LOGIC_VECTOR(1 downto 0);
        LEDR : OUT STD_LOGIC_VECTOR(9 downto 0);
        HEX0,HEX1,HEX2: OUT STD_LOGIC_VECTOR(0 to 6));
END signed_adder_map;

ARCHITECTURE Structure OF signed_adder_map IS
COMPONENT signed_adder_4bit 
  PORT (A4, B4 : IN SIGNED(3 downto 0);
        CR_in : IN STD_LOGIC;
        Clock : IN STD_LOGIC;
        RSTn : IN STD_LOGIC;
        OVF : OUT STD_LOGIC;
        SUM4 : OUT SIGNED(3 downto 0));  
END COMPONENT;
COMPONENT hex_decoder 
  PORT (C : IN SIGNED(3 DOWNTO 0);
        H : OUT STD_LOGIC_VECTOR(0 to 6)); 
END COMPONENT;

  

signal r1,r2: STD_LOGIC;
signal Adec,Bdec,Sdec: SIGNED(3 downto 0);
BEGIN
LEDR(8 downto 0)<="000000000";
Bdec<=SIGNED(SW(7 downto 4));
Adec<=SIGNED(SW(3 downto 0));
add: signed_adder_4bit PORT MAP(A4=>Adec, B4=>Bdec,CR_in=>'0',Clock=>KEY(1),RSTn=>KEY(0),OVF=>LEDR(9),SUM4=>Sdec);
dec2: hex_decoder PORT MAP(C=>Adec,H=>HEX2);
dec1: hex_decoder PORT MAP(C=>Bdec,H=>HEX1);
dec0: hex_decoder PORT MAP(C=>Sdec,H=>HEX0);
END Structure;
