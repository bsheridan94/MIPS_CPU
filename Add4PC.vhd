
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity Add4PC is
  generic(n:natural:=32);
  port(PC:in std_logic_vector(n-1 downto 0);
   Output:out std_logic_vector(n-1 downto 0));
end Add4PC;
 
architecture Behavorial of Add4PC is
  begin
     
Output<=std_logic_vector( unsigned(PC) + 4 );
end Behavorial;