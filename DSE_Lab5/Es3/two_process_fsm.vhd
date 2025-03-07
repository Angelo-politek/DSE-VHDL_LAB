LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY two_process_fsm IS
PORT(W,Clock,Reset : std_logic;
Z: out std_logic);
END two_process_fsm;

ARCHITECTURE Behavior OF two_process_fsm IS

TYPE State_type IS (A, B, C, D, E, F, G, H, I);
SIGNAL y_Q, Y_D : State_type; -- y_Q is present state, y_D is next state

BEGIN

PROCESS (w, y_Q) -- state table
BEGIN

CASE y_Q IS

WHEN A => IF (w = '0') THEN Y_D <= B;
ELSE Y_D <= F;
END IF;
WHEN B => IF (w = '0') THEN Y_D <= C;
ELSE Y_D <= F;
END IF;
WHEN C => IF (w = '0') THEN Y_D <= D;
ELSE Y_D <= F;
END IF;
WHEN D => IF (w = '0') THEN Y_D <= E;
ELSE Y_D <= F;
END IF;
WHEN E => IF (w = '0') THEN Y_D <= E;
ELSE Y_D <= F;
END IF;

WHEN F => IF (w = '1') THEN Y_D <= G;
ELSE Y_D <= B;
END IF;
WHEN G => IF (w = '1') THEN Y_D <= H;
ELSE Y_D <= B;
END IF;
WHEN H => IF (w = '1') THEN Y_D <= I;
ELSE Y_D <= B;
END IF;
WHEN I => IF (w = '1') THEN Y_D <= I;
ELSE Y_D <= B;
END IF;

END CASE;
END PROCESS; -- state table

PROCESS (Clock) -- state flip-flops
BEGIN
IF Reset = '0' then
	Y_Q <= A;
ELSIF (rising_edge(Clock)) then
	y_Q <= y_D;
END IF;
END PROCESS;

Z <= '1' when (y_Q = E) or (y_Q = I) else
	'0';
END Behavior;
