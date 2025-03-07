LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY reactiontimer IS
  PORT (RST: IN STD_LOGIC;    -- ingresso di reset dei contatori e di avvio del sistema
        STOP: IN STD_LOGIC;   -- ingresso per spegnere il led e fermare i contatori
        CLK: IN STD_LOGIC;    -- ingresso per segnale di clock
        TIME: IN STD_LOGIC_VECTOR(7 downto 0);   -- ingresso per settare il tempo che deve trascorrere da quando viene premuto reset a quando il led si accende
        C0,C1,C2,C3: OUT STD_LOGIC_VECTOR(3 downto 0);  -- uscite per le varie cifre del tempo trascorso (C3C2C1C0 es: 0124 ms)
        LED: OUT STD_LOGIC);  -- uscita per il led
END reactiontimer;


ARCHITECTURE Structure OF reactiontimer IS
  COMPONENT n_bit_counter IS
  GENERIC (N: integer); -- n bit
  PORT(Enable: in STD_LOGIC;
       Clock: in STD_LOGIC;
       Clear: in STD_LOGIC;
       Cout : out STD_LOGIC_VECTOR(N-1 downto 0));
  END COMPONENT n_bit_counter;
  
  COMPONENT gated_sr_latch IS
  PORT (Clk, S, R : IN STD_LOGIC;
        Q : OUT STD_LOGIC);
  END COMPONENT gated_sr_latch;
  
  COMPONENT and_nbit 
  GENERIC (N: integer);
  PORT (A, B : IN STD_LOGIC_VECTOR(N-1 downto 0);
        Y : OUT STD_LOGIC);  
  END COMPONENT;
  
  
  
  
  SIGNAL s0,s1,s2,s5,s6,s7,s8,s9,s10,s12,s13,s15,s16,s18,s19,s10n,s13n,s16n,s19n,s21,s22,s23: STD_LOGIC;
  SIGNAL s3: STD_LOGIC_VECTOR(15 downto 0);
  SIGNAL s4: STD_LOGIC_VECTOR(7 downto 0);
  SIGNAL s11,s14,s17,s20: STD_LOGIC_VECTOR(3 downto 0);

  BEGIN 
  latch0: gated_sr_latch PORT MAP(S=>RST,R=>STOP,Q=>s1,Clk=>CLK);
  count16: n_bit_counter GENERIC MAP(N=>16)
                         PORT MAP(Enable=>s1,Clear=>s2,Clock=>CLK,Cout=>s3);
  and16_0: and_nbit GENERIC MAP(N=>16)
                  PORT MAP(A=>s3,B=>"1100001101010000",Y=>s6);
  s2<=not(s6 or STOP);
  and16_1: and_nbit GENERIC MAP(N=>16)
                  PORT MAP(A=>s3,B=>"1100001101001111",Y=>s5);
  count8: n_bit_counter GENERIC MAP(N=>8)
                         PORT MAP(Enable=>s5,Clear=>s0,Clock=>CLK,Cout=>s4);
  s0<=not RST;
  and8: and_nbit GENERIC MAP(N=>8)
                  PORT MAP(A=>s4,B=>TIME,Y=>s7);
  latch1: gated_sr_latch PORT MAP(S=>s7,R=>STOP,Q=>s8,Clk=>CLK);
  LED<=s8;
  s9<=s5 and s8;
  
  
  count4_0: n_bit_counter GENERIC MAP(N=>4)
                          PORT MAP(Enable=>s9,Clear=>s10n,Clock=>CLK,Cout=>s11);
  s10n<=not (s10 or RST);
  and4_00: and_nbit GENERIC MAP(N=>4)
                    PORT MAP(A=>s11,B=>"1010",Y=>s10);
  and4_01: and_nbit GENERIC MAP(N=>4)
                    PORT MAP(A=>s11,B=>"1001",Y=>s12);
  count4_1: n_bit_counter GENERIC MAP(N=>4)
                          PORT MAP(Enable=>s21,Clear=>s13n,Clock=>CLK,Cout=>s14);
  s21<=s12 and s9;
  s13n<=not (s13 or RST);
  and4_10: and_nbit GENERIC MAP(N=>4)
                    PORT MAP(A=>s14,B=>"1010",Y=>s13);
  and4_11: and_nbit GENERIC MAP(N=>4)
                    PORT MAP(A=>s14,B=>"1001",Y=>s15);
  count4_2: n_bit_counter GENERIC MAP(N=>4)
                          PORT MAP(Enable=>s22,Clear=>s16n,Clock=>CLK,Cout=>s17);
  s22<=s15 and s9;
  s16n<=not (s16 or RST);
  and4_20: and_nbit GENERIC MAP(N=>4)
                    PORT MAP(A=>s17,B=>"1010",Y=>s16);
  and4_21: and_nbit GENERIC MAP(N=>4)
                    PORT MAP(A=>s17,B=>"1001",Y=>s18);
  count4_3: n_bit_counter GENERIC MAP(N=>4)
                          PORT MAP(Enable=>s23,Clear=>s19n,Clock=>CLK,Cout=>s20);
  s23<=s18 and s9;
  s19n<=not (s19 or RST);
  and4_30: and_nbit GENERIC MAP(N=>4)
                    PORT MAP(A=>s20,B=>"1010",Y=>s19);
  C0<=s11;
  C1<=s14;
  C2<=s17;
  C3<=s20;
END Structure;








