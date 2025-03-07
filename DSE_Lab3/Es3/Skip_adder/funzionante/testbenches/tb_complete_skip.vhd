LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY tb_complete_skip IS
END tb_complete_skip;

ARCHITECTURE behaviour OF complete_test IS

COMPONENT complete_skip
  GENERIC ( N : integer:=16);
  PORT (A, B : IN SIGNED(N-1 downto 0);
        CR_in : IN STD_LOGIC;
        Clock : IN STD_LOGIC;
        RSTn : IN STD_LOGIC;
        OVF : OUT STD_LOGIC;
        S : OUT SIGNED(N-1 downto 0));
END COMPONENT;

SIGNAL atb,btb,stb: SIGNED(15 DOWNTO 0):="0000000000000000";
SIGNAL ctb,cktb,rstb,ovftb: std_logic:='0';

BEGIN
sim: complete_skip PORT MAP(atb,btb,ctb,cktb,rstb,ovftb,stb);
PROCESS
BEGIN
atb<="0100110100101011";
btb<="0011100101011100";


  rstb<='1';
  WAIT FOR 100 ns;
  ctb<='0'; 
  WAIT FOR 100 ns; 
  ctb<='1'; 

  WAIT FOR 100 ns; 
  rstb<='0';
  WAIT FOR 50 ns;
END PROCESS;

PROCESS -- simulazione clock
BEGIN
  cktb<='0';
  WAIT FOR 10 ns;
  cktb<='1'; 
  WAIT FOR 10 ns;
END PROCESS;     

END Behaviour;
