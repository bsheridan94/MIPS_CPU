library ieee;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity Control is
port(Opcode:in std_logic_vector(5 downto 0);
     RegDst,Branch,MemRead,MemtoReg,MemWrite,ALUSrc,RegWrite,Jump:out std_logic;
     ALUOp:out std_logic_vector(1 downto 0));
end Control;

architecture behavorial of Control is
  
begin
  process(Opcode)
    begin
      
  case Opcode is
      -- R Type
    when "000000" =>  
        RegDst <= '1';
        Jump <= '0';
        Branch <= '0';
        MemRead <= '0';
        MemtoReg <= '0';
        ALUOp(1) <= '1';
        ALUOP(0) <= '0';
        MemWrite <= '0';
        ALUSrc <= '0';
        RegWrite <= '1';
		
      -- LW
    when "100011" => 
        RegDst <= '0';
        Jump <= '0';
        Branch <= '0';
        MemRead <= '1';
        MemtoReg <= '1';
        ALUOp(1) <= '0';
        ALUOP(0) <= '0';
        MemWrite <= '0';
        ALUSrc <= '1';
        RegWrite <= '1';

      -- SW
    when "101011"  => 
        RegDst <= 'X';
        Jump <= '0';		
        Branch <= '0';
        MemRead <= '0';
        MemtoReg <= 'X';
        ALUOp(1) <= '0';
        ALUOP(0) <= '0';
        MemWrite <= '1';
        ALUSrc <= '1';
        RegWrite <= '0';

    -- BEQ Command
    when "000100"  => 
        RegDst <= 'X';
		    Jump <= '0';
        Branch <= '1';
        MemRead <= '0';
        MemtoReg <= 'X';
        ALUOp(1) <= '0';
        ALUOP(0) <= '1';        
		    MemWrite <= '0';
        ALUSrc <= '0';
        RegWrite <= '0';

        -- JUMP
    when "000010" =>  
        RegDst <= 'X';
		    Jump <= '1'; 
        Branch <= '0';
        MemRead <= '0';
        MemtoReg <= 'X';
		    ALUOp(1) <= 'U';
        ALUOP(0) <= 'U';
        MemWrite <= '0';
        ALUSrc <= 'X';
        RegWrite <= '0';
        
  when others => 
        RegDst <= 'U';
		    Jump <= 'U'; 
        Branch <= 'U';
        MemRead <= 'U';
        MemtoReg <= 'U';
		    ALUOp(1) <= 'U';
        ALUOP(0) <= 'U';
        MemWrite <= 'U';
        ALUSrc <= 'U';
        RegWrite <= 'U';
         
      end case;
    end process;
  end behavorial;