--testbench decoder 
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY tb_7seg_decoder IS
END tb_7seg_decoder;


ARCHITECTURE Behavior OF tb_7seg_decoder IS
  COMPONENT d7seg_decoder --componente definito in d7seg_decoder.vhd
    PORT (C: IN STD_LOGIC_VECTOR(2 downto 0);
          H: OUT STD_LOGIC_VECTOR(6 downto 0));
  END COMPONENT;
  --segnali test
  SIGNAL C_t: STD_LOGIC_VECTOR(2 downto 0);
  SIGNAL H_t: STD_LOGIC_VECTOR(6 downto 0);

BEGIN
--map segnali test nel componente
dec: d7seg_decoder PORT MAP(C=>C_t,H=>H_t);
--simulazione dello switch
PROCESS
BEGIN         -- dovrebbe esserci un modo per scrivere C_t<=C_t + "001" ma ancora non sono riuscito a farlo funzionare 
  C_t<="000";
  WAIT FOR 10 ns;
  C_t<="001";
  WAIT FOR 10 ns;
  C_t<="010";
  WAIT FOR 10 ns;
  C_t<="011";
  WAIT FOR 10 ns;
  C_t<="100";
  WAIT FOR 10 ns;
  C_t<="101";
  WAIT FOR 10 ns;
  C_t<="110";
  WAIT FOR 10 ns;
  C_t<="111";
  WAIT FOR 10 ns;  
END PROCESS;
END Behavior;
