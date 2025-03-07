LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY datapath IS
  PORT (X : IN SIGNED(7 DOWNTO 0);
	SEL : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        Clock,Reset,Shift,SUB,Clear,Sum,Reg_out : IN STD_LOGIC;
        Y : OUT SIGNED(7 DOWNTO 0));
END datapath;


ARCHITECTURE Behavior OF datapath IS
COMPONENT reg_shift8 IS
  GENERIC ( N : integer:=8);
  PORT (X_in : IN SIGNED(N-1 DOWNTO 0);
        Clock, Reset,Shift : IN STD_LOGIC;
        X,X1,X2,X3 : OUT SIGNED(N-1 DOWNTO 0));
END COMPONENT;

COMPONENT reg IS
  GENERIC ( N : integer:=8);
  PORT (R : IN SIGNED(N-1 DOWNTO 0);
        Clock, Reset,Enable : IN STD_LOGIC;
        Q : OUT SIGNED(N-1 DOWNTO 0));
END COMPONENT;

COMPONENT shift_dx IS
  GENERIC ( N : integer:=8);
  PORT (R : IN SIGNED(N-1 DOWNTO 0);
	Clock : IN STD_LOGIC;
	Sub_flag : OUT STD_LOGIC;
        Q : OUT SIGNED(N-1 DOWNTO 0));
END COMPONENT;

COMPONENT shift2_dx IS
  GENERIC ( N : integer:=8);
  PORT (R : IN SIGNED(N-1 DOWNTO 0);
	Clock : IN STD_LOGIC;
        Q : OUT SIGNED(N-1 DOWNTO 0));
END COMPONENT;

COMPONENT shift2_sx IS
  GENERIC ( N : integer:=8);
  PORT (R : IN SIGNED(N-1 DOWNTO 0);
	Clock : IN STD_LOGIC;
        Q : OUT SIGNED(N-1 DOWNTO 0));
END COMPONENT;

COMPONENT shift_sx IS
  GENERIC ( N : integer:=8);
  PORT (R : IN SIGNED(N-1 DOWNTO 0);
	Sub_flag : OUT STD_LOGIC;
	Clock : IN STD_LOGIC;
        Q : OUT SIGNED(N-1 DOWNTO 0));
END COMPONENT;

COMPONENT mux_4_1_8bit IS
PORT (A0,A1,A2,A3 : IN SIGNED(7 DOWNTO 0);
      SEL: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      M : OUT SIGNED(7 DOWNTO 0)); 
END COMPONENT;

COMPONENT signed_adder_8bit IS
  GENERIC ( N : integer:=8);
  PORT (A, B : IN SIGNED(N-1 downto 0);
        SUB : IN STD_LOGIC;
        Clock,Enable : IN STD_LOGIC;
        RST : IN STD_LOGIC;
        OVF : OUT STD_LOGIC;
        SUM : OUT SIGNED(N-1 downto 0));
END COMPONENT;

COMPONENT mux_2_1_1bit IS
PORT (x,y,s : IN STD_LOGIC;
      m : OUT STD_LOGIC); 
END COMPONENT;

SIGNAL X_t,X1_t,X2_t,X3_t,S,S1,S2,S3,ADD,SM: SIGNED(7 DOWNTO 0);
SIGNAL SUB_CONTROL, flag,flag1,flag2: STD_LOGIC;

BEGIN
shift_reg: reg_shift8 PORT MAP(X_in=>X,Clock=>Clock,Reset=>Reset,Shift=>Shift,X=>X_t,X1=>X1_t,X2=>X2_t,X3=>X3_t);
shifter_dx: shift_dx PORT MAP(R=>X_t,Q=>S,Sub_flag=>flag1,Clock=>Clock);
shifter_sx: shift_sx PORT MAP(R=>X1_t,Q=>S1,Sub_flag=>flag2,Clock=>Clock);
shifter_2sx: shift2_sx PORT MAP(R=>X2_t,Q=>S2,Clock=>Clock);
shifter_2dx: shift2_dx PORT MAP(R=>X3_t,Q=>S3,Clock=>Clock);
mux8bit: mux_4_1_8bit PORT MAP(A0=>S,A1=>S1,A2=>S2,A3=>S3,SEL=>SEL,M=>ADD);
mux1bit: mux_2_1_1bit PORT MAP(x=>flag1,Y=>flag2,s=>SEL(0),m=>flag);
SUB_CONTROL<=(SUB and flag);
adder: signed_adder_8bit PORT MAP(A=>ADD,B=>SM,SUB=>SUB_CONTROL,Clock=>Clock,RST=>Clear,OVF=>open,SUM=>SM,Enable=>Sum);
reg_Y: reg PORT MAP(R=>SM,Clock=>Clock,Reset=>Reset,Enable=>Reg_out,Q=>Y);
END Behavior;
