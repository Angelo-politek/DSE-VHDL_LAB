--
LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY onehot_fsm IS
  PORT (W, Reset,Clock: IN STD_LOGIC;
        Z : OUT STD_LOGIC);
END onehot_fsm;



ARCHITECTURE Structure OF onehot_fsm IS
COMPONENT D_flipflop2 IS
  PORT (D, CLK: IN STD_LOGIC;
        Q : OUT STD_LOGIC);
END COMPONENT;



SIGNAL A,B,C,D,E,F,G,H,I: STD_LOGIC;
SIGNAL NA,NB,NC,ND,NE,NF,NG,NH,NI: STD_LOGIC;
SIGNAL nW,nReset: STD_LOGIC;

BEGIN
nReset<= not Reset;
nW<= not W;
ffA: D_flipflop2 PORT MAP(D=>nReset,CLK=>Clock,Q=>A);

NB<= (( (A and nW) or (F and nW) or (G and nW) or (H and nW) or (I and nW) ) and Reset) ;
ffB: D_flipflop2 PORT MAP(D=>NB,CLK=>Clock,Q=>B);

NC<= (B and nW and Reset);
ffC: D_flipflop2 PORT MAP(D=>NC,CLK=>Clock,Q=>C);

ND<= (C and nW and Reset);
ffD: D_flipflop2 PORT MAP(D=>ND,CLK=>Clock,Q=>D);

NE<= (( (D and nW) or (E and nW) ) and Reset);
ffE: D_flipflop2 PORT MAP(D=>NE,CLK=>Clock,Q=>E);

NG<= (F and W and Reset);
ffG: D_flipflop2 PORT MAP(D=>NG,CLK=>Clock,Q=>G);

NF<= (( (A and W) or (B and W) or (C and W) or (D and W) or (E and W) )and Reset);
ffF: D_flipflop2 PORT MAP(D=>NF,CLK=>Clock,Q=>F);

NH<= (G and W and Reset);
ffH: D_flipflop2 PORT MAP(D=>NH,CLK=>Clock,Q=>H);

NI<= (( (H and W) or (I and W) )and Reset);
ffI: D_flipflop2 PORT MAP(D=>NI,CLK=>Clock,Q=>I);

Z<= E or I;

END Structure;
