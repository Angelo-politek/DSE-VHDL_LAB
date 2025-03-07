Library IEEE;
USE IEEE.Std_logic_1164.all;

entity D_flipflop2 is 
   port(
      Q : out std_logic;    
      CLK :in std_logic;   
      D :in  std_logic    
   );
end D_flipflop2;
architecture Behavioral of D_flipflop2 is  
begin  
 process(Clk)
 begin 
    if(rising_edge(Clk)) then
    Q <= D; 
    end if;       
 end process;  
end Behavioral;
