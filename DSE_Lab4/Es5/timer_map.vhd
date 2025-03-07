-- interfaccia per visualizzare i numeri in esadecimale sui display 
LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY timermap IS
  GENERIC ( N : integer:=16);
  PORT (SW : IN STD_LOGIC_VECTOR(9 downto 0);
        KEY : IN STD_LOGIC_VECTOR(1 downto 0);
		  CLOCK_50 : IN STD_LOGIC;
		  LEDR: OUT STD_LOGIC_VECTOR(9 downto 0);
        HEX0,HEX1,HEX2,HEX3: OUT STD_LOGIC_VECTOR(0 to 6));
END timermap;

ARCHITECTURE Structure OF timermap IS
COMPONENT reactiontimer 
	PORT (RST: IN STD_LOGIC;    
         STOP: IN STD_LOGIC;   
         CLK: IN STD_LOGIC;    
         TIME: IN STD_LOGIC_VECTOR(7 downto 0);  
         C0,C1,C2,C3: OUT STD_LOGIC_VECTOR(3 downto 0); 
         LED: OUT STD_LOGIC); 
END COMPONENT reactiontimer;	

COMPONENT hex_decoder IS
	PORT (C: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
         H: OUT STD_LOGIC_VECTOR(0 to 6));
END COMPONENT hex_decoder;

  

signal t0,t1: STD_LOGIC;
signal Digit0,Digit1,Digit2,Digit3: STD_LOGIC_VECTOR(3 downto 0);
BEGIN
t0<=not(KEY(0));
t1<=not(KEY(1));
LEDR(9 downto 1)<="000000000";
timer: reactiontimer PORT MAP(RST=>t0,
										 STOP=>t1,
										 CLK=>CLOCK_50,
										 TIME=>SW(7 downto 0),
										 C0=>Digit0,
										 C1=>Digit1,
										 C2=>Digit2,
										 C3=>Digit3,
										 LED=>LEDR(0));
dec3: hex_decoder PORT MAP(C=>Digit3,H=>HEX3);
dec2: hex_decoder PORT MAP(C=>Digit2,H=>HEX2);
dec1: hex_decoder PORT MAP(C=>Digit1,H=>HEX1);
dec0: hex_decoder PORT MAP(C=>Digit0,H=>HEX0);
END Structure;
