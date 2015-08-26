library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity PC is
port(clk:in std_logic;
     Input:in std_logic_vector(31 downto 0);
     Output:out std_logic_vector(31 downto 0));
end PC;

architecture Behavioral of PC is
signal count:integer:=0;
begin

P1:process(clk, Input)
begin
if clk='1' and clk'event then
    if count=0 then
      Output<= (others=>'0');
      count<=1;
    else 
      Output<=Input;
    end if;
end if;

end process P1;
end Behavioral;


