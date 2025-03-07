LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY queue_reg IS
PORT(Enable,Clock,Reset: std_logic;
D: std_logic_vector(6 downto 0);
Q0,Q1,Q2,Q3,Q4,Q5 : out std_logic_vector(6 downto 0));
END queue_reg;

ARCHITECTURE dataflow OF queue_reg IS

COMPONENT register7bit IS
PORT(Enable,Clock,Reset: in std_logic;
D: in std_logic_vector(6 downto 0);
Q: out std_logic_vector(6 downto 0));
END COMPONENT;

SIGNAL D0,D1,D2,D3,D4,D5,D6: std_logic_vector(6 downto 0):="0000000";

BEGIN
D0 <= D;
reg0: register7bit PORT MAP(Enable,Clock,Reset,D0,D1);
reg1: register7bit PORT MAP(Enable,Clock,Reset,D1,D2);
reg2: register7bit PORT MAP(Enable,Clock,Reset,D2,D3);
reg3: register7bit PORT MAP(Enable,Clock,Reset,D3,D4);
reg4: register7bit PORT MAP(Enable,Clock,Reset,D4,D5);
reg5: register7bit PORT MAP(ENable,Clock,Reset,D5,D6);
Q0 <= D1;
Q1 <= D2;
Q2 <= D3;
Q3 <= D4;
Q4 <= D5;
Q5 <= D6;
END dataflow;