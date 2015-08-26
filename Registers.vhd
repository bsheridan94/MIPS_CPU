LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;


entity Registers is
port (clk:in std_logic;
  RegWrite:in STD_LOGIC;
  ReadReg1, ReadReg2, WriteReg:in STD_LOGIC_VECTOR (5 downto 0);
  ReadData1, ReadData2: out STD_LOGIC_VECTOR (31 downto 0);
  WriteData: in STD_LOGIC_VECTOR (31 downto 0));
end registers;

architecture behavioral of registers is
type registerBank is array(0 to 31) of STD_LOGIC_VECTOR (31 downto 0);
signal regBank: registerBank := (
    X"00000000", -- initialize register bank
    X"00000000", -- register 1
    X"00000000",
    X"00000000",
    X"00000000",
    X"00000000",
    X"00000000",
    X"00000000",
    X"00000000",
    X"00000000", 
    X"00000000", -- mem 10 
    X"00000000", 
    X"00000000",
    X"00000000",
    X"00000000",
    X"00000000",
    X"00000000",
    X"00000000",
    X"00000000",
    X"00000000",  
    X"00000000", -- mem 20
    X"00000000",
    X"00000000",
    X"00000000",
    X"00000000", 
    X"00000000",
    X"00000000",
    X"00000000",
    X"00000000",
    X"00000000", 
    X"00000000", -- mem 30
    X"00000000");
    
    
constant zero:integer:=0;
constant at:integer:=1;

constant v0:integer:=2;
constant v1:integer:=3;
constant a0:integer:=4;
constant a1:integer:=5;
constant a2:integer:=6;
constant a3:integer:=7;

constant t0:integer:=8;
constant t1:integer:=9;
constant t2:integer:=10;
constant t3:integer:=11;
constant t4:integer:=12;
constant t5:integer:=13;
constant t6:integer:=14;
constant t7:integer:=15;

constant s0:integer:=16;
constant s1:integer:=17;
constant s2:integer:=18;
constant s3:integer:=19;
constant s4:integer:=20;
constant s5:integer:=21;
constant s6:integer:=22; 
constant s7:integer:=23;
 
constant t8:integer:=24;
constant t9:integer:=25;
  
 -- Fill in the rest after my nap 
 
begin

P1:process(clk)  
  
variable initialize:integer:=1;
    
begin
  
  if(initialize=1) then
    regBank(t0) <= X"00000000";
    regBank(s4) <= X"0000000e";
    regBank(s5) <= X"00000005";
    initialize:=0;
  end if;
    
  ReadData1 <= (regBank(to_integer(unsigned(ReadReg1))));
  ReadData1 <= (regBank(to_integer(unsigned(ReadReg2))));
  
end process;
  
  
  
  
end behavioral;

