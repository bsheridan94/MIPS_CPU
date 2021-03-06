library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AndGate is 
  port(inA, inB:in  STD_LOGIC;
       output:out  STD_LOGIC);
    end AndGate;
    
    
architecture behavioral of AndGate is
  begin
    output <= inA and inB;
  end behavioral;
  