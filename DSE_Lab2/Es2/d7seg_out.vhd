-- File 7segments_out.vhd
-- Main file per Es2 
LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY d7seg_out IS
PORT (SW : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      HEX0,HEX1,HEX2,HEX3,HEX4 : OUT STD_LOGIC_VECTOR(0 to 6));
END d7seg_out;


ARCHITECTURE Structure OF d7seg_out IS
component mux_5_1_15bit IS     -- componente definito in mux_5_1_15bit.vhd
PORT (sel: IN STD_LOGIC_VECTOR(1 downto 0);
      output : OUT STD_LOGIC_VECTOR(14 downto 0));
end component;

component shifter IS         -- componente definito in shifter.vhd
PORT (input : IN STD_LOGIC_VECTOR(14 downto 0);
      sel: IN STD_LOGIC_VECTOR(2 downto 0);
      output : OUT STD_LOGIC_VECTOR(14 downto 0));
end component;

component decoder7           -- componente definito in decoder7.vhd
PORT (C : IN STD_LOGIC_VECTOR(2 downto 0);
      Display : OUT STD_LOGIC_VECTOR(6 downto 0));
end component;

SIGNAL a1,a2 : std_logic_vector (14 downto 0);   -- segnali di appoggio per collegare i componenti
BEGIN -- connessioni tra i vari componenti
MUX0: mux_5_1_15bit PORT MAP (SW(1 DOWNTO 0),a1);
SHIFT0: shifter PORT MAP (a1, SW(4 downto 2),a2);
H0: decoder7 PORT MAP (a2(2 downto 0), HEX0);
H1: decoder7 PORT MAP (a2(5 downto 3), HEX1);
H2: decoder7 PORT MAP (a2(8 downto 6), HEX2);
H3: decoder7 PORT MAP (a2(11 downto 9), HEX3);
H4: decoder7 PORT MAP (a2(14 downto 12), HEX4);
-- qui viene presa l'uscita dello shifter e mandata a gruppi di 3 bit ai vari decoder
END Structure;
