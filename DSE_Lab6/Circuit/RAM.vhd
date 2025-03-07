LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY RAM IS
PORT(CS,WR,RD,Clock: in std_logic:='0';
Address : in STD_LOGIC_VECTOR(9 DOWNTO 0);
Data_in: in SIGNED(7 downto 0);
Data_out: out SIGNED(7 downto 0));
END RAM;

ARCHITECTURE behaviour of RAM IS

type matrix_type is array (0 to 1023) of SIGNED(7 downto 0);
signal Outputs: matrix_type := (others => (others => '0'));


BEGIN

PROCESS(Clock)
BEGIN
IF(rising_edge(Clock)) then
	IF (WR = '1' AND CS = '1') then
		Outputs(to_integer(SIGNED(Address))) <= Data_in;
	END IF;
END IF;
IF (RD = '1' AND CS = '1') then
		Data_out <= Outputs(to_integer(SIGNED(Address)));
END IF;
END PROCESS;
END behaviour;
