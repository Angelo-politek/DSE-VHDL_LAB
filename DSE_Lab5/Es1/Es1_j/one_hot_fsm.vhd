LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY one_hot_fsm IS
PORT(w,clock,reset: in std_logic;
z: out std_logic);
END one_hot_fsm;

ARCHITECTURE dataflow OF one_hot_fsm IS

COMPONENT D_flipflop
PORT(D, Clock, Reset : in std_logic;
Q : out std_logic);
END COMPONENT;

SIGNAL nW,A,B,C,D,E,F,G,H,I,NB,NC,ND,NE,NF,NG,NH,NI: std_logic;

BEGIN

nW <= not W;

ffA: D_flipflop PORT MAP('1',Clock,Reset,A);

NB<= ( (A and nW) or (F and nW) or (G and nW) or (H and nW) or (I and nW) );
ffB: D_flipflop PORT MAP(NB,Clock,Reset,B);

NC<= B and nW;
ffC: D_flipflop PORT MAP(NC,Clock,Reset,C);

ND<= C and nW;
ffD: D_flipflop PORT MAP(ND,Clock,Reset,D);

NE<= ( (D and nW) or (E and nW) );
ffE: D_flipflop PORT MAP(NE,Clock,Reset,E);

NF<= ( (A and W) or (B and W) or (C and W) or (D and W) or (E and W) );
ffF: D_flipflop PORT MAP(NF,Clock,Reset,F);

NG<= F and W;
ffG: D_flipflop PORT MAP(NG,CLock,Reset,G);

NH<= G and W;
ffH: D_flipflop PORT MAP(NH,Clock,Reset,H);

NI<= ( (H and W) or (I and W) );
ffI: D_flipflop PORT MAP(NI,Clock,Reset,I);

Z<= E or I;

END dataflow;
