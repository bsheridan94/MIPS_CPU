

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity Add is
  generic(n:natural:=32);
  port(InputA:in std_logic_vector(n-1 downto 0);
   InputB:in std_logic_vector(n-1 downto 0);
   Output:out std_logic_vector(n-1 downto 0));
end Add;
 
architecture Behavorial of Add is
  begin
     
Output<=std_logic_vector( unsigned(InputA) + unsigned(InputB) );
end Behavorial;