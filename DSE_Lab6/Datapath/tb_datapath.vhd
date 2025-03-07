--test datapath
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY tb_datapath IS
END tb_datapath;


ARCHITECTURE Behavior OF tb_datapath IS
COMPONENT datapath IS
  PORT (X : IN SIGNED(7 DOWNTO 0);
	SEL : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        Clock,Reset,Shift,SUB,Clear,Sum,Reg_out : IN STD_LOGIC;
        Y : OUT SIGNED(7 DOWNTO 0));
END COMPONENT;
  
  SIGNAL X_t,Y_t: SIGNED(7 downto 0):="00000000"; -- segnali test
  SIGNAL SEL_t: STD_LOGIC_VECTOR(1 downto 0):="00";
  SIGNAL Clock_t,Reset_t,Shift_t,Clear_t,SUB_t,Sum_t,Reg_out_t: STD_LOGIC:='0';
BEGIN
dp: datapath PORT MAP(X=>X_t,
		      SEL=>SEL_t,
		      Clock=>Clock_t,
		      Reset=>Reset_t,
		      SUB=>SUB_t,
		      Shift=>Shift_t,
		      Clear=>Clear_t,
		      Sum=>Sum_t,
		      Reg_out=>Reg_out_t,
		      Y=>Y_t);

