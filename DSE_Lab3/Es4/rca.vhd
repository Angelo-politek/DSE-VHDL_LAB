LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY rca IS
PORT(Av,Bv: IN std_logic_vector(3 DOWNTO 0);
     C : IN std_logic;
     Sv: OUT std_logic_vector(3 DOWNTO 0);
     Co : OUT std_logic);
END rca;

ARCHITECTURE structure OF rca IS
COMPONENT full_adder
PORT(A,B,Cin: IN STD_LOGIC;
     S,Cout: OUT STD_LOGIC);
END COMPONENT;
SIGNAL Co1,Co2,Co3: std_logic;

BEGIN
F1: full_adder PORT MAP(Av(0),Bv(0),C,Sv(0),Co1);
F2: full_adder PORT MAP(Av(1),Bv(1),Co1,Sv(1),Co2);
F3: full_adder PORT MAP(Av(2),Bv(2),Co2,Sv(2),Co3);
F4: full_adder PORT MAP(Av(3),Bv(3),Co3,Sv(3),Co);
END structure;