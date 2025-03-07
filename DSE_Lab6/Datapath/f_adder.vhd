-- full adder con porte xor e multiplexer
LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY f_adder IS
  PORT (c_i, a, b : IN STD_LOGIC;
        sum,c_o : OUT STD_LOGIC);
END f_adder;

ARCHITECTURE Structure OF f_adder IS
COMPONENT mux_2_1_1bit 
  PORT (x,y,s : IN STD_LOGIC;
        m : OUT STD_LOGIC);  
END COMPONENT;
  

signal v1: STD_LOGIC;
BEGIN
mux: mux_2_1_1bit PORT MAP(x=>b,y=>c_i,s=>v1,m=>c_o); --map segnali test nel componente
v1<=(a xor b);
sum<=( c_i xor v1 );
END Structure;

