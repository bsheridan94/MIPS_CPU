library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;

entity InstructionMemory is
  generic(n:natural:=32);
port(Address:in std_logic_vector(n-1 downto 0);
	ReadData:out std_logic_vector(n-1 downto 0));
end InstructionMemory;

architecture Behavorial of InstructionMemory is
  type memory is array(0 to 1024) of std_logic_vector(31 downto 0);
signal memoryArray:memory;

begin
P1:process(Address)
variable index:integer;
variable initialize:integer:=1;
begin

if(initialize=1) then
-- lw $s0, 0($t0)
--memoryArray(0)<="10001101000100000000000000000000";  
-- lw $s1, 4($t0)
--memoryArray(1)<="10001101000100010000000000000100";  
-- beq $s0, $s1, L
--memoryArray(2)<="00010010000100010000000000000010";
-- add $s3, $s4, $s5
--memoryArray(3)<="00000010100101011001100000100000";
-- j exit
--memoryArray(4)<="00001000000000000000000000000110"; 
-- L: sub $s3, $s4, $s5
--memoryArray(5)<="00000010100101011001100000100010";
-- exit: sw $s3, 8($t0)
--memoryArray(6)<="10101101000100110000000000001000";

memoryArray(0)<="00100000000100000000000000001010";  
memoryArray(1)<="00100000000100010000000000010100";  
memoryArray(2)<="00100000000100110000000000000000";
memoryArray(3)<="00000000000000001010000000100000";
memoryArray(4)<="00000000000000001010100000100000"; 
memoryArray(5)<="00000010000100010100000000101010";
memoryArray(6)<="00010001000000000000000000001011";
memoryArray(7)<="00000000000100110100100010000000";  
memoryArray(8)<="00000001001101000101000000100000";  
memoryArray(9)<="10001101010010100000000000000000";
memoryArray(10)<="00000001010100000101000000100000";
memoryArray(11)<="00000001010100010101000000100000"; 
memoryArray(12)<="00000001001101010101100000100000";
memoryArray(13)<="10101101011010100000000000000000";
memoryArray(14)<="00100010000100001111111111111111";  
memoryArray(15)<="00100010001100011111111111111101";  
memoryArray(16)<="00100010011100110000000000000001";
memoryArray(17)<="00001000000000000000000000000101";


initialize:=0;
end if;

index := (conv_integer(unsigned(Address))/4);
ReadData<=memoryArray(index);

end process P1;

end Behavorial;