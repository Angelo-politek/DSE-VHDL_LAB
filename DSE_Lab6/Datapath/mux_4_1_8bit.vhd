-- multiplexer 4 a 1 a 8 bit 
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY mux_4_1_8bit IS
PORT (A0,A1,A2,A3 : IN SIGNED(7 DOWNTO 0);
      SEL: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      M : OUT SIGNED(7 DOWNTO 0)); 
END mux_4_1_8bit;


ARCHITECTURE Behavior OF mux_4_1_8bit IS
BEGIN
PROCESS(SEL,A0,A1,A2,A3)
BEGIN
CASE SEL IS
WHEN "00" => M<=A0;
WHEN "01" => M<=A1;
WHEN "10" => M<=A2;
WHEN "11" => M<=A3;
WHEN OTHERS => M<="00000000";
END CASE;
END PROCESS;
END Behavior;

