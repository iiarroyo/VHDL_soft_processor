
----------------------------------------------------------------------------------
-- Company:        ITESM - Campus Qro.        
-- Engineer:       A01706424 - José Miguel Luna Vega
-- 
-- Create Date:    06/03/2021
-- Module Name:    Reto2002B_CPU (TOP) 
-- Project Name:   
-- Target Devices: FPGA DE10-Lite 
-- Tool versions:  Quartus Prime Lite 18.1
-- Description:     
--
-- Dependencies:   
-- Revision: v1
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Top is

   Port ( 
		-- CtrlUnit
		
		--For Dec7Seg
		D        : in  std_logic_vector(7 downto 0);
		Switches : in  std_logic_vector(7 downto 0);
		SegH     : out std_logic_vector(7 downto 0);
		SegL     : out std_logic_vector(7 downto 0);
		CLK50MHz,Rst,Clr  : in std_logic
	);
end Top;

architecture rlt of Top is

	component Dec7Seg
	port (
		D   : in  std_logic_vector(3 downto 0);
		Seg : out std_logic_vector(7 downto 0)
	);
	end component;
 
	-- component CtrlUnit
	--  Port ( 
	-- 	Oper              : in std_logic_vector(3 downto 0);
    --   RegSrc_Op,JiJr_Op : out std_logic_vector(1 downto 0);
    --   ALUOp_Op          : out std_logic_vector(2 downto 0);
    --   RegWrite_Op,Write7Seg_Op,WriteLEDs_Op,PCInc_Op,Beq_Op : out std_logic
	-- );
	-- end component;
	
	component 	FullAdder 
   port (
		InA,InB : in std_logic_vector(7 downto 0);
	    S       : out std_logic_vector(7 downto 0));
	end component;
 
	component Mux4to1
	port (
		InA,InB,InC,InD : in  std_logic_vector(7 downto 0);
		Sel             : in  std_logic_vector(1 downto 0);
		M               : out std_logic_vector(7 downto 0));
	end component;

	component ALU
		port ( 
			Sel     : in  std_logic_vector(2 downto 0);
			InA,InB : in  std_logic_vector(7 downto 0);
			Oper    : out std_logic_vector(7 downto 0);
			Zero    : out std_logic);
		End component;

	component BrEq 
		port(
			InA	: in std_logic;
			InB	: in std_logic;
			Sel	: in std_logic;
			M		: out std_logic);
		end component;

	component Increm
		port(
			InA	: in std_logic_vector(7 downto 0);
			InB	: in std_logic_vector(7 downto 0);
			Sel	: in std_logic;
			M		: out std_logic_vector(7 downto 0));
	end component;

	component ProgCounter
		port(
			Clk	: in std_logic;
			Rst	: in std_logic;
			Cen	: in std_logic;
			PCIn	: in std_logic_vector(7 downto 0);
			PCOut	: out std_logic_vector(7 downto 0));
	end component;
	component Reg8 
		port(
			Clk	: in std_logic;
			Rst	: in std_logic;
			Cen	: in std_logic;
			En		: in std_logic;
			Inrs	: in std_logic_vector(7 downto 0);
			OutD	: out std_logic_vector(7 downto 0));
	end component;

	component CtrlUnit
		Port ( 
			 Oper              : in std_logic_vector(3 downto 0);
		   RegSrc_Op,JiJr_Op : out std_logic_vector(1 downto 0);
		   ALUOp_Op          : out std_logic_vector(2 downto 0);
		   RegWrite_Op,Write7Seg_Op,WriteLEDs_Op,PCInc_Op,Beq_Op : out std_logic);
	 end component;

	 component Registers 
	port (
		SelA  : in  std_logic_vector(2 downto 0); 
		SelB	: in  std_logic_vector(2 downto 0);
		SelWR : in  std_logic_vector(2 downto 0); 
		Data  : in  std_logic_vector(7 downto 0);
		Clk   : in  std_logic;
		Cen   : in  std_logic;
		Rst   : in  std_logic;
		WE    : in  std_logic;
		OutA  : out std_logic_vector(7 downto 0);
		OutB  : out std_logic_vector(7 downto 0)
	);
	end component;

   signal Opcode      : std_logic_vector(3 downto 0);
   signal RegSrc,JiJr : std_logic_vector(1 downto 0);
   signal ALUOp       : std_logic_vector(2 downto 0);
   signal RegWrite,Write7Seg,WriteLEDs,PCInc,Beq :  std_logic;
   signal rsd,rtd,ALUOper : std_logic_vector(7 downto 0);
   signal ALUZero     : std_logic;
   signal ClkEn       : std_logic;
   signal BrJiJrM     : std_logic_vector(7 downto 0);
   signal PC          : std_logic_vector(7 downto 0);
   signal IncremM     : std_logic_vector(7 downto 0);
   signal AdderS      : std_logic_vector(7 downto 0);
   signal imm         : std_logic_vector(7 downto 0);
   signal DataM       : std_logic_vector(7 downto 0);
   signal BrEqM       : std_logic;
   --input signals for registers
	signal rs    : std_logic_vector(2 downto 0); 
	signal rt    : std_logic_vector(2 downto 0); 
	signal rd    : std_logic_vector(2 downto 0); 
	--signal DataM : std_logic_vector(7 downto 0);
	--signal ClkEn : std_logic;
	-- signal rsd   : std_logic_vector(7 downto 0);
	-- signal rtd   : std_logic_vector(7 downto 0);
