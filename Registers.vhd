LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;


entity Registers is
port (
  RegWrite:in STD_LOGIC;
  ReadReg1, ReadReg2, WriteReg:in STD_LOGIC_VECTOR (4 downto 0);
  ReadData1, ReadData2: out STD_LOGIC_VECTOR (31 downto 0);
  WriteData: in STD_LOGIC_VECTOR (31 downto 0));
end registers;

architecture behavioral of registers is

begin
end behavioral;

