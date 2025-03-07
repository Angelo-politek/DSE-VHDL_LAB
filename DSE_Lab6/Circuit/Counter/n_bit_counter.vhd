-- Codice contatore sincrono a n bit
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY n_bit_counter IS
GENERIC (N: integer); -- n bit
PORT(Enable: in STD_LOGIC;
     Clock: in STD_LOGIC;
     Clear: in STD_LOGIC;
     Cout : out STD_LOGIC_VECTOR(N-1 downto 0));
END n_bit_counter;

ARCHITECTURE structure OF n_bit_counter IS

COMPONENT T_flipflop
PORT (T, Clock, Reset : IN STD_LOGIC;
      Q : OUT STD_LOGIC);
END COMPONENT;


SIGNAL C,r : std_logic_vector(N-1 DOWNTO 0);


BEGIN
Cout<=C;
r(0)<=Enable;
ff0: T_flipflop PORT MAP(T=>r(0),Clock=>Clock,Reset=>Clear,Q=>C(0));

gen:
For i in 1 to N-1 generate
r(i)<=(r(i-1) and C(i-1));
ffi: T_flipflop PORT MAP(T=>r(i),Clock=>Clock,Reset=>Clear,Q=>C(i));
end generate;

END structure;
