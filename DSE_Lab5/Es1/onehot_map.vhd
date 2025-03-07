-- interfaccia con la scheda 
LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY onehot_map IS
  PORT (SW : IN STD_LOGIC_VECTOR(9 downto 0);
        KEY : IN STD_LOGIC_VECTOR(1 downto 0);
		  LEDR: OUT STD_LOGIC_VECTOR(9 downto 0));
END onehot_map;

ARCHITECTURE Structure OF onehot_map IS
COMPONENT onehot_fsm IS
  PORT (W, Reset,Clock: IN STD_LOGIC;
        Z : OUT STD_LOGIC);
END COMPONENT;
  

BEGIN
LEDR(9 downto 1)<="000000000";
fsm: onehot_fsm PORT MAP(W=>SW(1),Reset=>SW(0),Clock=>KEY(0),Z=>LEDR(0));
END Structure;