begin
C01: ProgCounter
port map(
		Clk	  => CLK50MHz,
		Rst	  => RST,
		Cen	  => ClkEn,
		PCIn  =>BrJiJrM,
		PCOut => PC)
	;
	C03 : CtrlUnit
	port map (
		Oper         => Opcode,
		RegSrc_OP    => RegSrc,
      JiJr_Op      => JiJr,
      ALUOp_Op     => ALUOp, 
      RegWrite_Op  => RegWrite,
		Write7Seg_Op => Write7Seg,
		WriteLEDs_Op => WriteLEDs,
		PCInc_Op     => PCInc,
		Beq_Op       => Beq
	);
   C05: ALU
   port map (
		Sel => ALUOp,
		InA => rsd,
		InB => rtd,
		Oper => ALUOper,
		Zero => ALUZero
   );
   C04 : Registers
	port map (
		SelA  => rs,
		SelB	=> rt, 
		SelWR => rd,
		Data  => DataM,
		Clk   => Clk50MHz,
		Cen   => ClkEn,
		Rst   => Clr,
		WE    => RegWrite,
		OutA  => rsd,
		OutB  => rtd
	);
   C06: FullAdder
   port map(
	   InA => PC,
	   InB => IncremM,
	   S   =>AdderS
   );
   C07: Increm
   port map(
	   InA => "00000001",
	   InB => imm,
	   Sel => BrEqM,
	   M => IncremM
   );
   C08: BrEq
   port map(
	   InA => PCInc,
	   InB => ALUZero,
	   Sel => Beq,
	   M => BrEqM
   );
   C09: Mux4to1
   port map(
	   InA => imm,
	   InB => PC,
	   InC => ALUOper,
	   InD => Switches,
	   Sel => RegSrc,
	   M => DataM
   );
   C10: Mux4to1
   port map(
	   InA => AdderS,
	   InB => rsd,
	   InC => imm,
	   InD => "00000000",
	   Sel => JiJr,
	   M   => BrJiJrM
   );
   C13 : Dec7Seg
	port map (
		D   => D(7 downto 4),
		Seg => SegH  
	);
	
	C14 : Dec7Seg
	port map (
		D   => D(3 downto 0),
		Seg => SegL 
	);  
	
end rlt;

