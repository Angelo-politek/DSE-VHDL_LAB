LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY ControlUnit IS
PORT( START,Clock: in std_logic;
Cout: in std_logic_vector(9 downto 0);
RESET,WR,RD,CLEAR,MEM,DONE,NXT,Reg_out,SHIFT,SUM,SUB: out std_logic;
SEL: out std_logic_vector(1 downto 0));
END ControlUnit;


ARCHITECTURE dataflow OF ControlUnit IS

TYPE State_type IS (INIT, A, B, C, D, E, F, G, H, I,L,M,N,O,P,Q,R,S,T,U,V,RELOOP,FINISH);
SIGNAL Current_state, Next_state : State_type;
SIGNAL cont: integer;

BEGIN

PROCESS(Current_state,Clock)
BEGIN
cont<=0;
IF(START = '1') then
next_state<=INIT;
CASE Current_state IS
	WHEN INIT =>
		next_state <= A;
		RESET <= '0';
		CLEAR <= '0';
		DONE<='0';
		NXT <= '0';
		WR <= '0';
		RD <= '0';
		SHIFT <= '0';
		SUM <= '0';
		SEL <= "00";
		MEM <= '0';
		SUB<='0';
		Reg_out<='0';
	WHEN A => 
		next_state <= B;
		RESET<= '1';
		CLEAR <= '1';
	WHEN B =>
		next_state <= C;
		RESET <= '0';
		RD <= '0';
		WR <= '1';
	WHEN C =>
		IF(Cout = "1111111111") then
			next_state <= D;
		ELSE next_state <= C;
		END IF;
		NXT <= '1';
		CLEAR <= '0';
	WHEN D => 
		next_state <= E; 
		NXT <= '0';
		WR <= '0';
		RD <= '1';
	WHEN E =>
		next_state <= F;
		SHIFT <= '1';
	WHEN F =>
		next_state <= G;
		SHIFT <= '0';
		SEL <= "00";
	WHEN G =>
		SUB<='1';
		sum <= '1';           --qui dovrebbe loopare per 2 rising edge
		cont <= cont +1;
		IF(cont = 2) then
		next_state <= H;
		cont <= 0;
		ELSE next_state <= G;
		END IF;
	WHEN H => 
		SUB<='0';
		sum <= '0';
		cont <= cont +1;
		IF(cont = 2) then
		next_state <= I;
		cont <= 0;
		ELSE next_state <= H;	
		END IF;	
	WHEN I =>
		sel <= "01";
		next_state <= L;
	WHEN L =>
		SUB<='1';
		sum <= '1';
		cont <= cont +1;
		IF(cont = 2) then
		next_state <= M;
		cont <= 0;
		ELSE next_state <= L;
		END IF;
	WHEN M =>
		SUB<='0';
		sum <= '0';
		cont <= cont +1;
		IF(cont = 2) then
		next_state <= N;
		cont <= 0;
		ELSE next_state <= M;
		END IF;
	WHEN N => 
		sel <= "10";
		next_state <= O;
	WHEN O =>
		sum <= '1';
		cont <= cont +1;
		IF(cont = 2) then
		next_state <= P;
		cont <= 0;
		ELSE next_state <= O;
		END IF;
	WHEN P =>
		sum <= '0';
		cont <= cont +1;
		IF(cont = 2) then
		next_state <= Q;
		cont <= 0;
		ELSE next_state <= P;
		END IF;
	WHEN Q =>
		sel <= "11";
		next_state <= R;
	WHEN R =>
		sum <= '1';
		cont <= cont +1;
		IF(cont = 2) then
		next_state <= S;
		cont <= 0;
		ELSE next_state <= R;
		END IF;
	WHEN S =>
		sum <= '0';
		cont <= cont +1;
		IF(cont = 2) then
		next_state <= T;
		cont <= 0;
		ELSE next_state <= S;
		END IF;

	WHEN T =>
		reg_out <= '1';
		next_state <= U;
	WHEN U =>
		reg_out <= '0';
		MEM <= '1';
		next_state <= V;
	WHEN V =>
		MEM <= '0';
		IF(Cout = "1111111111") then
		next_state <= FINISH;
		ELSE 
		next_state <= RELOOP;
		END IF;
	WHEN FINISH =>
		DONE <= '1';
		IF (START='1') then
		next_state <= INIT;
		ELSE
		next_state <= FINISH;
		END IF;
	WHEN RELOOP =>
		NXT <= '1';
		CLEAR <= '1';
		next_state <= D;
END CASE;
END IF;


END PROCESS;

PROCESS(Clock)
BEGIN
IF(Rising_edge(Clock)) then
current_state <= next_state;
END IF;
END PROCESS;

END dataflow;
		
