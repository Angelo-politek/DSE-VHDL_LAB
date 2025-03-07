--testbench es2
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY tb_d7seg_out IS
END tb_d7seg_out;


ARCHITECTURE Behavior OF tb_d7seg_out IS
  COMPONENT d7seg_out --componente definito in d7seg_out.vhd
    PORT (SW : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
          HEX0,HEX1,HEX2,HEX3,HEX4 : OUT STD_LOGIC_VECTOR(6 downto 0));
  END COMPONENT;
  --segnali test
  SIGNAL SW_t: STD_LOGIC_VECTOR(4 downto 0);
  SIGNAL H0_t,H1_t,H2_t,H3_t,H4_t: STD_LOGIC_VECTOR(6 downto 0);
  SIGNAL sw_word: STD_LOGIC_VECTOR(1 downto 0);
  SIGNAL sw_shift: STD_LOGIC_VECTOR(2 downto 0);

BEGIN
--map segnali test nel componente
dec: d7seg_out PORT MAP(SW=>SW_t,HEX0=>H0_t,HEX1=>H1_t,HEX2=>H2_t,HEX3=>H3_t,HEX4=>H4_t);
SW_t<=(sw_shift&sw_word);
--simulazione dello switch
PROCESS
BEGIN
  sw_word<="00";
  WAIT FOR 10 ms;
    sw_shift<="000";
    WAIT FOR 10 ms;
    sw_shift<="001";
    WAIT FOR 10 ms;
    sw_shift<="010";
    WAIT FOR 10 ms;
    sw_shift<="011";
    WAIT FOR 10 ms;
    sw_shift<="100";
    WAIT FOR 10 ms;
    sw_shift<="110";
    WAIT FOR 10 ms;
  sw_word<="01";
  WAIT FOR 10 ms;
    sw_shift<="000";
    WAIT FOR 10 ms;
    sw_shift<="001";
    WAIT FOR 10 ms;
    sw_shift<="010";
    WAIT FOR 10 ms;
    sw_shift<="011";
    WAIT FOR 10 ms;
    sw_shift<="100";
    WAIT FOR 10 ms;
    sw_shift<="110";
    WAIT FOR 10 ms;
  sw_word<="10";
  WAIT FOR 10 ms;
    sw_shift<="000";
    WAIT FOR 10 ms;
    sw_shift<="001";
    WAIT FOR 10 ms;
    sw_shift<="010";
    WAIT FOR 10 ms;
    sw_shift<="011";
    WAIT FOR 10 ms;
    sw_shift<="100";
    WAIT FOR 10 ms;
    sw_shift<="110";
    WAIT FOR 10 ms;
  sw_word<="11";
  WAIT FOR 10 ms;
    sw_shift<="000";
    WAIT FOR 10 ms;
    sw_shift<="001";
    WAIT FOR 10 ms;
    sw_shift<="010";
    WAIT FOR 10 ms;
    sw_shift<="011";
    WAIT FOR 10 ms;
    sw_shift<="100";
    WAIT FOR 10 ms;
    sw_shift<="110";
    WAIT FOR 10 ms; 
END PROCESS;
END Behavior;


