library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux is 
  generic(n: natural :=1);
  port(sel: in  STD_LOGIC;
       inA:in STD_LOGIC_VECTOR (4 downto 0);
       inB:in  STD_LOGIC_VECTOR (4 downto 0);
       output:out  STD_LOGIC_VECTOR (4 downto 0));
    end Mux;
    
    
architecture behavioral of Mux is
  begin
    output <= inA when (sel='0') else inB;
  end behavioral;
  
  
    