PROCESS 
BEGIN 
  Reset_t<='1';  
  Clear_t<='1';
  WAIT FOR 160 ns;   -- reset iniziale
  Reset_t<='0';
  Clear_t<='0'; 
  WAIT FOR 40 ns; 


  X_t<="00000100"; -- NUOVO DATO   4
  WAIT FOR 40 ns;

  Shift_t<='1';    -- shift nel registro per memorizzarlo
  WAIT FOR 40 ns; 
  Shift_t<='0';
  WAIT FOR 40 ns;

  SUB_t<='1';
  SEL_t<="00";   -- seleziona il primo ingresso del mux 
  WAIT FOR 40 ns;
  
  Sum_t<='1';
  WAIT FOR 80 ns;  -- somma
  Sum_t<='0';
  SUB_t<='0';
  WAIT FOR 80 ns;

  SEL_t<="01";   -- seleziona il secondo ingresso del mux
  SUB_t<='1';
  WAIT FOR 40 ns;

  Sum_t<='1';
  WAIT FOR 80 ns; -- somma
  Sum_t<='0';
  SUB_t<='0';
  WAIT FOR 80 ns;


  SEL_t<="10"; -- seleziona il terzo ingresso del mux
  WAIT FOR 40 ns;

  Sum_t<='1';
  WAIT FOR 80 ns; -- somma
  Sum_t<='0';
  WAIT FOR 80 ns;

  SEL_t<="11";  -- seleziona il quarto ingresso del mux
  WAIT FOR 40 ns;

  Sum_t<='1';
  WAIT FOR 80 ns;  -- somma
  Sum_t<='0';
  WAIT FOR 80 ns;

  Reg_out_t<='1';
  WAIT FOR 40 ns;  -- Campiona risultato nel registro Y 
  Reg_out_t<='0';
  WAIT FOR 40 ns;

  SEL_t<="00";    -- Riporta il mux al primo ingresso e resetta la somma
  Clear_t<='1';
  WAIT FOR 40 ns;
  Clear_t<='0';
  WAIT FOR 40 ns;











  X_t<="00000010"; -- NUOVO DATO 2
  WAIT FOR 40 ns;

  Shift_t<='1';    -- shift nel registro per memorizzarlo
  WAIT FOR 40 ns; 
  Shift_t<='0';
  WAIT FOR 40 ns;

  SUB_t<='1';
  SEL_t<="00";   -- seleziona il primo ingresso del mux 
  WAIT FOR 40 ns;
  
  Sum_t<='1';
  WAIT FOR 80 ns;  -- somma
  Sum_t<='0';
  SUB_t<='0';
  WAIT FOR 80 ns;

  SEL_t<="01";   -- seleziona il secondo ingresso del mux
  SUB_t<='1';
  WAIT FOR 40 ns;

  Sum_t<='1';
  WAIT FOR 80 ns; -- somma
  Sum_t<='0';
  SUB_t<='0';
  WAIT FOR 80 ns;


  SEL_t<="10"; -- seleziona il terzo ingresso del mux
  WAIT FOR 40 ns;

  Sum_t<='1';
  WAIT FOR 80 ns; -- somma
  Sum_t<='0';
  WAIT FOR 80 ns;

  SEL_t<="11";  -- seleziona il quarto ingresso del mux
  WAIT FOR 40 ns;

  Sum_t<='1';
  WAIT FOR 80 ns;  -- somma
  Sum_t<='0';
  WAIT FOR 80 ns;

  Reg_out_t<='1';
  WAIT FOR 40 ns;  -- Campiona risultato nel registro Y 
  Reg_out_t<='0';
  WAIT FOR 40 ns;

  SEL_t<="00";    -- Riporta il mux al primo ingresso e resetta la somma
  Clear_t<='1';
  WAIT FOR 40 ns;
  Clear_t<='0';
  WAIT FOR 40 ns;













  X_t<="00001000"; -- NUOVO DATO  8
  WAIT FOR 40 ns;

  Shift_t<='1';    -- shift nel registro per memorizzarlo
  WAIT FOR 40 ns; 
  Shift_t<='0';
  WAIT FOR 40 ns;

  SUB_t<='1';
  SEL_t<="00";   -- seleziona il primo ingresso del mux 
  WAIT FOR 40 ns;
  
  Sum_t<='1';
  WAIT FOR 80 ns;  -- somma
  Sum_t<='0';
  SUB_t<='0';
  WAIT FOR 80 ns;

  SEL_t<="01";   -- seleziona il secondo ingresso del mux
  SUB_t<='1';
  WAIT FOR 40 ns;

  Sum_t<='1';
  WAIT FOR 80 ns; -- somma
  Sum_t<='0';
  SUB_t<='0';
  WAIT FOR 80 ns;


  SEL_t<="10"; -- seleziona il terzo ingresso del mux
  WAIT FOR 40 ns;

  Sum_t<='1';
  WAIT FOR 80 ns; -- somma
  Sum_t<='0';
  WAIT FOR 80 ns;

  SEL_t<="11";  -- seleziona il quarto ingresso del mux
  WAIT FOR 40 ns;

  Sum_t<='1';
  WAIT FOR 80 ns;  -- somma
  Sum_t<='0';
  WAIT FOR 80 ns;

  Reg_out_t<='1';
  WAIT FOR 40 ns;  -- Campiona risultato nel registro Y 
  Reg_out_t<='0';
  WAIT FOR 40 ns;

  SEL_t<="00";    -- Riporta il mux al primo ingresso e resetta la somma
  Clear_t<='1';
  WAIT FOR 40 ns;
  Clear_t<='0';
  WAIT FOR 40 ns;
















  X_t<="00010000"; -- NUOVO DATO 16
  WAIT FOR 40 ns;


  Shift_t<='1';    -- shift nel registro per memorizzarlo
  WAIT FOR 40 ns; 
  Shift_t<='0';
  WAIT FOR 40 ns;

  SUB_t<='1';
  SEL_t<="00";   -- seleziona il primo ingresso del mux 
  WAIT FOR 40 ns;
  
  Sum_t<='1';
  WAIT FOR 80 ns;  -- somma
  Sum_t<='0';
  SUB_t<='0';
  WAIT FOR 80 ns;

  SEL_t<="01";   -- seleziona il secondo ingresso del mux
  SUB_t<='1';
  WAIT FOR 40 ns;

  Sum_t<='1';
  WAIT FOR 80 ns; -- somma
  Sum_t<='0';
  SUB_t<='0';
  WAIT FOR 80 ns;


  SEL_t<="10"; -- seleziona il terzo ingresso del mux
  WAIT FOR 40 ns;

  Sum_t<='1';
  WAIT FOR 80 ns; -- somma
  Sum_t<='0';
  WAIT FOR 80 ns;

  SEL_t<="11";  -- seleziona il quarto ingresso del mux
  WAIT FOR 40 ns;

  Sum_t<='1';
  WAIT FOR 80 ns;  -- somma
  Sum_t<='0';
  WAIT FOR 80 ns;

  Reg_out_t<='1';
  WAIT FOR 40 ns;  -- Campiona risultato nel registro Y 
  Reg_out_t<='0';
  WAIT FOR 40 ns;

  SEL_t<="00";    -- Riporta il mux al primo ingresso e resetta la somma
  Clear_t<='1';
  WAIT FOR 40 ns;
  Clear_t<='0';
  WAIT FOR 40 ns;
 

END PROCESS;

PROCESS -- simulazione clock
BEGIN
  Clock_t<='0';
  WAIT FOR 20 ns;
  Clock_t<='1'; 
  WAIT FOR 20 ns;
END PROCESS;     

END Behavior;







