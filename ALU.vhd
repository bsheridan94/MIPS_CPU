
library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.ALL;

entity ALU is
generic(n:natural:=32);
port(ReadData1,ReadData2:in std_logic_vector(n-1 downto 0);
	  ALUOp:in std_logic_vector(3 downto 0);
	  ALUResult:out std_logic_vector(n-1 downto 0);
	  Zero:out std_logic);
 end ALU;
 

 
architecture Behavorial of ALU is
  
begin
  
end Behavorial; 