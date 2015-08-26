
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MIPSCPU is
  port(clk:in std_logic; Overflow:out std_logic);
end MIPSCPU;

--This is where all the port mapping jawns are
  
  
  architecture Behavorial of MIPSCPU is
    
    component ALU is
      generic(n:natural:=32);
        port(ReadData1,ReadData2:in std_logic_vector(n-1 downto 0);
	       ALUControl:in std_logic_vector(3 downto 0);
	       ALUResult:out std_logic_vector(n-1 downto 0);
	       Zero:out std_logic);
    end component;
    
    component ALUControl is
	     port(	ALUOp : in std_logic_vector(1 downto 0);
			ALUfunct : in std_logic_vector(5 downto 0);
			ALUControl : out std_logic_vector(3 downto 0));
	   end component;

    component Add is
      generic(n:natural:=32);
      port(InputA:in std_logic_vector(n-1 downto 0);
      InputB:in std_logic_vector(n-1 downto 0);
      Output:out std_logic_vector(n-1 downto 0));
    end component;
    
    
    component Add4PC is
  generic(n:natural:=32);
  port(PC:in std_logic_vector(n-1 downto 0);
   Output:out std_logic_vector(n-1 downto 0));
end component;
    
 component AndGate is 
  port(inA, inB:in  STD_LOGIC;
       output:out  STD_LOGIC);
    end component;   
    
component Control is
port(Opcode:in std_logic_vector(5 downto 0);
     RegDst,Branch,MemRead,MemtoReg,MemWrite,ALUSrc,RegWrite,Jump:out std_logic;
     ALUOp:out std_logic_vector(1 downto 0));
end component;    
    
component InstructionMemory is
  generic(n:natural:=32);
port(Address:in std_logic_vector(n-1 downto 0);
	ReadData:out std_logic_vector(n-1 downto 0));
end component;   
    
 component Mux is 
  generic(n: natural :=1);
  port(sel: in  STD_LOGIC;
       inA:in STD_LOGIC_VECTOR (4 downto 0);
       inB:in  STD_LOGIC_VECTOR (4 downto 0);
       output:out  STD_LOGIC_VECTOR (4 downto 0));
    end component;
    
    
    component Mux32 is 
  generic(n: natural :=32);
  port(sel: in  STD_LOGIC;
       inA:in STD_LOGIC_VECTOR (n-1 downto 0);
       inB:in  STD_LOGIC_VECTOR (n-1 downto 0);
       output:out  STD_LOGIC_VECTOR (n-1 downto 0));
    end component;   
    
    component PC is
port(clk:in std_logic;
     Input:in std_logic_vector(31 downto 0);
     Output:out std_logic_vector(31 downto 0));
end component;
    
 component Registers is
port (clk:in std_logic;
  RegWrite:in STD_LOGIC;
  ReadReg1, ReadReg2, WriteReg:in STD_LOGIC_VECTOR (5 downto 0);
  ReadData1, ReadData2: out STD_LOGIC_VECTOR (31 downto 0);
  WriteData: in STD_LOGIC_VECTOR (31 downto 0));
end component;   
    
component ShiftLeft2 is 
  generic(n:natural:=32);
  port(Input:in std_logic_vector(n-1 downto 0);
	     Output:out std_logic_vector(n-1 downto 0));
end component; 

component ShiftLeft2MergeWithPC is 
  generic(n:natural:=32);
  port(Input:in std_logic_vector(25 downto 0);
	     PC: in std_logic_vector(n-1 downto 0);
	     Output:out std_logic_vector(n-1 downto 0));
end component;   
    
    component SignExtend is
port(
	x:in std_logic_vector(15 downto 0);
	y:out std_logic_vector(31 downto 0));
end component;
    
component memory is
	port (
		address, write_data: in STD_LOGIC_VECTOR (31 downto 0);
		MemWrite, MemRead,ck: in STD_LOGIC;
		read_data: out STD_LOGIC_VECTOR (31 downto 0)
	);
end component;    
    
    
  
  
 -- Start making them signal and path jawns
 
  
  signal PC_InstructionMem: STD_LOGIC_VECTOR(31 downto 0);
  signal Instruction: STD_LOGIC_VECTOR(31 downto 0);
  signal WriteRegister: STD_LOGIC_VECTOR(4 downto 0);
  
  
  signal RegDst:STD_LOGIC;
  signal Branch:STD_LOGIC;
  signal MemRead:STD_LOGIC;
  signal MemtoReg:STD_LOGIC;
  signal MemWrite:STD_LOGIC;
  signal ALUSrc:STD_LOGIC;
  signal RegWrite:STD_LOGIC;
  signal Jump:STD_LOGIC;
  signal Zero:STD_LOGIC;
  
  signal ALUop: STD_LOGIC_VECTOR(1 downto 0);
  
  
  begin
    
    InstructMem:InstructionMemory port map(PC_InstructionMem, Instruction);
    MuxReadReg2AndWriteReg:Mux port map(RegDst, Instruction(20 downto 16),Instruction(15 downto 11),WriteRegister);  
    Contrl:Control port map(Instruction(31 downto 26),RegDst,Branch,MemRead,MemtoReg,MemWrite,ALUSrc,RegWrite,Jump,ALUOp);
  
  end Behavorial;