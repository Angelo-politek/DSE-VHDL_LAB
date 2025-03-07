LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY hello_fsm IS
PORT(Reset,Clock: in std_logic:='0';
HEX0,HEX1,HEX2,HEX3,HEX4,HEX5 : out std_logic_vector(6 downto 0):="1111111");
END hello_fsm;

ARCHITECTURE behaviour OF hello_fsm IS

COMPONENT queue_reg IS
PORT(Enable,Clock,Reset: std_logic;
D: std_logic_vector(6 downto 0);
Q0,Q1,Q2,Q3,Q4,Q5 : out std_logic_vector(6 downto 0):="1111111");
END COMPONENT;

TYPE top_state is (start,cycle);
SIGNAL cur_top, next_top: top_state:=start;
TYPE inner_state_type is (A,B,C,D,E,F);
signal cur_inner_state, next_inner_state : inner_state_type:=A;

signal enable_reg: std_logic:='1';
signal cont: integer:=0;
signal Dv,Hv0,hv1,Hv2,Hv3,Hv4,Hv5: std_logic_vector(6 downto 0):="1111111";

BEGIN

PROCESS(cur_top,cur_inner_state,enable_reg) -- inner states flow
BEGIN
IF(cur_top = start) then --condizione primo stato "start"
CASE cur_inner_state IS
        WHEN A =>
            next_inner_state <= B;
	    Dv <= "0001001"; --H
	    next_top <= start;
        WHEN B =>
            next_inner_state <= C;
	    Dv <= "0000110"; --E
	    next_top <= start;
        WHEN C =>
            next_inner_state <= D;
	    Dv <= "1000111";  --L
	    next_top <= start;
        WHEN D =>
            next_inner_state <= E;
	    Dv <= "1000111"; --L
	    next_top <= start;
        WHEN E =>
            next_inner_state <= F;
	    Dv <= "1000000";  --O
            next_top <= start;
	WHEN F => 
	    next_top <= cycle;
	    Dv <= "1111111"; -- " " (praticamente uno spazio vuoto)
    END CASE;
ELSIF(cur_top = cycle) then --condizione secondo stato "cycle"
Dv <= Hv5;
END IF;
END PROCESS;

PROCESS(Clock,Reset)
BEGIN
IF Reset = '0' then
	cur_inner_state <= A;
	cur_top <= start;
	cont <= 0;
ELSIF rising_edge(Clock) then
	IF(cont = 49999999) then
		cur_inner_state <= next_inner_state;
		cur_top <= next_top;
		enable_reg <= '1';
		cont <= 0;
	else cont <= cont +1;
		enable_reg <= '0';
	END IF;
END IF;
END PROCESS;


hec: queue_reg PORT MAP(enable_reg,Clock,Reset,Dv,Hv0,Hv1,Hv2,Hv3,Hv4,Hv5);

HEX0 <= Hv0;
HEX1 <= Hv1;
HEX2 <= Hv2;
HEX3 <= Hv3;
HEX4 <= Hv4;
HEX5 <= Hv5;

END behaviour;
