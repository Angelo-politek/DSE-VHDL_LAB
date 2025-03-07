LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY digit_counter IS
PORT(Enable,Clock,Clear : in std_logic;
Q : out std_logic_vector(3 DOWNTO 0));
END digit_counter;

ARCHITECTURE structure OF digit_counter IS

COMPONENT Tflipflop
PORT( T,Clock,Clear :in std_logic;
Q: out std_logic);
END COMPONENT;

SIGNAL Tv,Qv: std_logic_vector(3 DOWNTO 0);

BEGIN
Tv(0) <= Enable;
gen:
for i in 0 to 2 generate
tff: Tflipflop PORT MAP (Tv(i),Clock,Clear,Qv(i));
Tv(i+1) <= Tv(i) AND Qv(i);
END generate;
tff3: Tflipflop PORT MAP(Tv(3),Clock,Clear,Qv(3));
Q <= Qv; 
END structure; 
