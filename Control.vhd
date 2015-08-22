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
      
      -- R Type
      if Opcode = "000000" then
        RegDst <= '1';
        Branch <= '0';
        MemRead <= '0';
        MemtoReg <= '0';
        MemWrite <= '0';
        ALUSrc <= '0';
        RegWrite <= '1';
        Jump <= '0';
        ALUOp(1) <= '1';
        ALUOP(0) <= '0';
       
      -- LW
      elsif Opcode = "100011" then
        RegDst <= '0';
        Branch <= '0';
        MemRead <= '1';
        MemtoReg <= '1';
        MemWrite <= '0';
        ALUSrc <= '1';
        RegWrite <= '1';
        Jump <= '0';
        ALUOp(1) <= '0';
        ALUOP(0) <= '0';

      -- SW
      elsif Opcode = "101011" then
        RegDst <= 'X';
        Branch <= '0';
        MemRead <= '0';
        MemtoReg <= 'X';
        MemWrite <= '1';
        ALUSrc <= '1';
        RegWrite <= '0';
        Jump <= '0';
        ALUOp(1) <= '0';
        ALUOP(0) <= '0';

    -- BEQ Command optional
      elsif Opcode = "000100" then
        RegDst <= 'X';
        Branch <= '1';
        MemRead <= '0';
        MemtoReg <= 'X';
        MemWrite <= '0';
        ALUSrc <= '0';
        RegWrite <= '0';
        Jump <= '0';
        ALUOp(1) <= '0';
        ALUOP(0) <= '1';
        
        -- JUMP
      elsif Opcode = "000010" then
        RegDst <= 'X';
        Branch <= '0';
        MemRead <= '0';
        MemtoReg <= 'X';
        MemWrite <= '0';
        ALUSrc <= 'X';
        RegWrite <= '0';
        Jump <= '1'; 
        ALUOp(1) <= 'U';
        ALUOP(0) <= 'U';
         
      end if;
    end process;
  end behavorial;