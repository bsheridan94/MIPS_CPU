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
  
process(ALUop, ALUfunct)
begin
  
  -- SEE PAGE 318 In Book
case ALUOp is
  --LW SW
	when "00" => ALUControl <= "0010";
	-- BEQ
	when "01" => ALUControl <= "0110";
	-- Rtype
	when "10" =>
	    case ALUfunct is
	      -- R type Add
	      when "100000" => ALUControl <= "0010";
		    -- R type Subtract
		    when "100010" => ALUControl <= "0110";
		    -- R type AND
		    when "100100" => ALUControl <= "0000";
		    -- R Type OR
		    when "100101" => ALUControl <= "0001";
		    -- R type Set on less than
		    when "101010" => ALUControl <= "0111";  
	      when others => ALUControl <= "UUUU"; 
	      end case;
	when others => ALUControl <= "UUUU";
end case;

end process;
end behavorial;