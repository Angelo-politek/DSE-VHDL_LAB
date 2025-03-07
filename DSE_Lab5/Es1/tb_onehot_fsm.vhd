-- test onehot fsm
LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY tb_onehot_fsm IS
END tb_onehot_fsm;

ARCHITECTURE Structure OF tb_onehot_fsm IS
COMPONENT onehot_fsm IS
  PORT (W, Reset,Clock: IN STD_LOGIC;
        Z : OUT STD_LOGIC);
END COMPONENT;
  
SIGNAL W_t,Reset_t,Clock_t,Z_t: STD_LOGIC:='0';
BEGIN
fsm: onehot_fsm PORT MAP(W=>W_t,Reset=>Reset_t,Clock=>Clock_t,Z=>Z_t);

PROCESS
BEGIN
Reset_t<='0';
wait for 50 us;
Reset_t<='1';
wait for 50 us;
W_t<='0';
wait for 500 us;
W_t<='1';
wait for 500 us;
END PROCESS;

PROCESS
BEGIN
Clock_t<='0';
wait for 20 us;
Clock_t<='1';
wait for 20 us;
END PROCESS;
END Structure;
