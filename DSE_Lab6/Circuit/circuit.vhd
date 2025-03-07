LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY circuit IS
  PORT (DATA_IN : IN SIGNED(7 DOWNTO 0);
        START,Clock: IN STD_LOGIC);
END circuit;


ARCHITECTURE Behavior OF circuit IS
COMPONENT RAM IS
   PORT(CS,WR,RD,Clock: in std_logic:='0';
	Address : in STD_LOGIC_VECTOR(9 DOWNTO 0);
	Data_in: in SIGNED(7 downto 0);
	Data_out: out SIGNED(7 downto 0));
END COMPONENT;

COMPONENT datapath IS
  PORT (X : IN SIGNED(7 DOWNTO 0);
	SEL : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        Clock,Reset,Shift,SUB,Clear,Sum,Reg_out : IN STD_LOGIC;
        Y : OUT SIGNED(7 DOWNTO 0));
END COMPONENT;

COMPONENT n_bit_counter IS
GENERIC (N: integer); -- n bit
PORT(Enable: in STD_LOGIC;
     Clock: in STD_LOGIC;
     Clear: in STD_LOGIC;
     Cout : out STD_LOGIC_VECTOR(N-1 downto 0));
END COMPONENT;

COMPONENT ControlUnit IS
PORT( START,Clock: in std_logic;
Cout: in std_logic_vector(9 downto 0);
RESET,WR,RD,CLEAR,MEM,DONE,NXT,Reg_out,SHIFT,SUM,SUB: out std_logic;
SEL: out std_logic_vector(1 downto 0));
END COMPONENT;


SIGNAL X,Y: SIGNED(7 DOWNTO 0);
SIGNAL Cont: STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL Reset,Wr,Rd,Clear,Mem,DONE,Nxt,Reg_out,Shift,Sum,SUB: std_logic;
SIGNAL SEL: std_logic_vector(1 downto 0);
BEGIN
MEM_A: RAM PORT MAP(CS=>'1',WR=>Wr,RD=>Rd,Clock=>Clock,Address=>Cont,Data_in=>DATA_IN,Data_out=>X);
CNT: n_bit_counter GENERIC MAP(N=>10) PORT MAP(Enable=>Nxt,Clock=>Clock,Clear=>'0',Cout=>Cont);
DP: datapath PORT MAP(X=>X,SEL=>SEL,Clock=>Clock,Reset=>Reset,Shift=>Shift,SUB=>SUB,Clear=>CLear,Sum=>Sum,Reg_out=>Reg_out,Y=>Y);
CU: ControlUnit PORT MAP(START=>START,Clock=>Clock,RESET=>Reset,WR=>Wr,RD=>Rd,CLEAR=>Clear,MEM=>Mem,DONE=>DONE,NXT=>Nxt,Reg_out=>Reg_out,SHIFT=>Shift,SUM=>Sum,SUB=>SUB,SEL=>SEL,Cout=>Cont);
MEM_B: RAM PORT MAP(CS=>Mem,WR=>'1',RD=>'0',Clock=>Clock,Address=>Cont,Data_in=>Y,Data_out=>open);
END Behavior;
