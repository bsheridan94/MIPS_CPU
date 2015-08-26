
library ieee;
use IEEE.std_logic_1164.all;

entity ShiftLeft2MergeWithPC is 
  generic(n:natural:=32);
  port(Input:in std_logic_vector(n-1 downto 0);
	     PC: in std_logic_vector(n-1 downto 0);
	     Output:out std_logic_vector(n-1 downto 0));
end ShiftLeft2MergeWithPC;

architecture behavorial of ShiftLeft2MergeWithPC is
  signal tempIn: bit_vector(31 downto 0);
  signal tempOut: bit_vector(31 downto 0);
 
begin 
tempIn <= to_bitvector(Input);
tempOut <= tempIn sll 2;
Output <= to_stdlogicvector(tempOut);  



end behavorial;