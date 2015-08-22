LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
use IEEE.std_logic_signed.all;

entity ALUControl is
	port(	ALUOp : in std_logic_vector(1 downto 0);
			ALUfunct : in std_logic_vector(5 downto 0);
			ALUControl : out std_logic_vector(3 downto 0));
	end ALUControl;

architecture behavorial of ALUControl is
  
begin
  
  
  
  
end behavorial;