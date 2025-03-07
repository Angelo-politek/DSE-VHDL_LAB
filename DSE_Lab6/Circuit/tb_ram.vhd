LIbRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY tb_ram IS
END tb_ram;

ARCHITECTURE behaviour OF tb_ram IS

COMPONENT RAM IS
PORT(CS,WR,RD,Clock: in std_logic:='0';
Address : in SIGNED(9 downto 0);
Data_in: in SIGNED(7 downto 0);
Data_out: out SIGNED(7 downto 0));
END COMPONENT;

SIGNAL CStb,WRtb,RDtb,Clk: std_logic:='0';
SIGNAL Add: SIGNED(9 downto 0);
SIGNAL Dtb,Qtb: SIGNED(7 downto 0):="00000000";

BEGIN
sim: RAM PORT MAP (CStb,WRtb,RDtb,Clk,Add,Dtb,Qtb);

PROCESS
BEGIN
CStb <= '1';
WRtb <= '1';
RDtb <= '0';
Dtb <= "11111111";
Add <= "0000000000"; -- to be modified with 10 bits, i only used 3 bits for debugging purposes.
WAIT FOR 2 ns;

Dtb <= "11110000";
Add <= "0000000001";
WAIT FOR 2 ns;

Dtb <= "00001111";
Add <= "0000000010";
WAIT FOR 2 ns;

WRtb <= '0';
RDtb <= '1';
Add <= "0000000000";
WAIT FOR 2 ns;

Add <= "0000000001";
WAIT FOR 2 ns;

Add <= "0000000010";
WAIT FOR 2 ns;

END PROCESS;

PROCESS
BEGIN
Clk <= '0';
WAIT FOR 1 ns;
Clk <= '1';
WAIT FOR 1 ns;
END PROCESS;
END behaviour;
