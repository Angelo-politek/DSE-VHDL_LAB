--test gated latch
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY tb_gated_sr IS
END tb_gated_sr;


ARCHITECTURE Behavior OF tb_gated_sr IS
  COMPONENT gated_sr_latch 
	PORT (Clk, R, S : IN STD_LOGIC;
			  Q : OUT STD_LOGIC); 
  END COMPONENT;
  
  SIGNAL Clk_t,R_t,S_t,Q_t: STD_LOGIC:='0';
BEGIN
g_latch: gated_sr_latch PORT MAP(Clk=>Clk_t,R=>R_t,S=>S_t,Q=>Q_t);
PROCESS -- simulazione set reset
BEGIN 
  S_t<='1'; 
  wait for 20 ns;
  S_t<='0'; 
  wait for 20 ns;
  R_t<='1'; 
  wait for 20 ns;
  R_t<='0'; 
  wait for 20 ns;

END PROCESS;

PROCESS -- simulazione clock
BEGIN
  CLK_t<='0';
  WAIT FOR 10 ns;
  CLK_t<='1'; 
  WAIT FOR 10 ns;
END PROCESS;     

END Behavior;








