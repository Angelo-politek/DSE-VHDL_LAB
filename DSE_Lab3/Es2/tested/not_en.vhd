-- porta not abilitata da un segnale di controllo
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY not_en IS
  PORT (I : IN SIGNED(3 DOWNTO 0);
        En : IN STD_LOGIC;
        O : OUT SIGNED(3 DOWNTO 0));
END not_en;


ARCHITECTURE Behavior OF not_en IS
BEGIN
PROCESS (I,En)
BEGIN
IF (En = '0') THEN
O <= I;
ELSIF (En = '1') THEN
O <= not(I);
END IF;
END PROCESS;
END Behavior;
