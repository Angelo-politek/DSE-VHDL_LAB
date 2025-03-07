--test reaction timer
-- per eseguire il testbench ho cambiato i valori del contatore a 16 bit da 50000 e 49999 a 10000 e 9999
-- altrimenti modelsim raggiungeva il numero massimo di iterazioni possibili (probabilmente i latch vanno in metastabiltà)
-- quindi dai diagrammi di modelsim non si può vedere se effettivamente conta 1 millisecondo
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY tb_reaction_timer IS
END tb_reaction_timer;


ARCHITECTURE Behavior OF tb_reaction_timer IS
COMPONENT reactiontimer 
	PORT (RST: IN STD_LOGIC;    
         STOP: IN STD_LOGIC;   
         CLK: IN STD_LOGIC;    
         TIME: IN STD_LOGIC_VECTOR(7 downto 0);  
         C0,C1,C2,C3: OUT STD_LOGIC_VECTOR(3 downto 0); 
         LED: OUT STD_LOGIC); 
END COMPONENT reactiontimer;
  
  SIGNAL STOP_t,CLK_t,LED_t: STD_LOGIC:='0';
  SIGNAL RST_t: STD_LOGIC:='0';
  SIGNAL TIME_t: STD_LOGIC_VECTOR(7 downto 0):="00000000";
  SIGNAL c0_t,c1_t,c2_t,c3_t: STD_LOGIC_VECTOR(3 downto 0);
BEGIN
timer: reactiontimer PORT MAP(RST=>RST_t,STOP=>STOP_t,CLK=>CLK_t,TIME=>TIME_t,C0=>c0_t,C1=>c1_t,C2=>c2_t,C3=>c3_t,LED=>LED_t);
TIME_t<="00000001"; -- 1ms

PROCESS
BEGIN
  RST_t<='1';  
  wait for 50 us;
  RST_t<='0';
  wait for 50 us;
  STOP_t<='1';
  wait for 50 us;
  STOP_t<='0';  
  wait for 50 us;
  RST_t<='1';  
  wait for 50 us;
  RST_t<='0'; 
  wait for 10 ms;
  STOP_t<='1';
  wait for 50 us;
  STOP_t<='0';  
  wait for 50 us;

END PROCESS;

PROCESS -- simulazione clock
BEGIN
  CLK_t<='0';
  WAIT FOR 20 ns;
  CLK_t<='1'; 
  WAIT FOR 20 ns;
END PROCESS;     

END Behavior;













