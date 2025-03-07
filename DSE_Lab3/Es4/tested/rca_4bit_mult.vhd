LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY rca_4bit_mult IS
  PORT (a_4bit, b_4bit : IN STD_LOGIC_VECTOR(3 downto 0);
        c_in : IN STD_LOGIC;
        c_out : OUT STD_LOGIC;
        sum_4bit : OUT STD_LOGIC_VECTOR(3 downto 0));
END rca_4bit_mult;

ARCHITECTURE Structure OF rca_4bit_mult IS
COMPONENT f_adder --componente definito nel file f_adder.vhd
  PORT (c_i, a, b : IN STD_LOGIC;
        sum,c_o : OUT STD_LOGIC);  
END COMPONENT;
  

signal c1,c2,c3: STD_LOGIC;
BEGIN
fa0: f_adder PORT MAP(c_i=>c_in,a=>a_4bit(0),b=>b_4bit(0),sum=>sum_4bit(0),c_o=>c1); --map segnali test nel componente
fa1: f_adder PORT MAP(c_i=>c1,a=>a_4bit(1),b=>b_4bit(1),sum=>sum_4bit(1),c_o=>c2); 
fa2: f_adder PORT MAP(c_i=>c2,a=>a_4bit(2),b=>b_4bit(2),sum=>sum_4bit(2),c_o=>c3); 
fa3: f_adder PORT MAP(c_i=>c3,a=>a_4bit(3),b=>b_4bit(3),sum=>sum_4bit(3),c_o=>c_out); 
END Structure;






