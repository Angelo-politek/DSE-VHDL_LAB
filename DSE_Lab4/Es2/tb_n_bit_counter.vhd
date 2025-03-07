--test contatore
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY tb_n_bit_counter IS
  GENERIC (N: integer:=16);
END tb_n_bit_counter;


ARCHITECTURE Behavior OF tb_n_bit_counter IS
  COMPONENT n_bit_counter 
  GENERIC (N: integer:=16);
  PORT(Enable: in STD_LOGIC;
       Clock: in STD_LOGIC;
       Clear: in STD_LOGIC;
       Cout : out STD_LOGIC_VECTOR(N-1 downto 0));
  END COMPONENT;
  
  SIGNAL En_t,Clk_t,CLR_t: STD_LOGIC:='0';
  SIGNAL out_t: STD_LOGIC_VECTOR(N-1 downto 0);
BEGIN
counter: n_bit_counter PORT MAP(Enable=>En_t,Clock=>Clk_t,Clear=>CLR_t,Cout=>out_t);

PROCESS -- simulazione enable e clear
BEGIN
  CLR_t<='1'; 
  En_t<='1'; 
  wait for 200 ns;
  En_t<='0'; 
  wait for 200 ns;
  En_t<='1';
  wait for 500 ns;
  CLR_t<='0'; 
  En_t<='0'; 
  wait for 100 ns;

END PROCESS;

PROCESS -- simulazione clock
BEGIN
  CLK_t<='0';
  WAIT FOR 10 ns;
  CLK_t<='1'; 
  WAIT FOR 10 ns;
END PROCESS;     

END Behavior;











