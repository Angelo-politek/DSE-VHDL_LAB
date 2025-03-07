LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY reg_shift8 IS
  GENERIC ( N : integer:=8);
  PORT (X_in : IN SIGNED(N-1 DOWNTO 0);
        Clock, Reset,Shift : IN STD_LOGIC;
        X,X1,X2,X3 : OUT SIGNED(N-1 DOWNTO 0));
END reg_shift8;


ARCHITECTURE Structure OF reg_shift8 IS
COMPONENT reg IS
  GENERIC ( N : integer:=8);
  PORT (R : IN SIGNED(N-1 DOWNTO 0);
        Clock, Reset,Enable : IN STD_LOGIC;
        Q : OUT SIGNED(N-1 DOWNTO 0));
END COMPONENT;
SIGNAL s,s1,s2: SIGNED(7 DOWNTO 0);
BEGIN
reg_X: reg PORT MAP(R=>X_in,Clock=>Clock,Reset=>Reset,Enable=>Shift,Q=>s);
X<=s;
reg_X1: reg PORT MAP(R=>s,Clock=>Clock,Reset=>Reset,Enable=>Shift,Q=>s1);
X1<=s1;
reg_X2: reg PORT MAP(R=>s1,Clock=>Clock,Reset=>Reset,Enable=>Shift,Q=>s2);
X2<=s2;
reg_X3: reg PORT MAP(R=>s2,Clock=>Clock,Reset=>Reset,Enable=>Shift,Q=>X3);
END Structure;
