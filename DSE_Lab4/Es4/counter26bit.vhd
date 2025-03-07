LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY counter26bit IS
PORT(Enable,Clock,Clear : in std_logic;
Q : out std_logic_vector(25 DOWNTO 0));
END counter26bit;

ARCHITECTURE structure OF counter26bit IS

COMPONENT Tflipflop
PORT( T,Clock,Clear :in std_logic;
Q: out std_logic);
END COMPONENT;

SIGNAL Tv,Qv: std_logic_vector(25 DOWNTO 0);

BEGIN
Tv(0) <= Enable;
gen:
for i in 0 to 24 generate
tff: Tflipflop PORT MAP (Tv(i),Clock,Clear,Qv(i));
Tv(i+1) <= Tv(i) AND Qv(i);
END generate;
tff25: Tflipflop PORT MAP(Tv(25),Clock,Clear,Qv(25));
Q <= Qv; 

END structure; 
