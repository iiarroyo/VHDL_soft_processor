
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

entity Reto2002B_CPU is

   Port ( 
		--top inputs
		Switches : in  std_logic_vector(7 downto 0);

		--top outputs (display and leds)
		SegH : out std_logic_vector(7 downto 0);
		SegL : out std_logic_vector(7 downto 0);
		LEDs : out std_logic_vector(7 downto 0);
		
		--Clock and clear (reset)
		Clk50MHz : in std_logic;
		Clr      : in std_logic			
	);
	
end Reto2002B_CPU;

architecture rlt of Reto2002B_CPU is

	component Dec7Seg
	port (
		D   : in  std_logic_vector(3 downto 0);
		Seg : out std_logic_vector(7 downto 0)
	);
	end component;
	
	--signals for Dec7Seg
	signal D : std_logic_vector(7 downto 0);
 
	component CtrlUnit
	port ( 
		Oper              : in std_logic_vector(3 downto 0);
      RegSrc_Op,JiJr_Op : out std_logic_vector(1 downto 0);
      ALUOp_Op          : out std_logic_vector(2 downto 0);
      RegWrite_Op,Write7Seg_Op,WriteLEDs_Op,PCInc_Op,Beq_Op : out std_logic
	);
	end component;

	--input signals for control unit
	signal Opcode      : std_logic_vector(3 downto 0);
	--output signals from control unit
   signal RegSrc,JiJr : std_logic_vector(1 downto 0);
   signal ALUOp       : std_logic_vector(2 downto 0);
   signal RegWrite,Write7Seg,WriteLEDs,PCInc,Beq :  std_logic;	
	
	
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
	
	--input signals for registers
	signal rs    : std_logic_vector(2 downto 0); 
	signal rt    : std_logic_vector(2 downto 0); 
	signal rd    : std_logic_vector(2 downto 0); 
	signal DataM : std_logic_vector(7 downto 0);
	signal ClkEn : std_logic;
	signal rsd   : std_logic_vector(7 downto 0);
	signal rtd   : std_logic_vector(7 downto 0);


	component 	FullAdder 
   port (
		InA,InB : in std_logic_vector(7 downto 0);
	    S       : out std_logic_vector(7 downto 0));
	end component;

	--signal for full adder
   signal IncremM     : std_logic_vector(7 downto 0);
   signal AdderS      : std_logic_vector(7 downto 0);

	component Mux4to1
	port (
		InA,InB,InC,InD : in  std_logic_vector(7 downto 0);
		Sel             : in  std_logic_vector(1 downto 0);
		M               : out std_logic_vector(7 downto 0));
	end component;

	--signals for mux4to1
   signal BrJiJrM     : std_logic_vector(7 downto 0);
   signal imm         : std_logic_vector(7 downto 0);
   signal BrEqM       : std_logic;
	
	component ALU
		port ( 
			Sel     : in  std_logic_vector(2 downto 0);
			InA,InB : in  std_logic_vector(7 downto 0);
			Oper    : out std_logic_vector(7 downto 0);
			Zero    : out std_logic);
	end component;

	--signals for alu
	signal ALUZero : std_logic;
	signal ALUOper : std_logic_vector(7 downto 0);
	
	
	component ProgCounter
		port(
			Clk	: in std_logic;
			Rst	: in std_logic;
			Cen	: in std_logic;
			PCIn	: in std_logic_vector(7 downto 0);
			PCOut	: out std_logic_vector(7 downto 0));
	end component;
	
	--signal for program counter
   signal PC : std_logic_vector(7 downto 0);

	
	component Reg8 
		port(
			Clk	: in std_logic;
			Rst	: in std_logic;
			Cen	: in std_logic;
			En		: in std_logic;
			Inrs	: in std_logic_vector(7 downto 0);
			OutD	: out std_logic_vector(7 downto 0));
	end component;

	
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

	
	component ClkDiv
		port(
		Clkin  : in std_logic;
		Rst    : in std_logic;
		Clkout : out std_logic
	);
	end component;
	
begin

	C01 : ProgCounter
	port map(
		Clk	  => Clk50MHz,
		Rst	  => Clr,
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
	

   C05 : ALU
   port map (
		Sel => ALUOp,
		InA => rsd,
		InB => rtd,
		Oper => ALUOper,
		Zero => ALUZero
   );
	
	
   C06 : FullAdder
   port map(
	   InA => PC,
	   InB => IncremM,
	   S   =>AdderS
   );
	
	
   C07 : Increm
   port map(
	   InA => "00000001",
	   InB => imm,
	   Sel => BrEqM,
	   M => IncremM
   );
	
	
   C08 : BrEq
   port map(
	   InA => PCInc,
	   InB => ALUZero,
	   Sel => Beq,
	   M => BrEqM
   );
	
	
   C09 : Mux4to1
   port map(
	   InA => imm,
	   InB => PC,
	   InC => ALUOper,
	   InD => Switches,
	   Sel => RegSrc,
	   M => DataM
   );
	
	
   C10 : Mux4to1
   port map(
	   InA => AdderS,
	   InB => rsd,
	   InC => imm,
	   InD => "00000000",
	   Sel => JiJr,
	   M   => BrJiJrM
   );
	
	C11 : Reg8
	port map(
		Clk  => Clk50Mhz,
		Rst  => Clr,
		Cen  => ClkEn,
		En	  => Write7Seg,
		Inrs => rsd,
		OutD => D
	);		
	
			
	C12 : Reg8
	port map(
		Clk  => Clk50Mhz,
		Rst  => Clr,
		Cen  => ClkEn,
		En	  => Write7Seg,
		Inrs => rsd,
		OutD => LEDs
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
	
	C15 : ClkDiv
	port map (
		Clkin  => Clk50Mhz,
		Rst    => Clr,
		Clkout => ClkEn
	);
	
end rlt;

